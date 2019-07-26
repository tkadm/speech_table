unit uh_options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxCheckBox, DB, DB.SQLite, Menus,
  ExtCtrls, cxInplaceContainer, cxDBTL, cxControls, cxTLData, StdCtrls,
  ActnList, cxTextEdit, cxCurrencyEdit, cxCalendar, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxTLdxBarBuiltInMenu, System.Actions;

type
  TFH_Options = class(TForm)
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    trlsWorships: TcxDBTreeList;
    GroupBox1: TGroupBox;
    trlsPreachers: TcxDBTreeList;
    trlsPreachersfio: TcxDBTreeListColumn;
    trlsPreachersactive: TcxDBTreeListColumn;
    ppmnPreachers: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    qrWeek: TtkSQLiteQuery;
    qrPreachers: TtkSQLiteQuery;
    dtsrPreachers: TDataSource;
    dtsrWeek: TDataSource;
    ActionList: TActionList;
    actAddPreacher: TAction;
    actEditPreacher: TAction;
    Panel1: TPanel;
    actMoveUp: TAction;
    actMoveDown: TAction;
    spbtUp: TSpeedButton;
    spbtDown: TSpeedButton;
    trlsPreachersUsable: TcxDBTreeListColumn;
    trlsWeek: TcxDBTreeList;
    trlsWeekID: TcxDBTreeListColumn;
    trlsWeekCaption: TcxDBTreeListColumn;
    trlsWeekAmount: TcxDBTreeListColumn;
    qrWorships: TtkSQLiteQuery;
    dtsrWorships: TDataSource;
    trlsWorshipsord: TcxDBTreeListColumn;
    trlsWorshipsworship_time: TcxDBTreeListColumn;
    trlsWorshipssermons_amount: TcxDBTreeListColumn;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    trlsSermons: TcxDBTreeList;
    qrSermons: TtkSQLiteQuery;
    dtsrSermons: TDataSource;
    trlsSermonssermon_number: TcxDBTreeListColumn;
    trlsSermonscaption: TcxDBTreeListColumn;
    GroupBox5: TGroupBox;
    trlsSermonSorts: TcxDBTreeList;
    qrSermonSorts: TtkSQLiteQuery;
    dtsrSermonSorts: TDataSource;
    trlsSermonSortspriority: TcxDBTreeListColumn;
    trlsSermonSortscaption: TcxDBTreeListColumn;
    Panel3: TPanel;
    spbtUpss: TSpeedButton;
    spbtDownss: TSpeedButton;
    actSortUp: TAction;
    actSortDown: TAction;
    actWorshipAdd: TAction;
    actSermonAdd: TAction;
    actSermonEdit: TAction;
    actSermonRemove: TAction;
    actSermSortAdd: TAction;
    actSermSortEdit: TAction;
    actSermSortRemove: TAction;
    actWorshipEdit: TAction;
    actWorshipRemove: TAction;
    ppmnWorships: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ppmnSermons: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    actVacuum: TAction;
    btnVacuum: TButton;
    actWorshipUp: TAction;
    actWorshipDown: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    actSermonUp: TAction;
    actSermonDown: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    ppmnSermonSorts: TPopupMenu;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    actExceedDays: TAction;
    ppmnDayOfWeek: TPopupMenu;
    N21: TMenuItem;
    trlsPreachersServiceLider: TcxDBTreeListColumn;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox6: TGroupBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    treePeriods: TcxDBTreeList;
    qrPeriods: TtkSQLiteQuery;
    dtsrPeriods: TDataSource;
    treePeriodsworks_from: TcxDBTreeListColumn;
    Panel: TPanel;
    actWorshipPeriodAdd: TAction;
    actWorshipPeriodEdit: TAction;
    actWorshipPeriodRemove: TAction;
    ppmnPeriods: TPopupMenu;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    actWorshipPeriodAddCopying: TAction;
    N26: TMenuItem;
    N27: TMenuItem;
    trlsPreachersPHONE: TcxDBTreeListColumn;
    procedure actAddPreacherExecute(Sender: TObject);
    procedure actEditPreacherExecute(Sender: TObject);
    procedure trlsPreachersDblClick(Sender: TObject);
    procedure trlsPreachersFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure actMoveUpExecute(Sender: TObject);
    procedure actMoveDownExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure trlsWeekCustomDrawCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
    procedure trlsWeekFocusedNodeChanged(Sender: TcxCustomTreeList; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure trlsWorshipsFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure actSortUpExecute(Sender: TObject);
    procedure actSortDownExecute(Sender: TObject);
    procedure actWorshipAddExecute(Sender: TObject);
    procedure actWorshipEditExecute(Sender: TObject);
    procedure actWorshipRemoveExecute(Sender: TObject);
    procedure actSermonAddExecute(Sender: TObject);
    procedure actSermonEditExecute(Sender: TObject);
    procedure actSermonRemoveExecute(Sender: TObject);
    procedure trlsSermonsFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure trlsWorshipsDblClick(Sender: TObject);
    procedure trlsSermonsDblClick(Sender: TObject);
    procedure actSermSortAddExecute(Sender: TObject);
    procedure actSermSortEditExecute(Sender: TObject);
    procedure actSermSortRemoveExecute(Sender: TObject);
    procedure trlsSermonSortsFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure actVacuumExecute(Sender: TObject);
    procedure actWorshipUpExecute(Sender: TObject);
    procedure actWorshipDownExecute(Sender: TObject);
    procedure actSermonUpExecute(Sender: TObject);
    procedure actSermonDownExecute(Sender: TObject);
    procedure trlsSermonSortsDblClick(Sender: TObject);
    procedure actExceedDaysExecute(Sender: TObject);
    procedure treePeriodsFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure actWorshipPeriodAddExecute(Sender: TObject);
    procedure actWorshipPeriodEditExecute(Sender: TObject);
    procedure actWorshipPeriodRemoveExecute(Sender: TObject);
    procedure actWorshipPeriodAddCopyingExecute(Sender: TObject);
  private
    procedure MovePreacher(id,ord_need:integer);
    procedure MoveSermonSort(Direction,ID:integer);
    procedure MoveWorship(Direction,ID:integer);
    procedure MoveSermon(Direction,ID:integer);
  public
    { Public declarations }
  end;

var
  FH_Options: TFH_Options;

implementation

uses u_main,mdPreacherProperty,mdWorship,mdSermon,mdSermonSorts,mdExceedDays,
  mdWorshipTablePeriod;

{$R *.dfm}

procedure TFH_Options.actAddPreacherExecute(Sender: TObject);
begin
  with TF_PreacherProperty.Create(self)do
  begin
    PreacherID:=0;
    if ShowModal=mrOK then
    begin
      qrPreachers.Refresh;
      qrPreachers.Locate('id',PreacherID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.actEditPreacherExecute(Sender: TObject);
begin
  if qrPreachers.FieldValues['id']=null then exit;
  with TF_PreacherProperty.Create(self)do
  begin
    PreacherID:=qrPreachers.FieldValues['id'];
    if ShowModal=mrOK then
    begin
      qrPreachers.Refresh;
      qrPreachers.Locate('id',PreacherID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.treePeriodsFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  actWorshipPeriodEdit.Enabled:=AFocusedNode<>nil;
  actWorshipPeriodRemove.Enabled:=actWorshipPeriodEdit.Enabled;
  actWorshipAdd.Enabled:=actWorshipPeriodEdit.Enabled;
  actWorshipPeriodAddCopying.Enabled:=actWorshipPeriodEdit.Enabled;
  qrWeek.ParamByName('in_worship_period').Value:=qrPeriods.FieldValues['id'];
  qrWeek.ExecSQL;
end;

procedure TFH_Options.trlsPreachersDblClick(Sender: TObject);
begin
  actEditPreacher.Execute;
end;

procedure TFH_Options.trlsPreachersFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  actEditPreacher.Enabled:=AFocusedNode<>nil;
  actMoveUp.Enabled:=(AFocusedNode<>nil)and(AFocusedNode.GetPrev<>nil);
  actMoveDown.Enabled:=(AFocusedNode<>nil)and(AFocusedNode.GetNext<>nil);
end;

procedure TFH_Options.actMoveUpExecute(Sender: TObject);
begin
  if trlsPreachers.FocusedNode=nil then exit;
  MovePreacher(qrPreachers.FieldValues['id'],qrPreachers.FieldValues['ord']-1);
end;

procedure TFH_Options.actMoveDownExecute(Sender: TObject);
begin
  if trlsPreachers.FocusedNode=nil then exit;
  MovePreacher(qrPreachers.FieldValues['id'],qrPreachers.FieldValues['ord']+1);
end;

procedure TFH_Options.MovePreacher(id,ord_need:integer);
  var ord_now,id_need:integer;
begin
  if(id<1)or(ord_need<1)or(ord_need>qrPreachers.RecordCount) then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      SQL.Text:='select ord,id from "preachers" p order by p."ord"';
      Open;
      if Locate('id',id,[]) then
      begin
        ord_now:=FieldValues['ord'];
        if Locate('ord',ord_need,[]) then
        begin
          id_need:=FieldValues['id'];
        end else exit;
      end else exit;
      try
        Connection.StartTransaction;
        SQL.Text:='update "preachers" set "ord"=:in_ord where id=:in_id';
        ParamByName('in_ord').Value:=ord_need;
        ParamByName('in_id').Value:=id;
        ExecSQL;
        ParamByName('in_ord').Value:=ord_now;
        ParamByName('in_id').Value:=id_need;
        ExecSQL;
        Connection.Commit;
      except
        Connection.Rollback; raise;
      end;
    finally
      Free;
    end;
  end;
  qrPreachers.Refresh;
  qrPreachers.Locate('id',id,[]);
end;

procedure TFH_Options.FormCreate(Sender: TObject);
begin
  Caption:=F_Main.Caption;
  qrPreachers.Open;
  qrWeek.Open;

  qrSermonSorts.Open;
end;

procedure TFH_Options.trlsWeekCustomDrawCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  case AViewInfo.Node.Values[trlsWeekID.ItemIndex] of
  7: ACanvas.Font.Color:=clRed;
  8: if AViewInfo.Column=trlsWeekCaption then
    ACanvas.Font.Style:=[fsItalic] else ACanvas.Font.Style:=[];
  else begin ACanvas.Font.Color:=clBlack; ACanvas.Font.Style:=[]; end;
  end;
end;

procedure TFH_Options.trlsWeekFocusedNodeChanged(Sender:TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode:TcxTreeListNode);
begin
  if not qrPeriods.Active then exit;
  qrWorships.ParamByName('in_day').Value:=qrWeek.FieldValues['id'];
  qrWorships.ParamByName('in_worship_period').Value:=qrPeriods.FieldValues['id'];
  qrWorships.ExecSQL;
  actWorshipAdd.Enabled:=AFocusedNode<>nil;
end;

procedure TFH_Options.trlsWorshipsFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  qrSermons.ParamByName('in_worship').Value:=qrWorships.FieldValues['id'];
  qrSermons.ExecSQL;
  actWorshipEdit.Enabled:=AFocusedNode<>nil;
  actWorshipRemove.Enabled:=actWorshipEdit.Enabled;
  actSermonAdd.Enabled:=actWorshipEdit.Enabled;
  actWorshipUp.Enabled:=actWorshipEdit.Enabled and (AFocusedNode.GetPrev<>nil);
  actWorshipDown.Enabled:=actWorshipEdit.Enabled and (AFocusedNode.GetNext<>nil);
end;

procedure TFH_Options.actSortUpExecute(Sender: TObject);
begin
  if qrSermonSorts.FieldValues['id']=null then exit;
  MoveSermonSort(-1,qrSermonSorts.FieldValues['id']);
end;

procedure TFH_Options.actSortDownExecute(Sender: TObject);
begin
  if qrSermonSorts.FieldValues['id']=null then exit;
  MoveSermonSort(1,qrSermonSorts.FieldValues['id']);
end;

procedure TFH_Options.actWorshipAddExecute(Sender: TObject);
begin
  if(qrWeek.FieldValues['id']=null)or(qrPeriods.FieldValues['id']=null)then exit;
  with TF_Worship.Create(self)do
  begin
    ID:=0; WeekID:=qrWeek.FieldValues['id'];
    PeriodID:=qrPeriods.FieldValues['id'];
    if ShowModal=mrOK then
    begin
      qrWeek.Refresh; qrWeek.Locate('id',WeekID,[]);
      qrWorships.Refresh; qrWorships.Locate('id',ID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.actWorshipEditExecute(Sender: TObject);
begin
  if qrWorships.FieldValues['id']=null then exit;
  with TF_Worship.Create(self)do
  begin
    ID:=qrWorships.FieldValues['id'];
    WeekID:=qrWeek.FieldValues['id'];
    if qrWorships.FieldValues['worship_time']<>null then
      txedTime.Text:=qrWorships.FieldValues['worship_time'];
    if ShowModal=mrOK then
    begin
      qrWeek.Refresh; qrWeek.Locate('id',WeekID,[]);
      qrWorships.Refresh; qrWorships.Locate('id',ID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.actWorshipPeriodAddCopyingExecute(Sender: TObject);
  var SourcePeriodID:integer;
begin
  if qrPeriods.FieldValues['id']=null then exit;
  SourcePeriodID:=qrPeriods.FieldValues['id'];
  with TF_WorshipTablePeriod.Create(self)do
  try
    ID:=0;
    DefaultConnection.StartTransaction;
    try
      if ShowModal=mrOK then
      begin
        with TtkSQLiteQuery.Create(self)do
        try
          SQL.Text:='insert into worship_table select null,wt.ord,wt.day_of_week,'+
            'wt.worship_time,:in_period_new from worship_table wt where '+
            'wt.[worship_table_period]=:in_period_old';
          ParamByName('in_period_new').Value:=ID;
          ParamByName('in_period_old').Value:=SourcePeriodID;
          ExecSQL;
          SQL.Text:= ' insert into worship_sermons select ws.sermon_number,'+
            'wt2.id,ws.sermon_sort from worship_sermons ws join worship_table'+
            ' wt1 on ws.worship=wt1.id join worship_table wt2 on '+
            'wt1.ord=wt2.ord and wt1.[day_of_week]=wt2.[day_of_week] where '+
            'wt1.worship_table_period=:in_period_old and '+
            'wt2.worship_table_period=:in_period_new';
          ParamByName('in_period_new').Value:=ID;
          ParamByName('in_period_old').Value:=SourcePeriodID;
          ExecSQL;
          DefaultConnection.Commit;
        finally
          Free;
        end;
        qrPeriods.Refresh;
        qrPeriods.Locate('id',ID,[]);
      end;
    except
      DefaultConnection.Rollback; raise;
    end;
  finally
    Free;
  end;
end;

procedure TFH_Options.actWorshipPeriodAddExecute(Sender: TObject);
begin
  with TF_WorshipTablePeriod.Create(self)do
  try
    ID:=0;
    if ShowModal=mrOK then
    begin
      qrPeriods.Refresh;
      qrPeriods.Locate('id',ID,[]);
    end;
  finally
    Free;
  end;
end;

procedure TFH_Options.actWorshipPeriodEditExecute(Sender: TObject);
begin
  if qrPeriods.FieldValues['id']=null then exit;
  with TF_WorshipTablePeriod.Create(self)do
  try
    ID:=qrPeriods.FieldValues['id'];
    dtedDateFrom.Date:=StrToDate(qrPeriods.FieldValues['works_from']);
    if ShowModal=mrOK then
    begin
      qrPeriods.Refresh;
      qrPeriods.Locate('id',ID,[]);
    end;
  finally
    Free;
  end;
end;

procedure TFH_Options.actWorshipPeriodRemoveExecute(Sender: TObject);
begin
  if qrPeriods.FieldValues['id']=null then exit;
  if Application.MessageBox(PChar('Удалить текущий период?'),
    PChar('Удаление периода'),MB_YESNO+MB_ICONQUESTION)<>IDYES then exit;
  with TtkSQLiteQuery.Create(self) do
  try
    DefaultConnection.StartTransaction;
    try
      SQL.Text:='delete from worship_sermons where [worship] in (select wa.id '+
        'from worship_table wa where wa.worship_table_period=:in_period)';
      ParamByName('in_period').Value:=qrPeriods.FieldValues['id'];
      ExecSQL;
      SQL.Text:='delete from worship_table where worship_table_period=:in_period';
      ParamByName('in_period').Value:=qrPeriods.FieldValues['id'];
      ExecSQL;
      SQL.text:='delete from worship_table_period  where id=:in_period';
      ParamByName('in_period').Value:=qrPeriods.FieldValues['id'];
      ExecSQL;
      DefaultConnection.Commit;
    except
      DefaultConnection.Rollback; raise;
    end;
    qrPeriods.Refresh;
  finally
    Free;
  end;
end;

procedure TFH_Options.actWorshipRemoveExecute(Sender: TObject);
  var id:integer;
begin
  if qrWorships.FieldValues['id']=null then exit;
  if MessageBox(Handle,PChar('Удалить текущее богослужение из графика?'),
    PChar(Caption),MB_YESNO+MB_ICONWARNING)=IDNO then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      try
        Connection:=F_Main.ZConnection;
        Connection.StartTransaction;
        SQL.Text:='delete from "worship_table" where id=:in_id';
        ParamByName('in_id').Value:=qrWorships.FieldValues['id'];
        ExecSQL;
        SQL.Text:='update "worship_table" set "ord"="ord"-1 where "day_of_week"'+
          '=:in_day and "ord">:in_ord;';
        ParamByName('in_day').Value:=qrWeek.FieldValues['id'];
        ParamByName('in_ord').Value:=qrWorships.FieldValues['ord'];
        ExecSQL;
        Connection.Commit;
        id:=qrWeek.FieldValues['id'];
        qrWeek.Refresh;
        qrWeek.Locate('id',id,[]);
        qrWorships.Refresh;
      except
        Connection.Rollback;
        MessageBox(Handle,PChar('Запись содержит подчинённые позиции. Удаление н'+
          'евозможно!'),PChar(Caption),MB_OK+MB_ICONERROR);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Options.actSermonAddExecute(Sender: TObject);
begin
  if qrWorships.FieldValues['id']=null then exit;
  with TF_Sermon.Create(self)do
  begin
    ID:=0; WorshipID:=qrWorships.FieldValues['id'];
    if ShowModal=mrOK then
    begin
      qrWorships.Refresh; qrWorships.Locate('id',WorshipID,[]);
      qrSermons.Refresh;
      qrSermons.Locate('id',ID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.actSermonEditExecute(Sender: TObject);
begin
  if qrSermons.FieldValues['id']=null then exit;
  with TF_Sermon.Create(self)do
  begin
    ID:=qrSermons.FieldValues['id'];
    //qrSermonSorts.Locate('id',ID,[]);
    cmbxSermonSorts.EditValue:=qrSermons.FieldValues['sermon_sort'];
    if ShowModal=mrOK then
    begin
      qrSermons.Refresh;
      qrSermons.Locate('id',ID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.actSermonRemoveExecute(Sender: TObject);
begin
  if qrSermons.FieldValues['id']=null then exit;
  if MessageBox(Handle,PChar('Удалить текущую проповедь?'),PChar(Caption),
    MB_YESNO+MB_ICONEXCLAMATION)=mrNO then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      Connection.StartTransaction;
      try
        SQL.Text:='delete from "worship_sermons" where rowid=:in_id;';
        ParamByName('in_id').Value:=qrSermons.FieldValues['id'];
        ExecSQL;
        SQL.Text:='update "worship_sermons" set "sermon_number"="sermon_number"'+
          '-1 where "worship"=:in_worship and "sermon_number">:in_number;';
        ParamByName('in_worship').Value:=qrSermons.FieldValues['worship'];
        ParamByName('in_number').Value:=qrSermons.FieldValues['sermon_number'];
        ExecSQL;
        Connection.Commit;
        qrWorships.Refresh;
      except
        Connection.Rollback;
        raise;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Options.trlsSermonsFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  actSermonEdit.Enabled:=AFocusedNode<>nil;
  actSermonRemove.Enabled:=actSermonEdit.Enabled;
  actSermonUp.Enabled:=actSermonEdit.Enabled and (AFocusedNode.GetPrev<>nil);
  actSermonDown.Enabled:=actSermonEdit.Enabled and (AFocusedNode.GetNext<>nil);
end;

procedure TFH_Options.trlsWorshipsDblClick(Sender: TObject);
begin
  actWorshipEdit.Execute;
end;

procedure TFH_Options.trlsSermonsDblClick(Sender: TObject);
begin
  actSermonEdit.Execute;
end;

procedure TFH_Options.actSermSortAddExecute(Sender: TObject);
begin
  with TF_SermonSorts.Create(self)do
  begin
    ID:=0;
    if ShowModal=mrOK then
    begin
      qrSermonSorts.Refresh;
      qrSermonSorts.Locate('id',ID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.actSermSortEditExecute(Sender: TObject);
begin
  if qrSermonSorts.FieldValues['id']=null then exit;
  with TF_SermonSorts.Create(self)do
  begin
    ID:=qrSermonSorts.FieldValues['id'];
    txedCaption.Text:=qrSermonSorts.FieldValues['caption'];
    if ShowModal=mrOK then
    begin
      qrSermonSorts.Refresh;
      qrSermonSorts.Locate('id',ID,[]);
    end;
    Free;
  end;
end;

procedure TFH_Options.actSermSortRemoveExecute(Sender: TObject);
begin
  if qrSermonSorts.FieldValues['id']=null then exit;
  if MessageBox(Handle,PChar('Удалить текущий вид проповеди?'),PChar(Caption),
    MB_YESNO+MB_ICONEXCLAMATION)=mrNO then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      Connection.StartTransaction;
      try
        SQL.Text:='delete from "sermon_sorts" where id=:in_id; update "sermon_so'+
          'rts" set "priority"="priority"-1 where "priority">:in_priority;';
        ParamByName('in_id').Value:=qrSermonSorts.FieldValues['id'];
        ParamByName('in_priority').Value:=qrSermonSorts.FieldValues['priority'];
        ExecSQL;
        Connection.Commit;
        qrSermonSorts.Refresh;
      except
        Connection.Rollback;
        MessageBox(Handle,PChar('Запись содержит подчинённые позиции. Удаление н'+
          'евозможно!'),PChar(Caption),MB_OK+MB_ICONERROR);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Options.trlsSermonSortsFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  actSermSortEdit.Enabled:=AFocusedNode<>nil;
  actSermSortRemove.Enabled:=actSermSortEdit.Enabled;
  actSortUp.Enabled:=(AFocusedNode<>nil)and(AFocusedNode.GetPrev<>nil);
  actSortDown.Enabled:=(AFocusedNode<>nil)and(AFocusedNode.GetNext<>nil);
end;

procedure TFH_Options.actVacuumExecute(Sender: TObject);
begin
  F_Main.Vacuum;
end;

procedure TFH_Options.MoveSermonSort(Direction, ID: integer);
begin
  if Direction=0 then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      try
        Connection:=F_Main.ZConnection;
        Connection.StartTransaction;
        SQL.Text:='update "sermon_sorts" set "priority"=-(:in_step-"priority") w'+
          'here id=(select max(ss.id) from "sermon_sorts" ss where ss."priority"'+
          '=(select se."priority"+:in_step from "sermon_sorts" se where se."id"='+
          ':in_id)); update "sermon_sorts" set "priority"="priority"+:in_step wh'+
          'ere id=:in_id;';
        ParamByName('in_step').Value:=Direction div Abs(Direction);
        ParamByName('in_id').Value:=ID;
        ExecSQL;
        Connection.Commit;
        qrSermonSorts.Refresh;
        qrSermonSorts.Locate('id',ID,[]);
      except
        Connection.Rollback; raise;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Options.actWorshipUpExecute(Sender: TObject);
begin
  if qrWorships.FieldValues['id']=null then exit;
  MoveWorship(-1,qrWorships.FieldValues['id']);
end;

procedure TFH_Options.actWorshipDownExecute(Sender: TObject);
begin
  if qrWorships.FieldValues['id']=null then exit;
  MoveWorship(1,qrWorships.FieldValues['id']);
end;

procedure TFH_Options.MoveWorship(Direction, ID: integer);
  var OrdN,ParID:integer;
begin
  if Direction=0 then exit; Direction:=Direction div Abs(Direction);
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      try
        Connection:=F_Main.ZConnection;
        SQL.Text:='select ord,day_of_week from "worship_table" where id=:in_id;';
        ParamByName('in_id').Value:=ID;
        Open; First;
        OrdN:=FieldValues['ord'];
        ParID:=FieldValues['day_of_week']; Close;
        Connection.StartTransaction;
        SQL.Text:='update "worship_table" set ord=null where ord=:in_ord and day'+
          '_of_week=:in_day;';
        ParamByName('in_ord').Value:=OrdN+Direction;
        ParamByName('in_day').Value:=ParID;
        ExecSQL;
        SQL.Text:='update "worship_table" set ord=:in_ord where "id"=:in_id;';
        ParamByName('in_id').Value:=ID;
        ParamByName('in_ord').Value:=OrdN+Direction;
        ExecSQL;
        SQL.Text:='update "worship_table" set ord=:in_ord where "ord" is null;';
        ParamByName('in_ord').Value:=OrdN;
        ExecSQL;
        Connection.Commit;
        qrWorships.Refresh;
        qrWorships.Locate('id',ID,[]);
      except
        Connection.Rollback; raise;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Options.actSermonUpExecute(Sender: TObject);
begin
  if qrSermons.FieldValues['id']=null then exit;
  MoveSermon(-1,qrSermons.FieldValues['id']);
end;

procedure TFH_Options.actSermonDownExecute(Sender: TObject);
begin
  if qrSermons.FieldValues['id']=null then exit;
  MoveSermon(1,qrSermons.FieldValues['id']);
end;

procedure TFH_Options.MoveSermon(Direction,ID:integer);
  var Num,ParID:integer;
begin
  if Direction=0 then exit; Direction:=Direction div Abs(Direction);
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      try
        Connection:=F_Main.ZConnection;
        SQL.Text:='select m."sermon_number" as sermon_number,m."worship" as wors'+
          'hip from "v_sermons" m where m."id"=:in_id';
        ParamByName('in_id').Value:=ID;
        Open; First;
        Num:=FieldValues['sermon_number'];
        ParID:=FieldValues['worship']; Close;
        Connection.StartTransaction;
        SQL.Text:='update "worship_sermons" set "sermon_number"=null where "serm'+
          'on_number"=:in_number and "worship"=:in_worship; ';
        ParamByName('in_number').Value:=Num+Direction;
        ParamByName('in_worship').Value:=ParID;
        ExecSQL;
        SQL.Text:='update "worship_sermons" set "sermon_number"=:in_number where'+
          ' rowid=:in_id; ';
        ParamByName('in_id').Value:=ID;
        ParamByName('in_number').Value:=Num+Direction;
        ExecSQL;
        SQL.Text:='update "worship_sermons" set "sermon_number"=:in_number where'+
          ' "sermon_number" is null;';
        ParamByName('in_number').Value:=Num;
        ExecSQL;
        Connection.Commit;
        qrSermons.Refresh;
        qrSermons.Locate('id',ID,[]);
      except
        Connection.Rollback; raise;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFH_Options.trlsSermonSortsDblClick(Sender: TObject);
begin
  actSermSortEdit.Execute;
end;

procedure TFH_Options.actExceedDaysExecute(Sender: TObject);
begin
  with TF_ExceedDays.Create(self)do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

end.
