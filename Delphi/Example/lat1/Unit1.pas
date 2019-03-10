unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    editpesan: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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
begin
EditPesan.Text:='Hallo Dunia..';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
editpesan.text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 editpesan.font.color:=clred;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
editpesan.font.color:=clblack;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
editpesan.font.color:=clyellow;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
editpesan.font.color:=clblue;
end;

procedure TForm1.Button3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 form1.color:=clred
end;

procedure TForm1.Button6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 form1.Color:=clblue;
end;

procedure TForm1.Button5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
form1.color:=clyellow;
end;

procedure TForm1.Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
form1.Color:=clblack;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
form1.Color:=clwhite;
end;

end.
