unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
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
  i,jml : integer ;
begin
  jml:=StrToInt (Edit2.Text);
  for I := 1 to jml do
  begin
    memo1.Lines.Add(Edit1.Text+' * '+InttoStr(i)+' = '+IntToStr(StrToInt(Edit1.Text)*i)) ;

end;
    i:=i+1;
    end;
procedure TForm1.Button2Click(Sender: TObject);
begin
close;
end;

end.
