Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim myProcess As New Process()
        myProcess.StartInfo.FileName = "C:\Program Files\TechSmith\Camtasia Studio 8\CamRecorder.exe"
        myProcess.StartInfo.WindowStyle = ProcessWindowStyle.Maximized
        myProcess.Start()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        SendKeys.SendWait("F9")
    End Sub
End Class
