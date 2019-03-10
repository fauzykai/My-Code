Imports HelixToolkit
Imports HelixToolkit.Wpf
Imports System.Windows.Media.Media3D
Class MainWindow
    Dim viewport As New HelixViewport3D
    Public Sub cam()
        viewport.DefaultCamera = New PerspectiveCamera()
        viewport.DefaultCamera.Position = New Point3D(100, 100, 100)
        viewport.DefaultCamera.LookDirection = New Vector3D(-100, -100, -100)
        viewport.DefaultCamera.UpDirection = New Vector3D(0, 0, 1)
    End Sub
    Public Sub light()
        Dim light As New DefaultLights()
        viewport.Children.Add(light)
    End Sub

    Private Sub Window_Loaded(ByVal sender As System.Object, ByVal e As System.Windows.RoutedEventArgs) Handles MyBase.Loaded
        'Dim viewport As New HelixViewport3D
        HelixViewport3D1.Children.Add(viewport)
    End Sub
End Class
