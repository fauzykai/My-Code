Imports Gigasoft.ProEssentials.Enums
Public Class Form1
    Dim s As Integer
    Dim p As Integer
    Dim x As Integer, y As Integer, z As Integer
    Public Sub trajectinit()
        Pe3do1.PePlot.PolyMode = PolyMode.Scatter
        Pe3do1.PeData.Subsets = 10
        Pe3do1.PeData.Points = 300
        Pe3do1.PeColor.BitmapGradientMode = True
        Pe3do1.PeColor.QuickStyle = QuickStyle.DarkNoBorder
        'Pe3do1.PeColor.SubsetColors(0) = Color.FromArgb(198, 198, 0)
        Pe3do1.PeColor.SubsetColors(0) = Color.FromArgb(117, 162, 230)
        Pe3do1.PePlot.SubsetPointTypes(0) = PointType.DotSolid
        Pe3do1.PeString.SubsetLabels(0) = "Data 1"
        Pe3do1.PeString.MainTitle = "3D Scatter"
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
        Pe3do1.PeUserInterface.AutoRotation = True
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

    End Sub
    Public Sub graph()
        
    End Sub
    Public Sub add()
        'Dim i As Integer
        Pe3do1.PeData.X(s, p) = x
        Pe3do1.PeData.Y(s, p) = y
        Pe3do1.PeData.Z(s, p) = z

    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Dim i = 1
        trajectinit()
        For i = 1 To 300
            Pe3do1.PeData.X(0, i) = 0
            Pe3do1.PeData.Y(0, i) = 0
            Pe3do1.PeData.Z(0, i) = 0
        Next

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        'graph()
        s = 1
        p = 1
        Pe3do1.PeData.X(s, p) = 5
        Pe3do1.PeData.Y(s, p) = 10
        Pe3do1.PeData.Z(s, p) = 20
        'graph()
        'add()

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        s = 1
        p = 2
        Pe3do1.PeData.X(s, p) = 50
        Pe3do1.PeData.Y(s, p) = 100
        Pe3do1.PeData.Z(s, p) = 200
        'graph()
        'add()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        's = 1
        For p = 0 To 100
            Pe3do1.PeData.X(s, p) = x
            Pe3do1.PeData.Y(s, p) = y
            Pe3do1.PeData.Z(s, p) = z
            x = x + 10
            y = y + 10
            z = z + 10
            's = s + 1
            'graph()
            Pe3do1.Refresh()
        Next
       
    End Sub
End Class
