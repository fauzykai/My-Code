object Form1: TForm1
  Left = 411
  Top = 211
  Width = 309
  Height = 261
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
    Width = 247
    Height = 13
    Caption = 'MENGHITUNG BUNGA SIMPANAN  BANK JERRY'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 96
    Height = 13
    Caption = 'Simpanan Awal (Rp)'
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 31
    Height = 13
    Caption = 'Bunga'
  end
  object Label4: TLabel
    Left = 16
    Top = 104
    Width = 36
    Height = 13
    Caption = 'Periode'
  end
  object Label5: TLabel
    Left = 256
    Top = 88
    Width = 8
    Height = 13
    Caption = '%'
  end
  object Label6: TLabel
    Left = 256
    Top = 112
    Width = 27
    Height = 13
    Caption = 'Bulan'
  end
  object Label7: TLabel
    Left = 16
    Top = 144
    Width = 97
    Height = 13
    Caption = 'Simpanan Akhir (Rp)'
  end
  object Edit1: TEdit
    Left = 128
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 128
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Proses'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Keluar'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
end
