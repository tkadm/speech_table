unit u_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, cxStyles, cxLookAndFeels, cxControls, DB.SQLite,
  StdCtrls, cxGraphics, cxCustomData,
  cxCheckBox, DB, cxMaskEdit, cxTextEdit,
  cxCurrencyEdit,  ActnList, Menus,
  cxClasses, ExtCtrls, cxDropDownEdit, DBCtrls, cxContainer,
  cxEdit, cxLookupEdit, cxTL, cxLookAndFeelPainters, cxPCdxBarPopupMenu;

type
  TF_Main = class(TForm)
    pgcnMain: TcxPageControl;
    LookAndFeelController: TcxLookAndFeelController;
    StyleRepository: TcxStyleRepository;
    tbshGraphs: TcxTabSheet;
    tbshOptions: TcxTabSheet;
    TreeListStyleSheet: TcxTreeListStyleSheet;
    StyleBkGround: TcxStyle;
    StyleSelected: TcxStyle;
    ZConnection: TtkSQLiteConnection;
    procedure FormShow(Sender: TObject);
    procedure ZConnectionAfterConnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function  GetLastInsertRowId:integer;
    { Private declarations }
  protected
    //property  Table:TSermonTable read FTable write FTable;
  public
    { Public declarations }
    procedure Vacuum;
    property  LastInsertRowId:integer read GetLastInsertRowId;
  end;

  function NVL(Value,DefValue:variant):variant;
  function GetDBValue(const ValueName:string):string;
  function GetTableLastInsertRowValue(aTableName,aColumnName:string):variant;
  function DateToISOStr(ADate:TDateTime):string;

var
  F_Main: TF_Main;

implementation

  uses uh_graphics, uh_options;

{$R *.dfm}

function NVL(Value,DefValue:variant):variant;
begin
  if Value=null then result:=DefValue else result:=Value;
end;

function GetDBValue(const ValueName:string):string;
begin
  with TtkSQLiteQuery.Create(F_Main)do
  begin
    try
      SQL.Text:='select value from "options" where varname=:in_name';
      ParamByName('in_name').Value:=ValueName;
      Open; First;
      result:=FieldValues['value'];
    finally
      Free;
    end;
  end;
end;

function GetTableLastInsertRowValue(aTableName,aColumnName:string):variant;
begin
  with TtkSQLiteQuery.Create(F_Main)do
  try
    SQL.Text:='select '+aColumnName+' from '+aTableName+
      ' where rowid=last_insert_rowid()';
    Open;
    if RecordCount>0 then result:=FieldValues[aColumnName] else result:=null;
  finally
    Free;
  end;
end;

function DateToISOStr(ADate:TDateTime):string;
begin
  result:=FormatDateTime('yyyy-mm-dd',ADate);
end;

procedure TF_Main.FormShow(Sender: TObject);
begin
  pgcnMain.ActivePageIndex:=0;
  FH_Graphics.Panel.Parent:=tbshGraphs;
  FH_Options.Panel.Parent:=tbshOptions;
  //ZConnection.Connect;
end;

function TF_Main.GetLastInsertRowId:integer;
begin
  with TtkSQLiteQuery.Create(self)do
  try
    SQL.Text:='select last_insert_rowid() as id';
    Open;
    result:=FieldValues['id'];;
  finally
    Free;
  end;
end;

procedure TF_Main.ZConnectionAfterConnect(Sender: TObject);
begin
  ZConnection.ExecuteDirect('CREATE TEMPORARY TABLE "celebrations"('+
    'celebrate_ref integer,celebrate_type integer,date_value date);');
  ZConnection.ExecuteDirect('PRAGMA foreign_keys = ON;');
end;

procedure TF_Main.FormCreate(Sender: TObject);
begin
  ZConnection.Connect;
  FH_Graphics:=TFH_Graphics.Create(self);
  FH_Options:=TFH_Options.Create(self);
end;

procedure TF_Main.Vacuum;
begin
  ZConnection.ExecuteDirect('VACUUM;');
end;

procedure TF_Main.FormClose(Sender: TObject; var Action: TCloseAction);
  var res:integer;
begin
  if FH_Graphics.DataGridChanged then
  begin
    res:=MessageBox(Handle,PChar('Сохранить изменения в текущем графике?'),
      PChar(Caption),MB_YESNOCANCEL+MB_ICONEXCLAMATION);
    case res of
    IDYES:    FH_Graphics.SaveData;
    IDCANCEL: Action:=caNone;
    end;
  end;
end;

end.
