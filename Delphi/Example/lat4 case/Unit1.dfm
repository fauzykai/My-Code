object Form1: TForm1
  Left = 393
  Top = 245
  Width = 369
  Height = 220
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
    Left = 64
    Top = 24
    Width = 235
    Height = 20
    Caption = 'Memilih Kondisi dengan Case'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 56
    Width = 145
    Height = 13
    HelpType = htKeyword
    Caption = 'Masukan Nilai (0 ..100) : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 64
    Top = 88
    Width = 106
    Height = 17
    Caption = 'Index nya adalah :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 192
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button2: TButton
    Left = 208
    Top = 128
    Width = 75
    Height = 25
    Caption = '&Keluar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 128
    Width = 75
    Height = 25
    Caption = '&Proses'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
