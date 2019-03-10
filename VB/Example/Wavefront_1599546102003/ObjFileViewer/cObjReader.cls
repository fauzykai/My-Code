VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cObjReader"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
''------------------------------------------------------------------------
''
'' Author      : Anas S.
'' Date        : 6 June 2002
'' Version     : 1.0
'' Description : Wavefront OPJ loader
''
''------------------------------------------------------------------------

Option Explicit
Option Compare Text

Dim Model_Obj As TModel

Dim tmpVerticeNo As Integer
Dim tmpNormalNo As Integer
Dim tmpTexCoordNo As Integer

Public Enum DefaultColor  'Default Color of Object
 White = 0
 Black = 1
 Red = 2
 Yellow = 3
 Orange = 4
 Brown = 5
 Green = 6
 Blue = 7
End Enum

Dim obj_has_Material As Boolean 'Check if object file has a material file

Private Type TColor             ' Stores a RGB (0-1) Color
  R As Double
  G As Double
  b As Double
End Type

Private Type TCoord             ' Stores X, Y, Z coordinates
  x As Double
  y As Double
  Z As Double
End Type

Private Type TTexCoord          ' Stores texture coordinates
  U As Double
  v As Double
End Type

Private Type TMaterial          ' Material Structure
  Name  As String
  Ambient As TColor
  Diffuse As TColor
  Specular  As TColor
  Shininess As Double
  Texture  As Integer
End Type

Private Type TFace
  count As Integer           ' Number of vertices in faces
  vIndex(8) As Integer        ' indexes to vertices
  tIndex(8) As Integer        ' indexes to vertex textures
  nIndex(8) As Integer        ' indexes to vertex normals
End Type

Private Type TGroup
  Name As String
  Faces As Integer           ' Number of faces
  Face() As TFace            ' The faces in the group
  mIndex As Integer          ' index to Material
End Type

Private Type TModel
  Name As String
  MaterialFile As String
  Vertices As Integer
  Normals As Integer
  TexCoords As Integer
  Groups As Integer
  Materials As Integer
  Vertex() As TCoord
  Normal() As TCoord
  TexCoord() As TTexCoord
  Group() As TGroup
  Material() As TMaterial
End Type

'------------------------------------------------------------------
'  Initialises a model
'------------------------------------------------------------------
 Private Sub InitModel(m As TModel)
  With m
    .Name = ""
    .MaterialFile = ""
    .Vertices = 0
    .Normals = 0
    .TexCoords = 0
    .Groups = 0
    .Materials = 0
    ReDim .Vertex(0 To 0)
    ReDim .Normal(0 To 0)
    ReDim .TexCoord(0 To 0)
    ReDim .Group(0 To 0)
    ReDim .Material(0 To 0)
  End With
  tmpVerticeNo = 0
  tmpNormalNo = 0
  tmpTexCoordNo = 0
  'InitMaterials
 End Sub

'------------------------------------------------------------------
'  Gets Information from an Alias Wavefront .OBJ file
'------------------------------------------------------------------
Private Function GetInfo(FileName As String, Path As String) As TModel
 Dim m As TModel
 Dim s As String, S2 As String
 Dim p As Integer
 Dim tmpName() As String
 Dim FilePath As String
 Dim tmpGroups As Double
  
  InitModel m

  tmpName = Split(FileName, "/")
  p = UBound(tmpName)
  FilePath = Left$(FileName, Len(FileName) - Len(tmpName(p)))
  m.Name = Mid$(FileName, Len(FileName) - Len(tmpName(p)) + 1, Len(tmpName(p)) + 1)
  
   If Dir$(FileName) <> "" Then
    Open FileName For Input As #1
     Do While Not EOF(1)
      Line Input #1, s
      's = UCase(s)
      If (s <> "") Then 'And (Left$(s, 1) <> "#") Then
       Select Case Asc(Left$(s, 1))
         'Case "#"
          'Do nothing
         Case 103 '"g"
          m.Groups = m.Groups + 1
          ReDim Preserve m.Group(m.Groups + 1)
          S2 = Mid$(s, 3, Len(s))
          m.Group(m.Groups).Name = S2
         Case 118 '86 '"V"
          Select Case Asc(Mid$(s, 2, 1))
           Case 32 '" "
            m.Vertices = m.Vertices + 1
           Case 110 '"N"
            m.Normals = m.Normals + 1
           Case 116 '"T"
            m.TexCoords = m.TexCoords + 1
          End Select
         Case 102 '"F"
            m.Group(m.Groups).Faces = m.Group(m.Groups).Faces + 1
         'Case 85 '"U"
          'Do Nothing
         'Case 77 '"M"
          'Do Nothing
        End Select
      End If
     Loop
    Close #1
  Else
    MsgBox "Cannot find the model : " & FileName, vbOKOnly, "Load Model"
    End
  End If
  GetInfo = m
  Path = FilePath
End Function

'------------------------------------------------------------------
'  Loads a Alias Wavefront .OBJ file
'------------------------------------------------------------------
Private Function LoadModel(FileName As String) As TModel
 Dim i As Integer
 Dim m As TModel
 Dim p As Integer, tmpGroupNo As Integer
 Dim tmpFaceNo As Integer
 Dim MatPath As String, s As String
   
  m = GetInfo(FileName, MatPath)
  ReDim m.Vertex(0 To m.Vertices + 1)
  ReDim m.Normal(0 To m.Normals + 1)
  ReDim m.TexCoord(0 To m.TexCoords + 1)
  For i = 0 To m.Groups
   ReDim m.Group(i).Face(0 To m.Group(i).Faces + 1)
  Next i

  Open FileName For Input As #1
  Do While Not EOF(1)
   Line Input #1, s
   's = UCase(s)
   If (s <> "") Then 'And (Left$(s, 1) <> "#") Then
    Select Case Asc(Left$(s, 1))
    Case 103 '"G"
     tmpGroupNo = tmpGroupNo + 1
     tmpFaceNo = 0
    Case 118 '"V"
     ReadVertexData s, m              ' Read Vertex Date (coord, normal, texture)
    Case 102 '"F"
     tmpFaceNo = tmpFaceNo + 1
     ReadFaceData s, m, tmpGroupNo, tmpFaceNo ' Read faces
    Case 117 '"U"
     GetMaterialName s, m, tmpGroupNo ' Get the material name
    Case 109 '"M"
     LoadMaterials s, m, MatPath      ' Get the material name
    End Select
   End If
  Loop
  Close #1
  LoadModel = m
End Function

'------------------------------------------------------------------
'  Reads Vertex coords, Normals and Texture coords from a String
'------------------------------------------------------------------
Private Sub ReadVertexData(s As String, m As TModel)

 Dim C As TCoord
 Dim T As TTexCoord
 
 Select Case Asc(Mid$(s, 2, 1))

  Case 32 '" "                  ' Read the vertex coords
    C = GetCoords(s)
    tmpVerticeNo = tmpVerticeNo + 1
    m.Vertex(tmpVerticeNo) = C
  Case 110 '"N"                 ' Read the vertex normals
    C = GetCoords(s)
    tmpNormalNo = tmpNormalNo + 1
    m.Normal(tmpNormalNo) = C
  Case 116 '"T"                      ' Read the vertex texture coords
    T = GetTexCoords(s)
    tmpTexCoordNo = tmpTexCoordNo + 1
    m.TexCoord(tmpTexCoordNo) = T
  End Select
End Sub

'------------------------------------------------------------------
'  Gets the X, Y, Z coordinates from a String
'------------------------------------------------------------------
 Private Function GetCoords(s As String) As TCoord
  Dim p As Integer
  Dim C As TCoord
  Dim Numbers() As String
  
  s = LTrim$(Right$(s, Len(s) - 2)) 'Trim$(Right$(s, Len(s) - 2))
  Numbers = Split(s, " ")
  
  C.x = Val(Numbers(0))
  C.y = Val(Numbers(1))
  C.Z = Val(Numbers(2))
  GetCoords = C
End Function

'-------------------------------------------------------------------
'  Returns the U, V texture coordinates of a texture from a String
'-------------------------------------------------------------------
Private Function GetTexCoords(s As String) As TTexCoord

  Dim T As TTexCoord
  Dim Numbers() As String

  s = LTrim$(Right$(s, Len(s) - 3))
  Numbers = Split(s, " ")

  T.U = Val(Numbers(0))
  T.v = Val(Numbers(1))
  GetTexCoords = T
End Function

'------------------------------------------------------------------
'  Reads the faces/triangles info for the model
'  Data is stored as "f f f" OR "f/t f/t /ft" OR "f/t/n .. f/t/n"
'------------------------------------------------------------------
Private Sub ReadFaceData(s As String, m As TModel, GroupNo As Integer, FaceNo As Integer)
 Dim F As TFace, p As Integer, P1 As Integer
 Dim Str1() As String, i As Integer
 Dim Numbers() As String
      
  s = LTrim$(Right$(s, Len(s) - 2))
  Str1 = Split(s, " ")               ' First divide the string
                                     ' into smaller strings
                                     ' in the form v or v//vt or v/vn/vt

  For i = 0 To UBound(Str1())        ' Check for "/"
  p = InStr(1, Str1(i), "/")
   If p = 0 Then                     ' Does not exist !!!
    F.count = F.count + 1
    F.vIndex(F.count - 1) = Val(Str1(i))
    
   ElseIf p <> 0 Then                ' Exists
    P1 = InStr(p + 1, Str1(i), "/")
    If P1 <> p + 1 Then              ' Check if "/" or "//"
     F.count = F.count + 1           ' Case "/"
     
     Numbers = Split(Str1(i), "/")
     F.vIndex(F.count - 1) = Val(Numbers(0))
     F.tIndex(F.count - 1) = Val(Numbers(1))
     F.nIndex(F.count - 1) = Val(Numbers(2))
    Else                             ' Case "//"
     F.count = F.count + 1
     Numbers = Split(Str1(i), "//")
     F.vIndex(F.count - 1) = Val(Numbers(0))
     F.nIndex(F.count - 1) = Val(Numbers(1))
    End If
   End If
  Next i
  m.Group(GroupNo).Face(FaceNo) = F
End Sub

'------------------------------------------------------------------
'  Get the name of the material for the group
'------------------------------------------------------------------
Private Sub GetMaterialName(s As String, m As TModel, GroupNo As Integer)
 Dim i As Integer, p As Integer
 If Mid$(s, 1, 6) <> "USEMTL" Then Exit Sub  'false call
  p = InStr(1, s, " ")
  s = Mid$(s, p + 1, Len(s))
  
  For i = 1 To m.Materials
    If m.Material(i).Name = s Then
      m.Group(GroupNo).mIndex = i
    End If
  Next i
End Sub

'------------------------------------------------------------------
'  Load the materials from the material file
'------------------------------------------------------------------
Private Sub LoadMaterials(s As String, m As TModel, Path As String)
 Dim p As Integer
 Dim FileName As String
 
  If Mid$(s, 1, 6) <> "MTLLIB" Then Exit Sub  ' false call
  
  p = InStr(1, s, " ")
  FileName = Path & Mid$(s, p + 1, Len(s))
   If Dir$(FileName) <> "" Then
    Open FileName For Input As #2
     Do While Not EOF(2)
      Line Input #2, s
       s = UCase(Trim$(s))
       If (s <> "") And (Mid$(s, 1, 1) <> "#") Then
        Select Case Left$(s, 1)
         Case "N":
          Select Case Mid$(s, 2, 1)
           Case "S": GetShininess s, m    ' Get specular highlight amount
           Case "E": CreateMaterial s, m  ' create new material
          End Select
         Case "K": GetMaterial s, m       ' Material properties
         Case "M": GetTexture s, m          ' Map material to texture
         Case Else
        End Select
       End If
     Loop
    Close #2
  Else
    MsgBox "Cannot find the material file : " & FileName, vbOKOnly, "Load Model Material"
    End
  End If
End Sub

'------------------------------------
'  Create a new material
'------------------------------------
Private Sub CreateMaterial(s As String, m As TModel)
  Dim p As Integer
  If Mid$(s, 1, 6) <> "NEWMTL" Then Exit Sub
  m.Materials = m.Materials + 1
  ReDim Preserve m.Material(m.Materials + 1)
  p = InStr(s, " ")
  s = Mid$(s, p + 1, Len(s) - p)
  m.Material(m.Materials).Ambient.b = 0
  m.Material(m.Materials).Ambient.G = 0
  m.Material(m.Materials).Ambient.R = 0
  m.Material(m.Materials).Diffuse.b = 0
  m.Material(m.Materials).Diffuse.G = 0
  m.Material(m.Materials).Diffuse.R = 0
  m.Material(m.Materials).Specular.b = 0
  m.Material(m.Materials).Specular.G = 0
  m.Material(m.Materials).Specular.R = 0
  m.Material(m.Materials).Shininess = 60
  m.Material(m.Materials).Texture = 0
  m.Material(m.Materials).Name = s
End Sub

'------------------------------------
'  Get Material Color values
'------------------------------------
Private Sub GetMaterial(s As String, m As TModel)
 Dim C As TColor
 Dim Info() As String
   
  Info = Split(s, " ")
  
  C.R = Val(Info(1)) '(Mid$(s, 1, p))
  C.G = Val(Info(2)) '(Mid$(s, p + 1, P2 - p - 1))
  C.b = Val(Info(3)) '(Mid$(s, P2 + 1, Len(s)))
  Select Case (Info(0))
   Case "KA"
    m.Material(m.Materials).Ambient = C
   Case "KD"
    m.Material(m.Materials).Diffuse = C
   Case "KS"
    m.Material(m.Materials).Specular = C
  End Select
 End Sub

'------------------------------------
'  Get material specular highlight
'------------------------------------
Private Sub GetShininess(s As String, m As TModel)
  s = Mid$(s, 4, Len(s))
  m.Material(m.Materials).Shininess = Val(s)
End Sub

'------------------------------------
'  Load texture for material
'------------------------------------
Private Sub GetTexture(s As String, m As TModel)
 ' texturename = get the name from "map_Kd textures/fabric1.rgb"
 ' LoadTexture( texturename, M.Material[M.Materials].Texture)
End Sub

Private Sub GetMinMax(m As TModel)

 Dim MinC As TCoord, MaxC As TCoord
 Dim i As Integer, Scale1 As Double
 
 MinC.x = 0: MinC.y = 0: MinC.Z = 0
 MaxC.x = 0: MaxC.y = 0: MaxC.Z = 0

 '' Find the min and max in each coordinate system
  With m
    For i = 1 To .Vertices
      If (.Vertex(i).x < MinC.x) Then
       MinC.x = .Vertex(i).x
      ElseIf .Vertex(i).x > MaxC.x Then
       MaxC.x = .Vertex(i).x
      End If
      If (.Vertex(i).y < MinC.y) Then
       MinC.y = .Vertex(i).y
      ElseIf .Vertex(i).y > MaxC.y Then
       MaxC.y = .Vertex(i).y
      End If
      If (.Vertex(i).Z < MinC.Z) Then
       MinC.Z = .Vertex(i).Z
      ElseIf .Vertex(i).Z > MaxC.Z Then
       MaxC.Z = .Vertex(i).Z
      End If
    Next i
  End With

  '' find the max distance between the min and max
  MaxC.x = (MaxC.x - MinC.x)
  MaxC.y = (MaxC.y - MinC.y)
  MaxC.Z = (MaxC.Z - MinC.Z)

  ' Let scale = Max distance
  If MaxC.x > MaxC.y Then
    Scale1 = MaxC.x
  Else
    Scale1 = MaxC.y
  End If
  If Scale1 > MaxC.Z Then
    Scale1 = MaxC.Z
  End If
End Sub

Public Sub modelScale(Scalefactor As Double)
Dim i As Integer
   With Model_Obj
    For i = 1 To .Vertices
        .Vertex(i).x = .Vertex(i).x * Scalefactor
        .Vertex(i).y = .Vertex(i).y * Scalefactor
        .Vertex(i).Z = .Vertex(i).Z * Scalefactor
    Next
   End With
End Sub

Public Function Unitize() As Double
 Dim CX As Double, cy As Double, cz As Double, w As Double, _
    h As Double, d As Double, Scalefactor As Double
 Dim MinC As TCoord, MaxC As TCoord
 Dim i As Integer
 
 MinC.x = 0: MinC.y = 0: MinC.Z = 0
 MaxC.x = 0: MaxC.y = 0: MaxC.Z = 0

 ' Find the min and max in each coordinate system
  With Model_Obj
    For i = 1 To .Vertices
      If (.Vertex(i).x < MinC.x) Then
       MinC.x = .Vertex(i).x
      ElseIf .Vertex(i).x > MaxC.x Then
       MaxC.x = .Vertex(i).x
      End If
      If (.Vertex(i).y < MinC.y) Then
       MinC.y = .Vertex(i).y
      ElseIf .Vertex(i).y > MaxC.y Then
       MaxC.y = .Vertex(i).y
      End If
      If (.Vertex(i).Z < MinC.Z) Then
       MinC.Z = .Vertex(i).Z
      ElseIf .Vertex(i).Z > MaxC.Z Then
       MaxC.Z = .Vertex(i).Z
      End If
    Next i
  End With
 
    ' calculate model width, height, and depth
    w = Abs(MaxC.x) + Abs(MaxC.x)
    h = Abs(MaxC.y) + Abs(MinC.y)
    d = Abs(MaxC.Z) + Abs(MinC.Z)

    ' calculate center of the model
    CX = (MaxC.x + MinC.x) / 2
    cy = (MaxC.y + MinC.y) / 2
    cz = (MaxC.Z + MinC.Z) / 2

    ' calculate unitizing scale factor
    Scalefactor = 4 / Max(Max(w, h), d)
    ' translate around center then scale
    
    With Model_Obj
    For i = 1 To .Vertices
        .Vertex(i).x = .Vertex(i).x - CX
        .Vertex(i).y = .Vertex(i).y - cy
        .Vertex(i).Z = .Vertex(i).Z - cz
        .Vertex(i).x = .Vertex(i).x * Scalefactor
        .Vertex(i).y = .Vertex(i).y * Scalefactor
        .Vertex(i).Z = .Vertex(i).Z * Scalefactor
    Next
    End With
    Unitize = Scalefactor
End Function

'------------------------------------------------------------------
'  Draws a Alias Wavefront .OBJ model
'------------------------------------------------------------------
Private Sub DrawModel(m As TModel)
    Dim m_Mat As glxMaterial
    Set m_Mat = gCtl.NewMaterial
    
    Dim i As Integer, j As Integer, k As Integer

    glPushMatrix
    For i = 0 To m.Groups
      With m_Mat
        .Face = faceFrontAndBack
        .SetAmbient m.Material(m.Group(i).mIndex).Ambient.R, _
                    m.Material(m.Group(i).mIndex).Ambient.G, _
                    m.Material(m.Group(i).mIndex).Ambient.b
        .SetDiffuse m.Material(m.Group(i).mIndex).Diffuse.R, _
                    m.Material(m.Group(i).mIndex).Diffuse.G, _
                    m.Material(m.Group(i).mIndex).Diffuse.b
        .SetSpecular m.Material(m.Group(i).mIndex).Specular.R, _
                     m.Material(m.Group(i).mIndex).Specular.G, _
                     m.Material(m.Group(i).mIndex).Specular.b
        .Shininess = m.Material(m.Group(i).mIndex).Shininess
      End With
      
      If m.Materials = 0 Then
       obj_has_Material = False
      ElseIf m.Materials <> 0 Then
        m_Mat.SetMaterial
        obj_has_Material = True
      End If
        
      glDisable glcTexture2D
      
      For j = 1 To m.Group(i).Faces
       With m.Group(i).Face(j)
       Select Case .count
        Case 3: glBegin (GL_TRIANGLES)
        Case 4: glBegin (GL_QUADS)
        Case Else
         glBegin (GL_POLYGON)
       End Select

       For k = 0 To .count - 1
        If m.Normals > 0 Then
          glNormal3f m.Normal(.nIndex(k)).x, m.Normal(.nIndex(k)).y, m.Normal(.nIndex(k)).Z
        End If
        If m.TexCoords > 0 Then
          glTexCoord2f m.TexCoord(.tIndex(k)).U, m.TexCoord(.tIndex(k)).v
        End If
          glVertex3f m.Vertex(.vIndex(k)).x, m.Vertex(.vIndex(k)).y, m.Vertex(.vIndex(k)).Z
       Next k
       glEnd
       End With
      Next j
    Next i
    glPopMatrix
End Sub

Public Sub Initialize_Obj(FileName As String)
 Model_Obj = LoadModel(FileName)
End Sub

Public Function Draw_Obj() As Long
 Dim ID As Long
 ID = glGenLists(1)
 glNewList ID, GL_COMPILE
  DrawModel Model_Obj
 glEndList
 Draw_Obj = ID
End Function

Public Property Get MaterialExists() As Boolean
 MaterialExists = obj_has_Material
End Property

Private Function Max(A, b)
 Max = IIf(A > b, A, b)
End Function

Private Function Min(A, b)
 Min = IIf(A < b, A, b)
End Function
