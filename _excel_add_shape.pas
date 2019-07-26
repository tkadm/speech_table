unit _excel_add_shape;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ComObj;
 Const msoShapeOval = 9;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  var v,d:variant; tp,lf:double;
begin
  v:=CreateOleObject('Excel.Application');
  v.Workbooks.Add;
  tp:=v.ActiveSheet.Rows[5].Top;
  lf:=v.ActiveSheet.Columns[5].Left;
  //ShowMessage(floattostr(lf)+' '+floattostr(tp));
  d:=v.ActiveSheet.Shapes.AddShape(msoShapeOval, lf, tp, 14.25, 12.75);
  d.Fill.Transparency:=0.75;
  //d.Fill.ForeColor.ObjectThemeColor=0;
  v.Visible:=true;
end;

end.
