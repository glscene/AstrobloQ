object frmDuneFighter: TfrmDuneFighter
  Left = 233
  Top = 191
  Caption = 'frmDuneFighter'
  ClientHeight = 427
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 41
    Width = 746
    Height = 386
    Camera = camThirdPerson
    Buffer.FogEnvironment.FogColor.Color = {C6BF3F3FDCD8583FDCD8583F0000803F}
    Buffer.FogEnvironment.FogStart = 50.000000000000000000
    Buffer.FogEnvironment.FogEnd = 100.000000000000000000
    Buffer.BackgroundColor = clSkyBlue
    Buffer.FogEnable = True
    FieldOfView = 125.219512939453100000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitWidth = 738
    object Label3: TLabel
      Left = 8
      Top = 22
      Width = 107
      Height = 13
      Caption = 'F7 - '#1086#1090' '#1090#1088#1077#1090#1100#1077#1075#1086' '#1083#1080#1094#1072
    end
    object Label4: TLabel
      Left = 160
      Top = 22
      Width = 124
      Height = 13
      Caption = 'F8 - '#1086#1090' '#1087#1077#1088#1074#1086#1075#1086' '#1083#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 334
      Height = 13
      Caption = #1048#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1082#1083#1072#1074#1080#1096#1080' '#1085#1072#1074#1080#1075#1072#1094#1080#1080' '#1080' '#1089#1084#1077#1097#1077#1085#1080#1077' - CTRL, '#1073#1077#1075' - SHIFT'
    end
  end
  object GLScene1: TGLScene
    ObjectsSorting = osNone
    Left = 88
    Top = 56
    object GLLightSource2: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {00000000000020C1000000000000803F}
      LightStyle = lsParallel
      SpotCutOff = 180.000000000000000000
      SpotDirection.Coordinates = {00000000000080BF0000000000000000}
    end
    object dcTerrain: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLTerrainRenderer1: TGLTerrainRenderer
        Material.FrontProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.FrontProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.MaterialLibrary = GLMaterialLibrary1
        Direction.Coordinates = {000000000000803F0000000000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        TilesPerTexture = 1.000000000000000000
        MaterialLibrary = GLMaterialLibrary1
        QualityDistance = 30.000000000000000000
        ContourWidth = 0
      end
      object dcMushroom: TGLDummyCube
        CubeSize = 1.000000000000000000
        object ffMushroom: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {0AD7633FD7A3F03ECDCC4C3E0000803F}
          Direction.Coordinates = {000000000000803F0000000000000000}
          Position.Coordinates = {0000803F0000803F000000000000803F}
          Scale.Coordinates = {0AD7A33CCDCCCC3C4260E53C00000000}
          Up.Coordinates = {00000000000000000000803F00000000}
          NormalsOrientation = mnoInvert
        end
      end
      object DummyCube2: TGLDummyCube
        Position.Coordinates = {000000000000803F000000000000803F}
        CubeSize = 0.100000001490116100
        object camFirstPerson: TGLCamera
          DepthOfView = 200.000000000000000000
          FocalLength = 100.000000000000000000
          Position.Coordinates = {000000000000003F000000000000803F}
          Direction.Coordinates = {00000080000000000000803F00000000}
          Left = 320
          Top = 192
        end
        object Actor1: TGLActor
          Material.FrontProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
          Material.Texture.MinFilter = miLinear
          Material.Texture.Disabled = False
          Direction.Coordinates = {000000800000803F0000000000000000}
          Up.Coordinates = {0000803F000000000000000000000000}
          Visible = False
          Interval = 100
          object Actor2: TGLActor
            Material.Texture.MinFilter = miLinear
            Material.Texture.Disabled = False
            Interval = 100
          end
        end
        object dcCamera3rd: TGLDummyCube
          CubeSize = 1.000000000000000000
          object camThirdPerson: TGLCamera
            DepthOfView = 200.000000000000000000
            FocalLength = 100.000000000000000000
            TargetObject = DummyCube2
            Position.Coordinates = {0000000000000040000020C10000803F}
            Direction.Coordinates = {00000000000000800000803F00000000}
          end
        end
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    Enabled = False
    SleepLength = 0
    OnProgress = GLCadencer1Progress
    Left = 176
    Top = 56
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 176
    Top = 112
  end
  object GLNavigator1: TGLNavigator
    VirtualUp.Coordinates = {000000000000803F000000000000803F}
    MovingObject = DummyCube2
    UseVirtualUp = True
    Left = 88
    Top = 112
  end
  object GLUserInterface1: TGLUserInterface
    MouseSpeed = 20.000000000000000000
    GLNavigator = GLNavigator1
    Left = 264
    Top = 56
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 360
    Top = 56
  end
end
