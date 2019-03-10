Option Explicit On
Imports System
Imports System.ComponentModel
Imports System.Threading
Imports System.IO
Imports MySql.Data.MySqlClient
Imports System.Collections.Generic
Imports System.Drawing
Imports System.Globalization
Imports System.Windows.Forms
Imports GMap.NET
Imports GMap.NET.CacheProviders
Imports GMap.NET.MapProviders
Imports GMap.NET.WindowsForms
Imports GMap.NET.WindowsForms.Markers
Imports System.IO.Ports
Imports Gigasoft.ProEssentials.Enums
Imports System.Text
Imports DevComponents.DotNetBar.Metro

Public Class Form1
    Dim mysqlconn As MySqlConnection
    Dim myCommand As New MySqlCommand
    Dim myAdapter As New MySqlDataAdapter
    Dim myData As New DataTable
    Dim SQL As String
    Dim namadb As String = "ffdb" 'nama db
    Dim namatable As String = "gcsv4" 'table db
    Dim path As String = "D"
    Dim range As Integer = 150 'Convert.ToInt16(Form2.TextBoxrange.Text) '150 'setting rang x axis graph
    Dim intervalreq As Integer = 200 ' 1000 / Convert.ToInt16(Form2.TextBoxreqinterval.Text)
    Dim xlatawal As Double = -6.886635 'lattitude awal map set
    Dim xlonawal As Double = 107.615054 'longitude awal set
    Dim skr As String 'jam skr
    'Dim waktu As Date 'jam skr
    'Dim tanggal As Date 'tanggal skr
    'Dim percobaanke As Integer 'reset per connect
    Dim file_name As String 'logging.txt
    Dim file_name_rep As String
    Dim datake As Integer 'incr / data masuk
    Dim durasi As Integer 'detikan
    Dim myport As Array
    Dim InputData As String = ""
    Dim datain As String ', data As String
    Dim xacc As Integer, yacc As Integer, zacc As Integer
    Dim xgyr As Integer, ygyr As Integer, zgyr As Integer
    Dim xmag As Integer, ymag As Integer, zmag As Integer
    Dim baro As Integer ', dpl As Integer, c As Integer
    Dim lat As Integer, lng As Integer, alt As Integer
    'Dim sr As Byte, ss As Byte
    'Dim heading As Integer, altitude As Integer 'avionik
    Dim roll As Integer, pitch As Integer, yaw As Integer 'avionik
    'Dim per1 As Integer, per2 As Integer, per3 As Integer 'timer
    Dim xlat As Double, xlon As Double 'koordinat 1 peluncuran
    Dim xlat2 As Double, xlon2 As Double 'koordinat 2 pergerakan
    Dim count As Integer 'countdown auto separate
    Dim subsettr As Integer, pointtr As Integer ' subset=tipe / point=dot
    Dim xtr As Integer, ytr As Integer, ztr As Integer ' variabel untuk koordinat trajectory
    Dim hasil() As String 'array parsing
    Dim datasamp As Integer 'sampling
    Dim detik As Integer, detikke As Integer 'x axis graph
    'Dim tang As Date
    Dim datamin As Integer, datamax As Integer 'y axis graph scale
    Dim rowmin As Integer, rowmax As Integer 'untuk autoscroll graph 2d
    Dim packet As Integer, packettx As Integer 'packetdata
    Delegate Sub settextcallback(ByVal [text] As String)
    Dim titikbaroawal 'ketinggian awal traject 2d
    Dim maxalt As Integer 'nilai tinggi max
    Dim statussteady As Boolean
    Dim statusgo As Boolean
    Dim statusstart As Boolean
    Dim statusseparate As Boolean
    Dim notiffy As String
    Dim statuslog As Boolean = False
    Dim myProcess As System.Diagnostics.Process = System.Diagnostics.Process.GetCurrentProcess()

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Maximized
        Me.WindowState = 2
        mapsetting()
        kondisiawalstatus()
        trajectsetting()
        Labeltabmain_Click(sender, New System.EventArgs())
        skr = Format(Now, "dd-MM-yyyy-h-mm-ss")
        bukaportbaud()
        Labelcd.Text = "∞"
        TextBoxtimer.Text = "10"
        statussteady = False
        statusgo = False
        statusstart = False
        statusseparate = False
        statuslog = False
        ComboBoxbaudrkt.SelectedIndex = 4
        Labelsprs.Text = TextBoxsprdeg.Text & "°"
        Labelnotif.Text = " "
        datake = 0
        myProcess.PriorityClass = System.Diagnostics.ProcessPriorityClass.RealTime
        Chart3.Series("MDPL").IsValueShownAsLabel = True
        Labelnotif.Text = " "
        'PictureBox5.BackColor = Color.Transparent
        Labelnotif.BackColor = Color.Transparent
        Timer1grafik10ms.Interval = intervalreq
        Timer6fade.Enabled = False
        CheckBoxxgyr.Checked = True
        CheckBoxygyr.Checked = True
        CheckBoxzgyr.Checked = True
        TrackBarrange.Value = 3
        TrackBarfps.Value = 2

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
    End Sub
    Public Sub kondisiawalstatus()
        TextBoxsprdeg.Text = 80
        'Labelrkts.Text = "-"
        'Labelsprs.Text = "-"
        'Labelrktms.Text = "-"
        'Labeldatas.Text = "-"
        'Labelaltstatus.Text = "-"
        'Labelsampling.Text = "-"
        'Labelrktbatt.Text = "-"
        'Labelrktsig1.Text = "-"
        'Labelsprbatt.Text = "-"
        'Labelsprsig1.Text = "-"
    End Sub

    Private Sub SerialPort2_DataReceived(ByVal sender As System.Object, _
                     ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) _
                     Handles SerialPort2.DataReceived
        Try
            InputData = SerialPort2.ReadLine
            Me.BeginInvoke(New EventHandler(AddressOf DoUpdate))
        Catch 'ex As Exception
            ' MsgBox("Connectin Error, Please try again")
        End Try

    End Sub
    Private Sub AxMSComm1_OnComm(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AxMSComm1.OnComm
        Dim i As Integer
        Dim l As Double
        Try
            InputData = AxMSComm1.Input
            TextBoxdata.Text = InputData
            TextBoxdata.Text = ""
            If Mid(InputData, 5, 1) = "a" Then
                Try
                    For i = 1 To Val(Asc(Mid(InputData, 4, 1)) - 4) Step 2
                        l = Val(Asc(Mid(InputData, 6 + i, 1))) * 256 + Val(Asc(Mid(InputData, 5 + i, 1)))
                        If l > 32768 Then l = l - 65536
                        TextBoxdata.Text = TextBoxdata.Text & l & " "
                    Next
                    l = Val(Asc(Mid(InputData, 5 + i, 1))) + _
                        Val(Asc(Mid(InputData, 6 + i, 1))) * 256 + _
                        Val(Asc(Mid(InputData, 7 + i, 1))) * 65536
                    TextBoxdata.Text = TextBoxdata.Text & l & " "
                Catch
                End Try
            End If

            '
            datake = datake + 1
            DoUpdate()
        Catch
        End Try
    End Sub

    Public Sub DoUpdate()
        'TextBoxdata.Text = InputData

        'validasidata()
        If Timer1grafik10ms.Enabled = True Then
            If TextBoxdata.Text <> "" Then
                dataparse()
                packet = packet + 1
            End If

            textboxdatamain()
            'masukingrafiktab1a()
            'masukingrafiktab2a()
            'traject2d()
            visualisasiavionik()
            If statuslog = True Then
                datalogging()
            End If
            'tulisdb()
            'bacadb()
        End If
        'visualisasidata3d() 'grafik3d

        'datalogging() 'write log save data ke txt untuk replay
        'tulisdb()
        'bacadb()
        'loadlog() 'read log
        'bersihkan()

    End Sub
    Public Sub dataparse()
        hasil = Split(TextBoxdata.Text, " ")
        Try
            xacc = Convert.ToInt16(hasil(0))
            yacc = Convert.ToInt16(hasil(1))
            zacc = Convert.ToInt16(hasil(2))
            xgyr = Convert.ToInt16(hasil(3))
            ygyr = Convert.ToInt16(hasil(4))
            zgyr = Convert.ToInt16(hasil(5))
            xmag = Convert.ToInt16(hasil(6))
            ymag = Convert.ToInt16(hasil(7))
            zmag = Convert.ToInt16(hasil(8))
            roll = Convert.ToInt16(hasil(9)) / 10
            pitch = Convert.ToInt16(hasil(10)) / 10
            yaw = Convert.ToInt16(hasil(11))
            baro = Convert.ToInt32(hasil(12)) / 100
        Catch
            'xacc = 0
            'yacc = 0
            'zacc = 0
            'xgyr = 0
            'ygyr = 0
            'zgyr = 0
            'xmag = 0
            'ymag = 0
            'zmag = 0
            'roll = 0
            'pitch = 0
            'yaw = 0
            'baro = 0
        End Try
        If yaw < 0 Then
            yaw = yaw + 360
        End If
    End Sub

    Public Sub createfile()
        'skr = Format(Now, "dd-MM-yyyy-h-mm-ss")
        file_name = "" + path + ":\" + "DIRK-RKF-V2-" + skr + ".txt"
        File.Create(file_name).Dispose()
    End Sub
    Public Sub datalogging()
        Dim objwriter As New System.IO.StreamWriter(file_name, True)
        objwriter.Write(Str(datake) + ",")
        objwriter.Write(TimeValue(Now) + ",")
        objwriter.Write(Labeltime.Text + ",")
        objwriter.Write(Labelxacc.Text + ",")
        objwriter.Write(Labelyacc.Text + ",")
        objwriter.Write(Labelzacc.Text + ",")
        objwriter.Write(Labelxgyr.Text + ",")
        objwriter.Write(Labelygyr.Text + ",")
        objwriter.Write(Labelzgyr.Text + ",")
        objwriter.Write(Labelxmag.Text + ",")
        objwriter.Write(Labelymag.Text + ",")
        objwriter.Write(Labelzmag.Text + ",")
        objwriter.Write(Str(baro) + ",")
        'objwriter.Write(Str(sr) + ",") ' sr
        'objwriter.Write(Str(ss) + ",") ' ss
        objwriter.Write(Labelroll.Text + ",")
        objwriter.Write(Labelpitch.Text + ",")
        objwriter.Write(Labelyaw.Text + ",")
        'objwriter.Write(Labeldpl.Text + ",")
        'objwriter.Write(Labelc.Text + ",")
        objwriter.Write(Labelnotif.Text)
        objwriter.WriteLine("")
        objwriter.Close()
    End Sub
    Public Sub loadlog()
        'Me.ListView1.Items.Clear()
        If File.Exists("D:\DATA.txt") = True Then '(File.Exists(Application.StartupPath & "\data.txt") = True) Then
            Dim lines = IO.File.ReadAllLines("D:\DATA.txt") '(Application.StartupPath & "\data.txt")
            For i = 0 To lines.Length - 1
                Dim line As String = lines(i)
                Dim fields() As String = line.Split(",")
                If fields.Length = 17 Then
                    Dim item As New ListViewItem(New String() {fields(0), fields(1), fields(2), fields(3), fields(4), fields(5), fields(6), fields(7), fields(8), fields(9), fields(10), fields(11), fields(12), fields(13), fields(14), fields(15), fields(16)})
                    Me.ListView1.Items.Add(item)
                End If
            Next
            'Else
            'Dim oRead As System.IO.StreamWriter
            'oRead = File.CreateText(Application.StartupPath & "D:\data.txt")
        End If

    End Sub
    Public Sub createfilereplay()
        file_name_rep = "D:\" + "DIRK-RKF-V2-" + skr + "Replay" + ".txt"
        File.Create(file_name_rep).Dispose()
    End Sub
    Public Sub dataloggingreplay()
        Dim objwriter As New System.IO.StreamWriter(file_name_rep, True)
        objwriter.Write(Str(datake) + ",")
        objwriter.Write(Str(InputData))
        objwriter.WriteLine("")
    End Sub

    Public Sub textboxdatamain()
        Labelxacc.Text = xacc
        Labelyacc.Text = yacc
        Labelzacc.Text = zacc
        Labelxgyr.Text = xgyr
        Labelygyr.Text = ygyr
        Labelzgyr.Text = zgyr
        Labelxmag.Text = xmag
        Labelymag.Text = ymag
        Labelzmag.Text = zmag
        Labelroll.Text = roll
        Labelpitch.Text = pitch
        Labelyaw.Text = yaw
        Labelaltstatus.Text = baro
    End Sub
    Public Sub visualisasiavionik()
        HeadingIndicatorInstrumentControl1.SetHeadingIndicatorParameters(yaw)
        'AttitudeIndicatorInstrumentControl1.SetAttitudeIndicatorParameters(pitch, roll)
        ArtificialHorizon1.roll_angle = roll
        ArtificialHorizon1.pitch_angle = pitch
        AltimeterInstrumentControl1.SetAlimeterParameters(baro * 10)
    End Sub
    Public Sub masukingrafiktab1a()
        'Chart1.Dispose()
        'Chart1.DataBindings.Clear()
        'Chart1.Series.Dispose()
        ' Chart1.Update()
        'Chart1.ResetAutoValues()
        datamin = datake - range '50
        datamax = datake
        'End If
        'datamax = datake
        Chart1.ChartAreas(0).AxisX.Minimum = datamin
        Chart1.ChartAreas(0).AxisX.Maximum = datamax
        Chart1.Series("ACC X").Points.AddXY(datake, Convert.ToInt16(xacc))
        Chart1.Series("ACC Y").Points.AddXY(datake, Convert.ToInt16(yacc))
        Chart1.Series("ACC Z").Points.AddXY(datake, Convert.ToInt16(zacc))
        Chart1.Series("GYR X").Points.AddXY(datake, Convert.ToInt16(xgyr))
        Chart1.Series("GYR Y").Points.AddXY(datake, Convert.ToInt16(ygyr))
        Chart1.Series("GYR Z").Points.AddXY(datake, Convert.ToInt16(zgyr))
        Chart1.Series("MAG X").Points.AddXY(datake, Convert.ToInt16(xmag))
        Chart1.Series("MAG Y").Points.AddXY(datake, Convert.ToInt16(ymag))
        Chart1.Series("MAG Z").Points.AddXY(datake, Convert.ToInt16(zmag))
        'traject2d()
    End Sub
    Public Sub masukingrafiktab1b()
        datamin = datake - range
        datamax = datake
        Chart1.ChartAreas(0).AxisX.Minimum = datamin
        Chart1.ChartAreas(0).AxisX.Maximum = datamax
        If CheckBoxxacc.Checked = True Then
            Chart1.Series("ACC X").Points.AddXY(datake, Convert.ToInt16(xacc))
        End If
        If CheckBoxyacc.Checked = True Then
            Chart1.Series("ACC Y").Points.AddXY(datake, Convert.ToInt16(yacc))
        End If
        If CheckBoxzacc.Checked = True Then
            Chart1.Series("ACC Z").Points.AddXY(datake, Convert.ToInt16(zacc))
        End If
        If CheckBoxxgyr.Checked = True Then
            Chart1.Series("GYR X").Points.AddXY(datake, Convert.ToInt16(xgyr))
        End If
        If CheckBoxygyr.Checked = True Then
            Chart1.Series("GYR Y").Points.AddXY(datake, Convert.ToInt16(ygyr))
        End If
        If CheckBoxzgyr.Checked = True Then
            Chart1.Series("GYR Z").Points.AddXY(datake, Convert.ToInt16(zgyr))
        End If
        If CheckBoxxmag.Checked = True Then
            Chart1.Series("MAG X").Points.AddXY(datake, Convert.ToInt16(xmag))
        End If
        If CheckBoxymag.Checked = True Then
            Chart1.Series("MAG Y").Points.AddXY(datake, Convert.ToInt16(ymag))
        End If
        If CheckBoxzmag.Checked = True Then
            Chart1.Series("MAG Z").Points.AddXY(datake, Convert.ToInt16(zmag))
        End If
        If CheckBoxroll.Checked = True Then
            Chart1.Series("ROLL").Points.AddXY(datake, Convert.ToInt16(roll))
        End If
        If CheckBoxpitch.Checked = True Then
            Chart1.Series("PITCH").Points.AddXY(datake, Convert.ToInt16(pitch))
        End If
        If CheckBoxyaw.Checked = True Then
            Chart1.Series("YAW").Points.AddXY(datake, Convert.ToInt16(yaw))
        End If
    End Sub
    Public Sub masukingrafiktab2a()
        datamin = datake - range '50
        datamax = datake
        Chart4.ChartAreas(0).AxisX.Minimum = datamin
        Chart4.ChartAreas(0).AxisX.Maximum = datamax
        Chart5.ChartAreas(0).AxisX.Minimum = datamin
        Chart5.ChartAreas(0).AxisX.Maximum = datamax
        Chart6.ChartAreas(0).AxisX.Minimum = datamin
        Chart6.ChartAreas(0).AxisX.Maximum = datamax
        Chart2.ChartAreas(0).AxisX.Minimum = datamin
        Chart2.ChartAreas(0).AxisX.Maximum = datamax
        Chart4.Series("ACC X").Points.AddXY(datake, xacc)
        Chart4.Series("ACC Y").Points.AddXY(datake, yacc)
        Chart4.Series("ACC Z").Points.AddXY(datake, zacc)
        Chart5.Series("GYR X").Points.AddXY(datake, xgyr)
        Chart5.Series("GYR Y").Points.AddXY(datake, ygyr)
        Chart5.Series("GYR Z").Points.AddXY(datake, zgyr)
        Chart6.Series("MAG X").Points.AddXY(datake, xmag)
        Chart6.Series("MAG Y").Points.AddXY(datake, ymag)
        Chart6.Series("MAG Z").Points.AddXY(datake, zmag)
        Chart2.Series("Baro").Points.AddXY(datake, baro)
    End Sub
    Public Sub masukindatatab3a()
        Labellat.Text = xlatawal '"-" 'latmap
        Labellng.Text = xlonawal '"-" 'longmap
        Labelaltmap.Text = Convert.ToString(baro) + " MDPL" '"-" 'altmap
        Labelhspeed.Text = "-" 'hpspeed
        Labelvspeed.Text = "-" 'vspeed
        'Labeltime.Text = TimeValue(Now)
    End Sub

    Public Sub settingdb()
        mysqlconn = New MySqlConnection
        mysqlconn.ConnectionString = "server=localhost;user id=root;password=;database= " & namadb & ""
        mysqlconn.Open()
        'mysqlconn.Close()
    End Sub
    Public Sub tulisdb()
        'mysqlconn.Open()
        SQL = "INSERT INTO " & namatable & "(xacc,yacc,zacc,xgyr,ygyr,zgyr,xmag,ymag,zmag,roll,pitch,yaw,baro,latitude,longitude,altitude,fps,waktu) values('" & xacc & "','" & yacc & "','" & zacc & "','" & xgyr & "','" & ygyr & "','" & zgyr & "','" & xmag & "','" & ymag & "','" & zmag & "','" & roll & "','" & pitch & "','" & yaw & "','" & baro & "','" & lat & "','" & lng & "','" & alt & "','" & datasamp & "','" & TimeValue(Now) & "')"
        myCommand.Connection = mysqlconn
        myCommand.CommandText = SQL
        myCommand.ExecuteNonQuery()
        'mysqlconn.Close()
    End Sub
    Public Sub bacadb()
        'mysqlconn.Close()
        mysqlconn.Open()
        'DataGridView1.Refresh()
        myCommand.Connection = mysqlconn
        myCommand.CommandText = "SELECT * FROM " & namatable & " ORDER BY no DESC limit 0,20" 'select * from table order by ID desc limit 1;
        myAdapter.SelectCommand = myCommand '("SELECT * FROM address ORDER BY name ASC")
        myAdapter.Fill(myData)
        'DataGridView1.DataSource = myData
        mysqlconn.Close()

    End Sub
    Public Sub bacadbfull()
        myCommand.Connection = mysqlconn
        myCommand.CommandText = "SELECT * FROM " & namatable & " ORDER BY no DESC" 'select * from table order by ID desc limit 1;
        myAdapter.SelectCommand = myCommand '("SELECT * FROM address ORDER BY name ASC")
        myAdapter.Fill(myData)
        'DataGridView1.DataSource = myData
        'mysqlconn.Close()
    End Sub

    Public Sub mapsetting()
        With GMapControl1
            '.SetCurrentPositionByKeywords("bandung")
            .CanDragMap = True
            .RoutesEnabled = True
            .DragButton = Windows.Forms.MouseButtons.Left
            '.Dock = DockStyle.Fill
            .MapProvider = GMap.NET.MapProviders.GMapProviders.BingSatelliteMap
            .MaxZoom = 21
            .Zoom = 18
            .Manager.Mode = AccessMode.ServerAndCache
            'Controls.Add(GMapControl1)
            'ResumeLayout(True)
        End With
        GMapControl1.Position = New GMap.NET.PointLatLng(xlatawal, xlonawal)
        Dim overlayone As New GMap.NET.WindowsForms.GMapOverlay(GMapControl1, "OverlayTwo")
        overlayone.Markers.Add(New GMap.NET.WindowsForms.Markers.GMapMarkerGoogleRed(New GMap.NET.PointLatLng(xlatawal, xlonawal)))
        GMapControl1.Overlays.Add(overlayone)
        'GMapControl1.MapProvider.Projection.GetGroundResolution()
    End Sub
    Public Sub mapmark()
        Dim overlaytwo As New GMap.NET.WindowsForms.GMapOverlay(GMapControl1, "OverlayTwo")
        overlaytwo.Markers.Add(New GMap.NET.WindowsForms.Markers.GMapMarkerGoogleRed(New GMap.NET.PointLatLng(xlat, xlon)))
        GMapControl1.Overlays.Add(overlaytwo)
        GMapControl1.Position = New GMap.NET.PointLatLng(xlat2, xlon2)
    End Sub
    Public Sub maptrack()
        Dim polyOverlay As New GMapOverlay(GMapControl1, "polygons")
        Dim points As New List(Of PointLatLng)
        points.Add(New PointLatLng(xlat, xlon))
        points.Add(New PointLatLng(xlat2, xlon2))
        'points.Add(New PointLatLng(-6.5, 107.5))
        'points.Add(New PointLatLng(-6.7, 107.7))
        Dim polygon As New GMapPolygon(points, "mypolygon")
        polygon.Fill = New SolidBrush(Color.FromArgb(50, Color.Red))
        polygon.Stroke = New Pen(Color.Red, 2)
        'polygon.Stroke.DashCap = Drawing2D.DashCap.Triangle
        'polygon.Stroke.EndCap = New ArrowDirection
        polyOverlay.Polygons.Add(polygon)
        GMapControl1.Overlays.Add(polyOverlay)
    End Sub
    Public Sub getdist()
        Dim unit As String = "K"
        Dim theta As Double = xlon - xlon2
        Dim dist As Double = Math.Sin(deg2rad(xlat)) * Math.Sin(deg2rad(xlat2)) + Math.Cos(deg2rad(xlat)) * Math.Cos(deg2rad(xlat2)) * Math.Cos(deg2rad(theta))
        dist = Math.Acos(dist)
        dist = rad2deg(dist)
        dist = dist * 60 * 1.1515
        If unit = "K" Then
            dist = dist * 1.609344
        ElseIf unit = "N" Then
            dist = dist * 0.8684
        End If
        'Return dist
        'Label1.Text = dist
    End Sub
    Private Function deg2rad(ByVal deg As Double) As Double
        Return (deg * Math.PI / 180.0)
    End Function
    Private Function rad2deg(ByVal rad As Double) As Double
        Return rad / Math.PI * 180.0
    End Function

    Public Sub trajectsetting()
        Pe3do1.PePlot.PolyMode = PolyMode.Scatter
        Pe3do1.PeData.Subsets = 10
        Pe3do1.PeData.Points = 300
        Pe3do1.PeColor.BitmapGradientMode = True
        Pe3do1.PeColor.QuickStyle = QuickStyle.DarkNoBorder
        'Pe3do1.PeColor.SubsetColors(0) = Color.FromArgb(198, 198, 0)
        Pe3do1.PeColor.SubsetColors(0) = Color.FromArgb(117, 162, 230)
        Pe3do1.PePlot.SubsetPointTypes(0) = PointType.DotSolid
        Pe3do1.PeString.SubsetLabels(0) = "Data 1"
        Pe3do1.PeString.MainTitle = "Trajectory"
        Pe3do1.PeString.SubTitle = ""
        Pe3do1.PeUserInterface.Scrollbar.ViewingHeight = 15
        Pe3do1.PeUserInterface.Scrollbar.DegreeOfRotation = 145
        Pe3do1.PePlot.Method = 0
        Pe3do1.PeFont.FontSize = FontSize.Medium
        Pe3do1.PeFont.Fixed = True
        Pe3do1.PeLegend.Location = LegendLocation.Left
        Pe3do1.PeLegend.Show = False
        Pe3do1.PeConfigure.PrepareImages = True
        Pe3do1.PeUserInterface.Allow.FocalRect = False
        Pe3do1.PeConfigure.CacheBmp = True

        Pe3do1.PeUserInterface.RotationDetail = RotationDetail.FullDetail
        Pe3do1.PeUserInterface.RotationSpeed = 50
        Pe3do1.PeUserInterface.RotationIncrement = RotationIncrement.IncBy1
        Pe3do1.PeUserInterface.AutoRotation = False
        Pe3do1.PeConfigure.ImageAdjustLeft = 100
        Pe3do1.PeConfigure.ImageAdjustRight = 100
        Pe3do1.PeConfigure.ImageAdjustBottom = 100

        Pe3do1.PeConfigure.TextShadows = TextShadows.BoldText
        Pe3do1.PeFont.MainTitle.Bold = True
        Pe3do1.PeFont.SubTitle.Bold = True
        Pe3do1.PeFont.Label.Bold = True
        Pe3do1.PeColor.GraphForeground = Color.FromArgb(192, 192, 192)
        Pe3do1.PeSpecial.DpiX = 600
        Pe3do1.PeSpecial.DpiY = 600

        Pe3do1.PeConfigure.RenderEngine = RenderEngine.GdiPlus
        Pe3do1.PeConfigure.AntiAliasGraphics = True
        Pe3do1.PeConfigure.AntiAliasText = True

        Pe3do1.PePlot.MarkDataPoints = True
        Pe3do1.PeUserInterface.Scrollbar.MouseDraggingX = True
        Pe3do1.PeUserInterface.Scrollbar.MouseDraggingY = True
        For i = 1 To 300
            Pe3do1.PeData.X(0, i) = 0
            Pe3do1.PeData.Y(0, i) = 0
            Pe3do1.PeData.Z(0, i) = 0
        Next


    End Sub
    Public Sub traject2d()
        'If detikke > 10 Then
        'Chart3.ChartAreas(0).AxisX.Minimum = detikke - 10
        'Chart3.ChartAreas(0).AxisX.Maximum = detikke
        'End If
        Chart3.ChartAreas(0).AxisY.Minimum = titikbaroawal
        Chart3.Series("MDPL").Points.AddXY(detikke, baro)
        If detikke < 15 Then
            Chart3.Series("MDPL").IsValueShownAsLabel = True
        Else
            Chart3.Series("MDPL").IsValueShownAsLabel = False
        End If
        If baro > maxalt Then
            maxalt = baro
        End If
    End Sub
    Public Sub trajectmark()
        xtr = xacc
        ytr = yacc
        ztr = zacc
        subsettr = 0
        pointtr = datake
        Pe3do1.PeData.X(subsettr, pointtr) = xtr
        Pe3do1.PeData.Y(subsettr, pointtr) = ytr
        Pe3do1.PeData.Z(subsettr, pointtr) = ztr
        Pe3do1.Refresh()
    End Sub

    Public Sub separating()
        Timer2cd1s.Stop()
        'Timer4traject1s.Stop()
        'MsgBox("separated")
        statusseparate = True
        notiffy = "Separated"
        tampilnotif()
    End Sub
    Private Sub stopping()
        AxMSComm1.Output = "$M<3"
        Timer1grafik10ms.Stop()
        Timer2cd1s.Stop()
        Timer4traject1s.Stop()
        Timer5req30ms.Stop()
        Timer5req30ms.Enabled = False
        'MsgBox("DATA STOP")
        notiffy = "Data Stop"
        tampilnotif()
        Labeldatas.Text = "OFF"
        Labelsampling.Text = "-"
        statusstart = False
        statussteady = False
    End Sub
    Public Sub bersihkan()
        xacc = 0
        yacc = 0
        zacc = 0
        xgyr = 0
        ygyr = 0
        zgyr = 0
        xmag = 0
        ymag = 0
        zmag = 0
    End Sub

    Private Sub Timer1grafik10ms_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1grafik10ms.Tick
        AxMSComm1.Output = "$M<a"
        packettx = packettx + 1
        datasamp = datasamp + 1
        'If Panelmain.Visible = True Then
        'masukingrafiktab1a() '#
        masukingrafiktab1b()
        'End If
        'If Paneldata.Visible = True Then
        masukingrafiktab2a() '#
        'End If'
    End Sub 'fps @10ms
    Private Sub Timer2cd1s_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2cd1s.Tick
        detik = detik - 1
        Labelcd.Text = detik
        If detik = 0 Then
            separating()
            'stopping()
        End If
    End Sub 'countdown @1sec
    Private Sub Timer3statdtk1s_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer3statdtk1s.Tick
        Labelsampling.Text = Convert.ToString(datasamp) + " FPS"
        datasamp = 0
        Labelpacketrx.Text = packet 'datake
        Labelpackettx.Text = packettx
        'Labelaltstatus.Text = Convert.ToString(baro)
        If statusstart = True Then
            durasi = durasi + 1
            'Labeltime.Text = durasi
            Dim ts As TimeSpan = TimeSpan.FromSeconds(durasi) 'New TimeSpan(0, 0, 0, 227, 0)
            Dim mydate As DateTime = New DateTime(ts.Ticks)
            Labeltime.Text = (mydate.ToString(("HH:mm:ss:fff")))
        Else
            Labeltime.Text = TimeValue(Now)
        End If
        'masukindatatab3a()
        'traject2d()
    End Sub 'status @1sec
    Private Sub Timer4traject1s_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4traject1s.Tick
        detikke = detikke + 1
        traject2d()
    End Sub
    Private Sub Timer5req30ms_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer5req30ms.Tick
        'AxMSComm1.Output = "$M<a"
    End Sub

    Private Sub Buttoncrtk1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttoncrkt1.Click
        If Buttoncrkt1.Text = "Connect" Then
            Try
                AxMSComm1.CommPort = Convert.ToInt16(Mid(ComboBoxrkt.Text, 4, 2))
                AxMSComm1.Settings = ComboBoxbaudrkt.Text + ",n,8,1"
                AxMSComm1.PortOpen = True
                Buttoncrkt1.Text = "Disconnect"
                'Labelnotif.Text = "Connected"
                'suara.speak("connected")
                notiffy = "Connected"

                tampilnotif()
            Catch
                MsgBox("Max of number COM PORT is 10")
            End Try
        Else
            Buttoncrkt1.Text = "Connect"
            AxMSComm1.PortOpen = False
            'Labelnotif.Text = "Disconnected"
            notiffy = "Disconnected"
            tampilnotif()
        End If
    End Sub
    Private Sub Buttonrkton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonrkton.Click
        'Labeldatas.Text = "ON"
        'Labelsampling.Text = "-"
        If Timer5req30ms.Enabled = True Then
            MsgBox("Stop First")
        Else
            If Buttoncrkt1.Text = "Disconnect" Then
                notiffy = "Telemetry On"
                tampilnotif()
                statusstart = True
                Timer5req30ms.Enabled = True
                ' createfile()
                Timer5req30ms.Start()
                Timer1grafik10ms.Start()
                detikke = 0
            Else
                MsgBox("Connect First")
            End If
        End If
    End Sub

    Private Sub Buttonstop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonstop.Click
        If Timer5req30ms.Enabled = True Then
            notiffy = "Telemetry Off"
            tampilnotif()
            stopping()
            Labeltabresult_Click(sender, New System.EventArgs())
            getresult() 'get & show result
            loadlog() 'load log
        Else
            MsgBox("Start Frist")
        End If
    End Sub
    Private Sub Buttonrefresh_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonrefresh.Click
        If Buttoncrkt1.Text = "Disconnect" Then
            AxMSComm1.Output = "$M<3"
            AxMSComm1.Output = "$M<0"
            notiffy = "Ready"
            tampilnotif()
            clearchart()
        Else
            clearchart()
            'bersihin chart
            'load ulang comport
        End If
    End Sub
    Private Sub Buttonreset_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        ' Application.Restart()
    End Sub
    Private Sub Buttonsprset_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonsprset.Click
        'SerialPort2.Write("D" + Format(TextBoxsprdeg.Text, "000"))
        If Buttoncrkt1.Text = "Disconnect" Then
            AxMSComm1.Output = "D" + Format(TextBoxsprdeg.Text, "000")
            Labelsprs.Text = TextBoxsprdeg.Text & "°"
            notiffy = "SPR is " & TextBoxsprdeg.Text & " Degree"
            tampilnotif()
        Else
            MsgBox("Connect Frist")
        End If

    End Sub
    Private Sub Buttonsteady_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonsteady.Click
        If Timer5req30ms.Enabled = True Then
            statussteady = True
            detikke = 0
            If TextBoxtimer.Text <> "∞" Then
                If statuslog = True Then
                    createfile()
                End If
                clearchart()
                detik = Int(TextBoxtimer.Text)
                Labelcd.Text = detik
                titikbaroawal = baro
                Chart3.ChartAreas(0).AxisY.Minimum = titikbaroawal
                'Chart3.Series("DPL").Points.AddXY(detikke, baro)
                'Chart3.ChartAreas(0).AxisY.Minimum = titikbaroawal
                traject2d()
                AxMSComm1.Output = "$M<0"
                AxMSComm1.Output = "$M<1"
                notiffy = "Rocket is Ready..."
                tampilnotif()
            End If
        Else
            MsgBox("Start Frist")
        End If
    End Sub
    Private Sub Buttongo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttongo.Click
        If statussteady = True Then
            Timer4traject1s.Start()
            statusgo = True
            If TextBoxtimer.Text <> "∞" Or "0" Then
                Timer2cd1s.Start()
                AxMSComm1.Output = "$M<2"
                notiffy = "Launched"
                tampilnotif()
            End If
        Else
            MsgBox("Steady Frist")
        End If

    End Sub
    Private Sub Buttonseparate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonseparate.Click
        If Timer5req30ms.Enabled = True Then
            'If statussteady = True Then
            'MsgBox("Can't Manual Separating")
            'Else
            AxMSComm1.Output = "$M<3"
            separating()
            'MsgBox("Separated")
            'notiffy = "Separated"
            'tampilnotif()
            'End If
        Else
            MsgBox("Start Frist")
        End If
    End Sub

    Private Sub Labeltabmain_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Labeltabmain.Click
        Labeltabmain.ForeColor = Color.Black 'Color.CornflowerBlue
        Labeltabdata.ForeColor = Color.DarkGray
        Labeltabmaps.ForeColor = Color.DarkGray
        Labeltabdb.ForeColor = Color.DarkGray
        Labeltabresult.ForeColor = Color.DarkGray
        Panelmain.Show()
        Paneldata.Hide()
        Panelmaps.Hide()
        Paneldb.Hide()
        Panelresult.Hide()
    End Sub
    Private Sub Labeltabdata_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Labeltabdata.Click
        Labeltabmain.ForeColor = Color.DarkGray
        Labeltabdata.ForeColor = Color.Black 'Color.CornflowerBlue
        Labeltabmaps.ForeColor = Color.DarkGray
        Labeltabdb.ForeColor = Color.DarkGray
        Labeltabresult.ForeColor = Color.DarkGray
        Panelmain.Hide()
        Paneldata.Show()
        Panelmaps.Hide()
        Paneldb.Hide()
        Panelresult.Hide()
    End Sub
    Private Sub Labeltabmaps_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Labeltabmaps.Click
        Labeltabmain.ForeColor = Color.DarkGray
        Labeltabdata.ForeColor = Color.DarkGray
        Labeltabmaps.ForeColor = Color.Black 'Color.CornflowerBlue
        Labeltabdb.ForeColor = Color.DarkGray
        Labeltabresult.ForeColor = Color.DarkGray
        Panelmain.Hide()
        Paneldata.Hide()
        Panelmaps.Show()
        Paneldb.Hide()
        Panelresult.Hide()
    End Sub
    Private Sub Labeltabdb_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Labeltabdb.Click
        Labeltabmain.ForeColor = Color.DarkGray
        Labeltabdata.ForeColor = Color.DarkGray
        Labeltabmaps.ForeColor = Color.DarkGray
        Labeltabdb.ForeColor = Color.Black 'Color.CornflowerBlue
        Labeltabresult.ForeColor = Color.DarkGray
        Panelmain.Hide()
        Paneldata.Hide()
        Panelmaps.Hide()
        Paneldb.Show()
        Panelresult.Hide()
        'bacadb()
    End Sub
    Private Sub Labeltabresult_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Labeltabresult.Click
        Labeltabmain.ForeColor = Color.DarkGray
        Labeltabdata.ForeColor = Color.DarkGray
        Labeltabmaps.ForeColor = Color.DarkGray
        Labeltabdb.ForeColor = Color.DarkGray
        Labeltabresult.ForeColor = Color.Black 'Color.CornflowerBlue
        Panelmain.Hide()
        Paneldata.Hide()
        Panelmaps.Hide()
        Paneldb.Hide()
        Panelresult.Show()
        If statusgo = True Then
            getresult()
        End If
    End Sub

    Private Sub SwitchButton1_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SwitchButton1.ValueChanged
        Buttoncrtk1_Click_1(sender, New System.EventArgs())
    End Sub
    Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
        Dim sender As New System.Object
        Try
            If msg.WParam.ToInt32 = Convert.ToInt32(Keys.F1) Then
                Labeltabmain_Click(sender, New System.EventArgs()) 'MsgBox("A")
                'Return MyBase.ProcessCmdKey(msg, keyData)
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.F2) Then
                Labeltabdata_Click(sender, New System.EventArgs()) 'MsgBox("B")
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.F3) Then
                Labeltabmaps_Click(sender, New System.EventArgs()) 'MsgBox("B")
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.F4) Then
                Labeltabdb_Click(sender, New System.EventArgs()) 'MsgBox("B")
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.F5) Then
                Labeltabresult_Click(sender, New System.EventArgs()) 'MsgBox("B")
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.Alt) Then
                'MsgBox("ALT Connect")
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.D1) Then
                'MsgBox("1 Start")
                Buttonrkton_Click(sender, New System.EventArgs())
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.D2) Then
                'MsgBox("2 Steady")
                Buttonsteady_Click(sender, New System.EventArgs())
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.D3) Then
                'MsgBox("3 Go")
                Buttongo_Click(sender, New System.EventArgs())
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.Space) Then
                'MsgBox("Space Separate")
                Buttonseparate_Click(sender, New System.EventArgs())
            ElseIf msg.WParam.ToInt32 = Convert.ToInt32(Keys.D4) Then
                'MsgBox("4 Stop")
                Buttonstop_Click(sender, New System.EventArgs())
            End If
        Catch ex As Exception
            Return False
        End Try
        Return MyBase.ProcessCmdKey(msg, keyData)
    End Function
    Public Sub tampilnotif()
        Timer6fade.Enabled = True
        Labelnotif.BackColor = Color.DimGray
        Labelnotif.Text = notiffy
        'suara.speak(notiffy)
    End Sub
    Private Sub Timer6fade_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer6fade.Tick
        Labelnotif.Text = " "
        Labelnotif.BackColor = Color.Transparent
        Timer6fade.Enabled = False
        'suara.speak(notiffy)
    End Sub
    Private Sub Buttonloadlog_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonloadlog.Click
        If Timer5req30ms.Enabled = False Then
            'MsgBox("a")
            loadlog()

        Else
            MsgBox("Can't Load while telemetry On")
        End If
    End Sub
    Public Sub getresult()
        Dim ts As TimeSpan = TimeSpan.FromSeconds(durasi) 'New TimeSpan(0, 0, 0, 227, 0)
        Dim mydate As DateTime = New DateTime(ts.Ticks)
        Labeldurationres.Text = (mydate.ToString(("HH:mm:ss")))
        Labelmaxalt.Text = maxalt & " - " & titikbaroawal & " = " & maxalt - titikbaroawal & " Meter"
        Labelpacketres.Text = packettx - packet
        Labelspinres.Text = "N/A"
        Labeljarakres.Text = "N/A"
        Labelrateres.Text = "N/A"
        'Labeldurationres.Text = 

    End Sub

    Private Sub Buttonresult_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonresult.Click
        getresult()
    End Sub
    Private Sub Form1_FormClosing(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing
        'If (MessageBox.Show("Yes for Close" & vbCr & "No for Restart", "", MessageBoxButtons.YesNoCancel) = Windows.Forms.DialogResult.Cancel) Then
        'e.Cancel = True
        'ElseIf (MessageBoxButtons.YesNoCancel) = Windows.Forms.DialogResult.No Then
        'Application.Restart()
        'Application.Exit()
        'ElseIf (MessageBoxButtons.YesNoCancel) = Windows.Forms.DialogResult.Yes Then
        'Application.Exit()
        'End If
    End Sub
    Private Sub Form1_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        If AxMSComm1.PortOpen = True Then
            AxMSComm1.PortOpen = False
        End If
        bersihkan()
        'MsgBox("Closed")
    End Sub
    Public Sub clearchart()
        Chart1.Series(0).Points.Clear()
        Chart1.Series(1).Points.Clear()
        Chart1.Series(2).Points.Clear()
        Chart1.Series(3).Points.Clear()
        Chart1.Series(4).Points.Clear()
        Chart1.Series(5).Points.Clear()
        Chart1.Series(6).Points.Clear()
        Chart1.Series(7).Points.Clear()
        Chart1.Series(8).Points.Clear()
        Chart2.Series(0).Points.Clear()
        'Chart2.Series(1).Points.Clear()
        'Chart2.Series(2).Points.Clear()
        Chart3.Series(0).Points.Clear()
        Chart4.Series(0).Points.Clear()
        Chart4.Series(1).Points.Clear()
        Chart4.Series(2).Points.Clear()
        Chart5.Series(0).Points.Clear()
        Chart5.Series(1).Points.Clear()
        Chart5.Series(2).Points.Clear()
        Chart6.Series(0).Points.Clear()
        Chart6.Series(1).Points.Clear()
        Chart6.Series(2).Points.Clear()
    End Sub

    Private Sub Buttonall_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonall.Click
        CheckBoxxacc.Checked = True
        CheckBoxyacc.Checked = True
        CheckBoxzacc.Checked = True
        CheckBoxxgyr.Checked = True
        CheckBoxygyr.Checked = True
        CheckBoxzgyr.Checked = True
        CheckBoxxmag.Checked = True
        CheckBoxymag.Checked = True
        CheckBoxzmag.Checked = True
        CheckBoxroll.Checked = True
        CheckBoxpitch.Checked = True
        CheckBoxyaw.Checked = True
    End Sub

    Private Sub Buttonclr_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Buttonclr.Click
        CheckBoxxacc.Checked = False
        CheckBoxyacc.Checked = False
        CheckBoxzacc.Checked = False
        CheckBoxxgyr.Checked = False
        CheckBoxygyr.Checked = False
        CheckBoxzgyr.Checked = False
        CheckBoxxmag.Checked = False
        CheckBoxymag.Checked = False
        CheckBoxzmag.Checked = False
        CheckBoxroll.Checked = False
        CheckBoxpitch.Checked = False
        CheckBoxyaw.Checked = False
    End Sub

    Private Sub TrackBar1_Scroll(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TrackBarrange.Scroll
        'Label45.Text = TrackBar1.Value
        If TrackBarrange.Value = 0 Then
            range = 25
        Else
            range = TrackBarrange.Value * 50
        End If
    End Sub

    Private Sub TrackBar2_Scroll(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TrackBarfps.Scroll
        If TrackBarfps.Value = 3 > 0 Then
            intervalreq = 1
        Else
            intervalreq = 1000 / (TrackBarfps.Value * 3)
        End If
        Timer1grafik10ms.Interval = intervalreq
    End Sub

    Private Sub SwitchButton2_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SwitchButtonlog.ValueChanged
        If SwitchButtonlog.Value = True Then
            statuslog = True
        Else
            statuslog = False
        End If
    End Sub
End Class
