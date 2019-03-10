Imports System
Imports System.Threading
Imports System.IO.Ports
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms

Public Class Form1
    Dim myport As Array
    Dim InputData As String
    Dim hasil() As String
    Dim slot As Integer
    Dim numsen As Integer = 5 'banyaknya sensor
    Dim min_distance = 5 'cm
    Dim max_distance = 30 'cm
    Delegate Sub SetTextCallback(ByVal [text] As String)
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        bukaportbaud()
        Button1.Enabled = True
        Button2.Enabled = False
    End Sub


    Public Sub bukaportbaud()
        myport = IO.Ports.SerialPort.GetPortNames()
        System.Threading.Thread.Sleep(300)
        ComboBox1.Items.Add(9600)
        ComboBox1.Items.Add(19200)
        ComboBox1.Items.Add(38400)
        ComboBox1.Items.Add(57600)
        ComboBox1.Items.Add(115200)
        For i = 0 To UBound(myport)
            ComboBox2.Items.Add(myport(i))
        Next
        ComboBox1.Text = ComboBox1.Items.Item(0)
        ComboBox2.Text = ComboBox2.Items.Item(0)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        SerialPort1.PortName = ComboBox2.Text
        SerialPort1.BaudRate = ComboBox1.Text
        SerialPort1.Open()
        Button1.Enabled = False
        Button2.Enabled = True
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        SerialPort1.Close()
        Button1.Enabled = True
        Button2.Enabled = False
    End Sub

    Private Sub SerialPort1_DataReceived(sender As System.Object, e As System.IO.Ports.SerialDataReceivedEventArgs) Handles SerialPort1.DataReceived

        ReceivedText(SerialPort1.ReadExisting())
        Try
            'InputData = SerialPort1.ReadLine
            'RichTextBox1.Text = InputData
            'TextBox1.Text = InputData
            'Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
        Catch ex As Exception
            'MsgBox("Connection Error")
        End Try
    End Sub
    Public Sub DoUpdate()

    End Sub

    Private Sub ReceivedText(ByVal [text] As String) 'input from ReadExisting
        If Me.TextBox1.InvokeRequired Then
            Dim x As New SetTextCallback(AddressOf ReceivedText)
            Me.Invoke(x, New Object() {(text)})
        Else
            'Me.RichTextBox1.Text &= [text] 'append text
            TextBox1.Text = [text]
            Try
                dataparse()
            Catch ex As Exception
            End Try

            'DoUpdate()
        End If
    End Sub
    Public Sub dataparse()
        hasil = Split(TextBox1.Text, ",")
        
        If (hasil(0) > min_distance And hasil(0) < max_distance) Then
            PictureBox1.BackColor = Color.Green
            slot = slot + 1
        Else
            PictureBox1.BackColor = Color.Gray
        End If
        If (hasil(1) > min_distance And hasil(1) < max_distance) Then
            PictureBox2.BackColor = Color.Green
            slot = slot + 1
        Else
            PictureBox2.BackColor = Color.Gray
        End If
        If (hasil(2) > min_distance And hasil(2) < max_distance) Then
            PictureBox3.BackColor = Color.Green
            slot = slot + 1
        Else
            PictureBox3.BackColor = Color.Gray
        End If
        If (hasil(3) > min_distance And hasil(3) < max_distance) Then
            PictureBox4.BackColor = Color.Green
            slot = slot + 1
        Else
            PictureBox4.BackColor = Color.Gray
        End If
        If (hasil(4) > min_distance And hasil(4) < max_distance) Then
            PictureBox5.BackColor = Color.Green
            slot = slot + 1
        Else
            PictureBox5.BackColor = Color.Gray
        End If

        TextBox2.Text = numsen - slot
        slot = 0
    End Sub
End Class
