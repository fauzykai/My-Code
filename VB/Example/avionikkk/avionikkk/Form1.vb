Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        AttitudeIndicatorInstrumentControl1.SetAttitudeIndicatorParameters(Int(TextBox1.Text), Int(TextBox2.Text))

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        AltimeterInstrumentControl1.SetAlimeterParameters(Int(TextBox3.Text))
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        HeadingIndicatorInstrumentControl1.SetHeadingIndicatorParameters(Int(TextBox4.Text))
    End Sub
End Class
