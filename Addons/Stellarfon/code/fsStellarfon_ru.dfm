object frmStellarfon: TfrmStellarfon
  Left = 0
  Top = 0
  Caption = 'Stellarfon'
  ClientHeight = 567
  ClientWidth = 1104
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  TextHeight = 15
  object GLSceneViewer1: TGLSceneViewer
    Left = 201
    Top = 0
    Width = 728
    Height = 552
    Camera = Camera1
    Buffer.BackgroundColor = clBlack
    Buffer.AntiAliasing = csa8xHQ
    FieldOfView = 147.671005249023400000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    OnMouseUp = GLSceneViewer1MouseUp
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 552
    Width = 1104
    Height = 15
    Panels = <
      item
        Text = 'FPS'
        Width = 100
      end
      item
        Text = 'X: '
        Width = 100
      end
      item
        Text = 'Y:'
        Width = 100
      end
      item
        Text = 'Z:'
        Width = 100
      end>
    ExplicitTop = 527
    ExplicitWidth = 1096
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 552
    Align = alLeft
    Caption = ' '
    TabOrder = 2
    Visible = False
    ExplicitHeight = 527
  end
  object PanelRight: TPanel
    Left = 929
    Top = 0
    Width = 175
    Height = 552
    Align = alRight
    Caption = ' '
    TabOrder = 3
    Visible = False
    ExplicitLeft = 921
    ExplicitHeight = 527
    object tvComposition: TTreeView
      Left = 1
      Top = 1
      Width = 173
      Height = 216
      Indent = 19
      TabOrder = 0
      Items.NodeData = {
        070100000009540054007200650065004E006F00640065003500000000000000
        00000000FFFFFFFFFFFFFFFF00000000000000000003000000010B43006F006D
        0070006F0073006900740069006F006E0000002B0000000000000000000000FF
        FFFFFFFFFFFFFF0000000000000000000300000001064D0065006C006F006400
        790000003D0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        0000000000010F3300610032002C003200630031002C003100650030002C0032
        00630031000000370000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000000000000010C3200640033002C002C003200630031002C0032006200
        30000000330000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        0000000000010A3100650030002C002C003200640033002C002C0000002B0000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000040000000106
        430068006F007200640073000000230000000000000000000000FFFFFFFFFFFF
        FFFF00000000000000000000000000010241006D000000230000000000000000
        000000FFFFFFFFFFFFFFFF00000000000000000000000000010244006D000000
        230000000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000
        000102450037000000230000000000000000000000FFFFFFFFFFFFFFFF000000
        00000000000000000000010241006D0000001F0000000000000000000000FFFF
        FFFFFFFFFFFF000000000000000000000000000100}
    end
    object rgColorScale: TRadioGroup
      Left = 6
      Top = 248
      Width = 163
      Height = 226
      Caption = #1064#1082#1072#1083#1072' '#1094#1074#1077#1090#1072
      ItemIndex = 0
      Items.Strings = (
        #1063#1105#1088#1085#1086'-'#1073#1077#1083#1072#1103
        #1053#1100#1102#1090#1086#1085
        #1057#1082#1088#1103#1073#1080#1085
        #1057#1086#1085#1086#1093#1088#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103
        #1057#1083#1091#1095#1072#1081#1085#1099#1081' '#1094#1074#1077#1090
        'AI-'#1072#1089#1089#1080#1089#1090#1077#1085#1090)
      TabOrder = 1
      OnClick = rgColorScaleClick
    end
    object chbEnsemble: TCheckBox
      Left = 16
      Top = 504
      Width = 145
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1072#1085#1089#1072#1084#1072#1073#1083#1100
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = chbEnsembleClick
    end
  end
  object MainMenu: TMainMenu
    Left = 39
    Top = 381
    object miFile: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object miNew: TMenuItem
        Caption = #1053#1086#1074#1099#1081
        ImageIndex = 0
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object miOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        ImageIndex = 2
      end
      object miSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ImageIndex = 6
      end
      object miSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        ImageIndex = 132
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N11: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090'...'
      end
      object N10: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090'...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ImageIndex = 14
        ShortCut = 16411
        OnClick = miExitClick
      end
    end
    object miEdit: TMenuItem
      Caption = '&'#1055#1088#1072#1074#1082#1072
      object Undo1: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Caption = 'Cut'
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = 'Copy'
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = 'Insert'
        ShortCut = 16470
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object GoTo1: TMenuItem
        Caption = 'Go to...'
      end
      object N3: TMenuItem
        Caption = '-'
      end
    end
    object miView: TMenuItem
      Caption = '&'#1042#1080#1076
      object miColorFigures: TMenuItem
        Caption = #1056#1072#1079#1085#1086#1094#1074#1077#1090#1085#1099#1077' '#1092#1080#1075#1091#1088#1099'...'
        OnClick = miColorFiguresClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Hide1: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1100
      end
      object Show1: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100'...'
      end
    end
    object miInstruments: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      object miSettings: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
        OnClick = miSettingsClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object miMidikeys: TMenuItem
        Caption = #1052#1080#1076#1080'-'#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099'...'
        OnClick = miMidikeysClick
      end
      object miSequencer: TMenuItem
        Caption = #1057#1077#1082#1074#1077#1085#1089#1086#1088'...'
        OnClick = miSequencerClick
      end
      object miMediaPlayer: TMenuItem
        Caption = #1052#1077#1076#1080#1072#1087#1083#1077#1077#1088'...'
        OnClick = miMediaPlayerClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object miCalculate: TMenuItem
        Caption = #1055#1086#1076#1089#1095#1105#1090
      end
    end
    object miHelp: TMenuItem
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      object miContents: TMenuItem
        Caption = 'Ruwiki'
        ShortCut = 112
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = miAboutClick
      end
    end
  end
  object GLScene: TGLScene
    Left = 25
    Top = 18
    object GLSkyBox: TGLSkyBox
      MaterialLibrary = GLMatLibCubeMap
      MatNameTop = 'Top'
      MatNameBottom = 'Bottom'
      MatNameLeft = 'Left'
      MatNameRight = 'Right'
      MatNameFront = 'Front'
      MatNameBack = 'Back'
      MatNameClouds = 'Clouds'
      CloudsPlaneOffset = 0.200000002980232200
      CloudsPlaneSize = 32.000000000000000000
    end
    object GLSkyDome: TGLSkyDome
      Direction.Coordinates = {000000000000803F0000000000000000}
      Up.Coordinates = {0000000000000000FFFF7FBF00000000}
      Visible = False
      Bands = <
        item
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 15.000000000000000000
        end
        item
          StartAngle = 15.000000000000000000
          StopAngle = 90.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          Slices = 32
          Stacks = 10
        end>
      Stars = <
        item
          Color = clBlack
        end>
      object GLPolygon1: TGLPolygon
        Nodes = <>
      end
      object GLLines1: TGLLines
        Nodes = <>
        Options = []
      end
      object GLPoints1: TGLPoints
        NoZWrite = False
        Static = False
      end
    end
    object dcCamera: TGLDummyCube
      CubeSize = 1.000000000000000000
      object Cameracontroller: TGLCamera
        DepthOfView = 100.000000000000000000
        FocalLength = 50.000000000000000000
        TargetObject = dcScene
        Position.Coordinates = {000000400000003F0000803F0000803F}
        Direction.Coordinates = {0000803F000000000000008000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
      end
      object Camera: TGLCamera
        DepthOfView = 16000.000000000000000000
        FocalLength = 80.000000000000000000
        NearPlaneBias = 0.100000001490116100
        TargetObject = dcScene
        CameraStyle = csInfinitePerspective
        Position.Coordinates = {000000400000003F0000803F0000803F}
        Direction.Coordinates = {0000803F000000000000008000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
      end
      object Camera1: TGLCamera
        DepthOfView = 20000.000000000000000000
        FocalLength = 80.000000000000000000
        TargetObject = dcScene
        Position.Coordinates = {0000000000002041000048C20000803F}
        Direction.Coordinates = {00000000000000000000803F00000000}
        object LightSource1: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          SpotCutOff = 180.000000000000000000
        end
      end
    end
    object HUDTextGuitar: TGLHUDText
      Position.Coordinates = {0000C84200009643000048420000803F}
      Visible = False
      BitmapFont = GLBitmapFont
      Text = 'Guitar ColorFretboard'
      Rotation = 0.000000000000000000
    end
    object HUDTextPiano: TGLHUDText
      Position.Coordinates = {000000000000A0410000A0410000803F}
      Visible = False
      BitmapFont = GLBitmapFont
      Text = 'Piano ColorKeyboard'
      Rotation = 0.000000000000000000
    end
    object LightSource2: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {000000000000A0C10000F0410000803F}
      SpotCutOff = 180.000000000000000000
    end
    object dcPianoKeys: TGLDummyCube
      CubeSize = 100.000000000000000000
      VisibleAtRunTime = True
      object cbPianoStand: TGLCube
        Material.FrontProperties.Diffuse.Color = {EC51B83E0000803ECDCC4C3E0000803F}
        Position.Coordinates = {00000000000000C0000000000000803F}
        CubeSize = {000050420000004000004041}
      end
      object grdPianoKeysH: TGLXYZGrid
        Position.Coordinates = {0000D0C15C8F023F0000C0400000803F}
        XSamplingScale.Max = 52.000000000000000000
        XSamplingScale.Step = 1.000000000000000000
        YSamplingScale.Min = -5.000000000000000000
        YSamplingScale.Max = 5.000000000000000000
        YSamplingScale.Step = 5.000000000000000000
        ZSamplingScale.Min = -11.899999618530270000
        ZSamplingScale.Step = 12.000000000000000000
        Parts = [gpX, gpZ]
        LinesStyle = glsLine
      end
      object grdPianoKeysV: TGLXYZGrid
        Position.Coordinates = {0000D0C1000000BFEC51C0C00000803F}
        XSamplingScale.Max = 52.000000000000000000
        XSamplingScale.Step = 1.000000000000000000
        YSamplingScale.Max = 1.000000000000000000
        YSamplingScale.Step = 1.000000000000000000
        ZSamplingScale.Min = -12.000000000000000000
        ZSamplingScale.Step = 12.000000000000000000
        LinesStyle = glsLine
      end
    end
    object dcGuitarKeys: TGLDummyCube
      CubeSize = 100.000000000000000000
      VisibleAtRunTime = True
      object cbGuitarStand: TGLCube
        Material.FrontProperties.Diffuse.Color = {EC51B83E0000803ECDCC4C3E0000803F}
        Direction.Coordinates = {00000000000080BF0000000000000000}
        Position.Coordinates = {000000000000E0400000E0400000803F}
        Up.Coordinates = {00000000000000000000803F00000000}
        CubeSize = {00005042000000400000A041}
      end
      object grdGuitarKeys: TGLXYZGrid
        Position.Coordinates = {0000C8C10000B04014AE8F400000803F}
        LineColor.Color = {0000000000000000000000000000803F}
        XSamplingScale.Max = 50.000000000000000000
        XSamplingScale.Step = 2.000000000000000000
        YSamplingScale.Max = 6.000000000000000000
        YSamplingScale.Step = 1.000000000000000000
        ZSamplingScale.Step = 0.100000001490116100
      end
      object chAm: TGLDisk
        OuterRadius = 0.500000000000000000
        SweepAngle = 360.000000000000000000
      end
      object chDm: TGLDisk
        OuterRadius = 0.500000000000000000
        SweepAngle = 360.000000000000000000
      end
      object chE7: TGLDisk
        OuterRadius = 0.500000000000000000
        SweepAngle = 360.000000000000000000
      end
    end
    object dcScene: TGLDummyCube
      CubeSize = 1000.000000000000000000
      object hfBottom: TGLHeightField
        Material.FrontProperties.Ambient.Color = {0000803FF8FEFE3E000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000803FF8FEFE3E000000009A99993E}
        Material.BlendingMode = bmTransparency
        Material.BlendingParams.AlphaFuncRef = 0.500000000000000000
        Direction.Coordinates = {000000000000803F2EBD3BB300000000}
        PitchAngle = 90.000000000000000000
        Position.Coordinates = {00000000000048C2000000000000803F}
        Up.Coordinates = {000000002EBD3BB3000080BF00000000}
        XSamplingScale.Min = -50.000000000000000000
        XSamplingScale.Max = 50.000000000000000000
        XSamplingScale.Step = 10.000000000000000000
        YSamplingScale.Min = -50.000000000000000000
        YSamplingScale.Max = 50.000000000000000000
        YSamplingScale.Step = 10.000000000000000000
      end
      object spEarth: TGLSphere
        Position.Coordinates = {0000000000002041000000000000803F}
        Visible = False
        Radius = 2.000000000000000000
        Slices = 32
        Stacks = 32
        object spCore: TGLSphere
          ShowAxes = True
          Radius = 0.100000001490116100
        end
        object dcMoon: TGLDummyCube
          Position.Coordinates = {0000000000000000000040400000803F}
          CubeSize = 1.000000000000000000
          object spMoon: TGLSphere
            Radius = 0.200000002980232200
          end
        end
        object GLArrowLine5: TGLArrowLine
          Direction.Coordinates = {00000000000080BF0000000000000000}
          Position.Coordinates = {000048C200000000000048C20000803F}
          Up.Coordinates = {0000000000000000000080BF00000000}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
      end
      object dcEdges: TGLDummyCube
        CubeSize = 1.000000000000000000
        object EdgeZc: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'c'
          Position.Coordinates = {000048C200004842000000000000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeZcs: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'cs'
          Position.Coordinates = {0000484200004842000000000000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeZd: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'd'
          Position.Coordinates = {000048C2000048C2000000000000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeZds: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'ds'
          Position.Coordinates = {00004842000048C2000000000000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeYf: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'f'
          Direction.Coordinates = {00000000000080BF0000000000000000}
          Position.Coordinates = {000048C200000000000048C20000803F}
          Up.Coordinates = {0000000000000000000080BF00000000}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeYfs: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'fs'
          Direction.Coordinates = {00000000000080BF0000000000000000}
          Position.Coordinates = {000048C200000000000048420000803F}
          Up.Coordinates = {0000000000000000000080BF00000000}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeYg: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'g'
          Direction.Coordinates = {00000000000080BF0000000000000000}
          Position.Coordinates = {0000484200000000000048420000803F}
          Up.Coordinates = {0000000000000000000080BF00000000}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeYgs: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'gs'
          Direction.Coordinates = {00000000000080BF0000000000000000}
          Position.Coordinates = {0000484200000000000048C20000803F}
          Up.Coordinates = {0000000000000000000080BF00000000}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeXa: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'a'
          Direction.Coordinates = {000080BF000000800000000000000000}
          Position.Coordinates = {0000000000004842000048420000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeXas: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'as'
          Direction.Coordinates = {000080BF000000800000000000000000}
          Position.Coordinates = {0000000000004842000048C20000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeXb: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'b'
          Direction.Coordinates = {000080BF000000800000000000000000}
          Position.Coordinates = {00000000000048C2000048420000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
        object EdgeXe: TGLArrowLine
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'e'
          Direction.Coordinates = {000080BF000000800000000000000000}
          Position.Coordinates = {00000000000048C2000048C20000803F}
          BottomRadius = 1.000000000000000000
          Height = 100.000000000000000000
          TopRadius = 1.000000000000000000
          Parts = [alLine]
          TopArrowHeadHeight = 5.000000000000000000
          TopArrowHeadRadius = 2.000000000000000000
          BottomArrowHeadHeight = 5.000000000000000000
          BottomArrowHeadRadius = 2.000000000000000000
        end
      end
    end
    object GLFlatText1: TGLFlatText
      Direction.Coordinates = {0000000000000000000080BF00000000}
      Position.Coordinates = {0000204200000000000020C10000803F}
      Visible = False
      BitmapFont = GLWindowsBitmapFont
      Text = '0 1 2 3 4'
      Alignment = taLeftJustify
      Layout = tlTop
      Options = []
    end
    object dcBaynKeys: TGLDummyCube
      Visible = False
      CubeSize = 1.000000000000000000
      object cbRightBayanStand: TGLCube
      end
      object grdRightBayanKeys: TGLXYZGrid
        Position.Coordinates = {0000C8C10000B04014AE8F400000803F}
        LineColor.Color = {0000000000000000000000000000803F}
        XSamplingScale.Max = 50.000000000000000000
        XSamplingScale.Step = 2.000000000000000000
        YSamplingScale.Max = 6.000000000000000000
        YSamplingScale.Step = 1.000000000000000000
        ZSamplingScale.Step = 0.100000001490116100
      end
      object cbLeftBayanStand: TGLCube
      end
      object grdLeftBayanKeys: TGLXYZGrid
        Position.Coordinates = {0000C8C10000B04014AE8F400000803F}
        LineColor.Color = {0000000000000000000000000000803F}
        XSamplingScale.Max = 50.000000000000000000
        XSamplingScale.Step = 2.000000000000000000
        YSamplingScale.Max = 6.000000000000000000
        YSamplingScale.Step = 1.000000000000000000
        ZSamplingScale.Step = 0.100000001490116100
      end
    end
    object dcColorWheel: TGLDummyCube
      Position.Coordinates = {0000000000000000000048420000803F}
      Visible = False
      CubeSize = 1.000000000000000000
      object dcMajor: TGLDummyCube
        CubeSize = 1.000000000000000000
        object C: TGLDisk
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'c'
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = -15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object G: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 195.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object D: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 45.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object A: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 255.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object E: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 105.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object CdB: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 315.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object FdGb: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 165.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object CdDb: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 75.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Ab: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 285.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Eb: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 225.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Bb: TGLDisk
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object F: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 135.000000000000000000
          SweepAngle = 30.000000000000000000
        end
      end
      object dcMinor: TGLDummyCube
        CubeSize = 1.000000000000000000
        object Am: TGLDisk
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'a'
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = -15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Em: TGLDisk
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Bm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 45.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Fdm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 75.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Cdm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 105.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object GdmAbm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 135.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object DdmEbm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 165.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object AdmBbm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 195.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Fm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 225.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Cm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 255.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Gm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 285.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object Dm: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 315.000000000000000000
          SweepAngle = 30.000000000000000000
        end
      end
      object dcDim: TGLDummyCube
        CubeSize = 1.000000000000000000
        object dimB: TGLDisk
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'b'
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = -15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimFd: TGLDisk
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimCd: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 45.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimGd: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 75.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimDd: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 105.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimAd: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 135.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimEd: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 165.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimBd: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 195.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimG: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 225.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimD: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 255.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimA: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 285.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object dimE: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 315.000000000000000000
          SweepAngle = 30.000000000000000000
        end
      end
      object dcNdb: TGLDummyCube
        Visible = False
        CubeSize = 1.000000000000000000
        object db0: TGLDisk
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'b'
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = -15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object d1: TGLDisk
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'd'
          Direction.Coordinates = {0000000000000080000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 15.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object d2: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 45.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object d3: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 75.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object d4: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 105.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object d5b7: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 135.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object d6b6: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 165.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object d7b5: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 195.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object b4: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 225.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object b3: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 255.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object b2: TGLDisk
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 285.000000000000000000
          SweepAngle = 30.000000000000000000
        end
        object b1: TGLDisk
          Material.MaterialLibrary = GLMatLibOctava
          Material.LibMaterialName = 'gs'
          Direction.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 50.000000000000000000
          StartAngle = 315.000000000000000000
          SweepAngle = 30.000000000000000000
        end
      end
      object dcSectors: TGLDummyCube
        CubeSize = 1.000000000000000000
        object scSharps: TGLDisk
          OuterRadius = 0.500000000000000000
          SweepAngle = 360.000000000000000000
        end
        object scEnharmonics: TGLDisk
          OuterRadius = 0.500000000000000000
          SweepAngle = 360.000000000000000000
        end
        object scFlats: TGLDisk
          OuterRadius = 0.500000000000000000
          SweepAngle = 360.000000000000000000
        end
        object scBekar: TGLDisk
          OuterRadius = 0.500000000000000000
          SweepAngle = 360.000000000000000000
        end
      end
    end
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    OnProgress = GLCadencerProgress
    Left = 120
    Top = 16
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 119
    Top = 379
  end
  object GLWindowsBitmapFont: TGLWindowsBitmapFont
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -25
    Font.Name = 'Arial'
    Font.Style = []
    Font.Quality = fqAntialiased
    Left = 41
    Top = 311
  end
  object GLBitmapFont: TGLBitmapFont
    GlyphsIntervalX = 1
    GlyphsIntervalY = 1
    Ranges = <>
    CharWidth = 30
    CharHeight = 30
    HSpace = 3
    VSpace = 6
    Left = 144
    Top = 234
  end
  object GLMatLibOctava: TGLMaterialLibrary
    Materials = <
      item
        Name = 'a'
        Tag = 0
        Material.BackProperties.Ambient.Color = {00000000000000000000803F0000803F}
        Material.BackProperties.Diffuse.Color = {00000000000000000000803F0000803F}
        Material.BackProperties.Emission.Color = {00000000000000000000803F0000803F}
        Material.BackProperties.Specular.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Ambient.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Diffuse.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Emission.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Specular.Color = {00000000000000000000803F0000803F}
      end
      item
        Name = 'as'
        Tag = 0
        Material.BackProperties.Ambient.Color = {938C0C3E938C0C3E938E0E3F0000803F}
        Material.BackProperties.Diffuse.Color = {938C0C3E938C0C3E938E0E3F0000803F}
        Material.BackProperties.Emission.Color = {938C0C3E938C0C3E938E0E3F0000803F}
        Material.BackProperties.Specular.Color = {938C0C3E938C0C3E938E0E3F0000803F}
        Material.FrontProperties.Ambient.Color = {CFBC3C3ECFBC3C3EA19E9E3E0000803F}
        Material.FrontProperties.Diffuse.Color = {CFBC3C3ECFBC3C3EA19E9E3E0000803F}
        Material.FrontProperties.Specular.Color = {CFBC3C3ECFBC3C3EA19E9E3E0000803F}
      end
      item
        Name = 'b'
        Tag = 0
        Material.BackProperties.Ambient.Color = {A19E9E3ECFBC3C3EA19E9E3E0000803F}
        Material.BackProperties.Diffuse.Color = {A19E9E3ECFBC3C3EA19E9E3E0000803F}
        Material.BackProperties.Emission.Color = {A19E9E3ECFBC3C3EA19E9E3E0000803F}
        Material.BackProperties.Specular.Color = {A19E9E3ECFBC3C3EA19E9E3E0000803F}
        Material.FrontProperties.Ambient.Color = {A19E9E3ECFBC3C3EA19E9E3E0000803F}
        Material.FrontProperties.Diffuse.Color = {A19E9E3ECFBC3C3EA19E9E3E0000803F}
        Material.FrontProperties.Specular.Color = {A19E9E3ECFBC3C3EA19E9E3E0000803F}
      end
      item
        Name = 'c'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F00000000000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000803F00000000000000000000803F}
        Material.BackProperties.Emission.Color = {0000803F00000000000000000000803F}
        Material.BackProperties.Specular.Color = {0000803F00000000000000000000803F}
        Material.FrontProperties.Ambient.Color = {0000803F00000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F00000000000000000000803F}
        Material.FrontProperties.Specular.Color = {0000803F00000000000000000000803F}
      end
      item
        Name = 'cs'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803E000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803E000000000000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803E000000000000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803E000000000000803F}
        Material.FrontProperties.Ambient.Color = {0000803F0000803E000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F0000803E000000000000803F}
        Material.FrontProperties.Specular.Color = {0000803F0000803E000000000000803F}
      end
      item
        Name = 'd'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000003F000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000003F000000000000803F}
        Material.BackProperties.Emission.Color = {0000803F0000003F000000000000803F}
        Material.BackProperties.Specular.Color = {0000803F0000003F000000000000803F}
        Material.FrontProperties.Ambient.Color = {CDCC0C3FD7A3F03E295C0F3E0000803F}
        Material.FrontProperties.Diffuse.Color = {EC51383F6666E63ECDCC4C3E0000803F}
        Material.FrontProperties.Specular.Color = {CDCC0C3FD7A3F03E295C0F3E0000803F}
      end
      item
        Name = 'ds'
        Tag = 0
        Material.BackProperties.Ambient.Color = {8FC2353F6666263FB81E853E0000803F}
        Material.BackProperties.Diffuse.Color = {8FC2353F6666263FB81E853E0000803F}
        Material.BackProperties.Emission.Color = {8FC2353F6666263FB81E853E0000803F}
        Material.BackProperties.Specular.Color = {8FC2353F6666263FB81E853E0000803F}
        Material.FrontProperties.Ambient.Color = {0000803F0000003F000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F0000003F000000000000803F}
        Material.FrontProperties.Specular.Color = {0000803F0000003F000000000000803F}
      end
      item
        Name = 'e'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F000000000000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F000000000000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F000000000000803F}
        Material.FrontProperties.Ambient.Color = {295C4F3F8FC2353F1F856B3E0000803F}
        Material.FrontProperties.Diffuse.Color = {295C4F3F8FC2353F1F856B3E0000803F}
        Material.FrontProperties.Specular.Color = {295C4F3F8FC2353F1F856B3E0000803F}
      end
      item
        Name = 'f'
        Tag = 0
        Material.BackProperties.Ambient.Color = {000000000000003F000000000000803F}
        Material.BackProperties.Diffuse.Color = {000000000000003F000000000000803F}
        Material.BackProperties.Emission.Color = {000000000000003F000000000000803F}
        Material.BackProperties.Specular.Color = {000000000000003F000000000000803F}
        Material.FrontProperties.Ambient.Color = {000000000000003F000000000000803F}
        Material.FrontProperties.Diffuse.Color = {000000000000003F000000000000803F}
        Material.FrontProperties.Specular.Color = {000000000000003F000000000000803F}
      end
      item
        Name = 'fs'
        Tag = 0
        Material.BackProperties.Ambient.Color = {000000000000003F0000003F0000803F}
        Material.BackProperties.Diffuse.Color = {000000000000003F0000003F0000803F}
        Material.BackProperties.Emission.Color = {000000000000003F0000003F0000803F}
        Material.BackProperties.Specular.Color = {000000000000003F0000003F0000803F}
        Material.FrontProperties.Ambient.Color = {CFBC3C3EA19E9E3ECFBC3C3E0000803F}
        Material.FrontProperties.Diffuse.Color = {CFBC3C3EA19E9E3ECFBC3C3E0000803F}
        Material.FrontProperties.Specular.Color = {CFBC3C3EA19E9E3ECFBC3C3E0000803F}
      end
      item
        Name = 'g'
        Tag = 0
        Material.BackProperties.Ambient.Color = {000000000000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {000000000000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {000000000000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {000000000000803F0000803F0000803F}
        Material.FrontProperties.Ambient.Color = {ACC8483E9A99193FCDCC4C3F0000803F}
        Material.FrontProperties.Diffuse.Color = {ACC8483E9A99193FCDCC4C3F0000803F}
        Material.FrontProperties.Specular.Color = {ACC8483E9A99193FCDCC4C3F0000803F}
      end
      item
        Name = 'gs'
        Tag = 0
        Material.BackProperties.Ambient.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
        Material.BackProperties.Diffuse.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
        Material.BackProperties.Emission.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
        Material.BackProperties.Specular.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
        Material.FrontProperties.Ambient.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
        Material.FrontProperties.Diffuse.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
        Material.FrontProperties.Specular.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
      end>
    Left = 139
    Top = 160
  end
  object GLMatLibTextures: TGLMaterialLibrary
    Left = 48
    Top = 234
  end
  object GLMatLibBW: TGLMaterialLibrary
    Materials = <
      item
        Name = 'a'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
      end
      item
        Name = 'as'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000000000000000000000000000803F}
      end
      item
        Name = 'b'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
      end
      item
        Name = 'c'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
      end
      item
        Name = 'cs'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000000000000000000000000000803F}
      end
      item
        Name = 'd'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
      end
      item
        Name = 'ds'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000000000000000000000000000803F}
      end
      item
        Name = 'e'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
      end
      item
        Name = 'f'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
      end
      item
        Name = 'fs'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000000000000000000000000000803F}
      end
      item
        Name = 'g'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
      end
      item
        Name = 'gs'
        Tag = 0
        Material.BackProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.BackProperties.Diffuse.Color = {0000000000000000000000000000803F}
      end>
    Left = 137
    Top = 86
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 40
    Top = 90
  end
  object GLMatLibCubeMap: TGLMaterialLibrary
    Left = 40
    Top = 168
  end
  object BeaconDevice1: TBeaconDevice
    ManufacturerId = '004C'
    UUID = '{00000000-0000-0000-0000-000000000000}'
    EddystoneNamespace = 'example.com'
    EddystoneInstance = '000000000001'
    Left = 673
    Top = 360
  end
end
