unit mdSermon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,u_main, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, DB.SQLite, cxSpinEdit,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TF_Sermon = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    qrSermonSorts: TtkSQLiteQuery;
    dtsrSermonSorts: TDataSource;
    cmbxSermonSorts: TcxLookupComboBox;
    Label1: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FID:integer;
    FWorshipID:integer;
  public
    property ID:integer read FID write FID;
    property WorshipID:integer read FWorshipID write FWorshipID;
  end;

implementation

{$R *.dfm}

procedure TF_Sermon.btnOKClick(Sender: TObject);
begin
  if cmbxSermonSorts.EditValue=null then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      try
        Connection.StartTransaction;
        if ID=0 then
        begin
          SQL.Text:='insert into "worship_sermons" ("sermon_number","sermon_sort'+
          '","worship")values ((select ifnull(max(ws."sermon_number"),0)+1 from '+
          '"worship_sermons" ws where ws."worship"=:in_worship),:in_sermon_sort,'+
          ':in_worship);';
          ParamByName('in_worship').Value:=WorshipID;
        end else
        begin
          SQL.Text:='update "worship_sermons" set "sermon_sort"=:in_sermon_sort '+
            'where rowid=:in_id;';
          ParamByName('in_id').Value:=ID;
        end;
        ParamByName('in_sermon_sort').Value:=cmbxSermonSorts.EditValue;
        ExecSQL;
        if ID=0 then
        begin
          SQL.Text:='select last_insert_rowid() as id from week_table';
          Open; First;
          ID:=FieldValues['id'];
        end;
        Connection.Commit;
      except
        Connection.Rollback;
      end;
    finally
      Free;
    end;
  end;
  ModalResult:=mrOK;
end;

procedure TF_Sermon.FormCreate(Sender: TObject);
begin
  qrSermonSorts.Open;
end;

end.
