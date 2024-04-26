object FormLitosfera: TFormLitosfera
  Left = 412
  Top = 123
  Cursor = crHelp
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Litosfera'
  ClientHeight = 803
  ClientWidth = 1524
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 168
  TextHeight = 24
  object SceneViewer: TGLSceneViewer
    Left = 249
    Top = 51
    Width = 1275
    Height = 718
    Cursor = crCross
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = Camera
    BeforeRender = SceneViewerBeforeRender
    Buffer.BackgroundColor = clBlack
    FieldOfView = 149.004043579101600000
    PenAsTouch = False
    Align = alClient
    OnDblClick = SceneViewerDblClick
    OnMouseDown = SceneViewerMouseDown
    OnMouseMove = SceneViewerMouseMove
    TabOrder = 0
    ExplicitWidth = 1046
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 51
    Width = 249
    Height = 718
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    TabOrder = 1
    object tvPlanets: TTreeView
      Left = 1
      Top = 1
      Width = 247
      Height = 716
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      AutoExpand = True
      HideSelection = False
      Images = dfImages.ImgVirtPlanets
      Indent = 33
      TabOrder = 0
      OnClick = tvPlanetsClick
      Items.NodeData = {
        071900000009540054007200650065004E006F00640065002500000000000000
        00000000FFFFFFFFFFFFFFFF000000000000000000000000000103530075006E
        0000002D0000000100000001000000FFFFFFFFFFFFFFFF000000000000000000
        0000000001074D00650072006300750072007900000029000000020000000200
        0000FFFFFFFFFFFFFFFF000000000000000000000000000105560065006E0075
        0073000000290000000300000003000000FFFFFFFFFFFFFFFF00000000000000
        0000010000000105450061007200740068000000270000000A0000000A000000
        FFFFFFFFFFFFFFFF0000000000000000000000000001044D006F006F006E0000
        00270000000400000004000000FFFFFFFFFFFFFFFF0000000000000000000200
        000001044D0061007200730000002B0000000A0000000A00000001000000FFFF
        FFFF000000000000000000000000000106500068006F0062006F00730000002B
        0000000A0000000A00000001000000FFFFFFFF00000000000000000000000000
        01064400650069006D006F00730000002D0000000500000005000000FFFFFFFF
        FFFFFFFF0000000000000000000500000001074A007500700069007400650072
        000000230000000A0000000A000000FFFFFFFFFFFFFFFF000000000000000000
        00000000010249006F0000002B0000000A0000000A000000FFFFFFFFFFFFFFFF
        0000000000000000000000000001064500750072006F007000610000002F0000
        000A0000000A000000FFFFFFFFFFFFFFFF000000000000000000000000000108
        470061006E0079006D0065006400650000002F0000000A0000000A000000FFFF
        FFFFFFFFFFFF000000000000000000000000000108430061006C006C00690073
        0074006F0000002F0000000A0000000A00000001000000FFFFFFFF0000000000
        0000000000000000010841006D0061006C00740068006500610000002B000000
        0600000006000000FFFFFFFFFFFFFFFF0000000000000000000C000000010653
        0061007400750072006E000000310000000A0000000A000000FFFFFFFFFFFFFF
        FF00000000000000000000000000010945006E00630065006C00610064007500
        73000000290000000A0000000A000000FFFFFFFFFFFFFFFF0000000000000000
        0000000000010554006900740061006E000000290000000A0000000A000000FF
        FFFFFFFFFFFFFF0000000000000000000000000001054D0069006D0061007300
        00002B0000000A0000000A000000FFFFFFFFFFFFFFFF00000000000000000000
        00000001065400650074006800790073000000290000000A0000000A000000FF
        FFFFFFFFFFFFFF000000000000000000000000000105440069006F006E006500
        0000270000000A0000000A000000FFFFFFFFFFFFFFFF00000000000000000000
        0000000104520068006500610000002D0000000A0000000A000000FFFFFFFFFF
        FFFFFF0000000000000000000000000001074900610070006500740075007300
        0000290000000A0000000A00000001000000FFFFFFFF00000000000000000000
        00000001054A0061006E007500730000002F0000000A0000000A000000010000
        00FFFFFFFF000000000000000000000000000108480079007000650072006900
        6F006E000000330000000A0000000A00000001000000FFFFFFFF000000000000
        00000000000000010A500072006F006D0065007400680065007500730000002B
        0000000A0000000A00000001000000FFFFFFFF00000000000000000000000000
        0106500068006F0065006200650000002D0000000A0000000A00000001000000
        FFFFFFFF000000000000000000000000000107500061006E0064006F00720061
        0000002B0000000700000007000000FFFFFFFFFFFFFFFF000000000000000000
        0500000001065500720061006E007500730000002D0000000A0000000A000000
        FFFFFFFFFFFFFFFF0000000000000000000000000001074D006900720061006E
        00640061000000290000000A0000000A000000FFFFFFFFFFFFFFFF0000000000
        0000000000000000010541007200690065006C0000002D0000000A0000000A00
        0000FFFFFFFFFFFFFFFF00000000000000000000000000010755006D00620072
        00690065006C0000002D0000000A0000000A000000FFFFFFFFFFFFFFFF000000
        00000000000000000000010754006900740061006E006900610000002B000000
        0A0000000A000000FFFFFFFFFFFFFFFF0000000000000000000000000001064F
        006200650072006F006E0000002D0000000800000008000000FFFFFFFFFFFFFF
        FF0000000000000000000400000001074E0065007000740075006E0065000000
        2D0000000A0000000A00000001000000FFFFFFFF000000000000000000000000
        0001074C0061007200690073007300610000002B0000000A0000000A000000FF
        FFFFFFFFFFFFFF0000000000000000000000000001064E006500720065006900
        640000002B0000000A0000000A000000FFFFFFFFFFFFFFFF0000000000000000
        0000000000010654007200690074006F006E0000002D0000000A0000000A0000
        0001000000FFFFFFFF000000000000000000000000000107500072006F007400
        6500750073000000290000000900000009000000FFFFFFFFFFFFFFFF00000000
        000000000001000000010550006C00750074006F0000002B0000000A0000000A
        000000FFFFFFFFFFFFFFFF000000000000000000000000000106430068006100
        72006F006E000000290000000B0000000B000000FFFFFFFFFFFFFFFF00000000
        0000000000000000000105430065007200650073000000450000000B0000000B
        000000FFFFFFFFFFFFFFFF000000000000000000000000000113450072006900
        73005F002800640077006100720066005F0070006C0061006E00650074002900
        00002B0000000B0000000B000000FFFFFFFFFFFFFFFF00000000000000000000
        00000001064800610075006D00650061000000290000000B0000000B00000001
        000000FFFFFFFF00000000000000000000000000010556006500730074006100
        00002D0000000B0000000B00000001000000FFFFFFFF00000000000000000000
        00000001073200340033005F0049006400610000002F0000000B0000000B0000
        0001000000FFFFFFFF0000000000000000000000000001083400330033005F00
        450072006F0073000000330000000B0000000B00000001000000FFFFFFFF0000
        0000000000000000000000010A3900350031005F004700610073007000720061
        0000003D0000000B0000000B00000001000000FFFFFFFF000000000000000000
        00000000010F31003600320030005F00470065006F0067007200610070006800
        6F00730000003D0000000B0000000B00000001000000FFFFFFFF000000000000
        00000000000000010F31003800310030005F004500700069006D006500740068
        006500750073000000310000000B0000000B00000001000000FFFFFFFF000000
        00000000000000000000010931003900390038005F004B005900320036000000
        370000000B0000000B00000001000000FFFFFFFF000000000000000000000000
        00010C32003000360033005F0042006100630063006800750073000000390000
        000B0000000B00000001000000FFFFFFFF00000000000000000000000000010D
        34003100370039005F0054006F00750074006100740069007300000039000000
        0B0000000B00000001000000FFFFFFFF00000000000000000000000000010D34
        003700360039005F00430061007300740061006C00690061000000370000000B
        0000000B00000001000000FFFFFFFF00000000000000000000000000010C3600
        3400380039005F0047006F006C00650076006B0061000000350000000B000000
        0B000000FFFFFFFFFFFFFFFF00000000000000000000000000010B3900300033
        00370037005F005300650064006E006100}
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 769
    Width = 1524
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <
      item
        Text = 'FPS: '
        Width = 151
      end
      item
        Text = 'X:'
        Width = 151
      end
      item
        Text = 'Y:'
        Width = 151
      end
      item
        Text = 'Z:'
        Width = 151
      end>
  end
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 1524
    Height = 51
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    RowSize = 46
    TabOrder = 3
    object ToolBar1: TToolBar
      Left = 24
      Top = 2
      Width = 272
      Height = 88
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ButtonHeight = 39
      ButtonWidth = 40
      Caption = 'ToolBar'
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
      end
      object ToolButton2: TToolButton
        Left = 40
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 1
      end
      object ToolButton3: TToolButton
        Left = 80
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 2
      end
    end
  end
  object Scene: TGLScene
    ObjectsSorting = osNone
    Left = 306
    Top = 67
    object StarSkyDome: TGLSkyDome
      Bands = <
        item
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 15.000000000000000000
        end
        item
          StartAngle = 15.000000000000000000
          StopAngle = 90.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          Stacks = 4
        end>
      Stars = <
        item
          Color = clBlack
        end>
      object ConstLines: TGLLines
        Direction.Coordinates = {0000803F000000000000008000000000}
        Scale.Coordinates = {00A00C4600A00C4600A00C4600000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        Visible = False
        AntiAliased = True
        LineColor.Color = {E3A51B3FE3A51B3F0000803F00000000}
        LineWidth = 2.000000000000000000
        Nodes = <>
        NodesAspect = lnaInvisible
        SplineMode = lsmSegments
        Options = []
      end
      object ConstBounds: TGLLines
        Direction.Coordinates = {000000000000803F0000000000000000}
        Up.Coordinates = {0000000000000000000080BF00000000}
        AntiAliased = True
        LineColor.Color = {0000803F00000000000000000000803F}
        LineWidth = 2.000000000000000000
        Nodes = <>
        NodesAspect = lnaInvisible
        Options = []
      end
    end
    object PlanetSkyDome: TGLEarthSkyDome
      Visible = False
      Bands = <>
      Stars = <>
      SunElevation = 75.000000000000000000
      Turbidity = 15.000000000000000000
      ExtendedOptions = []
      Slices = 48
      Stacks = 24
    end
    object dcStar: TGLDummyCube
      ObjectsSorting = osNone
      CubeSize = 1000.000000000000000000
      object LightStar: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        Position.Coordinates = {00D0044600D00446000000000000803F}
        Specular.Color = {0000803F0000803F0000803F0000803F}
        SpotCutOff = 180.000000000000000000
        object LensStar: TGLLensFlare
          Seed = 1465
          FlareIsNotOccluded = True
        end
      end
      object CameraControler: TGLCamera
        DepthOfView = 10000.000000000000000000
        FocalLength = 50.000000000000000000
        TargetObject = dcStar
        Position.Coordinates = {0000803F000000000000803F0000803F}
        Direction.Coordinates = {0000803F000000000000008000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
      end
      object Camera: TGLCamera
        DepthOfView = 200000.000000000000000000
        FocalLength = 99.545860290527340000
        NearPlaneBias = 0.100000001490116100
        TargetObject = dcStar
        CameraStyle = csInfinitePerspective
        Position.Coordinates = {0000803F000000000000803F0000803F}
        Direction.Coordinates = {0000803F000000000000008000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
      end
      object dcMoon: TGLDummyCube
        Up.Coordinates = {FC9D7FB10000803F0000000000000000}
        CubeSize = 1.000000000000000000
        object Moon: TGLSphere
          Material.MaterialLibrary = MatLib
          Material.LibMaterialName = 'moon'
          Direction.Coordinates = {D947AABE616D713F0000000000000000}
          Position.Coordinates = {CDCCECC100000000000000000000803F}
          Scale.Coordinates = {713D8A3E713D8A3E713D8A3E00000000}
          TurnAngle = -170.000000000000000000
          Up.Coordinates = {00000000000000000000803F00000000}
          Radius = 0.500000000000000000
          Slices = 32
          Stacks = 32
        end
      end
      object ffPlanet: TGLFreeForm
        Material.MaterialLibrary = MatLib
        Direction.Coordinates = {00000000000080BF0000000000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        Visible = False
        MaterialLibrary = MatLib
      end
      object sfPlanet: TGLSphere
        Material.LibMaterialName = 'earthDay'
        Direction.Coordinates = {000000000000803F0000000000000000}
        TurnAngle = -150.000000000000000000
        Up.Coordinates = {00000000000000800000803F00000000}
        Radius = 0.500000000000000000
        Slices = 64
        Stacks = 64
        object diskRingDn: TGLDisk
          Material.Texture.Disabled = False
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          InnerRadius = 0.600000023841857900
          OuterRadius = 0.899999976158142100
          Slices = 64
          SweepAngle = 360.000000000000000000
        end
        object diskRingUp: TGLDisk
          Material.Texture.Disabled = False
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          NormalDirection = ndInside
          InnerRadius = 0.600000023841857900
          OuterRadius = 0.899999976158142100
          Slices = 64
          SweepAngle = 360.000000000000000000
        end
        object diskMantle: TGLDisk
          Material.Texture.Disabled = False
          Direction.Coordinates = {0000803F2EBD3BB3583DAF2600000000}
          PitchAngle = 90.000000000000000000
          Position.Coordinates = {0AD723BC00000000000000000000803F}
          TurnAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          NormalDirection = ndInside
          InnerRadius = 0.200000002980232200
          OuterRadius = 0.499000012874603300
          Slices = 64
          SweepAngle = 360.000000000000000000
        end
        object sfCore: TGLSphere
          Material.FrontProperties.Ambient.Color = {0000803F00000000000000000000803F}
          Material.FrontProperties.Diffuse.Color = {0000803F00000000000000000000803F}
          Radius = 0.200000002980232200
          Slices = 64
        end
        object Atmosphere: TGLAtmosphere
          Sun = LightStar
          Visible = False
        end
      end
      object DirectOpenGL: TGLDirectOpenGL
        Visible = False
        UseBuildList = False
        OnRender = DirectOpenGLRender
        Blend = False
      end
    end
  end
  object Cadencer: TGLCadencer
    Scene = Scene
    MaxDeltaTime = 0.050000000000000000
    OnProgress = CadencerProgress
    Left = 310
    Top = 169
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 509
    Top = 140
  end
  object MatLib: TGLMaterialLibrary
    Materials = <
      item
        Name = 'earthDay'
        Tag = 0
        Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.Texture.TextureMode = tmModulate
        Material.Texture.TextureFormat = tfLuminance
        Material.Texture.FilteringQuality = tfAnisotropic
        Material.Texture.Disabled = False
      end>
    Left = 744
    Top = 69
  end
  object TexCombiner: TGLTexCombineShader
    Combiners.Strings = (
      'Tex0:=Tex0;'
      'Tex1:=InterPolate(Tex0, Tex1, PrimaryColor);'
      '')
    DesignTimeEnabled = False
    Left = 1152
    Top = 200
  end
  object MainMenu: TMainMenu
    Left = 501
    Top = 56
    object Open1: TMenuItem
      Caption = #1060#1072#1081#1083
      object miFileOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1101#1082#1079#1086#1087#1083#1072#1085#1077#1090#1099'...'
        OnClick = miFileOpenClick
      end
      object miFileSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        OnClick = miFileSaveAsClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miFileExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miFileExitClick
      end
    end
    object miView: TMenuItem
      Caption = '&'#1042#1080#1076
      object miViewConstlines: TMenuItem
        Caption = #1051#1080#1085#1080#1080' '#1089#1086#1079#1074#1077#1079#1076#1080#1081
        OnClick = miViewConstlinesClick
      end
      object miViewConstborders: TMenuItem
        Caption = #1043#1088#1072#1085#1080#1094#1099' '#1089#1086#1079#1074#1077#1079#1076#1080#1081
        OnClick = miViewConstbordersClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object miViewHidePanels: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1080
        OnClick = miViewHidePanelsClick
      end
      object miShowHidePlanet: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1100' '#1087#1083#1072#1085#1077#1090#1091
        OnClick = miShowHidePlanetClick
      end
      object miClearTreeView: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
        Enabled = False
        OnClick = miClearTreeViewClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miInnerCore: TMenuItem
        Caption = #1071#1076#1088#1086' '
        OnClick = miInnerCoreClick
      end
      object miPlanetSkyDome: TMenuItem
        Caption = #1053#1077#1073#1086#1089#1074#1086#1076
        OnClick = miPlanetSkyDomeClick
      end
      object NightLights1: TMenuItem
        Caption = 'Night Lights'
      end
    end
    object miMonitor: TMenuItem
      Caption = '&'#1052#1086#1085#1080#1090#1086#1088
      object miSolarSystem: TMenuItem
        Caption = #1057#1086#1083#1085#1077#1095#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072'...'
        OnClick = miSolarSystemClick
      end
      object miStarSystem: TMenuItem
        Caption = #1047#1074#1105#1079#1076#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072'...'
        OnClick = miStarSystemClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miExosystemCreator: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1083#1072#1085#1077#1090#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099'...'
        OnClick = miExosystemCreatorClick
      end
    end
    object miOptions: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      object miSettings: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
        OnClick = miSettingsClick
      end
    end
    object Help1: TMenuItem
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      object miHelpWiki: TMenuItem
        Caption = #1056#1091#1074#1080#1082#1080'...'
        Hint = 'Information'
        ShortCut = 112
        OnClick = miHelpWikiClick
      end
      object miGoogleEarth: TMenuItem
        Caption = 'Google Earth...'
        OnClick = miGoogleEarthClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = About1Click
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 524
    Top = 297
  end
  object SaveDialog: TSaveDialog
    Left = 313
    Top = 299
  end
  object MainMenu1: TMainMenu
    Left = 812
    Top = 205
  end
end
