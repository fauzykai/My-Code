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
        Me.components = New System.ComponentModel.Container()
        Me.ComboBoxrkt = New System.Windows.Forms.ComboBox()
        Me.ComboBoxbaudrkt = New System.Windows.Forms.ComboBox()
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Button1 = New System.Windows.Forms.Button()
        Me.Button2 = New System.Windows.Forms.Button()
        Me.TextBoxtx = New System.Windows.Forms.TextBox()
        Me.SerialPort2 = New System.IO.Ports.SerialPort(Me.components)
        Me.Button3 = New System.Windows.Forms.Button()
        Me.Button4 = New System.Windows.Forms.Button()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Button5 = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.Button6 = New System.Windows.Forms.Button()
        Me.Button7 = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'ComboBoxrkt
        '
        Me.ComboBoxrkt.FormattingEnabled = True
        Me.ComboBoxrkt.Location = New System.Drawing.Point(12, 12)
        Me.ComboBoxrkt.Name = "ComboBoxrkt"
        Me.ComboBoxrkt.Size = New System.Drawing.Size(104, 21)
        Me.ComboBoxrkt.TabIndex = 0
        '
        'ComboBoxbaudrkt
        '
        Me.ComboBoxbaudrkt.FormattingEnabled = True
        Me.ComboBoxbaudrkt.Location = New System.Drawing.Point(12, 39)
        Me.ComboBoxbaudrkt.Name = "ComboBoxbaudrkt"
        Me.ComboBoxbaudrkt.Size = New System.Drawing.Size(104, 21)
        Me.ComboBoxbaudrkt.TabIndex = 1
        '
        'Timer1
        '
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(124, 10)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(103, 23)
        Me.Button1.TabIndex = 2
        Me.Button1.Text = "Open"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(124, 37)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(103, 23)
        Me.Button2.TabIndex = 3
        Me.Button2.Text = "Close"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'TextBoxtx
        '
        Me.TextBoxtx.Location = New System.Drawing.Point(12, 66)
        Me.TextBoxtx.Multiline = True
        Me.TextBoxtx.Name = "TextBoxtx"
        Me.TextBoxtx.Size = New System.Drawing.Size(215, 44)
        Me.TextBoxtx.TabIndex = 4
        '
        'SerialPort2
        '
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(12, 149)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(106, 23)
        Me.Button3.TabIndex = 5
        Me.Button3.Text = "Start"
        Me.Button3.UseVisualStyleBackColor = True
        '
        'Button4
        '
        Me.Button4.Location = New System.Drawing.Point(124, 149)
        Me.Button4.Name = "Button4"
        Me.Button4.Size = New System.Drawing.Size(103, 23)
        Me.Button4.TabIndex = 7
        Me.Button4.Text = "Stop"
        Me.Button4.UseVisualStyleBackColor = True
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(12, 118)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(78, 20)
        Me.TextBox1.TabIndex = 8
        '
        'Button5
        '
        Me.Button5.Location = New System.Drawing.Point(124, 116)
        Me.Button5.Name = "Button5"
        Me.Button5.Size = New System.Drawing.Size(103, 23)
        Me.Button5.TabIndex = 9
        Me.Button5.Text = "Interval Set"
        Me.Button5.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(98, 121)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(20, 13)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "ms"
        '
        'Timer2
        '
        '
        'Button6
        '
        Me.Button6.Location = New System.Drawing.Point(124, 178)
        Me.Button6.Name = "Button6"
        Me.Button6.Size = New System.Drawing.Size(103, 23)
        Me.Button6.TabIndex = 12
        Me.Button6.Text = "Restart"
        Me.Button6.UseVisualStyleBackColor = True
        '
        'Button7
        '
        Me.Button7.Location = New System.Drawing.Point(12, 178)
        Me.Button7.Name = "Button7"
        Me.Button7.Size = New System.Drawing.Size(106, 23)
        Me.Button7.TabIndex = 13
        Me.Button7.Text = "Auto"
        Me.Button7.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(239, 210)
        Me.Controls.Add(Me.Button7)
        Me.Controls.Add(Me.Button6)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Button5)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.Button4)
        Me.Controls.Add(Me.Button3)
        Me.Controls.Add(Me.TextBoxtx)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.ComboBoxbaudrkt)
        Me.Controls.Add(Me.ComboBoxrkt)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ComboBoxrkt As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxbaudrkt As System.Windows.Forms.ComboBox
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents TextBoxtx As System.Windows.Forms.TextBox
    Friend WithEvents SerialPort2 As System.IO.Ports.SerialPort
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents Button5 As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents Button6 As System.Windows.Forms.Button
    Friend WithEvents Button7 As System.Windows.Forms.Button

End Class
