unit uh_graphics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ActnList, DB, DB.SQLite, Menus,
  StdCtrls, tkCustomWinControl, tkSermonTableGrid, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxDBTL, cxTLData,
  cxCurrencyEdit, DBCtrls, cxSpinEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels, cxLookAndFeelPainters,
  cxTLdxBarBuiltInMenu, System.Actions;

type
  TFH_Graphics = class(TForm)
    Panel: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    cmbxGraphs: TcxLookupComboBox;
    GroupBox4: TGroupBox;
    ppmnGraphs: TPopupMenu;
    N3: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    Excel1: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    qrGraphs: TtkSQLiteQuery;
    dtsrGraphs: TDataSource;
    ActionList: TActionList;
    actCreateGraph: TAction;
    actDeleteGraph: TAction;
    actEditGraph: TAction;
    actToExcel: TAction;
    Panel2: TPanel;
    trlsSermonTypes: TcxDBTreeList;
    dtsrSermonTypes: TDataSource;
    qrSermotTypes: TtkSQLiteQuery;
    trlsSermonTypescaption: TcxDBTreeListColumn;
    trlsSermonTypescnt: TcxDBTreeListColumn;
    trlsSermonTypesprch_count: TcxDBTreeListColumn;
    trlsSermonTypescof: TcxDBTreeListColumn;
    dblblState: TDBText;
    actSaveGraphData: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    actClearGraphData: TAction;
    N8: TMenuItem;
    actPrintMaster: TAction;
    lblChangedGraph: TLabel;
    actRollback: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    actStatusProject: TAction;
    actStatusApproved: TAction;
    actStatusArchive: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    grbxMain: TGroupBox;
    grbxPrevious: TGroupBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure actCreateGraphExecute(Sender: TObject);
    procedure actDeleteGraphExecute(Sender: TObject);
    procedure actEditGraphExecute(Sender: TObject);
    procedure actToExcelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbxGraphsPropertiesEditValueChanged(Sender: TObject);
    procedure trlsSermonTypesFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure actSaveGraphDataExecute(Sender: TObject);
    procedure actClearGraphDataExecute(Sender: TObject);
    procedure actPrintMasterExecute(Sender: TObject);
    procedure actRollbackExecute(Sender: TObject);
    procedure actStatusProjectExecute(Sender: TObject);
    procedure dblblStateClick(Sender: TObject);
  private
    { Private declarations }
    FGrid,FPGrid: TtkSermonTableGrid;
    FDataGridChanged:boolean;
    procedure GridPopUp(Sender: TObject;
      const AddItemProc: TtkSermonTableAddItem);
    procedure GridSetData(Sender: TObject; iDate, jMember: Integer;
      Value: TtkSermonTableRc);
    procedure OnGridColumnChanged(Sender:TObject; LastFocusedColumn,
      FocusedColumn:TtkSermonTableDate);
    procedure FillGrid(AGrid:TtkSermonTableGrid; GridID:variant);
    function  DataExists(const Rc:TtkSermonTableRc; DatesI:integer):boolean;
    function  GetDataGridChanged: boolean;
    procedure SetDataGridChanged(const Value: boolean);
    procedure SetGraphStatus(bStatus:byte);
    property  Grid:TtkSermonTableGrid read FGrid write FGrid;
    property  PGrid:TtkSermonTableGrid read FPGrid write FPGrid;
  public
    property  DataGridChanged:boolean read GetDataGridChanged
      write SetDataGridChanged;
    procedure MarkSortOfSermns(GraphID,SermonSortID:integer);
    {procedure MarkPerformanceDate(ADateColumn:TtkSermonTableDate);
    procedure MarkSermOfPreachAmount(AMemNode:TtkSermonTableMember; GraphID:integer);}
    procedure SaveData;
    procedure ClearGraphData(const GraphID:integer);
  end;

var
  FH_Graphics: TFH_Graphics;

implementation

uses u_main,mdGraph,u_objects,DateUtils,mdPrintMaster,
  Contnrs;

{$R *.dfm}

procedure TFH_Graphics.actCreateGraphExecute(Sender: TObject);
begin
  with TF_Graph.Create(self)do
  begin
    try
      InitNew;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.actDeleteGraphExecute(Sender: TObject);
begin
  if cmbxGraphs.EditValue=null then exit;
  if MessageBox(Handle,PChar('Удалить текущий график?'),PChar(Caption),
    MB_YESNO+MB_ICONEXCLAMATION)=IDNO then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      Connection.StartTransaction;
      try
        SQL.Text:='delete from "graphs_sermons" where "graphs_worship" in '+
          '(select gw."id" from "graphs_worships" gw where gw."graphs_date" in '+
          '(select gd."id" from "graphs_dates" gd where gd."graphs"=:in_id))';
        ParamByName('in_id').Value:=cmbxGraphs.EditValue;
        ExecSQL;
        SQL.Text:='delete from "graphs_worships" where "graphs_date" in '+
          '(select gr."id" from "graphs_dates" gr where gr."graphs"=:in_id)';
        ParamByName('in_id').Value:=cmbxGraphs.EditValue;
        ExecSQL;
        SQL.Text:='delete from "graphs_celebrates" where "graphs_dates" in '+
          '(select gr."id" from "graphs_dates" gr where gr."graphs"=:in_id)';
        ParamByName('in_id').Value:=cmbxGraphs.EditValue;
        ExecSQL;
        SQL.Text:='delete from "graphs_dates" where "graphs"=:in_id';
        ParamByName('in_id').Value:=cmbxGraphs.EditValue;
        ExecSQL;
        SQL.Text:='delete from "graphs" where "id"=:in_id;';
        ParamByName('in_id').Value:=cmbxGraphs.EditValue;
        ExecSQL;
        Connection.Commit;
        qrGraphs.Refresh;
        qrGraphs.Last;
        cmbxGraphs.EditValue:=qrGraphs.FieldValues['id'];
      except
        Connection.Rollback; raise;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.actEditGraphExecute(Sender: TObject);
  var wY,wM,wD:word;
begin
  if cmbxGraphs.EditValue=null then exit;
  with TF_Graph.Create(self)do
  begin
    try
      ID:=cmbxGraphs.EditValue;
      DecodeDate(StrToDate(qrGraphs.FieldValues['date_from']),wY,wM,wD);
      spedYear.Value:=wY; cmbxMonths.ItemIndex:=wM-1;
      cmbxPeriodLength.ItemIndex:=MonthsBetween(StrToDate(qrGraphs.FieldValues['date_from']),
        StrToDate(qrGraphs.FieldValues['date_to'])+1)-2;
      spedYear.Enabled:=false; cmbxPeriodLength.Enabled:=false;
      cmbxMonths.Enabled:=false;
      spedAddEmptyStrings.EditValue:=qrGraphs.FieldValues['add_empty_strings'];
      chbxShowWorshipsAmount.Checked:=qrGraphs.FieldValues['show_worships_number'];
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.actToExcelExecute(Sender: TObject);
  var DataR:TXlsData;
begin
  if cmbxGraphs.EditValue=null then exit;
  with DataR,qrGraphs do
  begin
    GraphID:=cmbxGraphs.EditValue;
    AddEmptyStrings:=FieldValues['add_empty_strings'];
    bShowWorshipNumber:=FieldValues['show_worships_number'];
    bShowData:=true;
    DateFrom:=StrToDate(FieldValues['date_from']);
    DateTo:=StrToDate(FieldValues['date_to']);
    PrintMaster:=nil;
    ToExcel(DataR);
  end;
end;

procedure TFH_Graphics.FillGrid(AGrid:TtkSermonTableGrid; GridID:variant);
  var i,j:integer; di:TtkSermonTableDate;
begin
  //if qrGraphs.FieldValues['id']=null then
  if GridID=null then
  begin
    AGrid.StartPaint;
    AGrid.Clear; DataGridChanged:=false;
    AGrid.StopPaint;
    exit;
  end;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      AGrid.StartPaint;
      try
        AGrid.Clear;
        //Добавляем действующих проповедников
        SQL.Text:='select distinct p.id as id, p.caption as caption from '+
          'v_preachers p join v_graph_sermons gs on p.id=gs.preacher or p.active '+
          'where gs.graphs=:in_graph';
        ParamByName('in_graph').Value:=GridID;//cmbxGraphs.EditValue;
        Open; First;
        while not EOF do
        begin
          with AGrid.AddMember do
          begin
            ID:=FieldValues['id'];
            Caption:=CutFIO(FieldValues['caption']);
            Info:='';
          end;
          Next;
        end;
        //Добавляем список служений по дням
        SQL.Text:='select gd.id as id, gd.date_worship as date_val,(select '+
          'count(*) from graphs_sermons gs where gs.graphs_worship in (select '+
          'gw.id from graphs_worships gw where gw.graphs_date=gd.id))as '+
          'sermons_amount, gd.caption as celebration_caption from '+
          'v_graphs_dates gd where gd.graphs=:in_graph;';
        ParamByName('in_graph').Value:=GridID;
        Open; First;
        while not EOF do
        begin
          with AGrid.AddDate do
          begin
            ID:=FieldValues['id'];
            Date:=StrToDate(FieldValues['date_val']);
            SermonsAmount:=FieldValues['sermons_amount'];
            Description:=NVL(FieldValues['celebration_caption'],'');                                  //
          end;
          Next;
        end;
      finally
        AGrid.StopPaint;
      end;
      //Добавляем данные о том, кто когда проповедует
      SQL.Text:='select gs."date_worship" as date_worship,gs."graphs_date" as '+
        'graphs_date,gs."worship_number" as worship_number,gs."sermon_number" '+
        'as sermon_number, gs.[sermon_sort] as sermon_type from "v_graph_sermo'+
        'ns" gs where gs."graphs"=:in_graph and gs."preacher"=:in_preacher';
      ParamByName('in_graph').Value:=GridID;//cmbxGraphs.EditValue;
      Open;
      for j:=0 to AGrid.Members.Count-1 do
      begin
        ParamByName('in_preacher').Value:=AGrid.Members[j].ID;
        Refresh; First;
        while not EOF do
        begin
          i:=AGrid.Dates.FindItemByDate(StrToDate(FieldValues['date_worship']),di);
          if i>=0 then with AGrid.Data[i,j]^ do
          begin
            Data.worship_ord:=FieldValues['worship_number'];
            Data.sermon_number:=FieldValues['sermon_number'];
            Data.sermon_type:=FieldValues['sermon_type'];
            {caption:=IntToStr(Data.worship_ord)+PopupCaptDelimiter+
              IntToStr(Data.sermon_number);}
          end;
          {worship_ord,sermon_number,Flag,caption}
          Next;
        end;
      end;
      AGrid.Repaint;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.FormCreate(Sender: TObject);
begin
  Grid:=TtkSermonTableGrid.Create(self);
  Grid.Parent:=grbxMain;
  with Grid do
  begin
    Left:=2;
    Top:=209;
    Width:=904;
    Height:=222;
    Align:= alClient;
    OptionsView.NodeHeight:=20;
    OptionsView.ColumnWidth:=20;
    OptionsView.HeaderHeight:=20;
    OptionsView.WeekHeaderHeight:=10;
    OptionsView.MembersBarWidth:=120;
    OptionsView.MemDataBarWidth:=80;
    OptionsView.FooterHeight:=20;
    TabOrder:=0;
    TabStop:=True;
    OnPopUp:=GridPopUp;
    OnSetData:=GridSetData;
    OnFocusedColumnChanged:=OnGridColumnChanged;
  end;
  PGrid:=TtkSermonTableGrid.Create(self);
  PGrid.Parent:=grbxPrevious;
  with PGrid do
  begin
    Left:=2;
    Top:=209;
    Width:=904;
    Height:=222;
    Align:= alClient;
    OptionsView.NodeHeight:=20;
    OptionsView.ColumnWidth:=20;
    OptionsView.HeaderHeight:=20;
    OptionsView.WeekHeaderHeight:=10;
    OptionsView.MembersBarWidth:=120;
    OptionsView.MemDataBarWidth:=80;
    OptionsView.FooterHeight:=20;
    ReadOnly:=true;
    TabOrder:=0;
    TabStop:=True;
    OnFocusedColumnChanged:=OnGridColumnChanged;
  end;
  Caption:=F_Main.Caption;
  DataGridChanged:=false;
  qrGraphs.Open;
  qrGraphs.Last;
  cmbxGraphs.EditValue:=qrGraphs.FieldValues['id'];
end;

procedure TFH_Graphics.cmbxGraphsPropertiesEditValueChanged(Sender:TObject);
begin
  FillGrid(Grid,cmbxGraphs.EditValue);
  FillGrid(PGrid,qrGraphs.FieldValues['previous_id']);
  qrSermotTypes.ParamByName('in_graph').Value:=qrGraphs.FieldValues['id'];
  if qrSermotTypes.Active then qrSermotTypes.Refresh else qrSermotTypes.Open;
end;

procedure TFH_Graphics.trlsSermonTypesFocusedNodeChanged(Sender:TcxCustomTreeList;
  APrevFocusedNode,AFocusedNode:TcxTreeListNode);
begin
  exit;
  if(AFocusedNode=nil)or(cmbxGraphs.EditValue=null) then MarkSortOfSermns(-1,-1)
  else MarkSortOfSermns(qrGraphs.FieldValues['id'],qrSermotTypes.FieldValues['sermon_sort']);
end;

procedure TFH_Graphics.MarkSortOfSermns(GraphID,SermonSortID:integer);
  var fs:TtkSermonTableDate;
begin
  Grid.ClearDatesSelection(true);
  if(GraphID=-1)or(SermonSortID=-1) then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      SQL.Text:='select distinct gs."sermon_sort" as sermon_sort,gs."date_worshi'+
        'p" as date_worship from "v_graph_sermons" gs where gs."graphs"=:in_grap'+
        'h and gs."sermon_sort"=:in_sermon_sort order by gs."date_worship"';
      ParamByName('in_graph').Value:=GraphID;
      ParamByName('in_sermon_sort').Value:=SermonSortID;
      Open; First;
      while not EOF do
      begin
        Grid.Dates.FindItemByDate(StrToDate(FieldValues['date_worship']),fs);
        if fs<>nil then fs.Selected:=true;
        Next;
      end;
    finally
      Free;
    end;
  end;
  Grid.Repaint;
end;

procedure TFH_Graphics.OnGridColumnChanged(Sender: TObject; LastFocusedColumn,
  FocusedColumn: TtkSermonTableDate);
  const sMain='Текущий график'; sAdd='Предыдущий график';
begin
  if Sender=Grid then
  begin
    if(FocusedColumn=nil)or(Length(FocusedColumn.Description)=0) then
      grbxMain.Caption:=sMain else
      grbxMain.Caption:=sMain+' <'+FocusedColumn.Description+'>';
  end else
  if Sender=PGrid then
  begin
    if(FocusedColumn=nil)or(Length(FocusedColumn.Description)=0) then
      grbxPrevious.Caption:=sMain else
      grbxPrevious.Caption:=sMain+' <'+FocusedColumn.Description+'>';
  end;
end;

procedure TFH_Graphics.SaveData;
  var i,j:integer;
begin
  if(cmbxGraphs.EditValue=null)or(not DataGridChanged) then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      Connection.StartTransaction;
      SQL.Text:='update "graphs_sermons" set "preacher"=null where "graphs_worsh'+
        'ip" in (select gs."graphs_worship" from "v_graph_sermons" gs where gs."'+
        'graphs"=:in_graph);';
      ParamByName('in_graph').Value:=cmbxGraphs.EditValue;
      ExecSQL;
      SQL.Text:='update "graphs_sermons" set "preacher"=:in_preacher where sermo'+
        'n_number=:in_sermon_number and "graphs_worship"=(select gw."id" from "g'+
        'raphs_worships" gw where gw."graphs_date"=:in_worship_date_id and gw."o'+
        'rd"=:in_worship_ord);';
      try
        for i:=0 to Grid.Dates.Count-1 do
        for j:=0 to Grid.Members.Count-1 do
        begin
          if(Grid.Data[i,j].Data.worship_ord=0)or
            (Grid.Data[i,j].Data.sermon_number=0)then continue;
          ParamByName('in_preacher').Value:=Grid.Members[j].ID;
          ParamByName('in_worship_ord').Value:=Grid.Data[i,j].Data.worship_ord;
          ParamByName('in_sermon_number').Value:=Grid.Data[i,j].Data.sermon_number;
          ParamByName('in_worship_date_id').Value:=Grid.Dates[i].ID;
          ExecSQL;
        end;
      except
        Connection.Rollback; raise;
      end;
      Connection.Commit;
      DataGridChanged:=false;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.ClearGraphData(const GraphID:integer);
begin
  if GraphID=0 then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      SQL.Text:='update "graphs_sermons" set "preacher"=null where "graphs_worsh'+
        'ip" in (select gs."graphs_worship" from "v_graph_sermons" gs where gs."'+
        'graphs"=:in_graph)';
      Connection.StartTransaction;
      try
        ParamByName('in_graph').Value:=GraphID;
        ExecSQL;
      except
        Connection.Rollback; raise;
      end;
      Connection.Commit;
      DataGridChanged:=true;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.GridPopUp(Sender: TObject; const AddItemProc:TtkSermonTableAddItem);
  var Rc:TtkSermonTableRc; sT:string; cn:integer;
begin
  if(Grid.FocusedNode=nil)or(Grid.FocusedColumn=nil)then exit;
  with TtkSQLiteQuery.Create(self) do
  begin
    try
      Connection:=F_Main.ZConnection;
      SQL.Text:='select count(*) as cnt from "v_graph_sermons" where "graphs_dat'+
        'e"=:in_graph_date;';
      ParamByName('in_graph_date').Value:=Grid.FocusedColumn.ID;
      Open; cn:=FieldValues['cnt'];
      SQL.Text:='select gs."sermon_number" as sermon_number,gs."worship_number" '+
        'as worship_number, gs.[sermon_sort] as sermon_sort from "v_graph_sermon'+
        's" gs join "preachers_ability" pa on gs."sermon_sort"=pa."sermon_sorts"'+
        ' where gs."graphs_date"=:in_graph_date and pa."preacher"=:in_preahcer '+
        'order by gs."worship_number", gs."sermon_number"';
      ParamByName('in_preahcer').Value:=Grid.FocusedNode.ID;
      ParamByName('in_graph_date').Value:=Grid.FocusedColumn.ID;
      Open; First;
      while not EOF do
      begin
        Rc.worship_ord:=FieldValues['worship_number'];
        Rc.sermon_number:=FieldValues['sermon_number'];
        Rc.sermon_type:=FieldValues['sermon_sort'];
        if not DataExists(Rc,Grid.Dates.IndexOf(Grid.FocusedColumn)) then
        begin
          if cn=1 then sT:='V' else
            sT:=IntToStr(Rc.worship_ord)+PopupCaptDelimiter+IntToStr(Rc.sermon_number);
          AddItemProc(sT,Rc);
        end;
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function TFH_Graphics.DataExists(const Rc:TtkSermonTableRc; DatesI:integer):boolean;
  var j:integer;
begin
  result:=false;
  for j:=0 to Grid.Members.Count-1 do
  begin
    result:=integer(Grid.Data[DatesI,j].Data)=integer(Rc);
    if result then break;
  end;
end;

procedure TFH_Graphics.dblblStateClick(Sender: TObject);
begin

end;

{procedure TFH_Graphics.MarkPerformanceDate(ADateColumn:TtkSermonTableDate);
  var iFlag:integer; Rc:TtkSermonTableRc;
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      SQL.Text:='select gs."sermon_number" as sermon_number,gs."worship_number" '+
        'as worship_number from "v_graph_sermons" gs where gs."graphs_date"=:in_'+
        'graph_date order by gs."worship_number", gs."sermon_number"';
      ParamByName('in_graph_date').Value:=ADateColumn.ID;
      Open; First; iFlag:=0;
      while not EOF do
      begin
        Rc.worship_ord:=FieldValues['worship_number'];
        Rc.sermon_number:=FieldValues['sermon_number'];
        if DataExists(Rc,Grid.Dates.IndexOf(ADateColumn)) then Inc(iFlag);
        Next;
      end;
      if iFlag=RecordCount then ADateColumn.Description:='OK' else
        ADateColumn.Description:=IntToStr(RecordCount-iFlag);
    finally
      Free;
    end;
  end;
end;}

procedure TFH_Graphics.GridSetData(Sender:TObject; iDate,jMember:integer;
  Value:TtkSermonTableRc);
begin
  {MarkPerformanceDate(Grid.Dates[iDate]);
  MarkSermOfPreachAmount(Grid.Members[jMember],cmbxGraphs.EditValue);}
  DataGridChanged:=true;
  Grid.Repaint;
end;

{procedure TFH_Graphics.MarkSermOfPreachAmount(AMemNode:TtkSermonTableMember;
  GraphID:integer);
  var i,j,iFlag:integer;
begin
  iFlag:=0; j:=Grid.Members.IndexOf(AMemNode);
  for i:=0 to Grid.Dates.Count-1 do
  begin
    if integer(Grid.Data[i,j].Data)<>0 then Inc(iFlag);
  end;
  AMemNode.Info:=IntToStr(iFlag);
end;}

procedure TFH_Graphics.actSaveGraphDataExecute(Sender: TObject);
begin
  if qrGraphs.FieldValues['graph_state']=1 then SaveData else
  DataGridChanged:=false;
end;

procedure TFH_Graphics.actClearGraphDataExecute(Sender: TObject);
begin
  if(cmbxGraphs.EditValue=null)or(qrGraphs.FieldValues['graph_state']<>1)or
    (MessageBox(Handle,PChar('Очистить текущий график?'),PChar(Caption),
    MB_YESNO)=ID_NO) then exit;
  Grid.ClearData;
  DataGridChanged:=true;
  Grid.Repaint;
end;

function TFH_Graphics.GetDataGridChanged:boolean;
begin
  result:=FDataGridChanged;
end;

procedure TFH_Graphics.SetDataGridChanged(const Value:boolean);
begin
  if Value=FDataGridChanged then exit;
  FDataGridChanged:=Value;
  actCreateGraph.Enabled:=not Value;
  actToExcel.Enabled:=actCreateGraph.Enabled;
  actPrintMaster.Enabled:=actCreateGraph.Enabled;
  cmbxGraphs.Enabled:=actCreateGraph.Enabled;
  lblChangedGraph.Visible:=not actCreateGraph.Enabled;
  actRollback.Enabled:=not actCreateGraph.Enabled;
  actSaveGraphData.Enabled:=not actCreateGraph.Enabled;
end;

procedure TFH_Graphics.actPrintMasterExecute(Sender: TObject);
  var DataR:TXlsData; Form:TF_PrintMaster;
begin
  if cmbxGraphs.EditValue=null then exit;
  Form:=TF_PrintMaster.Create(self);
  with Form do
  begin
    try
      GraphID:=cmbxGraphs.EditValue;
      if ShowModal=mrOK then
        with DataR,qrGraphs do
        begin
          GraphID:=cmbxGraphs.EditValue;
          AddEmptyStrings:=FieldValues['add_empty_strings'];
          bShowWorshipNumber:=FieldValues['show_worships_number'];
          bShowData:=true;
          DateFrom:=StrToDate(FieldValues['date_from']);
          DateTo:=StrToDate(FieldValues['date_to']);
          PrintMaster:=Form;
          ToExcel(DataR);
        end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.actRollbackExecute(Sender: TObject);
begin
  if MessageBox(Handle,PChar('Откатить сделанные изменения?'),PChar(Caption),
    MB_YESNO+MB_ICONEXCLAMATION)=IDNO then exit;
  FillGrid(Grid,cmbxGraphs.EditValue);
  DataGridChanged:=false;
end;

procedure TFH_Graphics.SetGraphStatus(bStatus: byte);
  var v:variant;
begin
  if(cmbxGraphs.EditValue=null)or(not bStatus in [1..3]) then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      try
        Connection:=F_Main.ZConnection;
        Connection.StartTransaction;
        SQL.Text:='update [graphs] set [graph_state]=:in_status where [id]=:in_g'+
          'raph;';
        ParamByName('in_graph').Value:=cmbxGraphs.EditValue;
        ParamByName('in_status').Value:=bStatus;
        ExecSQL;
        Connection.Commit;
        v:=cmbxGraphs.EditValue;
        qrGraphs.Refresh;
        qrGraphs.Locate('id',v,[]);
      except
        Connection.Rollback;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Graphics.actStatusProjectExecute(Sender: TObject);
begin
  SetGraphStatus(TAction(Sender).Tag);
end;

end.
