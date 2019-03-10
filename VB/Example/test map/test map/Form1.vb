Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.Drawing
Imports System.Globalization
Imports System.Windows.Forms
Imports GMap.NET
Imports GMap.NET.CacheProviders
Imports GMap.NET.MapProviders
Imports GMap.NET.WindowsForms
Imports GMap.NET.WindowsForms.Markers

Public Class Form1
    Dim xlat As Double = -6.886635
    Dim xlon As Double = 107.615054
    Dim xlat2 As Double = -6.926768
    Dim xlon2 As Double = 107.62619

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        ' Dim pointStart As New PointLatLng(-6.886635, 107.615054)
        ' Dim pointEnd As New PointLatLng(-6.1, 107.1)
        ' GMap.NET.MapProviders.GMapProviders.GoogleMap.GetRouteBetweenPoints(pointStart, pointEnd, False, False, 15)
        Dim overlayOne As New GMap.NET.WindowsForms.GMapOverlay(GMapControl1, "OverlayOne")
        overlayOne.Markers.Add(New GMap.NET.WindowsForms.Markers.GMapMarkerGoogleGreen(New GMap.NET.PointLatLng(xlat2, xlon2)))
        'GMap.NET.WindowsForms.GMapMarker.ToolTi
        GMapControl1.Overlays.Add(overlayOne)
        GMapControl1.Position = New GMap.NET.PointLatLng(xlat2, xlon2)

    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ' InitializeComponent()
        'SuspendLayout()
        With GMapControl1
            '.SetCurrentPositionByKeywords("bandung")
            .CanDragMap = True
            .RoutesEnabled = True
            .DragButton = Windows.Forms.MouseButtons.Left
            '.Dock = DockStyle.Fill
            '.Manager.Mode = AccessMode.ServerAndCache
            'SetCurrentPositionByKeywords("USA")
            .MapProvider = GMap.NET.MapProviders.GMapProviders.BingMapOld
            .MaxZoom = 21
            .Zoom = 10
            .Manager.Mode = AccessMode.ServerAndCache
            'Controls.Add(GMapControl1)
            'ResumeLayout(True)

        End With

        GMapControl1.Position = New GMap.NET.PointLatLng(xlat, xlon)

        

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim overlaytwo As New GMap.NET.WindowsForms.GMapOverlay(GMapControl1, "OverlayTwo")
        overlaytwo.Markers.Add(New GMap.NET.WindowsForms.Markers.GMapMarkerGoogleRed(New GMap.NET.PointLatLng(xlat, xlon)))
        GMapControl1.Overlays.Add(overlaytwo)
        GMapControl1.Position = New GMap.NET.PointLatLng(xlat2, xlon2)

    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
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
    Private Sub gmapcontrol1_OnMarkerClick(ByVal item As GMapMarker, ByVal e As MouseEventArgs)
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dim deltalat As Double = xlat2 - xlat
        Dim deltalon As Double = xlon2 - xlon
        Dim EARTH_RADIUS As Double = 6367.45
        Dim a As Double = (Math.Sin(deltalat / 2)) ^ 2 + Math.Cos(xlat) * Math.Cos(xlat2) * (Math.Sin(deltalon / 2)) ^ 2
        Dim c As Double = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a))
        Dim distance As Double = EARTH_RADIUS * c
        Label1.Text = distance
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
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
        Label1.Text = dist
    End Sub

    Private Function deg2rad(ByVal deg As Double) As Double
        Return (deg * Math.PI / 180.0)
    End Function

    Private Function rad2deg(ByVal rad As Double) As Double
        Return rad / Math.PI * 180.0
    End Function

End Class
