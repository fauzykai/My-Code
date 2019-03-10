Module mConstant
    'imports System


    Public gCtl As glxCtl
    Public cOGL As New cOpenGL

    'Use ocx wrappers for the materials
    Public MatWhite As 'glxMaterial
    Public MatBlack As glxMaterial
    Public MatRed As glxMaterial
    Public MatYellow As glxMaterial
    Public MatOrange As glxMaterial
    Public MatBrown As glxMaterial
    Public MatGreen As glxMaterial
    Public MatBlue As glxMaterial


    Public Sub Main()
        'Set fMainForm = New mnfrm
        Load(mnfrm)
        gCtl = mnfrm.glxCtl1
        CX = New cOpenGL
        gCtl.Init()
        InitMaterials()
        mnfrm.Show()
    End Sub

    Private Sub InitMaterials()
        MatWhite = gCtl.NewMaterial
        With MatWhite
            .Face = faceFront
            .SetAmbient(1, 1, 1)
            .SetDiffuse(1, 1, 1)
            .SetSpecular(1, 1, 1)
            .SpecExp = 60
            .Shininess = 300
        End With
        MatBlack = gCtl.NewMaterial
        With MatBlack
            .Face = faceFront
            .SetAmbient(0.1, 0.1, 0.1)
            .SetDiffuse(0.1, 0.1, 0.1)
            .SetSpecular(1, 1, 1)
            .SpecExp = 60
            .Shininess = 300
        End With
        MatRed = gCtl.NewMaterial
        With MatRed
            .Face = faceFront
            .SetAmbient(1, 0, 0)
            .SetDiffuse(1, 0, 0)
            .SetSpecular(1, 1, 1)
            .SpecExp = 30
            .Shininess = 300
        End With
        MatYellow = gCtl.NewMaterial
        With MatYellow
            .Face = faceFront
            .SetAmbient(1, 1, 0)
            .SetDiffuse(1, 1, 0)
            .SetSpecular(1, 1, 1)
            .SpecExp = 100
            .Shininess = 300
        End With
        MatOrange = gCtl.NewMaterial
        With MatOrange
            .Face = faceFront
            .SetAmbient(0.6, 0, 0)
            .SetDiffuse(1, 0.501961, 0.25098)
            .SetSpecular(1, 0.501961, 0.25098)
            .SpecExp = 10
            .Shininess = 300
        End With
        MatBrown = gCtl.NewMaterial
        With MatBrown
            .Face = faceFront
            .SetAmbient(0, 0, 0)
            .SetDiffuse(0.3, 0, 0)
            .SetSpecular(0.5, 0.5, 0.5)
            .SpecExp = 10
            .Shininess = 300
        End With
        MatGreen = gCtl.NewMaterial
        With MatGreen
            .Face = faceFront
            .SetAmbient(0.243, 0.874, 0.143)
            .SetDiffuse(0.243, 0.874, 0.143)
            .SetSpecular(0.1, 0.1, 0.1)
            .SpecExp = 10
            .Shininess = 300
        End With
        MatBlue = gCtl.NewMaterial
        With MatBlue
            .Face = faceFront
            .SetAmbient(0.123, 0.32, 0.798)
            .SetDiffuse(0.123, 0.32, 0.798)
            .SetSpecular(0.1, 0.1, 0.1)
            .SpecExp = 10
            .Shininess = 300
        End With
    End Sub


End Module
