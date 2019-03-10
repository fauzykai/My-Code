Public Class Form1


    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click

    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged
        'MsgBox(Mid(Me.ComboBox1.Text, 4))
    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        For i As Integer = 0 To _
        My.Computer.Ports.SerialPortNames.Count - 1
            'tambahkan ke dalam list combo serial port
            ComboBox1.Items.Add( _
            My.Computer.Ports.SerialPortNames(i))
        Next
        ComboBox2.Items.Add("9600,n,8,1")
        ComboBox2.Items.Add("19200,n,8,1")
        ComboBox2.Items.Add("57600,n,8,1")
        ComboBox2.Items.Add("115200,n,8,1")
        'btnDisconnect.Enabled = False

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        AxMSComm1.CommPort = Int(Mid(Me.ComboBox1.Text, 4))
        AxMSComm1.Settings = (Me.ComboBox2.Text)
        AxMSComm1.PortOpen = True
        TextBox1.Text = AxMSComm1.Input
        TextBox1.ScrollToCaret()
    End Sub

    ' Private Sub AxMSComm1_comEvReceive(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AxMSComm1.OnComm
    '   TextBox1.Text = AxMSComm1.Input
    '  TextBox1.ScrollToCaret()
    'TextBox1.Clear()
    'End Sub
End Class
