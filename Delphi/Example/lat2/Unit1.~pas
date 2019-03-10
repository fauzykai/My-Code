unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
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
i : integer;
Tgl : TDateTime;

Const
  NamaHari : Array[1..7] of String=('minggu','senin','selasa','rabu','kamis','jum''at','sabtu');
  NamaBulan : Array[1..12] of string=('januari','februari','maret','april','mei','juni','juli','agustus','september','oktober','november','desember');

begin
  for i:= 1 to 7 do
    LongDayNames[i]:=NamaHari[i];
  for i:=1 to 12 do
    LongMonthNames[i]:=NamaBulan[i];
    Tgl :=StrToDate (Edit1.Text);
    Edit2.Text:=FormatDateTime('dddd, d mmmm yyyy',tgl);

  if Edit1.Text='06/07/1993' then
    Label3.Caption:='Benar Tanggal Lahirku'
  else
    Label3.Caption:='itu bukan tanggal lahir ku';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
close;
end;

end.
