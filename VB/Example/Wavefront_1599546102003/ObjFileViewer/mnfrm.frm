VERSION 5.00
Object = "{34A5E085-7527-11D2-9718-000000000000}#1.1#0"; "glxctl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form mnfrm 
   Caption         =   "Wavefront .Obj Files Viewer"
   ClientHeight    =   5895
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   4860
   Icon            =   "mnfrm.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5895
   ScaleWidth      =   4860
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3960
      TabIndex        =   9
      Text            =   "0"
      Top             =   5280
      Width           =   735
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3960
      TabIndex        =   8
      Text            =   "0"
      Top             =   4680
      Width           =   735
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3960
      TabIndex        =   7
      Text            =   "0"
      Top             =   4080
      Width           =   735
   End
   Begin VB.HScrollBar yawScroll 
      Height          =   495
      Left            =   1080
      Max             =   359
      TabIndex        =   3
      Top             =   5280
      Width           =   2775
   End
   Begin VB.HScrollBar pitchScroll 
      Height          =   495
      Left            =   1080
      Max             =   359
      TabIndex        =   2
      Top             =   4680
      Width           =   2775
   End
   Begin VB.HScrollBar rollScroll 
      Height          =   495
      Left            =   1080
      Max             =   359
      TabIndex        =   1
      Top             =   4080
      Width           =   2775
   End
   Begin MSComDlg.CommonDialog dlgLoadModel 
      Left            =   960
      Top             =   3120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin glCtl.glxCtl glxCtl1 
      Height          =   3855
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4575
      _ExtentX        =   8070
      _ExtentY        =   6800
      BorderStyle     =   0
   End
   Begin VB.Label Label3 
      Caption         =   "Yaw"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   5280
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "Pitch"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   5
      Top             =   4680
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Roll"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   4080
      Width           =   855
   End
   Begin VB.Menu mnuLoadModel 
      Caption         =   "Load Model"
   End
   Begin VB.Menu MnuColor 
      Caption         =   "Change Color"
      Begin VB.Menu mnuCBackGround 
         Caption         =   "BackGround"
         Begin VB.Menu mnuBGColor 
            Caption         =   "Beige"
            Index           =   0
         End
         Begin VB.Menu mnuBGColor 
            Caption         =   "Deep Sky Blue"
            Index           =   1
         End
         Begin VB.Menu mnuBGColor 
            Caption         =   "Gray"
            Checked         =   -1  'True
            Index           =   2
         End
         Begin VB.Menu mnuBGColor 
            Caption         =   "Pale Golden rod"
            Index           =   3
         End
         Begin VB.Menu mnuBGColor 
            Caption         =   "Medium Blue"
            Index           =   4
         End
         Begin VB.Menu mnuBGColor 
            Caption         =   "Light Gray"
            Index           =   5
         End
         Begin VB.Menu mnuBGColor 
            Caption         =   "Olive Drab"
            Index           =   6
         End
      End
      Begin VB.Menu mnuCModel 
         Caption         =   "Model"
         Enabled         =   0   'False
         Begin VB.Menu MnuMColor 
            Caption         =   "White"
            Index           =   0
         End
         Begin VB.Menu MnuMColor 
            Caption         =   "CBlack"
            Index           =   1
         End
         Begin VB.Menu MnuMColor 
            Caption         =   "Red"
            Index           =   2
         End
         Begin VB.Menu MnuMColor 
            Caption         =   "Yellow"
            Index           =   3
         End
         Begin VB.Menu MnuMColor 
            Caption         =   "Orange"
            Checked         =   -1  'True
            Index           =   4
         End
         Begin VB.Menu MnuMColor 
            Caption         =   "Brown"
            Index           =   5
         End
         Begin VB.Menu MnuMColor 
            Caption         =   "Green"
            Index           =   6
         End
         Begin VB.Menu MnuMColor 
            Caption         =   "Blue"
            Index           =   7
         End
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "Help"
   End
End
Attribute VB_Name = "mnfrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
Private Sub glxCtl1_KeyDown(KeyCode As Integer, Shift As Integer)
 cOGL.KeyDown KeyCode, Shift
End Sub

'OCX Draw
Private Sub glxCtl1_Draw()
    cOGL.Draw
End Sub

'OCX GL Initialize
Private Sub glxCtl1_InitGL()
 cOGL.InitGL
End Sub

'OCX Initialize
Private Sub glxCtl1_Init()
 cOGL.Init
End Sub

'OCX KeyPress
Private Sub glxCtl1_KeyPress(KeyAscii As Integer)
 cOGL.KeyPress KeyAscii
End Sub

'OCX Mouse Move
Private Sub glxCtl1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 cOGL.MouseMove Button, Shift, X, Y
End Sub

'OCX Paint
Private Sub glxCtl1_Paint()
 gCtl.Render
End Sub

Private Sub mnuHelp_Click()
 Load frmHelp
 frmHelp.Show
End Sub

'Menu Load Files
Private Sub mnuLoadModel_Click()
 dlgLoadModel.FileName = ""
 dlgLoadModel.Filter = "Wavefront Object File (*.obj)|*.obj"
 dlgLoadModel.ShowOpen
 If dlgLoadModel.FileName = "" Then Exit Sub
 MousePointer = 11
 cOGL.FileName = dlgLoadModel.FileName
 mnuCModel.Enabled = Not (cOGL.MaterialExists)
 MousePointer = 0
End Sub

'Menu BackGround Color Click
Private Sub mnuBGColor_Click(Index As Integer)
 ClearBGColorItems
  mnuBGColor(Index).Checked = True
 cOGL.BackGroundColor = Index
End Sub

'Menu Model Color Click
Private Sub MnuMColor_Click(Index As Integer)
 ClearMatColorItems
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
 cOGL.Scroll "z", pitchScroll.Value
 Text2.Text = pitchScroll.Value
End Sub

Private Sub rollScroll_Scroll()
 cOGL.Scroll "x", rollScroll.Value
 Text1.Text = rollScroll.Value
End Sub

Private Sub yawScroll_Scroll()
 cOGL.Scroll "y", yawScroll.Value
 Text3.Text = yawScroll.Value
End Sub
