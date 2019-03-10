unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, CPortCtl, ExtCtrls, TeeProcs, TeeDraw3D,
  TeEngine, Series, Chart, TeeTools, TeePageNumTool, TeeGauges, DBChart,
  Grids, DBGrids, DB, ADODB, jpeg;

type
  TForm1 = class(TForm)
    ComPort1: TComPort;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComLed2: TComLed;
    ComLed3: TComLed;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Memo1: TMemo;
    ComTerminal1: TComTerminal;
    Chart2: TChart;
    Series2: TFastLineSeries;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Label6: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Series3: TFastLineSeries;
    Button5: TButton;
    Button6: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label12: TLabel;
    Label13: TLabel;
    Button7: TButton;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComPort1RxBuf(Sender: TObject; const Buffer; Count: Integer);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.Button2Click(Sender: TObject);
begin
ComPort1.Open;
label3.Caption:='CONNECTED' ;
label3.Font.Color:=clgreen ;
radiobutton1.checked:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
ComPort1.close;
label3.Caption:='DISCONNECTED' ;
label3.Font.Color:=clmaroon ;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
COMPORT1.ShowSetupDialog;
end;

procedure TForm1.ComPort1RxBuf(Sender: TObject; const Buffer;
Count: Integer);
 var
str,time:string;
suhu1,suhu2:real;
olah1,olah2,adc1,adc2 : single;
begin
comport1.ReadStr(str,8);
time:=datetimetostr(now);
//date:=datetostr(now);


  if str <> '' then
  begin
    memo1.Lines.Add(str);
    adc1 :=STRtoFLOAT(copy(str,1,3));
    adc2 :=STRtoFLOAT(copy(str,4,4));
    if radiobutton1.checked=true then
    begin
    radiobutton2.checked:=false;
    olah1 := adc1/1024*500;
    olah2 := adc2/1024*500;
    label6.Caption:='°C';
    label8.caption:='°C';
    end
    else
    begin
    radiobutton1.checked:=false;
    olah1 := adc1/1024*500*1.8+32;
    olah2 := adc2/1024*500*1.8+32;
    label6.caption:='°F';
    label8.caption:='°F';
    end;
    edit1.text:=FLOATtoSTR(olah1);
    edit2.Text:=FLOATtoSTR(olah2);
    edit1.text:=copy(edit1.text,1,5);
    edit2.text:=copy(edit2.text,1,5);
  end;
suhu1:=STRtoFLOAT(edit1.text);
chart1.Series[0].Add(suhu1,time,clgreen);
suhu2:=STRtoFLOAT(edit2.text);
chart2.Series[0].add(suhu2,time,clgreen);
adotable1.Open;
adotable1.Append;
adotable1.FieldByName('SuhuRuangA').AsString:=edit1.text+' '+label6.Caption;
adotable1.FieldByName('SuhuRuangB').AsString:=edit2.text+' '+label8.caption;
adotable1.FieldByName('LampuA').AsString:=button5.Caption;
adotable1.FieldByName('LampuB').AsString:=button6.Caption;
adotable1.FieldByName('waktu').AsString:=time;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if button5.caption='OFF' then
begin
button5.caption:='ON';
shape1.Brush.color:=clwhite;
end
else
begin
button5.caption:='OFF';
shape1.Brush.color:=clred;
end;
end;


procedure TForm1.Button6Click(Sender: TObject);
begin
if button6.caption='OFF' then
begin
button6.caption:='ON';
shape2.Brush.color:=clwhite;
end
else
begin
button6.caption:='OFF';
shape2.Brush.color:=clred;
end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
memo1.Clear;
chart1.Series[0].clear;
chart2.Series[0].clear;
end;

end.
