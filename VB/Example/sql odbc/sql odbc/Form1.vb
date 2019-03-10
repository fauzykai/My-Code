Imports System.Data.Odbc
Imports System.Data

Module koneksi
    Public conn As OdbcConnection
    Public da As OdbcDataAdapter
    Public ds As DataSet
    Public strcon As String
    Public Sub konek()
        strcon = "Driver={MySQL ODBC 5.2 ANSI Driver};database=gcs;server=localhost;uid=root"
        conn = New OdbcConnection(strcon)
        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If
    End Sub
End Module

Public Class Form1  
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        konek()
        da = New Odbc.OdbcDataAdapter("select * from gcstab", conn)
        ds = New DataSet
        ds.Clear()
        da.Fill(ds, "gcstab")
        dgv.DataSource = (ds.Tables("gcstab"))
    End Sub
End Class
