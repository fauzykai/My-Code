object Form1: TForm1
  Left = 244
  Top = 153
  Width = 385
  Height = 278
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
    Top = 8
    Width = 332
    Height = 20
    Caption = 'Memilih Kondisi dengan CASE..OF..ELSE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 72
    Top = 160
    Width = 61
    Height = 13
    Caption = 'Keterangan :'
  end
  object GroupBox1: TGroupBox
    Left = 48
    Top = 40
    Width = 281
    Height = 113
    Caption = 'Daftar Minuman'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 53
      Height = 13
      Caption = '1. Es Jeruk'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 67
      Height = 13
      Caption = '2. Jus Alpukat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 72
      Width = 64
      Height = 13
      Caption = '3. Soda Susu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 136
      Top = 24
      Width = 76
      Height = 13
      Caption = 'Pesanan Anda?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 120
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Proses'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Selesai'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
