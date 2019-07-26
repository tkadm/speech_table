unit mdPreacherProperty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,cxControls, cxContainer, cxEdit, cxTextEdit,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxCheckBox,
  cxCurrencyEdit, cxTimeEdit, Menus, cxCalendar, cxMaskEdit, cxSpinEdit,u_main,
  cxDBTL, DB, DB.SQLite, cxTLData, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLookAndFeels,
  cxLookAndFeelPainters, cxTLdxBarBuiltInMenu;

type
  TF_PreacherProperty = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    trlsSermonTypes: TcxTreeList;
    trlsSermonTypesCaption: TcxTreeListColumn;
    trlsSermonTypesEnable: TcxTreeListColumn;
    trlsSermonTypesID: TcxTreeListColumn;
    GroupBox2: TGroupBox;
    trlsDatePeriodAbsence: TcxTreeList;
    trlsDayOfWeekAbsence: TcxTreeList;
    trlsDayOfWeekAbsenceChecked: TcxTreeListColumn;
    trlsDayOfWeekAbsenceDayCaption: TcxTreeListColumn;
    trlsDatePeriodAbsenceBegin: TcxTreeListColumn;
    trlsDatePeriodAbsenceEnd: TcxTreeListColumn;
    ppmPeriods: TPopupMenu;
    ppmAdd: TMenuItem;
    ppmDelete: TMenuItem;
    ppm_: TMenuItem;
    Label2: TLabel;
    spedProcentPower: TcxSpinEdit;
    chbxActiveState: TcxCheckBox;
    cmbxPersons: TcxLookupComboBox;
    qrPersons: TtkSQLiteQuery;
    dtsrPersons: TDataSource;
    chbxServiceLeader: TcxCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppmAddClick(Sender: TObject);
    procedure ppmDeleteClick(Sender: TObject);
    procedure chbxActiveStatePropertiesEditValueChanged(Sender: TObject);
    procedure cmbxPersonsPropertiesEditValueChanged(Sender: TObject);
  private
    FModifyed:boolean;
    FID:integer;
  public
    property FormModifyed:boolean read FModifyed write FModifyed;
    property PreacherID:integer read FID write FID;
  end;

implementation
  uses Math;
{$R *.dfm}

procedure TF_PreacherProperty.btnOKClick(Sender: TObject);
  var Node:TcxTreeListNode; n:integer;
begin
  if cmbxPersons.EditValue=null then exit;
  if FormModifyed then
  begin
    F_Main.ZConnection.StartTransaction;
    try
    with TtkSQLiteQuery.Create(self)do
    begin
      try
      SQL.Text:='delete from "absence_day_of_week" where preacher=:in_preacher';
      ParamByName('in_preacher').Value:=PreacherID;
      ExecSQL;
      SQL.Text:='delete from "absence_periods" where preacher=:in_preacher';
      ParamByName('in_preacher').Value:=PreacherID;
      ExecSQL;
      SQL.Text:='delete from "preachers_ability" where preacher=:in_preacher';
      ParamByName('in_preacher').Value:=PreacherID;
      ExecSQL;
      if PreacherID=0 then
      begin
        SQL.Text:='insert into preachers (person,active,usable,ord,service_lead'+
          'er)values (:in_person,:in_active,:in_usable,(select ifnull(MAX("ord"'+
          '),0)+1 from "preachers"),:in_service_leader)';
        ParamByName('in_person').Value:=cmbxPersons.EditValue;
      end else
      begin
        SQL.Text:='update preachers set active=:in_active,usable=:in_usable,ser'+
          'vice_leader=:in_service_leader where id=:in_preacher';
        ParamByName('in_preacher').Value:=PreacherID;
      end;
      if chbxActiveState.Checked then ParamByName('in_active').Value:=1
      else ParamByName('in_active').Value:=0;
      ParamByName('in_usable').Value:=Min(spedProcentPower.Value,100);
      if chbxServiceLeader.Checked then ParamByName('in_service_leader').Value:=1
      else ParamByName('in_service_leader').Value:=0;
      ExecSQL;
      if PreacherID=0 then
      begin
        SQL.Text:='select p."id" from preachers p where p.rowid=last_insert_rowid();';
        Open; PreacherID:=FieldValues['id'];
      end;
      SQL.Text:='insert into "preachers_ability" ("preacher","sermon_sorts") '+
        'values (:in_preacher,:in_sermonsorts)';
      ParamByName('in_preacher').Value:=PreacherID;
      Node:=trlsSermonTypes.TopNode;
      while Node<>nil do
      begin
        if Node.Values[trlsSermonTypesEnable.ItemIndex] then
        begin
          ParamByName('in_sermonsorts').Value:=Node.Values[trlsSermonTypesID.ItemIndex];
          ExecSQL;
        end;
        Node:=Node.GetNext;
      end;
      SQL.Text:='insert into "absence_day_of_week" ("day_of_week","preacher")'+
        'values (:in_day,:in_preacher)';
      ParamByName('in_preacher').Value:=PreacherID;
      Node:=trlsDayOfWeekAbsence.TopNode; n:=1;
      while Node<>nil do
      begin
        if Node.Values[trlsDayOfWeekAbsenceChecked.ItemIndex] then
        begin
          ParamByName('in_day').Value:=n;
          ExecSQL;
        end;
        Node:=Node.GetNext; Inc(n);
      end;
      SQL.Text:='insert into "absence_periods"("preacher","date_from","date_to")'+
        'values(:in_preacher,:in_date_from,:in_date_to)';
      ParamByName('in_preacher').Value:=PreacherID;
      Node:=trlsDatePeriodAbsence.TopNode;
      while Node<>nil do
      begin
        ParamByName('in_date_from').Value:=Node.Values[trlsDatePeriodAbsenceBegin.ItemIndex];
        ParamByName('in_date_to').Value:=Node.Values[trlsDatePeriodAbsenceEnd.ItemIndex];
        if(ParamByName('in_date_from').Value<>null)and
          (ParamByName('in_date_to').Value<>null)then ExecSQL;
        Node:=Node.GetNext;
      end;
      finally
      Free;
      end;
    end;
    F_Main.ZConnection.Commit;
    except
      F_Main.ZConnection.Rollback;
      raise;
    end;
    ModalResult:=mrOK;
  end else ModalResult:=mrCancel;
end;

procedure TF_PreacherProperty.FormShow(Sender:TObject);
  var Node:TcxTreeListNode; n:integer;
begin
  qrPersons.ParamByName('in_preacher').Value:=PreacherID;
  qrPersons.Open;
  with TtkSQLiteQuery.Create(self) do
  begin
    SQL.Text:='select s.id,s."caption", (select 1 from "preachers_ability" b where '+
      'b."sermon_sorts"=s.id and b."preacher"=:in_preacher) as able from '+
      'sermon_sorts s order by s.priority';
    ParamByName('in_preacher').Value:=PreacherID;
    Open; First;
    trlsSermonTypes.BeginUpdate;
    while not EOF do
    begin
      Node:=trlsSermonTypes.Add;
      Node.Values[trlsSermonTypesCaption.ItemIndex]:=FieldValues['caption'];
      Node.Values[trlsSermonTypesID.ItemIndex]:=FieldValues['id'];
      Node.Values[trlsSermonTypesEnable.ItemIndex]:=not(FieldValues['able']=null);
      Next;
    end;
    Close; trlsSermonTypes.EndUpdate;
    SQL.Text:='select ap."date_from",ap."date_to" from "absence_periods" ap where '+
      'ap."preacher"=:in_preacher order by ap."date_from"';
    ParamByName('in_preacher').Value:=PreacherID;
    Open; First;
    trlsDatePeriodAbsence.BeginUpdate;
    while not EOF do
    begin
      Node:=trlsDatePeriodAbsence.Add;
      Node.Values[trlsDatePeriodAbsenceBegin.ItemIndex]:=FieldValues['date_from'];
      Node.Values[trlsDatePeriodAbsenceEnd.ItemIndex]:=FieldValues['date_to'];
      Next;
    end;
    Close; trlsDatePeriodAbsence.EndUpdate;
    SQL.Text:='select distinct a."day_of_week" from "absence_day_of_week" a where '+
      'a."preacher"=:in_preacher order by a."day_of_week"';
    ParamByName('in_preacher').Value:=PreacherID;
    Open;
    trlsDayOfWeekAbsence.BeginUpdate;
    Node:=trlsDayOfWeekAbsence.TopNode; n:=1;
    while Node<>nil do
    begin
      Node.Values[trlsDayOfWeekAbsenceChecked.ItemIndex]:=Locate('day_of_week',n,[]);
      Node:=Node.GetNext; Inc(n);
    end;
    Close; trlsDayOfWeekAbsence.EndUpdate;
    SQL.Text:='select rowid as "rowid",p.id,p.person,p.active,p.usable,'+
      'p.service_leader from "preachers" p where p."id"=:in_preacher';
    ParamByName('in_preacher').Value:=PreacherID;
    Open; First;
    if RecordCount<>0 then
    begin
      cmbxPersons.EditValue:=FieldValues['person'];
      spedProcentPower.Value:=FieldValues['usable'];
      chbxActiveState.Checked:=NVL(FieldValues['active'],0)=1;
      chbxServiceLeader.Checked:=FieldValues['service_leader'];
    end;
    cmbxPersons.Properties.ReadOnly:=cmbxPersons.EditValue<>null;
    Free;
  end;
  FormModifyed:=false;
end;

procedure TF_PreacherProperty.ppmAddClick(Sender: TObject);
begin
  trlsDatePeriodAbsence.Add;
  FormModifyed:=true;
end;

procedure TF_PreacherProperty.ppmDeleteClick(Sender: TObject);
begin
  if trlsDatePeriodAbsence.FocusedNode=nil then exit;
  trlsDatePeriodAbsence.FocusedNode.Free;
  FormModifyed:=true;
end;

procedure TF_PreacherProperty.chbxActiveStatePropertiesEditValueChanged(
  Sender: TObject);
begin
  FormModifyed:=true;
end;

procedure TF_PreacherProperty.cmbxPersonsPropertiesEditValueChanged(
  Sender: TObject);
begin
  FormModifyed:=true;
end;

end.
