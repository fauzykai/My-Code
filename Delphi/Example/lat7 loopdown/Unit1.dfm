object Form1: TForm1
  Left = 324
  Top = 170
  Width = 291
  Height = 281
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
    Left = 16
    Top = 16
    Width = 130
    Height = 13
    Caption = 'TANGGAL SEKARANG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 106
    Height = 13
    Caption = 'TANGGAL KEMBALI :'
  end
  object Label3: TLabel
    Left = 16
    Top = 72
    Width = 44
    Height = 13
    Caption = 'DENDA :'
  end
  object Memo1: TMemo
    Left = 16
    Top = 104
    Width = 249
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 144
    Top = 72
    Width = 121
    Height = 21
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
    Left = 184
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Keluar'
    TabOrder = 4
    OnClick = Button2Click
  end
end
