unit mdSermonSorts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, u_main, DB, DB.SQLite, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TF_SermonSorts = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    txedCaption: TcxTextEdit;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FID:integer;
  public
    { Public declarations }
    property  ID:integer read FID write FID;
  end;

implementation

{$R *.dfm}

procedure TF_SermonSorts.btnOKClick(Sender: TObject);
begin
  if Trim(txedCaption.Text)='' then exit;
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      Connection.StartTransaction;
      try
        if ID=0 then
        begin
          SQL.Text:='insert into "sermon_sorts" ("caption","priority")values(:in'+
            '_caption,(select ifnull(max(ss."priority"),0)+1 from "sermon_sorts"'+
            ' ss))';
        end else
        begin
          SQL.Text:='update "sermon_sorts" set "caption"=:in_caption where id=:i'+
            'n_id';
          ParamByName('in_id').Value:=ID;
        end;
        ParamByName('in_caption').Value:=txedCaption.Text;
        ExecSQL;
        if ID=0 then
        begin
          SQL.Text:='select id from "sermon_sorts" where rowid=last_insert_rowid'+
            '();';
          Open; ID:=FieldValues['ID'];
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

end.
