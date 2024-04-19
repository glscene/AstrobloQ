object FormPlotStars: TFormPlotStars
  Left = 69
  Top = 77
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  ClientHeight = 850
  ClientWidth = 1312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -23
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 28
  object GLSViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 1312
    Height = 817
    Cursor = crHandPoint
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = Camera
    Buffer.BackgroundColor = clActiveCaption
    Buffer.ContextOptions = [roDoubleBuffer, roRenderToWindow]
    FieldOfView = 127.827621459960900000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSViewerMouseDown
    OnMouseMove = GLSViewerMouseMove
    OnMouseUp = GLSViewerMouseUp
    TabOrder = 0
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 817
    Width = 1312
    Height = 33
    Cursor = crHandPoint
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Color = clCream
    Panels = <
      item
        Alignment = taCenter
        Width = 308
      end
      item
        Alignment = taCenter
        Width = 308
      end
      item
        Alignment = taCenter
        Width = 308
      end
      item
        Alignment = taCenter
        Width = 308
      end
      item
        Alignment = taCenter
        Width = 88
      end>
  end
  object GLScene: TGLScene
    Left = 64
    Top = 106
    object GLLight: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000484200004842000048420000803F}
      LightStyle = lsOmni
      Specular.Color = {0000803F0000803F0000803F0000803F}
      SpotCutOff = 180.000000000000000000
      SpotDirection.Coordinates = {00000000000000000000000000000000}
    end
    object TargetCube: TGLDummyCube
      Scale.Coordinates = {00000040000000400000004000000000}
      Pickable = False
      CubeSize = 2.000000000000000000
      EdgeColor.Color = {0000803FAE47E13D7B142E3F0000803F}
    end
    object CameraCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      EdgeColor.Color = {CDCC0C3FD7A3F03E295C0F3E0000803F}
      object Camera: TGLCamera
        DepthOfView = 1000.000000000000000000
        FocalLength = 200.000000000000000000
        NearPlaneBias = 0.009999999776482582
        TargetObject = TargetCube
        Position.Coordinates = {00004842000048420000F0410000803F}
        Direction.Coordinates = {000000000000803F0000008000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
      end
    end
    object GLxyGrid: TGLXYZGrid
      LineColor.Color = {00000000000000000000803F0000803F}
      XSamplingScale.Max = 4.000000000000000000
      XSamplingScale.Step = 1.000000000000000000
      YSamplingScale.Max = 4.000000000000000000
      YSamplingScale.Step = 1.000000000000000000
      ZSamplingScale.Step = 1.000000000000000000
      Parts = [gpX, gpY, gpZ]
    end
    object GLxzGrid: TGLXYZGrid
      LineColor.Color = {000000000000003F000000000000803F}
      XSamplingScale.Max = 4.000000000000000000
      XSamplingScale.Step = 1.000000000000000000
      YSamplingScale.Step = 0.100000001490116100
      ZSamplingScale.Max = 4.000000000000000000
      ZSamplingScale.Step = 1.000000000000000000
      Parts = [gpX, gpZ]
    end
    object GLyzGrid: TGLXYZGrid
      LineColor.Color = {0000803F00000000000000000000803F}
      XSamplingScale.Step = 0.100000001490116100
      YSamplingScale.Max = 4.000000000000000000
      YSamplingScale.Step = 1.000000000000000000
      ZSamplingScale.Max = 4.000000000000000000
      ZSamplingScale.Step = 1.000000000000000000
      Parts = [gpY, gpZ]
    end
    object Fields: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object xCoordLine: TGLLines
      LineColor.Color = {0000803F00000000000000000000803F}
      LineWidth = 3.000000000000000000
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object yCoordLine: TGLLines
      LineColor.Color = {0000803F00000000000000000000803F}
      LineWidth = 3.000000000000000000
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object zCoordLine: TGLLines
      LineColor.Color = {0000803F00000000000000000000803F}
      LineWidth = 3.000000000000000000
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object AddXLine: TGLLines
      LineColor.Color = {0000803F00000000000000000000803F}
      LineWidth = 3.000000000000000000
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object AddYLine: TGLLines
      LineColor.Color = {0000803F00000000000000000000803F}
      LineWidth = 3.000000000000000000
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object AddZLine: TGLLines
      LineColor.Color = {0000803F00000000000000000000803F}
      LineWidth = 3.000000000000000000
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object BoxLine1: TGLLines
      Nodes = <
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object BoxLine2: TGLLines
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object BoxLine3: TGLLines
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object BoxLine4: TGLLines
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object XCoordsCube: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object YCoordsCube: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object ZCoordsCube: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object xArrow: TGLArrowLine
      Visible = False
      BottomRadius = 0.100000001490116100
      Height = 1.000000000000000000
      TopRadius = 0.100000001490116100
      TopArrowHeadHeight = 0.500000000000000000
      TopArrowHeadRadius = 0.200000002980232200
      BottomArrowHeadHeight = 0.500000000000000000
      BottomArrowHeadRadius = 0.200000002980232200
    end
    object yArrow: TGLArrowLine
      Visible = False
      BottomRadius = 0.100000001490116100
      Height = 1.000000000000000000
      TopRadius = 0.100000001490116100
      TopArrowHeadHeight = 0.500000000000000000
      TopArrowHeadRadius = 0.200000002980232200
      BottomArrowHeadHeight = 0.500000000000000000
      BottomArrowHeadRadius = 0.200000002980232200
    end
    object AddedField: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object VolumeLines: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
  end
  object GLWinBmpFont: TGLWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    MagFilter = maNearest
    MinFilter = miNearest
    Left = 64
    Top = 32
  end
  object MainMenu: TMainMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    Left = 248
    Top = 33
    object miFile: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object miNew: TMenuItem
        Caption = #1053#1086#1074#1099#1081
        OnClick = miNewClick
      end
      object miOpenFile: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        OnClick = miOpenFileClick
      end
      object miRecent: TMenuItem
        Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077
      end
      object miSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = miSaveClick
      end
      object miSaveas: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        OnClick = miSaveasClick
      end
      object miExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miExitClick
      end
    end
    object miView: TMenuItem
      Caption = #1042#1080#1076
      object miGraf1d: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082#1080' y=f(x)...'
      end
      object miGraf2d: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082#1080' z=f(x,y)...'
      end
      object miGraf3d: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082#1080' g=f(x,y,z)...'
      end
    end
    object miOptions: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      object miDefaultLayout: TMenuItem
        Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        OnClick = miDefaultLayoutClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miGrid: TMenuItem
        Caption = 'Grids...'
        OnClick = miGridClick
      end
      object miCoordText: TMenuItem
        Caption = 'Grids Coordinates...'
        OnClick = miCoordTextClick
      end
      object miGridColours: TMenuItem
        Caption = 'Grids Colours...'
        OnClick = miGridColoursClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miEvaluate: TMenuItem
        Caption = 'Evaluate Function...'
        OnClick = miEvaluateClick
      end
      object miPlotColours: TMenuItem
        Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1075#1088#1072#1092#1080#1082#1072'...'
        OnClick = miPlotColoursClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object miDerivativeOps: TMenuItem
        Caption = 'Partial Derivative or Double Integral...'
        OnClick = miDerivativeOpsClick
      end
      object miDerivativePlotColours: TMenuItem
        Caption = 'Derivative or Double Integral Plot Colours...'
        Enabled = False
        OnClick = miDerivativePlotColoursClick
      end
    end
    object miHelp: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object miAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = miAboutClick
      end
    end
  end
end
