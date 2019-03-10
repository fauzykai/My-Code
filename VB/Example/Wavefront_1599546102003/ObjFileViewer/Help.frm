VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmHelp 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Help"
   ClientHeight    =   7605
   ClientLeft      =   3045
   ClientTop       =   615
   ClientWidth     =   8055
   ControlBox      =   0   'False
   Icon            =   "Help.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7605
   ScaleWidth      =   8055
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   375
      Left            =   2640
      TabIndex        =   0
      Top             =   7200
      Width           =   2775
   End
   Begin MSFlexGridLib.MSFlexGrid MShelp 
      Height          =   6735
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   11880
      _Version        =   393216
      Rows            =   93
      Cols            =   1
      FixedRows       =   0
      FixedCols       =   0
      WordWrap        =   -1  'True
      GridLines       =   0
      ScrollBars      =   2
      BorderStyle     =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
 frmHelp.Hide
 mnfrm.Show
 Call Unload(frmHelp)
End Sub

Private Sub Form_Load()

MShelp.ColWidth(0) = 8000
MShelp.ColAlignment(0) = 1
MShelp.Row = 0
MShelp.Col = 0
MShelp.Text = "This program loads Wavefront Object Files into OpenGL"
MShelp.Row = 1
MShelp.Text = ""
MShelp.Row = 2
MShelp.Text = "To load a file click on Load File, and chose any Wavefront object file."
MShelp.Row = 4
MShelp.Text = "I made my models in AutoCAD and converted them to Wavefront Object File"
MShelp.Row = 5
MShelp.Text = "format by using Right Hemisphere's Deep Exploration Package. "
MShelp.Row = 6
MShelp.Text = ""
MShelp.Row = 7
MShelp.Text = "You can change the color of the background and the color of the models if"
MShelp.Row = 8
MShelp.Text = "the model has no material file specified for it. You can change the view"
MShelp.Row = 9
MShelp.Text = "by using these keys:"
MShelp.Row = 10
MShelp.Text = ""
MShelp.Row = 11
MShelp.Text = "Arrow KeyUP - KeyDOWN : Rotate the object about x-axis."
MShelp.Row = 12
MShelp.Text = "Arrow KeyLEFT - KeyRIGHT : Rotate the object about z-axis."
MShelp.Row = 13
MShelp.Text = "PageUP - PageDOWN : Increase or Decrease the speed of object's rotation about"
MShelp.Row = 14
MShelp.Text = "                                                 y-axis"
MShelp.Row = 15
MShelp.Text = "'Z' key : Zoom in the object"
MShelp.Row = 17
MShelp.Text = "'X' key : Zoom out the object"
MShelp.Row = 18
MShelp.Text = ""
MShelp.Row = 19
MShelp.Text = "Moving the Mouse and pressing the left button moves the object too."
MShelp.Row = 21
MShelp.Text = ""
MShelp.Row = 22
MShelp.Text = "Hope the program is useful. Enjoy using it !! :)"
MShelp.Row = 24
MShelp.Text = "By Anas S. 2003"
End Sub
