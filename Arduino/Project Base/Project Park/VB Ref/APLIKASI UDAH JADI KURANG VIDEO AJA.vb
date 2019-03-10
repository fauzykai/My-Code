Imports System
Imports System.Threading
Imports System.IO.Ports
Imports System.ComponentModel


Public Class Form1
    '------------------------------------------------
    Dim hasil() As String
    Dim myPort As Array
    Dim mxc As Single
    Dim myc As Single
    Dim mzc As Single
    Dim ax As Single
    Dim ay As Single
    Dim az As Single
    Dim gx As Single
    Dim gy As Single
    Dim gz As Single
    Dim mxcp As Single
    Dim mycp As Single
    Dim mzcp As Single
    Dim h As Single
    Dim th As Single
    Dim temp As Single
    Dim press As Single
    Dim atm As Single
    Dim alt As Single
    Dim InputData

    Delegate Sub SetTextCallback(ByVal [text] As String) 'Added to prevent threading errors during receiveing of data
    '------------------------------------------------
    Private Sub Form1_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        myPort = IO.Ports.SerialPort.GetPortNames()
        ComboBox1.Items.AddRange(myPort)

    End Sub
    Public Sub dataparse()

        'hasil = Split(RichTextBox2.Text, ",")
        'mxc = Convert.ToSingle(hasil(0))
        'myc = Convert.ToSingle(hasil(1))
        'mzc = Convert.ToSingle(hasil(2))
        'ax = Convert.ToSingle(hasil(3))
        'ay = Convert.ToSingle(hasil(4))
        'az = Convert.ToSingle(hasil(5))
        'gx = Convert.ToSingle(hasil(6))
        'gy = Convert.ToSingle(hasil(7))
        'gz = Convert.ToSingle(hasil(8))
        'mxcp = Convert.ToSingle(hasil(9))
        'mycp = Convert.ToSingle(hasil(10))
        'mzcp = Convert.ToSingle(hasil(11))
        'h = Convert.ToSingle(hasil(12))
        'th = Convert.ToSingle(hasil(13))
        'temp = Convert.ToSingle(hasil(14))
        'press = Convert.ToSingle(hasil(15))
        'atm = Convert.ToSingle(hasil(16))
        'alt = Convert.ToSingle(hasil(17))

        TextBox1.Text = hasil(1)
        TextBox2.Text = hasil(2)
        TextBox3.Text = hasil(3)
        TextBox4.Text = hasil(4)
        TextBox5.Text = hasil(5)
        TextBox6.Text = hasil(6)
        TextBox7.Text = hasil(7)
        TextBox8.Text = hasil(8)
        TextBox9.Text = hasil(9)
        TextBox10.Text = hasil(10)
        TextBox11.Text = hasil(11)
        'TextBox12.Text = hasil(12)
        'TextBox13.Text = hasil(13)
        'TextBox14.Text = hasil(14)
        'TextBox15.Text = hasil(15)
        'TextBox16.Text = hasil(16)
        'TextBox17.Text = hasil(17)
        'TextBox18.Text = hasil(18)
    End Sub

    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles Button1.Click
        SerialPort1.PortName = ComboBox1.Text
        SerialPort1.BaudRate = ComboBox2.Text
        SerialPort1.Open()
        Button1.Enabled = False
        Button4.Enabled = True

    End Sub

    Private Sub Button4_Click(sender As System.Object, e As System.EventArgs) Handles Button4.Click
        SerialPort1.Close()
        Button1.Enabled = True
        Button4.Enabled = False
    End Sub

    'Private Sub SerialPort1_DataReceived(sender As System.Object, e As System.IO.Ports.SerialDataReceivedEventArgs) Handles SerialPort1.DataReceived
    '    ReceivedText(SerialPort1.ReadExisting())
    'End Sub
    Private Sub SerialPort1_DataReceived(sender As System.Object, e As System.IO.Ports.SerialDataReceivedEventArgs) Handles SerialPort1.DataReceived
        Try
            InputData = SerialPort1.Readline
            RichTextBox2.Text = InputData
            Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
        Catch
        End Try
    End Sub

    Public Sub DoUpdate()
        dataparse()
    End Sub


    Private Sub ReceivedText(ByVal [text] As String) 'input from ReadExisting
        If Me.RichTextBox2.InvokeRequired Then
            Dim x As New SetTextCallback(AddressOf ReceivedText)
            Me.Invoke(x, New Object() {(text)})
        Else
            Me.RichTextBox2.Text &= [text] 'append text
        End If
        dataparse()
    End Sub



End Class