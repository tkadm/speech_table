unit mdWorship;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, DB, DB.SQLite,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TF_Worship = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    Label1: TLabel;
    txedTime: TcxTextEdit;
    procedure btnOKClick(Sender: TObject);
  private
    FID,FWeekID,FPeriodID:integer;
  public
    { Public declarations }
    property  ID:integer read FID write FID;
    property  WeekID:integer read FWeekID write FWeekID;
    property  PeriodID:integer read FPeriodID write FPeriodID;
  end;

implementation
  uses u_main;
{$R *.dfm}

procedure TF_Worship.btnOKClick(Sender: TObject);
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection:=F_Main.ZConnection;
      try
        Connection.StartTransaction;
        if ID=0 then
        begin
          SQL.Text:='insert into "worship_table"("ord","day_of_week","worship_ti'+
            'me","worship_table_period")values((select ifnull(max(wt."ord"),0)+1'+
            ' from "worship_table" wt where wt."day_of_week"=:in_day),:in_day,'+
            ':in_time,:in_period);';
          ParamByName('in_day').Value:=WeekID;
          ParamByName('in_period').Value:=PeriodID;
        end else
        begin
          SQL.Text:='update "worship_table" set "worship_time"=:in_time where id'+
            '=:in_id';
          ParamByName('in_id').Value:=ID;
        end;
        ParamByName('in_time').Value:=txedTime.Text;
        ExecSQL;
        if ID=0 then
        begin
          ID:=NVL(GetTableLastInsertRowValue('"worship_table"','"id"'),0);
          {SQL.Text:='select wt.id from "worship_table" wt where wt.rowid=last_in'+
            'sert_rowid();'; Open; First;
          if RecordCount>0 then ID:=FieldValues['id']
          else}
          if ID=0 then raise Exception.Create('Ошибка сохранения!');
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
