Public Class Form1
    Dim myport As Array
    Dim InputData As String = ""
    Delegate Sub SetTextCallback(ByVal [text] As String)
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        myport = IO.Ports.SerialPort.GetPortNames()
        ComboBox1.Items.Add(9600)
        ComboBox1.Items.Add(19200)
        ComboBox1.Items.Add(38400)
        ComboBox1.Items.Add(57600)
        ComboBox1.Items.Add(115200)
        
        ComboBox1.Text = ComboBox1.Items.Item(0)
        'ComboBox2.Text = ComboBox2.Items.Item(0)
        Button2.Enabled = False

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Button1.Click()
        SerialPort1.PortName = ComboBox2.Text
        SerialPort1.BaudRate = ComboBox1.Text
        SerialPort1.Parity = IO.Ports.Parity.None
        SerialPort1.StopBits = IO.Ports.StopBits.One
        SerialPort1.DataBits = 8
        SerialPort1.Open()
        Button1.Enabled = False
        Button2.Enabled = True
    End Sub
    Private Sub SerialPort1_DataReceived(ByVal sender As System.Object, _
                     ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) _
                     Handles SerialPort1.DataReceived
        inputData = SerialPort1.ReadExisting 'or SerialPort1.ReadLine
        Me.Invoke(New EventHandler(AddressOf DoUpdate))
    End Sub
    Public Sub DoUpdate()
        'TextBox1.Text(TextBox1.Text & InputData)
        TextBox1.AppendText(InputData)
        'TextBox1.Select(TextBox1.TextLength, 0)
        'TextBox1.ScrollToCaret()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Button1.Enabled = True
        Button2.Enabled = False
        SerialPort1.Close()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        'myport.Clear()
        For i = 0 To UBound(myport)
            ComboBox2.Items.Add(myport(i))
        Next
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        ComboBox2.Items.Clear()
    End Sub
End Class
