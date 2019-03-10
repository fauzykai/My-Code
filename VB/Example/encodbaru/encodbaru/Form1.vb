Public Class Form1
    Dim inputdata As String = ""
    Dim indata As String = ""
    Dim l As Integer
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        SerialPort1.PortName = "COM52"
        SerialPort1.BaudRate = "38400"
        SerialPort1.Parity = IO.Ports.Parity.None
        SerialPort1.StopBits = IO.Ports.StopBits.One
        SerialPort1.DataBits = 8
        SerialPort1.Open()
        SerialPort1.Write("A")
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Timer1.Enabled = False
    End Sub
    Private Sub SerialPort1_DataReceived(ByVal sender As System.Object, _
                     ByVal e As System.IO.Ports.SerialDataReceivedEventArgs)

        Try
            inputdata = SerialPort1.ReadExisting
            Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
        Catch ex As Exception
            MsgBox("Connectin Error, Please try again")
        End Try

    End Sub
    Public Sub DoUpdate()
        TextBox1.Text = inputdata
        Try
            encod()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        SerialPort1.Write("Z")
        SerialPort1.Close()
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        'SerialPort1.PortName = "COM10"
        'SerialPort1.BaudRate = "115200"
        'SerialPort1.Parity = IO.Ports.Parity.None
        'SerialPort1.StopBits = IO.Ports.StopBits.One
        'SerialPort1.DataBits = 8
        'SerialPort1.Open()
        'SerialPort1.Write("A")
        AxMSComm1.PortOpen = True
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Timer1.Enabled = True
        Timer1.Start()
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Timer1.Stop()
        'SerialPort1.Close()

        AxMSComm1.PortOpen = False
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        'SerialPort1.Write("$M<a")
        AxMSComm1.Output = "$M<a"
    End Sub
    Public Sub encod()
    End Sub

    Private Sub SerialPort1_DataReceived_1(ByVal sender As System.Object, ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) Handles SerialPort1.DataReceived
        Try
            inputdata = SerialPort1.ReadExisting
            Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
        Catch ex As Exception
            MsgBox("Connectin Error, Please try again")
        End Try

    End Sub

    Private Sub AxMSComm1_OnComm(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AxMSComm1.OnComm
        Dim i As Integer
        indata = AxMSComm1.Input
        TextBox3.Text = indata
        TextBox2.Text = ""
        If Mid(indata, 5, 1) = "a" Then
            For i = 1 To Val(Asc(Mid(indata, 4, 1)) - 4) Step 2
                l = Val(Asc(Mid(indata, 6 + i, 1))) * 256 + Val(Asc(Mid(indata, 5 + i, 1)))
                If l > 32768 Then l = l - 65536
                TextBox2.Text = TextBox2.Text & l & " "
            Next
            l = Val(Asc(Mid(indata, 5 + i, 1))) + _
                Val(Asc(Mid(indata, 6 + i, 1))) * 256 + _
                Val(Asc(Mid(indata, 7 + i, 1))) * 65536
            TextBox2.Text = TextBox2.Text & l & " "
        End If
    End Sub
End Class
