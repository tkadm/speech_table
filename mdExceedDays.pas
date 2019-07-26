unit mdExceedDays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, u_main, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxControls, cxInplaceContainer, cxTextEdit, cxCheckBox, DB, DB.SQLite,
  cxLookAndFeels, cxLookAndFeelPainters, cxTLdxBarBuiltInMenu;

type
  TF_ExceedDays = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    treeDays: TcxTreeList;
    treeDaysID: TcxTreeListColumn;
    treeDaysChecked: TcxTreeListColumn;
    treeDaysCAPTION: TcxTreeListColumn;
    Label1: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.dfm}
procedure TF_ExceedDays.FormShow(Sender: TObject);
  var Node:TcxTreeListNode;
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      SQL.Text:='select wt."day_of_week" as id,c."day_of_week" as checked, wt."c'+
        'aption" as caption from "week_table" wt left join "celebrate_exceedes_d'+
        'ays" c on (wt."day_of_week"=c."day_of_week") limit 7;';
      Open; First;
      while not EOF do
      begin
        Node:=treeDays.Add;
        Node.Values[treeDaysID.ItemIndex]:=FieldValues['id'];
        Node.Values[treeDaysChecked.ItemIndex]:=FieldValues['checked']<>null;
        Node.Values[treeDaysCAPTION.ItemIndex]:=FieldValues['caption'];
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TF_ExceedDays.btnOKClick(Sender: TObject);
  var Node:TcxTreeListNode;
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      Connection.StartTransaction;
      try
        SQL.Text:='delete from "celebrate_exceedes_days";';
        ExecSQL;
        SQL.Text:='insert into "celebrate_exceedes_days" ("day_of_week")values(:'+
          'in_day);';
        Node:=treeDays.TopNode;
        while Node<>nil do
        begin
          if Node.Values[treeDaysChecked.ItemIndex] then
          begin
            ParamByName('in_day').Value:=Node.Values[treeDaysID.ItemIndex];
            ExecSQL;
          end;
          Node:=Node.GetNext;
        end;
        Connection.Commit;
      except
        Connection.Rollback; raise;
      end;
    finally
      Free;
    end;
  end;
  ModalResult:=mrOK;
end;

end.
