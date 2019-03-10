unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
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
  tahun : integer;

begin
tahun:=StrToInt (Edit1.Text);
if tahun > 0 then
  if ((Tahun mod 4 ) = 0 ) or ((tahun mod 400)=0) then
  label3.Caption:='tahun kabisat'
else
  label3.caption:='bukan tahun kabisat'
else
  label3.Caption:='tahun harus bilangan positif';
  
end;

end.
