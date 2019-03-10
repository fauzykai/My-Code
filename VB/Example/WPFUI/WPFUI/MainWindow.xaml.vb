Imports MahApps.Metro.Controls
Imports MahApps.Metro

Class MainWindow
    Dim myport As Array
    Private Sub MetroWindow_Loaded(ByVal sender As System.Object, ByVal e As System.Windows.RoutedEventArgs) Handles MyBase.Loaded
        bukaport()
    End Sub
    Public Sub bukaport()
        myport = IO.Ports.SerialPort.GetPortNames()

        ComboBox1.Items.Add(9600)
        ComboBox1.Items.Add(19200)
        ComboBox1.Items.Add(38400)
        ComboBox1.Items.Add(57600)
        ComboBox1.Items.Add(115200)
        For i = 0 To UBound(myport)
            ComboBox2.Items.Add(myport(i))

        Next

        ComboBox2.Text = ComboBox2.Items.Item(0)
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.Windows.RoutedEventArgs) Handles Button2.Click

    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.Windows.RoutedEventArgs) Handles Button6.Click
        flyout1.IsOpen = True
    End Sub
End Class
