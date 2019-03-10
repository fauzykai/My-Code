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
    Edit1: TEdit;
    Button2: TButton;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
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

procedure TForm1.BitBtn1Click(Sender: TObject);
Var nilai : Integer;
    Indek : String;

begin
    Nilai:=strtoint(edit1.text);
    Case Nilai of
    80..100 : Indek:='A';
    70..79  : Indek:='B';
    60..69  : Indek:='C';
    50..59  : Indek:='D';
    0..49   : Indek:='E';
end;
    Label3.Caption:='Indeknya adalah : '+Indek;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
close;
end;

end.

