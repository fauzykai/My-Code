<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class mnfrm
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(mnfrm))
        Me.glxCtl1 = New AxglCtl.AxglxCtl()
        CType(Me.glxCtl1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'glxCtl1
        '
        Me.glxCtl1.Enabled = True
        Me.glxCtl1.Location = New System.Drawing.Point(38, 28)
        Me.glxCtl1.Name = "glxCtl1"
        Me.glxCtl1.OcxState = CType(resources.GetObject("glxCtl1.OcxState"), System.Windows.Forms.AxHost.State)
        Me.glxCtl1.Size = New System.Drawing.Size(194, 228)
        Me.glxCtl1.TabIndex = 0
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(290, 268)
        Me.Controls.Add(Me.glxCtl1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.glxCtl1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents glxCtl1 As AxglCtl.AxglxCtl

End Class
