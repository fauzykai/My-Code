object Form1: TForm1
  Left = 424
  Top = 146
  Width = 451
  Height = 188
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 191
    Height = 13
    Caption = 'Masukan Tgl dengan Format (hh/bb/tttt)'
  end
  object Label2: TLabel
    Left = 32
    Top = 56
    Width = 82
    Height = 13
    Caption = 'Hari dan Tanggal'
  end
  object Label3: TLabel
    Left = 200
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Edit1: TEdit
    Left = 248
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 248
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 104
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Proses'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Selesai'
    TabOrder = 3
    OnClick = Button2Click
  end
end
