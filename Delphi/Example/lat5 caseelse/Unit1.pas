unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
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
Var
  Pilihan : Integer;
begin
  Pilihan:=strtoint(edit1.Text);
  case pilihan of
  1: Label6.Caption:='Keterangan : ES Jeruk Harganya Rp. 3500';
  2: Label6.Caption:='Keterangan : Jus Alpukat Harganya Rp. 4000';
  3: Label6.Caption:='Keterangan : Soda Susu Harganya Rp. 5000';
  else
  Label6.Caption:='Keterangan : Ma''af Minuman Tersebut Belum Ada';


end;
end;
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.


