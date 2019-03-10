unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
TglKembali,hari: TDateTime;
HariIni : String;
JmlHari : Double;
i,Denda,bayar:Integer;

begin
denda:=StrToint ( Edit2.Text);
TglKembali:=StrTodate(Edit1.Text);
HariIni :=DateToStr(now);
hari:=StrTodate(hariini);
jmlhari:=tglkembali-hari
for i :=strtoint (floattostr(jmlhari)) downto 1 do
begin
bayar:=i*denda;
memo1.Lines.add(inttostr(i)+'*'+inttostr(denda)+' - '+inttostr(bayar));
end;
i:=i+1;
procedure TForm1.Button2Click(Sender: TObject);
begin
close;
end;

end.
