unit mdWorshipTablePeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DB.SQLite;

type
  TF_WorshipTablePeriod = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    dtedDateFrom: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FID:integer;
  public
    property ID:integer read FID write FID;
  end;

implementation

uses u_main;

{$R *.dfm}

procedure TF_WorshipTablePeriod.btnOKClick(Sender: TObject);
begin
  if Length(dtedDateFrom.Text)=0 then exit;
  with TtkSQLiteQuery.Create(self)do
  try
    if ID=0 then SQL.Text:='insert into worship_table_period(works_from)'+
      'values(:in_date)' else
    begin
      SQL.Text:='update worship_table_period set [works_from]=:in_date where '+
        'id=:in_id';
      ParamByName('in_id').Value:=ID;
    end;
    ParamByName('in_date').Value:=DateToISOStr(dtedDateFrom.Date);
    ExecSQL;
    if ID=0 then
    begin
      ID:=NVL(GetTableLastInsertRowValue('worship_table_period','id'),0);
      if ID=0 then raise Exception.Create('Ошибка сохранения!');
    end;
  finally
    Free;
  end;
  ModalResult:=mrOK;
end;

procedure TF_WorshipTablePeriod.FormCreate(Sender: TObject);
begin
  ID:=0;
  dtedDateFrom.Date:=Date;
end;

end.
