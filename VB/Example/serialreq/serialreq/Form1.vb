Public Class Form1
    Dim myport As Array
    Dim inputdata As String
    Dim texttx As String
    Dim counter As Integer
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        bukaportbaud()
        TextBox1.Text = 1000
        'textbtx()
        'PictureBoxtx.BackColor = Color.White
        Timer2.Start()
    End Sub
    Public Sub textbtx()
        'TextBoxtx.Text = "1234567890abcdefghijklmnopqrstuvwxyz~!@#$%^&*())(*&^%$#@!0987654321"

    End Sub
    Public Sub bukaportbaud()
        myport = IO.Ports.SerialPort.GetPortNames()
        System.Threading.Thread.Sleep(300)
        ComboBoxbaudrkt.Items.Add(9600)
        ComboBoxbaudrkt.Items.Add(19200)
        ComboBoxbaudrkt.Items.Add(38400)
        ComboBoxbaudrkt.Items.Add(57600)
        ComboBoxbaudrkt.Items.Add(115200)
        For i = 0 To UBound(myport)
            ComboBoxrkt.Items.Add(myport(i))
        Next
        ComboBoxrkt.Text = ComboBoxrkt.Items.Item(0)
        ComboBoxbaudrkt.SelectedIndex = 0
    End Sub
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        SerialPort2.PortName = ComboBoxrkt.Text
        SerialPort2.BaudRate = ComboBoxbaudrkt.Text
        SerialPort2.Parity = IO.Ports.Parity.None
        SerialPort2.StopBits = IO.Ports.StopBits.One
        SerialPort2.DataBits = 8
        SerialPort2.Open()
    End Sub
    Private Sub SerialPort2_DataReceived(ByVal sender As System.Object, _
                     ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) _
                     Handles SerialPort2.DataReceived
        Try
            inputdata = SerialPort2.ReadLine
            Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
        Catch 'ex As Exception
            ' MsgBox("Connectin Error, Please try again")
        End Try
    End Sub
    Public Sub DoUpdate()

        'PictureBoxtx.BackColor = Color.Green
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        ' PictureBoxtx.BackColor = Color.Red
        Dim xCharArray() As Char = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray
        Dim xNoArray() As Char = "0123456789".ToCharArray
        Dim xGenerator As System.Random = New System.Random()
        Dim xStr As String = String.Empty
        counter = counter + 1
        While xStr.Length < 20

            If xGenerator.Next(0, 2) = 0 Then
                xStr &= xCharArray(xGenerator.Next(0, xCharArray.Length))
            Else
                xStr &= xNoArray(xGenerator.Next(0, xNoArray.Length))
            End If

        End While
        TextBoxtx.Text = (counter & "_" & xStr & vbCr)
        SerialPort2.Write(TextBoxtx.Text)

    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Timer1.Enabled = True
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Timer1.Enabled = False
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Timer1.Interval = Convert.ToInt16(TextBox1.Text)
        Timer2.Interval = Convert.ToInt16(TextBox1.Text) / 2
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        'PictureBoxtx.BackColor = Color.White
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        SerialPort2.Close()
    End Sub
End Class
