unit mdGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, DB, DB.SQLite,
  cxCheckBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TF_Graph = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    spedYear: TcxSpinEdit;
    cmbxMonths: TcxComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmbxPeriodLength: TcxComboBox;
    spedAddEmptyStrings: TcxSpinEdit;
    Label2: TLabel;
    chbxShowWorshipsAmount: TcxCheckBox;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FID:integer;
    procedure CreateNewData(const DateFrom,DateTo:TDateTime);
  public
    procedure InitNew;
    property  ID:integer read FID write FID;
  end;

implementation

  uses u_main,DateUtils,u_objects,uh_graphics,System.Math;

{$R *.dfm}

{ TF_Graph }

procedure TF_Graph.InitNew;
  var wY,wM,wD:word; Dt:TDateTime;
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      SQL.Text:='select ifnull(strftime(''%d.%m.%Y'',max(g."date_to"),''start '+
        'of month'',''+1 month''),strftime(''%d.%m.%Y'',''now'',''start of '+
        'month'')) as max_date from "graphs" g';
      Open;
      Dt:=StrToDate(FieldValues['max_date']);
    finally
      Free;
    end;
  end;
  DecodeDate(Dt,wY,wM,wD);
  spedYear.Value:=wY;
  cmbxMonths.ItemIndex:=wM-1; cmbxPeriodLength.ItemIndex:=1;
  spedAddEmptyStrings.Value:=3; chbxShowWorshipsAmount.Checked:=false;
  ID:=0;
end;

procedure TF_Graph.btnOKClick(Sender: TObject);
  var DateFrom,DateTo:TDateTime; sDateFrom,sDateTo:string;
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      DateFrom:=EncodeDate(spedYear.Value,cmbxMonths.ItemIndex+1,1);
      DateTo:=IncMonth(DateFrom,cmbxPeriodLength.ItemIndex+2)-1;
      sDateFrom:=DateToISOStr(DateFrom);
      sDateTo:=DateToISOStr(DateTo);
      if ID=0 then
      begin
        SQL.Text:='select count(*) as res from "graphs" g where (:in_begin_date '+
          'between g."date_from" and g."date_to")or(:in_end_date between g.'+
          '"date_from" and g."date_to")';
        ParamByName('in_begin_date').Value:=sDateFrom;
        ParamByName('in_end_date').Value:=sDateTo;
        Open;
        if FieldValues['res']<>0 then raise Exception.Create('ѕериод задан неверно!');
      end;
      try
        DefaultConnection.StartTransaction;
        if ID=0 then
        begin
          SQL.Text:='insert into "graphs"("id","graph_state","date_from","date_'+
          'to","add_empty_strings","show_worships_number") values (null,1,:in_d'+
          'ate_from,:in_date_to,:in_add_str,:in_show_worships)';
          ParamByName('in_date_from').Value:=sDateFrom;
          ParamByName('in_date_to').Value:=sDateTo;
        end else
        begin
          SQL.Text:='update "graphs" set "graph_state"=1,"add_empty_strings"=:i'+
            'n_add_str,"show_worships_number"=cast(:in_show_worships as integer)'+
            ' where "id"=:in_id';
          ParamByName('in_id').Value:=ID;
        end;
        ParamByName('in_add_str').Value:=integer(spedAddEmptyStrings.Value);
        if chbxShowWorshipsAmount.Checked then
          ParamByName('in_show_worships').Value:=1 else
          ParamByName('in_show_worships').Value:=0;
        ExecSQL;
        if ID=0 then
        begin
          SQL.Text:='select g."id" from "graphs" g where g.rowid=last_insert_rowid();';
          Open;
          if RecordCount>0 then ID:=FieldValues['ID']
          else raise Exception.Create('ќшибка сохранени€!');
          CreateNewData(DateFrom,DateTo);
        end;
        DefaultConnection.Commit;
        FH_Graphics.qrGraphs.Refresh;
        FH_Graphics.cmbxGraphs.EditValue:=ID;
      except
        DefaultConnection.Rollback; raise;
      end;
    finally
      Free;
    end;
  end;
  ModalResult:=mrOK;
end;

procedure TF_Graph.CreateNewData(const DateFrom,DateTo:TDateTime);
  var tq,tp:TtkSQLiteQuery; iY:word; dt,et:TDateTime;
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      //„истим таблицы имеющие отношение к текущему графику и временную celebrations...
      SQL.Text:='delete from "graphs_sermons" where "graphs_worship" in (select '+
        'gw."id" from "graphs_worships" gw where gw."graphs_date" in (select ta.'+
        '"id" from "graphs_dates" ta where ta."graphs"=:in_id))';
      ParamByName('in_id').Value:=ID;
      ExecSQL;
      SQL.Text:='delete from "graphs_worships" where "graphs_date" in (select '+
        'd."id" from "graphs_dates" d where d."graphs"=:in_id)';
      ParamByName('in_id').Value:=ID;
      ExecSQL;
      SQL.Text:='delete from "graphs_celebrates" where "graphs_dates" in '+
        '(select d."id" from "graphs_dates" d where d."graphs"=:in_id)';
      ParamByName('in_id').Value:=ID;
      ExecSQL;
      SQL.Text:='delete from "graphs_dates" where "graphs"=:in_id; delete from'+
        ' celebrations;';
      ParamByName('in_id').Value:=ID;
      ExecSQL;
      tq:=TtkSQLiteQuery.Create(nil);
      try
        {÷икл лет, охватываемый обрабатываемым периодом. «агружаю в celebrations
          все праздники этих лет}
        tq.SQL.Text:='insert into "celebrations"("celebrate_ref","celebrate'+
          '_type","date_value") values (:in_cel_ref,:in_cel_type,:in_date);';
        for iy:=YearOf(DateFrom) to YearOf(DateTo) do
        begin
          SQL.Text:='select e."id", e."offset" from "celebrations_easter" e order'+
            ' by e."offset"';
          dt:=ComputeEsterDate(iy);
          Open; First;
          while not EOF do
          begin
            tq.ParamByName('in_cel_ref').Value:=FieldValues['id'];
            tq.ParamByName('in_cel_type').Value:=2;//ester
            tq.ParamByName('in_date').Value:=DateToISOStr(dt+FieldValues['offset']);
            tq.ExecSQL;
            Next;
          end;
          SQL.Text:='select x."id",x."day",x."month" from "celebrations_xmas" x or'+
            'der by x."month",x."day"';
          Open; First;
          while not EOF do
          begin
            tq.ParamByName('in_cel_ref').Value:=FieldValues['id'];
            tq.ParamByName('in_cel_type').Value:=1;//xmas
            tq.ParamByName('in_date').Value:=DateToISOStr(EncodeDate(iy,
              FieldValues['month'],FieldValues['day']));
            tq.ExecSQL;
            Next;
          end;
        end;
        tq.SQL.Text:='insert into "celebrations" select c.id,3,c.cel_date '+
          'from "celebrations_casual" c where c."cel_date" between :in_begin and '+
          ':in_end order by c."cel_date"';
        tq.ParamByName('in_begin').Value:=DateToISOStr(DateFrom);
        tq.ParamByName('in_end').Value:=DateToISOStr(DateTo);
        tq.ExecSQL;
        //¬ celebrations загружены все праздники лет, затронутных обрабатываемым периодом...
        //ќтсекаю праздники, выход€щие за пределы обрабатываемого периода...
        tq.SQL.Text:='delete from "celebrations" where not date_value between '+
          ':in_begin and :in_end;';
        tq.ParamByName('in_begin').Value:=DateToISOStr(DateFrom);
        tq.ParamByName('in_end').Value:=DateToISOStr(DateTo);
        tq.ExecSQL;


        {«агружаю даты в graphs_dates, согласно недельного расписани€ богослужений}
        tp:=TtkSQLiteQuery.Create(self);
        try
          //ќпредел€ю задействованые периоды
          tp.SQL.Text:='select w.[id] as id, strftime(''%d.%m.%Y'',w.[works_from])'+
            ' as works_from, strftime(''%d.%m.%Y'',w.[works_to]) as works_to from '+
            'v_worship_table_periods w where w.[works_from]<=:in_date_to and '+
            'ifnull(w.[works_to],:in_date_to)>:in_date_from';
          tp.ParamByName('in_date_from').Value:=DateToISOStr(DateFrom);
          tp.ParamByName('in_date_to').Value:=DateToISOStr(DateTo);
          tp.Open; tp.First;
          //ѕолучаю богослужебные дни недели
          tq.SQL.Text:='select wt."day_of_week" from "week_table" wt where '+
              '(select count(*) from "worship_table" t where wt."day_of_week"='+
              't."day_of_week" and t.[worship_table_period]=:in_period)>0 and '+
              'wt."day_of_week"<8 order by wt."day_of_week"';
          SQL.Text:='insert into "graphs_dates" ("graphs","date_worship")'+
            'values(:in_graphs,:in_date)';
          ParamByName('in_graphs').Value:=ID;

          while not tp.Eof do
          begin
            tq.ParamByName('in_period').Value:=tp.FieldValues['id'];
            tq.Refresh;
            dt:=max(DateFrom,StrToDate(tp.FieldValues['works_from']));
            if tp.FieldValues['works_to']=null then et:=DateTo else
              et:=min(DateTo,StrToDate(tp.FieldValues['works_to']));
            while dt<=et do
            begin
              if tq.Locate('day_of_week',DayOfTheWeek(dt),[]) then
              begin
                ParamByName('in_date').Value:=DateToISOStr(dt);
                ExecSQL;
              end;
              dt:=dt+1;
            end;
            tp.Next;
          end;//while not tp.Eof do
          {загружаю в graphs_dates данные о праздниках, но не пересекающиес€ уже с
          введЄнными богослужени€ми, согласно недельного плана...}
          SQL.Text:='insert into "graphs_dates" select null,:in_graph,c."date_value"'+
            ' from "celebrations" c where c."date_value" not in (select gr."date_'+
            'worship" from "graphs_dates" gr where gr."graphs"=:in_graph);';
          ParamByName('in_graph').Value:=ID;
          ExecSQL;
          {заношу данные о праздниках, т.е. ссылки на них}
          SQL.Text:='insert into "graphs_celebrates" select g."id",c."celebrate_typ'+
            'e",c."celebrate_ref" from "graphs_dates" g join "celebrations" c on (g'+
            '."date_worship"=c."date_value");';
          ExecSQL;

          SQL.Text:='select d."id" as id,d."week_day_worship" as DayID from "v_graph'+
            's_dates" d where d."graphs"=:in_graph;';
          ParamByName('in_graph').Value:=ID;
          Open;
          {«аполн€ю данные о служени€х и проповед€х, но проповедников не указываю...}
          tp.First;
          while not tp.Eof do
          begin
            tq.SQL.Text:='insert into "graphs_worships" select null,t."ord",'+
              ':in_graphs_date,null from "worship_table" t where t."day_of_week"='+
              ':in_day_of_week and t.[worship_table_period]=:in_period';
            tq.ParamByName('in_period').Value:=tp.FieldValues['id'];
            First;
            while not EOF do
            begin
              tq.ParamByName('in_graphs_date').Value:=FieldValues['id'];
              tq.ParamByName('in_day_of_week').Value:=FieldValues['DayID'];
              tq.ExecSQL;
              Next;
            end;
            tq.SQL.Text:='insert into "graphs_sermons" select gw."id",null,ws.'+
              '"sermon_number",ws."sermon_sort" from "worship_sermons" ws join'+
              ' "worship_table" wt on ws."worship"=wt.id join "graphs_worships'+
              '" gw on gw."ord"=wt.ord and gw.graphs_date=:in_graphs_date wher'+
              'e wt.day_of_week=:in_day_of_week and wt.[worship_table_period]='+
              ':in_period';
            tq.ParamByName('in_period').Value:=tp.FieldValues['id'];
            First;
            while not EOF do
            begin
              tq.ParamByName('in_graphs_date').Value:=FieldValues['id'];
              tq.ParamByName('in_day_of_week').Value:=FieldValues['DayID'];
              tq.ExecSQL;
              Next;
            end;
            tp.Next;
          end;
        finally
          tp.Free;
        end;
      //
      finally
        tq.Free;
      end;
    finally
      Free;
    end;
  end;
end;

end.
