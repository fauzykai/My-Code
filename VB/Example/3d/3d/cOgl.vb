Public Class cOgl
    ''------------------------------------------------------------------------
    ''
    '' Author      : Anas S.
    '' Date        : 6 June 2003
    '' Version     : 1.0
    '' Description : OpenGL class to display Wavefront Object files
    ''
    ''------------------------------------------------------------------------
    
    Option Explicit on
    'imports VBOpenGL

    Dim x_ang As Double, z_ang As Double  'variables describing the orientation
    'of the object in x and z directions
    Dim ySpeed As Double, yRot, zRot, xRot As Double 'ySpeed is the rotation speed of the
    'object in y-direction, where as yRot
    'is the orientation of the object in
    'y direction
    Dim obj_has_Material As Boolean       'Check if object has prespecified materials
    Dim M_Color As DefaultColor           'Material Color to assign to object

    Dim ObjID As Long                     'ID of the onject to load in OpenGL
    Dim dist As Single                    'Zoom Variable
    Dim ObjFile As String                 'Object File Path

    Dim bgRed As Single                   'BackGround Color specification
    Dim bgGreen As Single
    Dim bgBlue As Single

    ' Here the backgroung color of the openGL window is set to Grey
    ' initially
    Private Sub Class_Initialize()
        'Default BackColor is Gray
        bgRed = 112 / 255
        bgGreen = 128 / 255
        bgBlue = 144 / 255
        M_Color = Orange
    End Sub

    'This property gets the file path of the object to load
Public Property Let FileName(ByVal vNewValue As String)
 ObjFile = vNewValue
 Init
 InitGL
End Property

    'This property specifies the color of the object incase
    'the object does not have an .mtl file
Public Property Let MaterialColor(ByVal vNewValue As DefaultColor)
 M_Color = vNewValue
End Property

    'This property allows the user to change the
    'Background color of the OpenGL screen
Public Property Let BackGroundColor(ByVal vNewValue As Integer)

  Select Case vNewValue

  Case 0 'Beige
   bgRed = 245 / 255: bgGreen = 245 / 255: bgBlue = 220 / 255

  Case 1 'Deep Sky Blue
   bgRed = 0 / 255: bgGreen = 191 / 255: bgBlue = 255 / 255

  Case 2 'Slate Gray
   bgRed = 112 / 255: bgGreen = 128 / 255: bgBlue = 144 / 255

  Case 3 'Pale Golden Rod
   bgRed = 238 / 255: bgGreen = 232 / 255: bgBlue = 170 / 255

  Case 4 'Medium Blue
  bgRed = 0 / 255: bgGreen = 0 / 255: bgBlue = 205 / 255

  Case 5 'Light Gray
   bgRed = 211 / 255: bgGreen = 211 / 255: bgBlue = 211 / 255

  Case 6 'Olive Drap
   bgRed = 107 / 255: bgGreen = 142 / 255: bgBlue = 35 / 255
  End Select

End Property

    ' Check if the object has material properties specified for it or not
Public Property Get MaterialExists() As Boolean
 MaterialExists = obj_has_Material
End Property

    ' Initializes the parameters for orientation, speed and zoom
    Public Sub Init()
        x_ang = 0
        z_ang = 0
        yRot = 0
        dist = 30
        ySpeed = 0
    End Sub

    'Initialize the OpenGL environment
    Public Sub InitGL()

        With gCtl.Lights.Item(liLight0)
            .SetPosition(1, 0.2, 1)
            .Enabled = True
        End With

        With gCtl.Lights.Item(liLight1)
            .SetAmbient(0.2, 0.2, 0.2)
            .SetDiffuse(1, 1, 1, 1)
            .SetPosition(0, 0, 0)
            .SetSpecular(1, 1, 1)
            .LinearAttenuation = 0.2
            .Enabled = True
        End With

        glEnable(glcNormalize)
        glMatrixMode(mmProjection)
        glLoadIdentity()
        glMatrixMode(mmModelView)
        glLoadIdentity()

        With gCtl                         'set the ocx file
            .MouseRotate = True
            .Trackball.Animate = False
            .Grid = glxGridX
            .Axis = glxXYZ
            .Pick = True
        End With

        glEnable(glcLighting)            ' Enable Lighting
        glEnable(glcLight0)              ' Enable Light0
        glEnable(glcLight1)              ' Enable Light1

        glDepthFunc(cfLess)
        glEnable(glcDepthTest)           ' Enables Depth test
        glShadeModel(smSmooth)             ' Enables Smooth Color Shading

        glFlush()
        If ObjFile <> "" Then MakeDisplay()
    End Sub

    Public Sub Draw()

        ' Here's Where We Do All The Drawing

        glClear(clrColorBufferBit Or clrDepthBufferBit)
        glClearColor(bgRed, bgGreen, bgBlue, 1) 'Gray Background

        glMatrixMode(mmProjection)  'Set the matrix projection method
        glLoadIdentity()

        With gCtl.Camera             'Set the View Parameters
            .NearPlane = 10
            .FarPlane = 1000
            .FieldOfView = 15
            .LookAt(0, 0, dist, 0, 0, 0, 0, 1, 0)
        End With

        glMatrixMode(mmModelView)

        yRot = yRot + ySpeed       'The orientation speed in y-direction

        DrawPart()                   'Draw the part
        glFlush()

        With gCtl
            .Trackball.Update()
            .Animate = True
        End With

    End Sub

    'Here the part to be drawn is arranged in
    'OpenGL environment
    Private Sub DrawPart()
        glRotatef(-x_ang, 1, 0, 0)  'x-orientation
        glRotatef(-z_ang, 0, 0, 1)  'z-orientation
        glPushMatrix()
        glRotatef(-yRot, 0, 1, 0)  'y-orientation
        ColorObject()
        glCallList(ObjID)        'call the object stored in OpenGL
        glPopMatrix()
        glRotatef(z_ang, 0, 0, 1)
        glRotatef(x_ang, 1, 0, 0)
    End Sub

    'This routine loads the Object File model
    'and stores it in OpenGL
    Private Sub MakeDisplay()
        Dim Obj_File As New cObjReader    'We use the cObjReader class to read
        'wavefront object files and load them
        'in OpenGL
        Obj_File.Initialize_Obj(ObjFile)   'Here specify the path of the model
        Obj_File.Unitize()                  'Change the dimensions of the model
        'to unity
        ObjID = Obj_File.Draw_Obj         'stores the object in OpenGL
        obj_has_Material = Obj_File.MaterialExists 'Does the object have material
        'specifications
        Obj_File = Nothing            'release the cObjReader Object
    End Sub

    'Here we specify what color will the object be
    'in case the object does not have any color specified
    'to it
    Private Sub ColorObject()
        Select Case M_Color
            Case White
                MatWhite.SetMaterial()
            Case Black
                MatBlack.SetMaterial()
            Case Red
                MatRed.SetMaterial()
            Case Yellow
                MatYellow.SetMaterial()
            Case Orange
                MatOrange.SetMaterial()
            Case Brown
                MatBrown.SetMaterial()
            Case Green
                MatGreen.SetMaterial()
            Case Blue
                MatBlue.SetMaterial()
        End Select
    End Sub


    '''''''''''''''''''''''''''''''''''''''''''''''
    ' The routine handles Key Press Operation
    ' done by the user in the GUI
    '''''''''''''''''''''''''''''''''''''''''''''''
    Public Sub KeyPress(ByVal KeyAscii As Integer)
        Dim s As String
        s = UCase(Chr$(KeyAscii))
        Select Case (s)
            Case "Z"     'The user presses 'Z'
                If (dist > 15) Then dist = dist - 1 'Zoom In

            Case "X"         'The user presses 'X'
                If (dist < 60) Then dist = dist + 1 'Zoom Out

        End Select
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''
    ' The routine handles Key Down Operation
    ' done by the user in the GUI
    '''''''''''''''''''''''''''''''''''''''''''''''
    Public Sub KeyDown(ByVal KeyCode%, ByVal Shift%)
        Select Case (KeyCode)
            Case vbKeyUp 'The user presses ArrowKey UP
                x_ang = x_ang + 1

            Case vbKeyDown 'The user presses ArrowKey DOWN
                x_ang = x_ang - 1

            Case vbKeyLeft 'The user presses ArrowKey Left
                z_ang = z_ang + 1

            Case vbKeyRight 'The user presses ArrowKey RIGHT
                z_ang = z_ang - 1

            Case vbKeyPageUp          'The user presses PAGE UP
                If (ySpeed <= 40) Then ySpeed = ySpeed + 1
            Case vbKeyPageDown        'The user presses PAGE DOWN
                If (ySpeed >= -40) Then ySpeed = ySpeed - 1

            Case 27 : Unload(mnfrm)   'The user presses ESCAPE

            Case Else
        End Select
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''
    'Coba edit
    '''''''''''''''''''''''''''''''''''''''''''''''
    Public Sub Scroll(ByVal Axis, ByVal Shift)
        Select Case (Axis)
            Case "x" 'The user presses ArrowKey UP
                x_ang = Shift

            Case "y" 'The user presses ArrowKey UP
                yRot = Shift

            Case "z" 'The user presses ArrowKey UP
                z_ang = Shift

            Case Else
        End Select
    End Sub
    '''''''''''''''''''''''''''''''''''''''''''''''
    ' The routine handles Mouse Move Operation
    ' done by the user in the GUI
    '''''''''''''''''''''''''''''''''''''''''''''''
    Public Sub MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
        If Button = 0 Then
            Exit Sub
        ElseIf Button = 1 Then
            x_ang = 140 - Y
            yRot = -X
            gCtl.Render()
        End If
    End Sub

End Class
