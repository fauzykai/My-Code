unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  simpanan_awal,
  simpanan_akhir : double;
  bunga:real;
  periode,I:integer;
begin
simpanan_awal:=strtoint(edit1.text);
bunga:=strtoint(edit2.text);
periode:=strtoint(edit3.text);
i:=1;
simpanan_akhir:=0;
bunga:=bunga/100;
while i <= periode do
Begin
Simpanan_Akhir := Simpanan_awal + (Bunga *
Simpanan_Awal);
Simpanan_Awal := Simpanan_Akhir;
inc(i);
end;
Label7.Caption := 'Simpanan Akhir adalah Rp. ' +
FormatFloat('#,0',Simpanan_Akhir);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
