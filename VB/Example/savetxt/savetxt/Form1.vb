Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim file_name As String = "D:\isi.txt"
        If System.IO.File.Exists(file_name) = True Then
            Dim objwriter As New System.IO.StreamWriter(file_name)
            objwriter.Write(TextBox1.Text)
            objwriter.Write(",")

            objwriter.WriteLine("a")
            objwriter.WriteLine("b")
            objwriter.Close()

            MsgBox("sukses")
        Else
            MsgBox("gagal")
        End If
    End Sub
End Class
