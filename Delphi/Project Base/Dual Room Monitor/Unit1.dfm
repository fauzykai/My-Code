object Form1: TForm1
  Left = 260
  Top = 124
  Width = 773
  Height = 593
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clInactiveCaptionText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 136
    Top = 24
    Width = 522
    Height = 23
    Caption = 'MONITORING SUHU DAN KONTROL LAMPU RUANGAN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 48
    Width = 353
    Height = 225
    Caption = 'CONFIG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 256
      Top = 89
      Width = 45
      Height = 13
      Caption = 'RECEIVE'
    end
    object Label2: TLabel
      Left = 144
      Top = 88
      Width = 59
      Height = 13
      Caption = 'TRANSMIT'
    end
    object Label3: TLabel
      Left = 152
      Top = 32
      Width = 170
      Height = 25
      Caption = 'DISCONNECTED'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComLed2: TComLed
      Left = 304
      Top = 80
      Width = 25
      Height = 25
      ComPort = ComPort1
      LedSignal = lsRx
      Kind = lkRedLight
    end
    object ComLed3: TComLed
      Left = 208
      Top = 80
      Width = 25
      Height = 25
      ComPort = ComPort1
      LedSignal = lsTx
      Kind = lkRedLight
    end
    object Label12: TLabel
      Left = 232
      Top = 184
      Width = 3
      Height = 13
    end
    object Label13: TLabel
      Left = 200
      Top = 64
      Width = 74
      Height = 13
      Caption = 'SERIAL DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveCaptionText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 24
      Top = 24
      Width = 89
      Height = 25
      Caption = 'SET COM-PORT'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 24
      Top = 64
      Width = 89
      Height = 25
      Caption = 'CONNECT'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 24
      Top = 104
      Width = 89
      Height = 25
      Caption = 'DISCONNECT'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 24
      Top = 184
      Width = 89
      Height = 25
      Caption = 'CLOSE'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Memo1: TMemo
      Left = 144
      Top = 112
      Width = 185
      Height = 89
      TabOrder = 4
    end
    object ComTerminal1: TComTerminal
      Left = 144
      Top = 168
      Width = 185
      Height = 33
      Color = clBlack
      Columns = 10
      ComPort = ComPort1
      Emulation = teVT100orANSI
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      Rows = 2
      ScrollBars = ssBoth
      TabOrder = 5
      Visible = False
    end
    object Button7: TButton
      Left = 24
      Top = 144
      Width = 89
      Height = 25
      Caption = 'RESET DATA'
      TabOrder = 6
      OnClick = Button7Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 280
    Width = 721
    Height = 265
    Caption = 'MONITORING DAN KONTROL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label4: TLabel
      Left = 24
      Top = 64
      Width = 50
      Height = 13
      Caption = 'RUANG A'
    end
    object Label5: TLabel
      Left = 368
      Top = 64
      Width = 49
      Height = 13
      Caption = 'RUANG B'
    end
    object Label6: TLabel
      Left = 160
      Top = 64
      Width = 13
      Height = 13
      Caption = #176'C'
    end
    object Label8: TLabel
      Left = 504
      Top = 64
      Width = 13
      Height = 13
      Caption = #176'C'
    end
    object Label9: TLabel
      Left = 192
      Top = 64
      Width = 39
      Height = 13
      Caption = 'LAMPU'
    end
    object Label10: TLabel
      Left = 544
      Top = 64
      Width = 39
      Height = 13
      Caption = 'LAMPU'
    end
    object Shape1: TShape
      Left = 232
      Top = 64
      Width = 33
      Height = 17
      Shape = stCircle
    end
    object Shape2: TShape
      Left = 592
      Top = 64
      Width = 17
      Height = 17
      Shape = stCircle
    end
    object Edit1: TEdit
      Left = 80
      Top = 64
      Width = 73
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 424
      Top = 64
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object RadioButton1: TRadioButton
      Left = 32
      Top = 24
      Width = 81
      Height = 17
      Caption = 'CELCIUS'
      TabOrder = 2
    end
    object RadioButton2: TRadioButton
      Left = 120
      Top = 24
      Width = 89
      Height = 17
      Caption = 'FAHRENHEIT'
      TabOrder = 3
    end
    object Chart2: TChart
      Left = 360
      Top = 96
      Width = 345
      Height = 154
      Legend.Visible = False
      Title.Text.Strings = (
        'RUANG B')
      LeftAxis.Title.Caption = 'suhu2'
      LeftAxis.Title.Visible = False
      TabOrder = 4
      object Series2: TFastLineSeries
        Marks.Callout.Brush.Color = clBlack
        Marks.Visible = False
        LinePen.Color = clRed
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart1: TChart
      Left = 16
      Top = 96
      Width = 337
      Height = 154
      AllowPanning = pmHorizontal
      Legend.Visible = False
      Title.Text.Strings = (
        'RUANG A')
      LeftAxis.Title.Caption = 'suhu2'
      LeftAxis.Title.Visible = False
      Zoom.Allow = False
      Zoom.Direction = tzdHorizontal
      TabOrder = 5
      TabStop = True
      PrintMargins = (
        15
        29
        15
        29)
      object Series1: TFastLineSeries
        Marks.Callout.Brush.Color = clBlack
        Marks.Visible = False
        LinePen.Color = clRed
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TFastLineSeries
        Active = False
        Marks.Callout.Brush.Color = clBlack
        Marks.Visible = False
        LinePen.Color = clGreen
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.DateTime = True
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Button5: TButton
      Left = 280
      Top = 56
      Width = 65
      Height = 25
      Caption = 'OFF'
      TabOrder = 6
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 640
      Top = 56
      Width = 65
      Height = 25
      Caption = 'OFF'
      TabOrder = 7
      OnClick = Button6Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 384
    Top = 48
    Width = 361
    Height = 225
    Caption = 'DATA RECORD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 24
      Top = 24
      Width = 313
      Height = 177
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clInactiveCaptionText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
    end
  end
  object ComPort1: TComPort
    BaudRate = br2400
    Port = 'COM11'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Timeouts.ReadInterval = 100
    Timeouts.ReadTotalMultiplier = 8
    Timeouts.ReadTotalConstant = 8
    OnRxBuf = ComPort1RxBuf
    Left = 24
    Top = 8
  end
  object Timer1: TTimer
    Interval = 100
    Left = 56
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=uas2;Initial Catalog=uas2'
    LoginPrompt = False
    Left = 88
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 120
    Top = 8
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'datasuhu1'
    Left = 152
    Top = 8
  end
end
