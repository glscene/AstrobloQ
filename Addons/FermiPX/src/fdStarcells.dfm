object frmStarnets: TfrmStarnets
  Left = 0
  Top = 0
  Caption = 'Starnets'
  ClientHeight = 616
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 597
    Width = 900
    Height = 19
    Panels = <
      item
        Text = 'Total points:'
        Width = 250
      end
      item
        Text = 'FPS:'
        Width = 50
      end>
    ExplicitTop = 572
    ExplicitWidth = 892
  end
  object GLSceneViewer: TGLSceneViewer
    Left = 185
    Top = 33
    Width = 553
    Height = 564
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 159.499740600585900000
    PenAsTouch = False
    Align = alClient
    OnDblClick = GLSceneViewerDblClick
    OnMouseDown = GLSceneViewerMouseDown
    TabOrder = 1
  end
  object PanelRight: TPanel
    Left = 738
    Top = 33
    Width = 162
    Height = 564
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 730
    ExplicitHeight = 539
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 33
    Width = 185
    Height = 564
    Align = alLeft
    TabOrder = 3
    ExplicitHeight = 539
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 41
      Align = alTop
      TabOrder = 0
    end
    object PanelBottom: TPanel
      Left = 1
      Top = 523
      Width = 183
      Height = 40
      Align = alBottom
      Caption = 'PanelBottom'
      TabOrder = 1
      ExplicitTop = 498
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 42
      Width = 183
      Height = 481
      ActivePage = tsDatasets
      Align = alClient
      TabOrder = 2
      ExplicitHeight = 456
      object tsDatasets: TTabSheet
        Caption = #1044#1072#1085#1085#1099#1077
        object tvDatasets: TTreeView
          Left = 0
          Top = 0
          Width = 175
          Height = 453
          Align = alClient
          Indent = 19
          TabOrder = 0
          Items.NodeData = {
            070500000009540054007200650065004E006F00640065002B00000000000000
            00000000FFFFFFFFFFFFFFFF0000000000000000000000000001061704320451
            04370434044B0400002F0000000000000000000000FFFFFFFFFFFFFFFF000000
            000000000000000000000108220435044204400430043D043504420400002D00
            00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001
            071F043E043B0438043D043504420400002F0000000000000000000000FFFFFF
            FFFFFFFFFF000000000000000000000000000108130430043B04300433044004
            380434040000290000000000000000000000FFFFFFFFFFFFFFFF000000000000
            00000000000000010514044004350439043A04}
          ExplicitHeight = 428
        end
      end
      object tsModeling: TTabSheet
        Caption = #1052#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077
        ImageIndex = 1
        object tvModeling: TTreeView
          Left = 0
          Top = 0
          Width = 175
          Height = 453
          Align = alClient
          AutoExpand = True
          Indent = 19
          TabOrder = 0
          Items.NodeData = {
            070400000009540054007200650065004E006F00640065002900000000000000
            00000000FFFFFFFFFFFFFFFF00000000000000000000000000010512044B0431
            043E04400400003F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            00000000000000000110220435044204400430044D043404400430043B043804
            37043004460438044F0400002F0000000000000000000000FFFFFFFFFFFFFFFF
            0000000000000000000300000001081304400438043404340438043D04330400
            003D0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
            0000010F21044004350434043D043504350420003204200031043B043E043A04
            350400003B0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            0000000000010E11043B04380436043D044F044F042000370432043504370434
            0430040000370000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000000010C1F043E042000420435044204400430043D04350442044304
            00003D0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
            000000010F1A0440043004420447043004390448043804390420003F04430442
            044C04}
        end
      end
    end
  end
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 900
    Height = 33
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 892
    object ToolBar1: TToolBar
      Left = 19
      Top = 2
      Width = 304
      Height = 22
      Caption = 'ToolBar1'
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 1
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 2
      end
    end
  end
  object GLScene: TGLScene
    Left = 248
    Top = 20
    object SkySphere: TGLSphere
      NormalDirection = ndInside
      Radius = 10000.000000000000000000
      Slices = 256
      Stacks = 256
    end
    object SkyBox: TGLSkyBox
      Visible = False
      CloudsPlaneOffset = 0.200000002980232200
      CloudsPlaneSize = 32.000000000000000000
    end
    object Camera: TGLCamera
      DepthOfView = 20000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = dcGalablock
      Position.Coordinates = {0080894400808944008089440000803F}
      object LightSource2: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object dcGalablock: TGLDummyCube
      Visible = False
      CubeSize = 1000.000000000000000000
      VisibleAtRunTime = True
      object boxPlane: TGLPlane
        Material.BackProperties.Emission.Color = {938E0E3F938C0C3EDCD6D63E0000803F}
        Material.FrontProperties.Emission.Color = {CDCC0C3FEC51B83DEC51B83D0000803F}
        Direction.Coordinates = {000000000000803F0000000000000000}
        Up.Coordinates = {0000000000000000000080BF00000000}
        Visible = False
        Height = 1000.000000000000000000
        Width = 1000.000000000000000000
      end
      object circDisk: TGLDisk
        Material.FrontProperties.Emission.Color = {A9A5253FB1A8283EB1A8283E0000803F}
        Direction.Coordinates = {000000000000803F0000000000000000}
        Up.Coordinates = {0000000000000000000080BF00000000}
        InnerRadius = 200.000000000000000000
        OuterRadius = 566.000000000000000000
        Slices = 64
        SweepAngle = 360.000000000000000000
      end
      object circSphere: TGLSphere
        Material.FrontProperties.Emission.Color = {0000803FF8FEFE3E000000000000803F}
        Material.PolygonMode = pmLines
        Radius = 866.000000000000000000
        Slices = 64
        Stacks = 64
      end
      object xyzGrid: TGLXYZGrid
        Visible = False
        XSamplingScale.Min = -500.000000000000000000
        XSamplingScale.Max = 500.000000000000000000
        XSamplingScale.Origin = -500.000000000000000000
        XSamplingScale.Step = 100.000000000000000000
        YSamplingScale.Min = -500.000000000000000000
        YSamplingScale.Max = 500.000000000000000000
        YSamplingScale.Origin = -500.000000000000000000
        YSamplingScale.Step = 100.000000000000000000
        ZSamplingScale.Min = -500.000000000000000000
        ZSamplingScale.Max = 500.000000000000000000
        ZSamplingScale.Origin = -500.000000000000000000
        ZSamplingScale.Step = 100.000000000000000000
        Parts = [gpX, gpY, gpZ]
      end
      object GLLines1: TGLLines
        Up.Coordinates = {0000803F000000000000008000000000}
        Visible = False
        NodeColor.Color = {0000803F0000803F0000803F0000803F}
        Nodes = <>
        Options = []
      end
      object GLPoints1: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
      end
      object GLPolygon1: TGLPolygon
        Visible = False
        Nodes = <>
      end
      object ffSolSphere: TGLFreeForm
        Material.FrontProperties.Diffuse.Color = {EBE0E03EE4DB5B3F9A93133F0000803F}
        Material.PolygonMode = pmLines
      end
      object SolCube: TGLCube
        Material.PolygonMode = pmLines
        Visible = False
        CubeSize = {00007A4400007A4400007A44}
      end
      object Torus: TGLTorus
        Visible = False
        MajorRadius = 400.000000000000000000
        MinorRadius = 100.000000000000000000
        StopAngle = 360.000000000000000000
        Parts = [toSides, toStartDisk, toStopDisk]
      end
    end
    object HeightField: TGLHeightField
      Direction.Coordinates = {0044F4970000803F2EBD3BB300000000}
      Up.Coordinates = {0000803F583DAF262EBD3B3300000000}
      Visible = False
      XSamplingScale.Min = -500.000000000000000000
      XSamplingScale.Max = 500.000000000000000000
      XSamplingScale.Step = 100.000000000000000000
      YSamplingScale.Min = -500.000000000000000000
      YSamplingScale.Max = 500.000000000000000000
      YSamplingScale.Step = 100.000000000000000000
      object YZGrid: TGLXYZGrid
        LineColor.Color = {00000000F8FEFE3E0000803F0000803F}
        XSamplingScale.Min = -500.000000000000000000
        XSamplingScale.Max = 500.000000000000000000
        XSamplingScale.Origin = -500.000000000000000000
        XSamplingScale.Step = 100.000000000000000000
        YSamplingScale.Min = -500.000000000000000000
        YSamplingScale.Max = 500.000000000000000000
        YSamplingScale.Origin = -500.000000000000000000
        YSamplingScale.Step = 100.000000000000000000
        ZSamplingScale.Min = -500.000000000000000000
        ZSamplingScale.Max = 500.000000000000000000
        ZSamplingScale.Origin = -500.000000000000000000
        ZSamplingScale.Step = 100.000000000000000000
        Parts = [gpY, gpZ]
      end
      object XZGrid: TGLXYZGrid
        LineColor.Color = {00000000F8FEFE3E0000803F0000803F}
        XSamplingScale.Min = -500.000000000000000000
        XSamplingScale.Max = 500.000000000000000000
        XSamplingScale.Origin = -500.000000000000000000
        XSamplingScale.Step = 100.000000000000000000
        YSamplingScale.Min = -500.000000000000000000
        YSamplingScale.Max = 500.000000000000000000
        YSamplingScale.Origin = -500.000000000000000000
        YSamplingScale.Step = 100.000000000000000000
        ZSamplingScale.Min = -500.000000000000000000
        ZSamplingScale.Max = 500.000000000000000000
        ZSamplingScale.Origin = -500.000000000000000000
        ZSamplingScale.Step = 100.000000000000000000
        Parts = [gpX, gpZ]
      end
      object XYGrid: TGLXYZGrid
        LineColor.Color = {00000000F8FEFE3E0000803F0000803F}
        XSamplingScale.Min = -500.000000000000000000
        XSamplingScale.Max = 500.000000000000000000
        XSamplingScale.Origin = -500.000000000000000000
        XSamplingScale.Step = 100.000000000000000000
        YSamplingScale.Min = -500.000000000000000000
        YSamplingScale.Max = 500.000000000000000000
        YSamplingScale.Origin = -500.000000000000000000
        YSamplingScale.Step = 100.000000000000000000
        ZSamplingScale.Min = -500.000000000000000000
        ZSamplingScale.Max = 500.000000000000000000
        ZSamplingScale.Origin = -500.000000000000000000
        ZSamplingScale.Step = 100.000000000000000000
      end
    end
    object LightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {00401C4500401C4500409CC50000803F}
      Shining = False
      Specular.Color = {0000803F0000803F0000803F0000803F}
      SpotCutOff = 180.000000000000000000
    end
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    OnProgress = GLCadencerProgress
    Left = 250
    Top = 128
  end
  object Timer1: TTimer
    Left = 368
    Top = 8
  end
  object MainMenu: TMainMenu
    Left = 382
    Top = 146
    object miFile: TMenuItem
      Caption = '&File'
      object miOpen: TMenuItem
        Caption = 'Open...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'Exit'
        OnClick = miExitClick
      end
    end
    object miModeling: TMenuItem
      Caption = '&Mode'
      object miPoints: TMenuItem
        Caption = 'Stars'
        RadioItem = True
      end
      object miDelaunay: TMenuItem
        Caption = 'Delanet'
        RadioItem = True
      end
      object miVoronoi: TMenuItem
        Caption = 'Voronet'
        RadioItem = True
      end
    end
    object miView: TMenuItem
      Caption = '&View'
      object miDrake: TMenuItem
        Caption = 'Drake...'
        OnClick = miDrakeClick
      end
    end
    object miTools: TMenuItem
      Caption = '&Tools'
      object miOptions: TMenuItem
        Caption = 'Settings...'
        OnClick = miOptionsClick
      end
    end
    object miHelp: TMenuItem
      Caption = '&Help'
      object Content1: TMenuItem
        Caption = 'Wiki...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = 'About...'
        OnClick = miAboutClick
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 248
    Top = 216
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\dgoni\Documents\Embarcadero\Studio\STARS_DB\DA' +
        'TA\A_Delaunay.sqlite'
      'DriverID=SQLite')
    Left = 680
    Top = 104
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 512
    Top = 104
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 508
    Top = 176
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer
    FormCaption = 'FermiPD - %FPS'
    KeyCombinations = <
      item
        ShiftState = [ssLeft, ssRight]
        Action = snaZoom
      end
      item
        ShiftState = [ssLeft]
        Action = snaMoveAroundTarget
      end
      item
        ShiftState = [ssRight]
        Action = snaMoveAroundTarget
      end>
    Left = 982
    Top = 8
  end
  object FDTable: TFDTable
    Connection = FDConnection
    Left = 940
    Top = 132
  end
  object GLMaterialLibrary: TGLMaterialLibrary
    Left = 366
    Top = 306
  end
end
