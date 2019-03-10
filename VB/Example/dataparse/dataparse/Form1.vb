Imports System.Windows.Forms.DataVisualization.Charting
Imports Excel = Microsoft.Office.Interop.Excel
Imports Office = Microsoft.Office.Core
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class Form1
    Dim inputdata As String
    Dim hasil As VariantType
    Dim datake As Integer
    Private xlApp As New Excel.Application
    Private xlWBook As Excel.Workbook
    Private xlWS As Excel.Worksheet
    Dim odoc As Object
    Dim iteras As Integer
    Dim percobaanke As Integer
    Dim waktu As Date

    Dim mysqlconn As MySqlConnection
    Dim myCommand As New MySqlCommand
    Dim myAdapter As New MySqlDataAdapter
    Dim myData As New DataTable
    Dim SQL As String
    Dim SQL1 As String

    Private Sub Buttoncrkt_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttoncrkt.Click

        If Buttoncrkt.Text = "Connect" Then
            If SerialPort2.IsOpen Then
                SerialPort2.Write("1")
                percobaanke = percobaanke + 1
                Timer1.Start()


            Else
                SerialPort2.PortName = "COM10"
                SerialPort2.BaudRate = 57600
                SerialPort2.Parity = IO.Ports.Parity.None
                SerialPort2.StopBits = IO.Ports.StopBits.One
                SerialPort2.DataBits = 8
                SerialPort2.Open()
                SerialPort2.Write("1")
                Timer1.Start()
            End If

            Buttoncrkt.Text = "Disconnect"
        Else
            SerialPort2.Write("0")
            Timer1.Stop()

            Buttoncrkt.Text = "Connect"
            SerialPort2.DiscardInBuffer()

        End If
    End Sub
    Private Sub SerialPort2_DataReceived(ByVal sender As System.Object, _
                     ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) _
                     Handles SerialPort2.DataReceived

        inputdata = SerialPort2.ReadLine
        Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
    End Sub
    Public Sub DoUpdate()
        'savetxt()
        TextBox1.Text = inputdata
        par()
        datake = datake + 1
        Chart1.ChartAreas(0).AxisX.Minimum = datake - 70
        Chart1.ChartAreas(0).AxisX.Maximum = datake + 50
        tulis()
        Label1.Text = DateValue(Now)
        Label2.Text = TimeValue(Now)
        'DataGridView1.Refresh()
        baca()
    End Sub
    Public Sub savetxt()
        Dim i As Integer = FreeFile()
        FileOpen(i, "D:\isi.txt", OpenMode.Append)
        PrintLine(i, TextBox2.Text)

    End Sub
    Public Sub par()
        TextBox2.Text = Mid(TextBox1.Text, 1, 3)
        TextBox3.Text = Mid(TextBox1.Text, 4, 4)
        TextBox4.Text = Mid(TextBox1.Text, 8, 4)
        TextBox5.Text = Mid(TextBox1.Text, 12, 2)
        TextBox1.Clear()
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        AxMSComm1.PortOpen = True
        AxMSComm1.Output = "1"
    End Sub
    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        AxMSComm1.Output = "0"
        AxMSComm1.PortOpen = False
    End Sub
    Private Sub AxMSComm1_OnComm(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AxMSComm1.OnComm
        If AxMSComm1.CommEvent = MSCommLib.OnCommConstants.comEvReceive Then
            Label1.Text = AxMSComm1.InputLen
        Else
            Label1.Text = "a"
        End If
    End Sub
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        SerialPort2.Write("0")
        SerialPort2.Close()

    End Sub
    Public Sub grafik()
        Chart1.ChartAreas(0).AxisX.Minimum = datake - 70
        Chart1.ChartAreas(0).AxisX.Maximum = datake + 50
        Chart1.Series("Series1").Points.AddXY(datake, TextBox2.Text)
        Chart1.Series("Series1").ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline
        'Chart1.Series
    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim namafile As String
        Dim skr As String

        skr = Format(Now, "h-mm-ss-dd-MM-yyyy")


        namafile = "D:\" + "DIRK-RKF-V2-" + skr + "-" + Str(percobaanke) + ".txt"
        Label7.Text = namafile
        'File.Create(namafile).Dispose()
        SQL1 = "SELECT * FROM gcstab1"
        mysqlconn = New MySqlConnection
        mysqlconn.ConnectionString = "server=localhost;user id=root;password=;database=ffdb"
        'Try
        mysqlconn.Open()
        myCommand.Connection = mysqlconn
        myCommand.CommandText = SQL1

        myAdapter.SelectCommand = myCommand
        myAdapter.Fill(myData)

        DataGridView1.DataSource = myData
        'mysqlconn.Close()
        'Catch myerror As MySqlException
        'MsgBox("terbuka")
        'Finally
        'mysqlconn.Close()
        'mysqlconn.Dispose()
        ' End Try
    End Sub
    Private Sub baca()
        SQL1 = "SELECT * FROM gcstab1"
        mysqlconn = New MySqlConnection
        mysqlconn.ConnectionString = "server=localhost;user id=root;password=;database=ffdb"
        'Try
        'mysqlconn.Open()
        myCommand.Connection = mysqlconn
        myCommand.CommandText = SQL1

        'myAdapter.SelectCommand = myCommand
        myAdapter.Fill(myData)
        DataGridView1.Refresh()
        DataGridView1.DataSource = myData
        ' mysqlconn.Close()
    End Sub
    Private Sub tulis()
        SQL = "INSERT INTO gcstab1 (xacc) values('" & TextBox2.Text & "')"
        mysqlconn = New MySqlConnection
        mysqlconn.ConnectionString = "server=localhost;user id=root;password=;database=ffdb"

        'mysqlconn.Open()
        myCommand.Connection = mysqlconn
        myCommand.CommandText = SQL
        myCommand.ExecuteNonQuery()
        'mysqlconn.Clone()
    End Sub
    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Chart1.Series("Series1").Points.AddXY(TimeValue(Now), TextBox2.Text)
        Chart1.Series("Series1").ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Line

        If TabControl1.SelectedTab Is TabPage1 Then
            Label3.Text = "1"
        Else
            Label3.Text = "2"
        End If

        'grafik()
    End Sub
    Private Sub TabControl1_Selecting(ByVal sender As System.Object, ByVal e As System.Windows.Forms.TabControlCancelEventArgs) Handles TabControl1.Selecting
        If TabControl1.SelectedTab Is TabPage1 Then
            Label3.Text = "1"
        Else
            Label3.Text = "2"
        End If
    End Sub
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        iteras = iteras + 1
        If iteras = 10 Then
            grafik()
            iteras = 0
        End If
        Label4.Text = iteras
        Label5.Text = Str(iteras) + TimeValue(Now)
        Label6.Text = Now + TimeValue("0:00:10")
    End Sub
    Public Sub loadcontact()
        Me.ListView1.Items.Clear()
        If (File.Exists("D:\test.txt") = True) Then
            Dim lines = IO.File.ReadAllLines("D:\test.txt")
            For i = 0 To lines.Length - 1
                Dim line As String = lines(i)
                Dim fields() As String = line.Split(",")
                If fields.Length = 2 Then
                    Dim item As New ListViewItem(New String() {fields(0), fields(1)})
                    Me.ListView1.Items.Add(item)
                End If
            Next
        Else
            Dim oRead As System.IO.StreamWriter
            oRead = File.CreateText(Application.StartupPath & "\data_contact.txt")
        End If

    End Sub
    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        loadcontact()

    End Sub
    Public Sub WriteContent(ByVal FullPath As String, _
ByVal content As String)
        Dim fileWriter As StreamWriter
        Try
            fileWriter = New StreamWriter(FullPath)
            fileWriter.Write(TextBox2.Text)
            fileWriter.Close()
        Catch x As Exception
            MsgBox(x.Message)
        End Try
    End Sub

    Private Sub Button10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button10.Click
        baca()

    End Sub
End Class
