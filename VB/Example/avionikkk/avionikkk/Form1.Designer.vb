<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.AttitudeIndicatorInstrumentControl1 = New AvionicsInstrumentControl.AttitudeIndicatorInstrumentControl()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.TextBox2 = New System.Windows.Forms.TextBox()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.AltimeterInstrumentControl1 = New AvionicsInstrumentControl.AltimeterInstrumentControl()
        Me.Button2 = New System.Windows.Forms.Button()
        Me.TextBox3 = New System.Windows.Forms.TextBox()
        Me.HeadingIndicatorInstrumentControl1 = New AvionicsInstrumentControl.HeadingIndicatorInstrumentControl()
        Me.Button3 = New System.Windows.Forms.Button()
        Me.TextBox4 = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'AttitudeIndicatorInstrumentControl1
        '
        Me.AttitudeIndicatorInstrumentControl1.Location = New System.Drawing.Point(12, 12)
        Me.AttitudeIndicatorInstrumentControl1.Name = "AttitudeIndicatorInstrumentControl1"
        Me.AttitudeIndicatorInstrumentControl1.Size = New System.Drawing.Size(198, 197)
        Me.AttitudeIndicatorInstrumentControl1.TabIndex = 0
        Me.AttitudeIndicatorInstrumentControl1.Text = "AttitudeIndicatorInstrumentControl1"
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(231, 114)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(100, 20)
        Me.TextBox1.TabIndex = 1
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(231, 140)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(100, 20)
        Me.TextBox2.TabIndex = 2
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(231, 166)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 3
        Me.Button1.Text = "Button1"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'AltimeterInstrumentControl1
        '
        Me.AltimeterInstrumentControl1.Location = New System.Drawing.Point(370, 12)
        Me.AltimeterInstrumentControl1.Name = "AltimeterInstrumentControl1"
        Me.AltimeterInstrumentControl1.Size = New System.Drawing.Size(199, 197)
        Me.AltimeterInstrumentControl1.TabIndex = 4
        Me.AltimeterInstrumentControl1.Text = "AltimeterInstrumentControl1"
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(575, 166)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(75, 23)
        Me.Button2.TabIndex = 6
        Me.Button2.Text = "Button2"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(575, 140)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(100, 20)
        Me.TextBox3.TabIndex = 5
        '
        'HeadingIndicatorInstrumentControl1
        '
        Me.HeadingIndicatorInstrumentControl1.Location = New System.Drawing.Point(696, 12)
        Me.HeadingIndicatorInstrumentControl1.Name = "HeadingIndicatorInstrumentControl1"
        Me.HeadingIndicatorInstrumentControl1.Size = New System.Drawing.Size(187, 190)
        Me.HeadingIndicatorInstrumentControl1.TabIndex = 7
        Me.HeadingIndicatorInstrumentControl1.Text = "HeadingIndicatorInstrumentControl1"
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(696, 243)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(75, 23)
        Me.Button3.TabIndex = 9
        Me.Button3.Text = "Button3"
        Me.Button3.UseVisualStyleBackColor = True
        '
        'TextBox4
        '
        Me.TextBox4.Location = New System.Drawing.Point(696, 217)
        Me.TextBox4.Name = "TextBox4"
        Me.TextBox4.Size = New System.Drawing.Size(100, 20)
        Me.TextBox4.TabIndex = 8
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(895, 353)
        Me.Controls.Add(Me.Button3)
        Me.Controls.Add(Me.TextBox4)
        Me.Controls.Add(Me.HeadingIndicatorInstrumentControl1)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.TextBox3)
        Me.Controls.Add(Me.AltimeterInstrumentControl1)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.TextBox2)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.AttitudeIndicatorInstrumentControl1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents AttitudeIndicatorInstrumentControl1 As AvionicsInstrumentControl.AttitudeIndicatorInstrumentControl
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents AltimeterInstrumentControl1 As AvionicsInstrumentControl.AltimeterInstrumentControl
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents HeadingIndicatorInstrumentControl1 As AvionicsInstrumentControl.HeadingIndicatorInstrumentControl
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents TextBox4 As System.Windows.Forms.TextBox

End Class
