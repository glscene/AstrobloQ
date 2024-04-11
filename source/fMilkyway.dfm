object FormMilkyway: TFormMilkyway
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Milkyway'
  ClientHeight = 801
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 168
  TextHeight = 30
  object GLSceneViewer: TGLSceneViewer
    Left = 169
    Top = 0
    Width = 1021
    Height = 772
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 156.582000732421900000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 159
    ExplicitTop = -10
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 169
    Height = 772
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 772
    Width = 1362
    Height = 29
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <
      item
        Text = 'X:'
        Width = 150
      end
      item
        Text = 'Y:'
        Width = 150
      end
      item
        Text = 'Z:'
        Width = 150
      end>
  end
  object PanelRight: TPanel
    Left = 1190
    Top = 0
    Width = 172
    Height = 772
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alRight
    TabOrder = 3
  end
  object GLScene: TGLScene
    Left = 218
    Top = 80
    object Camera: TGLCamera
      DepthOfView = 10000.000000000000000000
      FocalLength = 80.000000000000000000
      TargetObject = DummyCube
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {0000FA440000FA440000FA440000803F}
      object LightSource: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object DummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      object Cube: TGLCube
        Material.PolygonMode = pmLines
        CubeSize = {0000FA440000FA440000FA44}
      end
      object GLHexahedron1: TGLHexahedron
        Material.PolygonMode = pmLines
        Scale.Coordinates = {0000FA440000FA440000FA4400000000}
      end
      object XYZGrid: TGLXYZGrid
        Direction.Coordinates = {000000000000803F0000000000000000}
        ShowAxes = True
        Up.Coordinates = {0000000000000000000080BF00000000}
        XSamplingScale.Min = -50000.000000000000000000
        XSamplingScale.Max = 50000.000000000000000000
        XSamplingScale.Step = 1000.000000000000000000
        YSamplingScale.Min = -50000.000000000000000000
        YSamplingScale.Max = 50000.000000000000000000
        YSamplingScale.Step = 1000.000000000000000000
        ZSamplingScale.Min = -500.000000000000000000
        ZSamplingScale.Max = 500.000000000000000000
        ZSamplingScale.Step = 1000.000000000000000000
        Parts = [gpX, gpY, gpZ]
      end
    end
    object ObjectsCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      EdgeColor.Color = {0000803F00000000000000000000803F}
      object ArrowZ: TGLArrowLine
        Material.FrontProperties.Emission.Color = {00000000000000000000803F0000803F}
        Position.Coordinates = {0000000000000000000000400000803F}
        Scale.Coordinates = {00007A4400007A4400007A4400000000}
        BottomRadius = 0.050000000745058060
        Height = 4.000000000000000000
        TopRadius = 0.050000000745058060
        TopArrowHeadHeight = 0.500000000000000000
        TopArrowHeadRadius = 0.100000001490116100
        BottomArrowHeadHeight = 0.500000000000000000
        BottomArrowHeadRadius = 0.200000002980232200
      end
      object ArrowY: TGLArrowLine
        Material.FrontProperties.Emission.Color = {000000000000003F000000000000803F}
        Direction.Coordinates = {000000000000803F0000000000000000}
        Position.Coordinates = {0000000000000040000000000000803F}
        Scale.Coordinates = {00007A4400007A4400007A4400000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        BottomRadius = 0.050000000745058060
        Height = 4.000000000000000000
        TopRadius = 0.050000000745058060
        TopArrowHeadHeight = 0.500000000000000000
        TopArrowHeadRadius = 0.100000001490116100
        BottomArrowHeadHeight = 0.500000000000000000
        BottomArrowHeadRadius = 0.200000002980232200
      end
      object ArrowX: TGLArrowLine
        Material.FrontProperties.Emission.Color = {0000803F00000000000000000000803F}
        Direction.Coordinates = {0000803F000000000000000000000000}
        Position.Coordinates = {0000004000000000000000000000803F}
        Scale.Coordinates = {00007A4400007A4400007A4400000000}
        BottomRadius = 0.050000000745058060
        Height = 4.000000000000000000
        TopRadius = 0.050000000745058060
        TopArrowHeadHeight = 0.500000000000000000
        TopArrowHeadRadius = 0.100000001490116100
        BottomArrowHeadHeight = 0.500000000000000000
        BottomArrowHeadRadius = 0.200000002980232200
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 1036
    Top = 86
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
      end
      object Open1: TMenuItem
        Caption = '&Open...'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = '&Save'
      end
      object SaveAs1: TMenuItem
        Caption = 'Save &As...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'E&xit'
        OnClick = miExitClick
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object Undo1: TMenuItem
        Caption = '&Undo'
        ShortCut = 16474
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Caption = 'Cu&t'
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = '&Copy'
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = '&Paste'
        ShortCut = 16470
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = '&Find...'
      end
      object Replace1: TMenuItem
        Caption = 'R&eplace...'
      end
      object GoTo1: TMenuItem
        Caption = '&Go To...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Links1: TMenuItem
        Caption = 'Lin&ks...'
      end
      object Object1: TMenuItem
        Caption = '&Object'
      end
    end
    object miView: TMenuItem
      Caption = '&View'
      object NewWindow1: TMenuItem
        Caption = '&New Window'
      end
      object Tile1: TMenuItem
        Caption = '&Tile'
      end
      object Cascade1: TMenuItem
        Caption = '&Cascade'
      end
      object ArrangeAll1: TMenuItem
        Caption = '&Arrange All'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Hide1: TMenuItem
        Caption = '&Hide'
      end
      object Show1: TMenuItem
        Caption = '&Show...'
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object miWiki: TMenuItem
        Caption = '&Wiki...'
      end
      object SearchforHelpOn1: TMenuItem
        Caption = '&Search for Help On...'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object GLAsyncTimer: TGLAsyncTimer
    Left = 364
    Top = 84
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    Left = 224
    Top = 210
  end
  object GLSimpleNavigation: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer
    FormCaption = 'Milkyway - %FPS'
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
    Left = 392
    Top = 210
  end
end
