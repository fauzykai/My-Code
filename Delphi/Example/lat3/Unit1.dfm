object Form1: TForm1
  Left = 643
  Top = 146
  Width = 342
  Height = 162
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
    Left = 24
    Top = 16
    Width = 94
    Height = 13
    Caption = 'MASUKAN TAHUN'
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 74
    Height = 13
    Caption = 'KETERANGAN'
  end
  object Label3: TLabel
    Left = 160
    Top = 48
    Width = 3
    Height = 13
  end
  object Edit1: TEdit
    Left = 160
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 80
    Width = 75
    Height = 25
    Caption = '&PROSES'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 80
    Width = 75
    Height = 25
    Caption = '&SELESAI'
    TabOrder = 2
  end
end
