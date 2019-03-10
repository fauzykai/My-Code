Public Class mnfrm
    ''------------------------------------------------------------------------
    ''
    '' Author      : Anas S.
    '' Date        : 6 June 2003
    '' Version     : 1.0
    '' Description : Wavefront Object File Viewer
    ''
    ''------------------------------------------------------------------------

    'This program needs you to


    'Form resize
    Private Sub Form_Resize()
        glxCtl1.Left = 0
        glxCtl1.Top = 0
        glxCtl1.Width = ScaleWidth
        glxCtl1.Height = ScaleHeight
    End Sub

    'OCX Key Down
    Private Sub glxCtl1_KeyDown(ByVal KeyCode As Integer, ByVal Shift As Integer)
        cOGL.KeyDown(KeyCode, Shift)
    End Sub

    'OCX Draw
    Private Sub glxCtl1_Draw()
        cOGL.Draw()
    End Sub

    'OCX GL Initialize
    Private Sub glxCtl1_InitGL()
        cOGL.InitGL()
    End Sub

    'OCX Initialize
    Private Sub glxCtl1_Init()
        cOGL.Init()
    End Sub

    'OCX KeyPress
    Private Sub glxCtl1_KeyPress(ByVal KeyAscii As Integer)
        cOGL.KeyPress(KeyAscii)
    End Sub

    'OCX Mouse Move
    Private Sub glxCtl1_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
        cOGL.MouseMove(Button, Shift, X, Y)
    End Sub

    'OCX Paint
    Private Sub glxCtl1_Paint()
        gCtl.Render()
    End Sub

    Private Sub mnuHelp_Click()
        Load(frmHelp)
        frmHelp.Show()
    End Sub

    'Menu Load Files
    Private Sub mnuLoadModel_Click()
        dlgLoadModel.FileName = ""
        dlgLoadModel.Filter = "Wavefront Object File (*.obj)|*.obj"
        dlgLoadModel.ShowOpen()
        If dlgLoadModel.FileName = "" Then Exit Sub
        MousePointer = 11
        cOGL.FileName = dlgLoadModel.FileName
        mnuCModel.Enabled = Not (cOGL.MaterialExists)
        MousePointer = 0
    End Sub

    'Menu BackGround Color Click
    Private Sub mnuBGColor_Click(ByVal Index As Integer)
        ClearBGColorItems()
        mnuBGColor(Index).Checked = True
        cOGL.BackGroundColor = Index
    End Sub

    'Menu Model Color Click
    Private Sub MnuMColor_Click(ByVal Index As Integer)
        ClearMatColorItems()
        MnuMColor(Index).Checked = True
        cOGL.MaterialColor = Index
    End Sub

    'This routine clears all the check marks
    'in the Background color menu
    Private Sub ClearBGColorItems()
        Dim i As Integer
        For i = 0 To mnuBGColor.count - 1
            mnuBGColor(i).Checked = False
        Next
    End Sub

    'This routine clears all the check marks
    'in the Model color menu
    Private Sub ClearMatColorItems()
        Dim i As Integer
        For i = 0 To MnuMColor.count - 1
            MnuMColor(i).Checked = False
        Next
    End Sub

    Private Sub pitchScroll_Scroll()
        cOGL.Scroll("z", pitchScroll.Value)
        Text2.Text = pitchScroll.Value
    End Sub

    Private Sub rollScroll_Scroll()
        cOGL.Scroll("x", rollScroll.Value)
        Text1.Text = rollScroll.Value
    End Sub

    Private Sub yawScroll_Scroll()
        cOGL.Scroll("y", yawScroll.Value)
        Text3.Text = yawScroll.Value
    End Sub
End Class
