Imports MySql.Data.MySqlClient

Public Class Form1  
    Dim mysqlconn As MySqlConnection
    Dim myCommand As New MySqlCommand
    Dim myAdapter As New MySqlDataAdapter
    Dim myData As New DataTable
    Dim SQL As String

    Private Sub cmdsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdsave.Click
        mysqlconn = New MySqlConnection
        mysqlconn.ConnectionString = "server=localhost;user id=root;password=;database=ffdb"
        Try
            mysqlconn.Open()
            MsgBox("sudah open")
            'mysqlconn.Close()

        Catch ex As Exception
            MsgBox("gbs")
        Finally
            mysqlconn.Dispose()
        End Try
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        SQL = "SELECT * FROM gcstab"
        mysqlconn = New MySqlConnection
        mysqlconn.ConnectionString = "server=localhost;user id=root;password=;database=ffdb"
        Try
            mysqlconn.Open()
        myCommand.Connection = mysqlconn
        myCommand.CommandText = SQL

        myAdapter.SelectCommand = myCommand
        myAdapter.Fill(myData)

            DataGridView1.DataSource = myData
        Catch myerror As MySqlException
            MsgBox("terbuka")
        Finally
            mysqlconn.Close()
            mysqlconn.Dispose()
        End Try

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        'Dim masuk As Integer
        Dim xacc As String
        xacc = txtname.Text
        SQL = "INSERT INTO gcstab (XACC) values('" & xacc & "')"
        mysqlconn = New MySqlConnection
        mysqlconn.ConnectionString = "server=localhost;user id=root;password=;database=ffdb"
        Try
            mysqlconn.Open()
            myCommand.Connection = mysqlconn
            myCommand.CommandText = SQL
            myCommand.ExecuteNonQuery()
            mysqlconn.Close()
        Catch myerror As MySqlException
            MsgBox("eror")
        End Try

    End Sub
End Class
