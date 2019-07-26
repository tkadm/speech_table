unit u_objects;

{ $define DonotPrint}

interface
  uses classes,windows;

type

  TExcel=class
  private
    FExcel:variant;
    FHeadRaw,FHeadColumn,FActiveWorkSheet,
    FCurrentColumn,FCurrentRaw:cardinal;
    function    GetWorkSheet:Variant;
    function    GetValInCol(Raw:integer):variant;
    procedure   SetValInCol(Raw:integer; Value:variant);
  protected
    procedure   AddSheet;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure   ShowExcel;
    function    RangeInColumn(BeginInd,EndInd:integer):variant;
    function    GetRange(BeginRaw,EndRaw,BeginCol,EndCol:integer):variant;
    function    GetRows(BeginRaw,EndRaw:integer):variant;
    procedure   PaintRangeInColumn(const Range:variant; ColorIndex:integer);
    procedure   ColumnAutoFit;
    procedure   CloseExcel;
    procedure   PrintActiveSheet(Copies:byte; Preview:boolean; PrinterName:string);
    property    WorkSheet:Variant read GetWorkSheet;
    property    HeadRaw:cardinal read FHeadRaw write FHeadRaw;
    property    HeadColumn:cardinal read FHeadColumn write FHeadColumn;
    property    ActiveWorkSheetIndex:cardinal read FActiveWorkSheet write FActiveWorkSheet;
    property    CurrentColumn:cardinal read FCurrentColumn write FCurrentColumn;
    property    CurrentRaw:cardinal read FCurrentRaw write FCurrentRaw;
    property    ValuesInColumn[Raw:integer]:variant read GetValInCol write SetValInCol;
  end;

  TGraphDateData=class(TComponent)
  private
    FData:TDateTime;
    FGraphDateID:integer;
  protected
  public
    property DataValue:TDateTime read FData write FData;
    property GraphDateID:integer read FGraphDateID write FGraphDateID;
  end;

  TXlsData=record
    GraphID,AddEmptyStrings:integer;
    bShowWorshipNumber,bShowData:boolean;
    DateFrom,DateTo:TDateTime;
    PrintMaster:pointer;
  end;

  procedure ToExcel(const Data:TXlsData);
  function ComputeEsterDate(const Year:word):TDateTime;
  function CutFIO(InValue:string):string;
  const DayOfWeeksShortName:array [1..7] of string=('пн','вт','ср','чт','пт','сб','вс');
    Months:array [1..12] of string=('Январь','Февраль','Март','Апрель',
      'Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь');

implementation

  uses DB.SQLite, DateUtils, DB, SysUtils, u_main, variants,
  StrUtils, ComObj, mdPrintMaster, cxTL;

  const xlDiagonalDown=5; xlDiagonalUp=6; xlEdgeLeft=7; xlEdgeRight=10;
    xlEdgeTop=8; xlEdgeBottom=9; xlInsideVertical=11; xlInsideHorizontal=12;
    xlThin=2; xlThick=4; xlMedium=-4138; xlHairline=1;
    xlContinuous=1; xlDash=-4115; xlDashDot=4; xlDashDotDot=5; xlDot=-4118;
    xlDouble=-4119; xlLineStyleNone=-4142; xlSlantDashDot=13; xlPasteAll=-4104;
    xlPasteFormats=-4122; xlHAlignCenter=-4108; xlVAlignCenter=-4108;
    xlCenter=-4108; xlBottom=-4107; xlLeft=-4131; xlTop=-4160;
    xlGray8=18; xlLightUp=14; xlSolid=1;
    VertOtstup=2;
      
function ComputeEsterDate(const Year:word):TDateTime; //Этой процедуры на мой век хватит
  var a,b,Day,Month:word; //По новому стилю!
begin
  a:=(19*(Year mod 19)+15)mod 30;
  b:=(2*(Year mod 4)+4*(Year mod 7)+6*a+6)mod 7;
  if (a+b)>10 then
  begin
    Month:=4;
    Day:=a+b-9;
  end else
  begin
    Month:=3;
    Day:=22+a+b;
  end;
  result:=EncodeDate(Year,Month,Day)+13;
end;

function CutFIO(InValue:string):string;
  var i:integer;
begin
  result:=''; if InValue=null then exit;
  InValue:=Trim(InValue);
  i:=Pos(' ',InValue);
  result:=AnsiUpperCase(InValue[1])+AnsiLowerCase(Copy(InValue,2,i-1));
  while i<>0 do
  begin
    InValue:=Trim(Copy(InValue,i,Length(InValue)-i+1));
    result:=result+AnsiUpperCase(InValue[1])+'.';
    i:=Pos(' ',InValue);
  end;
end;

function GetPeriodString(FromDate,ToDate:TDateTime):string;
  var Year,Year_,Month,Month_,Day:word;
begin
  DecodeDate(FromDate,Year,Month,Day);
  DecodeDate(ToDate,Year_,Month_,Day);
  if Year<>Year_ then
    result:=Months[Month]+' '+IntToStr(Year)+'г. -'+Months[Month_]+' '+
      IntToStr(Year_)+'г.' else
    result:=Months[Month]+'-'+Months[Month_]+' '+IntToStr(Year)+'г.';
end;

procedure ToExcel(const Data:TXlsData);
  var ActiveRecCount,CurMonthCol,ActiveCol,SrvCount,WsAm:cardinal; N,Nt,Pt:integer;
    Range,DataArea,RangeL:variant; CurMonth,Day,Month,Year,DoW:word; sTemp:string;
    qr,qt:TtkSQLiteQuery; dt:TDateTime; lsPreachers:TList;
    Node:TcxTreeListNode;
begin //tree - проповедники treeServices-служения
  ActiveRecCount:=VertOtstup; qr:=nil; lsPreachers:=nil;
  try
  with TExcel.Create do
  begin
    try try
    qr:=TtkSQLiteQuery.Create(nil);
    qr.SQL.Text:='select distinct id,person,usable,caption from v_preachers p '+
      'join v_graph_sermons gs on p.id=gs.preacher where gs.graphs=:in_graph';
    qr.ParamByName('in_graph').Value:=Data.GraphID;
    qr.Open; qr.First;
    lsPreachers:=TList.Create;
    while not qr.Eof do //Вывод списка проповедующих...
    begin
      ValuesInColumn[CurrentRaw+ActiveRecCount]:=CutFIO(qr.FieldValues['caption']);
      lsPreachers.Add(Pointer(integer(qr.FieldValues['id'])));
      Inc(ActiveRecCount);
      qr.Next;
    end;
    Inc(ActiveRecCount,Data.AddEmptyStrings);
    //Параметры отображения списка проповедующих
    Range:=RangeInColumn(CurrentRaw,CurrentRaw+ActiveRecCount-1);
    //PaintRangeInColumn(Range,15);
    Range.Font.Italic:=true;
    Range.Font.Size:=13;
    Range.Borders[xlInsideHorizontal].Weight:=xlThin;
    //конец
    ColumnAutoFit;
    qr.SQL.Text:='select sum(ifnull(d."worships_amount",0)) as cn from "v_graphs'+
      '_dates" d where d."graphs"=:in_graph';
    qr.ParamByName('in_graph').Value:=Data.GraphID;
    qr.Open; qr.First;
    if qr.RecordCount=0 then SrvCount:=0 else SrvCount:=qr.FieldValues['cn'];
    //Ширина столбцов с датами
    GetRange(1,1,HeadColumn+1,HeadColumn+SrvCount).Columns.ColumnWidth:=3;
    //конец
    ActiveCol:=HeadColumn+1; CurMonthCol:=ActiveCol;
    qr.SQL.Text:='select id,date_worship,worships_amount,(select count(*) from '+
      '[graphs_sermons] gs where gs.[graphs_worship] in (select gw.id from [gra'+
      'phs_worships] gw where gw.[graphs_date]=g.id)) as sermons_inday_amount,c'+
      'aption from "v_graphs_dates" g where g."graphs"=:in_graph'; //выборка дат графика
    qr.ParamByName('in_graph').Value:=Data.GraphID;
    qr.Open; qr.First;
    DecodeDate(Data.DateFrom,Year,Month,Day);
    CurMonth:=Month;
    //New!
    Range:=GetRows(HeadRaw+1,HeadRaw+1);
    Range.RowHeight:=10;
    Range.Font.Size:=7;
    Range.HorizontalAlignment:=xlCenter;
    Range.VerticalAlignment:=xlBottom;
    //
    qt:=TtkSQLiteQuery.Create(nil);
    //обработка формата ячеек поля данных
    if Data.bShowWorshipNumber then
    begin
      qt.SQL.Text:='select count(*)as cnt from [graphs_worships] gw where gw.[g'+
        'raphs_date] in (select gd.id from [graphs_dates] gd where gd.graphs=:i'+
        'n_graph)';
      qt.ParamByName('in_graph').Value:=Data.GraphID;
      qt.Open;
      SrvCount:=qt.FieldValues['cnt'];
    end else SrvCount:=cardinal(qr.RecordCount);
    DataArea:=GetRange(CurrentRaw+VertOtstup,CurrentRaw+VertOtstup+ActiveRecCount-3,
      HeadColumn+1,HeadColumn+SrvCount);
    DataArea.HorizontalAlignment:=xlCenter;
    DataArea.Font.Bold:=true;
    DataArea.NumberFormat:='@';
    //
    qt.SQL.Text:='select gw.ord as worship_ord, gs.sermon_number, gs.preacher '+
      'from [graphs_worships] gw join [graphs_sermons] gs on gw.id=gs.graphs_w'+
      'orship where gs.preacher is not null and gw.graphs_date=:in_date_id ord'+
      'er by gw.ord,gs.sermon_number';
    //
    while not qr.EOF do  //выборка дат графика
    begin
      WsAm:=qr.FieldValues['worships_amount'];
      dt:=StrToDate(qr.FieldValues['date_worship']);
      if Data.bShowWorshipNumber then
      begin
        Range:=GetRange(HeadRaw,HeadRaw,ActiveCol,ActiveCol+WsAm-1);
        Range.Merge;
      end else Range:=WorkSheet.Cells[HeadRaw,ActiveCol];
      DecodeDate(dt,Year,Month,Day);
      sTemp:=IntToStr(Day);
      Range.Font.Size:=12;
      Range.Value:=sTemp;
      Range.HorizontalAlignment:=xlCenter;
      Range.VerticalAlignment:=xlBottom;
      //end
      DoW:=DayOfTheWeek(dt);
      //
      if Data.bShowWorshipNumber then
      begin
        Range:=GetRange(HeadRaw+1,HeadRaw+1,ActiveCol,ActiveCol+WsAm-1);
        Range.Merge;
      end else Range:=WorkSheet.Cells[HeadRaw+1,ActiveCol];
      Range.Value:=DayOfWeeksShortName[DoW];
      //end
      if Data.bShowWorshipNumber then
        Range:=GetRange(HeadRaw,HeadRaw+ActiveRecCount-1,ActiveCol,ActiveCol+WsAm-1)
      else
        Range:=GetRange(HeadRaw,HeadRaw+ActiveRecCount-1,ActiveCol,ActiveCol);
      Range.Borders[xlEdgeLeft].Weight:=xlThin;
      Range.Borders[xlInsideVertical].Weight:=xlHairline;
      Range.Borders[xlInsideHorizontal].Weight:=xlThin;
      if DoW=7 then PaintRangeInColumn(Range,34);//15
      //Обозначаю праздники на графике
      if qr.FieldValues['caption']<>null then
      begin
        if Data.bShowWorshipNumber then
        begin
          Range:=GetRange(HeadRaw+ActiveRecCount,HeadRaw+ActiveRecCount,ActiveCol,
            ActiveCol+WsAm-1);
          Range.Merge;
        end else Range:=WorkSheet.Cells[HeadRaw+ActiveRecCount,ActiveCol];
        Range.HorizontalAlignment:=xlCenter;
        Range.VerticalAlignment:=xlTop;
        Range.Font.Bold:=true;
        Range.Value:='П';
      end;
      if Data.bShowData then
      begin
        qt.ParamByName('in_date_id').Value:=qr.FieldValues['id'];
        if qt.Active then qt.Refresh else qt.Open;
        qt.First;
        while not qt.Eof do
        begin
          N:=integer(HeadRaw)+VertOtstup+
            lsPreachers.IndexOf(Pointer(integer(qt.FieldValues['preacher'])));
          if Data.bShowWorshipNumber then
          begin
            WorkSheet.Cells[N,ActiveCol+qt.FieldValues['worship_ord']-1]:=
              qt.FieldValues['sermon_number'];
          end
          else
          begin
            if qr.FieldValues['sermons_inday_amount']=1 then
              WorkSheet.Cells[N,ActiveCol]:='V'
            else
              WorkSheet.Cells[N,ActiveCol]:=IntToStr(qt.FieldValues['worship_ord'])+
                '-'+IntToStr(qt.FieldValues['sermon_number']);
          end;
          qt.Next;
        end;
      end;
      //
      qr.Next;//Далее никаких чтений из полей набора данных!!!
      if qr.EOF then begin Inc(Month); Inc(ActiveCol,1); end;
      if CurMonth<>Month then
      begin
        Range:=GetRange(HeadRaw-1,HeadRaw-1,CurMonthCol,ActiveCol-1);
        Range.Merge;
        Range.HorizontalAlignment:=xlCenter;
        Range.VerticalAlignment:=xlBottom;
        Range.Font.Bold:=true;
        Range.Font.Size:=12;
        if CurMonth=1 then sTemp:=Months[CurMonth]+' '+IntToStr(Year)+'г.' else
        if CurMonth=12 then sTemp:=Months[CurMonth]+' '+IntToStr(Year-1)+'г.' else
          sTemp:=Months[CurMonth];
        Range.Value:=sTemp;
        //Рамка для месяца по всему графику
        Range:=GetRange(HeadRaw-1,HeadRaw+ActiveRecCount-1,CurMonthCol,ActiveCol-1);
        Range.Borders[xlEdgeLeft].Weight:=    xlMedium;
        //конец
        CurMonth:=Month;
        CurMonthCol:=ActiveCol;
      end;
      if Data.bShowWorshipNumber then Inc(ActiveCol,WsAm) else Inc(ActiveCol);
    end;
    //Прорисовка внешней оконтовки
    Range:=GetRange(HeadRaw,HeadRaw+ActiveRecCount-1,HeadColumn,ActiveCol-2);//-3
    Range.Borders[xlEdgeLeft].Weight:=    xlMedium;
    Range.Borders[xlEdgeRight].Weight:=   xlMedium;
    Range.Borders[xlEdgeTop].Weight:=     xlMedium;
    Range.Borders[xlEdgeBottom].Weight:=  xlMedium;
    //конец
    //Заголовок графика
    Range:=GetRange(1,1,HeadColumn,ActiveCol-2);
    Range.Merge;
    Range.Font.Size:=18;
    Range.Value:='График проповедующих церкви ЕХБ "Возрождение"';
    Range.HorizontalAlignment:=xlCenter;
    Range:=GetRange(2,2,HeadColumn,ActiveCol-2);
    Range.Merge;
    Range.Font.Size:=14;
    Range.Value:='(на период '+GetPeriodString(Data.DateFrom,Data.DateTo)+')';
    Range.HorizontalAlignment:=xlCenter;
    //конец
    //прорисовка линий в месяцах
    Range:=GetRange(HeadRaw-1,HeadRaw-1,HeadColumn+1,ActiveCol-2);
    Range.Borders[xlEdgeRight].Weight:=       xlMedium;
    Range.Borders[xlEdgeTop].Weight:=         xlMedium;
    //конец
    //Черезстрочные полосы
    for N:=CurrentRaw+VertOtstup to CurrentRaw+VertOtstup+ActiveRecCount-3 do
    begin
      if (N div 2)*2=N then
      begin
        Range:=GetRange(N,N,HeadColumn+1,ActiveCol-2);
        Range.Interior.Pattern:=xlGray8;
      end;
    end;
    //конец
    Range:=GetRange(HeadRaw,HeadRaw+1,HeadColumn,ActiveCol-2);//-3
    Range.Borders[xlEdgeBottom].Weight:=xlMedium;
    qr.SQL.Text:='select id,date_worship,worships_amount,caption from "v_graphs_'+
      'dates" where graphs=:in_graph and caption is not null';
    qr.ParamByName('in_graph').Value:=Data.GraphID;
    qr.Open; qr.First;
    if qr.RecordCount>0 then
    begin
      Inc(ActiveRecCount);
      Range:=GetRange(HeadRaw+ActiveRecCount,HeadRaw+ActiveRecCount,HeadColumn,
        ActiveCol-2);
      Range.Merge;
      Range.Value:='Праздники (годовщины):';
      Range.Font.Size:=12; Range.Font.Bold:=true;
    end;
    while not qr.EOF do//Даты праздников
    begin
      Inc(ActiveRecCount);
      Range:=GetRange(HeadRaw+ActiveRecCount,HeadRaw+
        ActiveRecCount,HeadColumn,ActiveCol-2);
      Range.Merge;
      Range.Value:=string(qr.FieldValues['date_worship']+' '+
        qr.FieldValues['caption']);
      Range.Font.Bold:=true;
      qr.Next;
    end;
    Inc(ActiveRecCount,2);
    Range:=GetRange(HeadRaw+ActiveRecCount,HeadRaw+ActiveRecCount,HeadColumn,
      ActiveCol-2);
    Range.Merge;
    Range.Value:=GetDBValue('graph_bottom_message');
    Range.HorizontalAlignment:=xlCenter;
    Range.Font.Bold:=true;
    if Data.PrintMaster<>nil then with TF_PrintMaster(Data.PrintMaster) do
    begin
      Node:=trlsMembers.TopNode;
      if Node<>nil then
      begin
        if (Node.Values[trlsMembersID.ItemIndex]=0)and
        (Node.Values[trlsMembersCopyes.ItemIndex]>0) then
        begin
{$ifndef DonotPrint}
          if chbxUsePreveiw.Checked then ShowExcel;
          PrintActiveSheet(Node.Values[trlsMembersCopyes.ItemIndex],
            chbxUsePreveiw.Checked,cmbxPrinter.Text);
{$else}
          ShowExcel;            
{$endif}
        end;
        Node:=Node.GetNext;
      end;
      N:=CurrentRaw+VertOtstup;
      RangeL:=null;
      DataArea.Font.Bold:=false; Nt:=-1;
      while Node<>nil do
      begin
        if Node.Values[trlsMembersCopyes.ItemIndex]>0 then
        begin
          if Nt>=0 then    
          begin
            RangeL:=GetRange(Nt,Nt,HeadColumn,HeadColumn+SrvCount);
            RangeL.Font.Bold:=false;
            RangeL.Interior.Pattern:=xlSolid;
            if Pt>0 then
              GetRange(Nt,Nt,HeadColumn+1,HeadColumn+SrvCount).Interior.Pattern:=Pt;
          end;
          RangeL:=GetRange(CurrentRaw,CurrentRaw,HeadColumn+1,HeadColumn+SrvCount);
          RangeL.Font.Size:=10; RangeL.Font.Bold:=false;
          RangeL:=GetRange(CurrentRaw+1,CurrentRaw+1,HeadColumn+1,HeadColumn+SrvCount);
          RangeL.Font.Size:=6; RangeL.Font.Bold:=false;
          RangeL:=GetRange(N,N,HeadColumn+1,HeadColumn+SrvCount).Interior.Pattern;
          if VarIsNull(RangeL) then Pt:=0 else Pt:=RangeL;
          Range:=GetRange(N,N,HeadColumn,HeadColumn+SrvCount);
          Range.Font.Bold:=true;
          Range.Interior.Pattern:=xlLightUp;
          RangeL:=Range;
          Day:=HeadColumn+1; sTemp:='0';
          while sTemp<>'' do
          begin
            sTemp:=WorkSheet.Cells[N,Day];
            if sTemp<>'' then
            begin
              Range:=GetRange(HeadRaw,HeadRaw,Day,Day).Font;
              Range.Size:=12; Range.Bold:=true;
              Range:=GetRange(HeadRaw+1,HeadRaw+1,Day,Day).Font;
              Range.Size:=7; Range.Bold:=true;
            end;
            Inc(Day); sTemp:=WorkSheet.Cells[HeadRaw,Day];
          end;
{$ifndef DonotPrint}
          if chbxUsePreveiw.Checked then ShowExcel;
          PrintActiveSheet(Node.Values[trlsMembersCopyes.ItemIndex],
              chbxUsePreveiw.Checked,cmbxPrinter.Text);
{$else}
          ShowExcel;
{$endif}
          Nt:=N;
        end;
        Node:=Node.GetNext; Inc(N);
      end;
{$ifndef DonotPrint}
      CloseExcel;
{$endif}
    end else ShowExcel;
  except
    CloseExcel; raise;
  end;
  finally
    if Assigned(qr) then qr.Free; Free;
    if Assigned(lsPreachers) then lsPreachers.Free;
  end;
  end;
  except
  on Exception do
      MessageBox(0,PChar('К сожалению, при выгрузке возникли пробле'+
      'мы в соединении с MS Excel! (если он вообще установлен...)'),PChar('Ошибка!'),
      MB_OK+MB_ICONERROR);
  end;
end;

{ TExcel }

procedure TExcel.AddSheet;
begin
  FExcel.Sheets.Add;
end;

procedure TExcel.CloseExcel;
begin
  FExcel.ActiveWorkbook.Close(0);
end;

procedure TExcel.ColumnAutoFit;
begin
  FExcel.Columns[CurrentColumn].EntireColumn.AutoFit;
end;

constructor TExcel.Create;
begin
  FHeadRaw:=StrToInt(GetDBValue('head_raw')); FHeadColumn:=1; FActiveWorkSheet:=1;
  CurrentColumn:=FHeadColumn; CurrentRaw:=FHeadRaw;
  FExcel:=CreateOleObject('Excel.Application');
  FExcel.Workbooks.Add;
  FExcel.ActiveSheet.PageSetup.Orientation:=2;
end;

destructor TExcel.Destroy;
begin
  FExcel:=null;
end;

function TExcel.GetRange(BeginRaw,EndRaw,BeginCol,EndCol:integer):variant;
begin
  result:=WorkSheet.Range[WorkSheet.Cells[BeginRaw,BeginCol],
    WorkSheet.Cells[EndRaw,EndCol]];
end;

function TExcel.GetRows(BeginRaw,EndRaw: integer): variant;
begin
  result:=WorkSheet.Rows[IntToStr(BeginRaw)+':'+IntToStr(EndRaw)];
end;

function TExcel.GetValInCol(Raw:integer):variant;
begin
  result:=WorkSheet.Cells[Raw,CurrentColumn];
end;

function TExcel.GetWorkSheet:Variant;
begin
  result:=FExcel.WorkSheets[ActiveWorkSheetIndex];
end;

procedure TExcel.PaintRangeInColumn(const Range:variant; ColorIndex:integer);
begin
  Range.Interior.ColorIndex:=ColorIndex;
end;

procedure TExcel.PrintActiveSheet(Copies:byte; Preview:boolean; PrinterName:string);
begin
  WorkSheet.PrintOut(1,1,Copies,Preview,PrinterName,false,false,'');
end;

function TExcel.RangeInColumn(BeginInd,EndInd:integer):variant;
begin
  result:=WorkSheet.Range[WorkSheet.Cells[BeginInd,CurrentColumn],
    WorkSheet.Cells[EndInd,CurrentColumn]];
end;

procedure TExcel.SetValInCol(Raw:integer; Value:variant);
begin
  WorkSheet.Cells[Raw,CurrentColumn]:=Value;
end;

procedure TExcel.ShowExcel;
begin
  FExcel.Visible:=true;
end;

end.
