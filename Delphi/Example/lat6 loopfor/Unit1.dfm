object Form1: TForm1
  Left = 402
  Top = 155
  Width = 273
  Height = 289
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
    Left = 8
    Top = 24
    Width = 116
    Height = 13
    Caption = 'HARGA HANDPHONE :'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 113
    Height = 13
    Caption = 'JUMLAH PEMBELIAN :'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 113
    Height = 13
    Caption = 'HASIL PERHITUNGAN'
  end
  object Edit1: TEdit
    Left = 128
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 16
    Top = 104
    Width = 225
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Proses'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Keluar'
    TabOrder = 4
    OnClick = Button2Click
  end
end
