object FormStarcube: TFormStarcube
  Left = 0
  Top = 263
  Caption = 'StarCube'
  ClientHeight = 577
  ClientWidth = 931
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 752
    Height = 577
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 110.537437438964800000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 760
  end
  object PanelRight: TPanel
    Left = 752
    Top = 0
    Width = 179
    Height = 577
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 744
    ExplicitHeight = 552
    object ClassGroup: TRadioGroup
      Left = 6
      Top = 7
      Width = 163
      Height = 218
      Caption = #1050#1083#1072#1089#1089#1099' '#1079#1074#1105#1079#1076
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077
        'O'
        'B'
        'A'
        'F'
        'G'
        'K'
        'M')
      TabOrder = 0
      OnClick = ClassGroupClick
    end
    object Panel2: TPanel
      Tag = 1
      Left = 75
      Top = 50
      Width = 86
      Height = 19
      Color = clHotLight
      ParentBackground = False
      TabOrder = 1
      OnClick = Panel2Click
    end
    object Panel1: TPanel
      Tag = 2
      Left = 75
      Top = 75
      Width = 86
      Height = 19
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 2
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Tag = 3
      Left = 75
      Top = 100
      Width = 86
      Height = 19
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 3
      OnClick = Panel2Click
    end
    object Panel4: TPanel
      Tag = 4
      Left = 75
      Top = 125
      Width = 86
      Height = 19
      Color = clCream
      ParentBackground = False
      TabOrder = 4
      OnClick = Panel2Click
    end
    object Panel5: TPanel
      Tag = 5
      Left = 75
      Top = 150
      Width = 86
      Height = 19
      Color = clYellow
      ParentBackground = False
      TabOrder = 5
      OnClick = Panel2Click
    end
    object Panel6: TPanel
      Tag = 6
      Left = 75
      Top = 175
      Width = 86
      Height = 19
      Color = 35071
      ParentBackground = False
      TabOrder = 6
      OnClick = Panel2Click
    end
    object Panel7: TPanel
      Tag = 7
      Left = 75
      Top = 200
      Width = 86
      Height = 19
      Color = clOrangered
      ParentBackground = False
      TabOrder = 7
      OnClick = Panel2Click
    end
  end
  object GLScene1: TGLScene
    Left = 48
    Top = 16
    object GLCamera1: TGLCamera
      DepthOfView = 500000.000000000000000000
      FocalLength = 200.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000004000000040000000400000803F}
    end
    object GLDummyCube1: TGLDummyCube
      ShowAxes = True
      CubeSize = 400.000000000000000000
      EdgeColor.Color = {B1A8A83EB1A8A83EB1A8A83E0000803F}
      VisibleAtRunTime = True
      object GLLines1: TGLLines
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
        Nodes = <>
      end
      object GLTetrahedron1: TGLTetrahedron
        Material.Texture.BorderColor.Color = {9A93133FE4DB5B3FEBE0E03E0000803F}
        Direction.Coordinates = {000000000000803F0000000000000000}
        Position.Coordinates = {0000803F0000803F0000803F0000803F}
        Up.Coordinates = {8B8F67BF000000004A51DABE00000000}
        Visible = False
      end
      object DelStruct: TGLFreeForm
        Material.FrontProperties.Diffuse.Color = {EBE0E03EE4DB5B3F9A93133F0000803F}
      end
      object GLLines2: TGLLines
        Visible = False
        Nodes = <>
        Options = []
      end
      object VoxelDummy: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 48
    Top = 104
  end
  object Timer1: TTimer
    Left = 192
    Top = 112
  end
  object MainMenu1: TMainMenu
    Left = 336
    Top = 16
    object Start1: TMenuItem
      Caption = #1060#1072#1081#1083
      object LoadFiles: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083#1099'....'
        OnClick = LoadFilesClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N8Click
      end
    end
    object N2: TMenuItem
      Caption = #1052#1077#1090#1086#1076
      object StarItem: TMenuItem
        Caption = #1047#1074#1105#1079#1076#1099
        Checked = True
        Default = True
        OnClick = StarItemClick
      end
      object DelaunayItem: TMenuItem
        Caption = #1058#1077#1090#1088#1072#1101#1076#1088#1099' '#1044#1077#1083#1086#1085#1077
        OnClick = DelaunayItemClick
      end
      object VoronoiItem: TMenuItem
        Caption = #1055#1086#1083#1080#1101#1076#1088#1099' '#1042#1086#1088#1086#1085#1086#1075#1086
        OnClick = VoronoiItemClick
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 472
    Top = 48
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer1
    FormCaption = 'StarCube'
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
    Left = 192
    Top = 16
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 472
    Top = 120
  end
end
