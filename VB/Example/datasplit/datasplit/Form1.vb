Public Class Form1
    Dim inputdata As String
    Dim arrayhasil() As String

    'Dim rx As String = SerialPort1.ReadLine
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        SerialPort1.PortName = "COM42"
        SerialPort1.BaudRate = "57600"
        SerialPort1.Parity = IO.Ports.Parity.None
        SerialPort1.StopBits = IO.Ports.StopBits.One
        SerialPort1.DataBits = 8
        SerialPort1.Open()
        SerialPort1.Write("A")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        SerialPort1.Write("Z")
        SerialPort1.DiscardInBuffer()
        TextBox1.Clear()
        SerialPort1.Close()
    End Sub

    Private Sub SerialPort1_DataReceived(ByVal sender As System.Object, ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) Handles SerialPort1.DataReceived
        Try
            InputData = SerialPort1.ReadLine
            Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
            'MsgBox("a")
        Catch ex As Exception
            MsgBox("Connectin Error, Please try again")
        End Try

    End Sub
    Public Sub DoUpdate()
        TextBox1.AppendText(inputdata)
        arrayhasil = Split(inputdata, " ")
        TextBox2.Text = arrayhasil(0)
        TextBox3.Text = arrayhasil(1)
        TextBox4.Text = arrayhasil(2)
    End Sub

End Class
