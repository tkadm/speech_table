unit mdPrintMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTextEdit, cxSpinEdit, DB, DB.SQLite, cxContainer, 
  cxEdit, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters, cxTLdxBarBuiltInMenu;

type
  TF_PrintMaster = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    trlsMembers: TcxTreeList;
    trlsMembersID: TcxTreeListColumn;
    trlsMembersCopyes: TcxTreeListColumn;
    trlsMembersCaption: TcxTreeListColumn;
    Panel1: TPanel;
    Label1: TLabel;
    cmbxPrinter: TcxComboBox;
    chbxUsePreveiw: TcxCheckBox;
    spedCopies: TcxSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure trlsMembersCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure spbtCopiesPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FGraph:integer;
  public
    { Public declarations }
    property GraphID:integer read FGraph write FGraph;
  end;

implementation
  uses u_main,printers;
{$R *.dfm}

procedure TF_PrintMaster.FormShow(Sender: TObject);
  procedure AddNode(ID:integer; Text:string);
    var Node:TcxTreeListNode;
  begin
    Node:=trlsMembers.Add;
    Node.Values[trlsMembersID.ItemIndex]:=ID;
    Node.Values[trlsMembersCopyes.ItemIndex]:=1;
    Node.Values[trlsMembersCaption.ItemIndex]:=Text;
  end;
begin
  with TtkSQLiteQuery.Create(self)do
  begin
    try
      SQL.Text:='select p.[id] as id,p.[caption] as caption from [v_preachers] p'+
        ' where p.[id] in (select gs.[preacher] from [v_graph_sermons] gs where '+
        'gs.[graphs]=:in_graph)';
      ParamByName('in_graph').Value:=GraphID;
      Open; First;
      if RecordCount>0 then AddNode(0,'Общий график');
      while not Eof do
      begin
        AddNode(FieldValues['ID'],FieldValues['CAPTION']);
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TF_PrintMaster.FormCreate(Sender: TObject);
begin
  GraphID:=0;
  cmbxPrinter.Properties.Items.Assign(Printer.Printers);
  cmbxPrinter.ItemIndex:=Printer.PrinterIndex;
end;

procedure TF_PrintMaster.trlsMembersCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.Values[trlsMembersID.ItemIndex]=0 then
    ACanvas.Font.Color:=clBlue else ACanvas.Font.Color:=clBlack;
end;

procedure TF_PrintMaster.spbtCopiesPropertiesChange(Sender: TObject);
  var Node:TcxTreeListNode;
begin
  Node:=trlsMembers.TopNode;
  trlsMembers.BeginUpdate;
  try
    while Node<>nil do
    begin
      Node.Values[trlsMembersCopyes.ItemIndex]:=spedCopies.Value;
      Node:=Node.GetNext;
    end;
  finally
    trlsMembers.EndUpdate;
  end;
end;

end.
