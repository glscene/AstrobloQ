object FormBox: TFormBox
  Left = 264
  Top = 193
  Caption = 'Starbox'
  ClientHeight = 675
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 672
    Width = 1136
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 554
    ExplicitWidth = 870
  end
  object GLSceneViewer: TGLSceneViewer
    Left = 121
    Top = 0
    Width = 803
    Height = 672
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    Buffer.ColorDepth = cd24bits
    FieldOfView = 163.071914672851600000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewerMouseDown
    TabOrder = 0
    ExplicitWidth = 811
  end
  object PanelRight: TPanel
    Left = 924
    Top = 0
    Width = 212
    Height = 672
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 650
    ExplicitHeight = 529
    object ButtonStars: TButton
      Left = 22
      Top = 15
      Width = 98
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1074#1105#1079#1076
      TabOrder = 0
      OnClick = ButtonStarsClick
    end
    object gbStars: TGroupBox
      Left = 6
      Top = 145
      Width = 201
      Height = 270
      Caption = #1050#1083#1072#1089#1089#1099' '#1079#1074#1105#1079#1076
      TabOrder = 1
      object shO: TShape
        Left = 48
        Top = 31
        Width = 29
        Height = 24
        Brush.Color = clHotLight
      end
      object shB: TShape
        Left = 48
        Top = 61
        Width = 29
        Height = 24
        Brush.Color = clSkyBlue
      end
      object shA: TShape
        Left = 48
        Top = 95
        Width = 29
        Height = 24
        Brush.Color = clCream
      end
      object shG: TShape
        Left = 48
        Top = 166
        Width = 29
        Height = 24
        Brush.Color = clYellow
      end
      object shK: TShape
        Left = 48
        Top = 199
        Width = 29
        Height = 24
        Brush.Color = clOrange
      end
      object shF: TShape
        Left = 48
        Top = 129
        Width = 29
        Height = 24
        Brush.Color = clFuchsia
      end
      object shM: TShape
        Left = 48
        Top = 232
        Width = 29
        Height = 24
        Brush.Color = clRed
      end
      object Label1: TLabel
        Left = 107
        Top = 23
        Width = 8
        Height = 13
        Caption = '%'
      end
      object Label2: TLabel
        Left = 160
        Top = 23
        Width = 32
        Height = 13
        Caption = #1063#1080#1089#1083#1086
      end
      object chbO: TCheckBox
        Left = 8
        Top = 34
        Width = 34
        Height = 17
        Caption = 'O'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        OnClick = chbOClick
      end
      object chbB: TCheckBox
        Left = 8
        Top = 68
        Width = 34
        Height = 17
        Caption = 'B'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 1
        OnClick = chbOClick
      end
      object chbA: TCheckBox
        Left = 8
        Top = 102
        Width = 34
        Height = 17
        Caption = 'A'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 2
        OnClick = chbOClick
      end
      object chbF: TCheckBox
        Left = 8
        Top = 135
        Width = 34
        Height = 17
        Caption = 'F'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 3
        OnClick = chbOClick
      end
      object chbG: TCheckBox
        Left = 8
        Top = 169
        Width = 34
        Height = 17
        Caption = 'G'
        Checked = True
        Color = clYellow
        ParentColor = False
        State = cbChecked
        TabOrder = 4
        OnClick = chbOClick
      end
      object chbK: TCheckBox
        Left = 8
        Top = 203
        Width = 34
        Height = 17
        Caption = 'K'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 5
        OnClick = chbOClick
      end
      object chbM: TCheckBox
        Left = 8
        Top = 237
        Width = 34
        Height = 17
        Caption = 'M'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 6
        OnClick = chbOClick
      end
      object chbAll: TCheckBox
        Left = 88
        Top = 0
        Width = 66
        Height = 17
        Caption = #1042#1089#1077
        TabOrder = 7
        OnClick = chbAllClick
      end
      object nbO: TNumberBox
        Left = 88
        Top = 36
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 1
        Mode = nbmFloat
        MaxValue = 100.000000000000000000
        TabOrder = 8
        Value = 0.100000000000000000
      end
      object nbB: TNumberBox
        Left = 88
        Top = 65
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 1
        Mode = nbmFloat
        MaxValue = 100.000000000000000000
        TabOrder = 9
        Value = 0.400000000000000000
      end
      object nbA: TNumberBox
        Left = 88
        Top = 101
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 1
        Mode = nbmFloat
        MaxValue = 100.000000000000000000
        TabOrder = 10
        Value = 0.500000000000000000
      end
      object nbF: TNumberBox
        Left = 88
        Top = 136
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 1
        Mode = nbmFloat
        MaxValue = 100.000000000000000000
        TabOrder = 11
        Value = 3.000000000000000000
      end
      object nbG: TNumberBox
        Left = 88
        Top = 172
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 1
        Mode = nbmFloat
        MaxValue = 100.000000000000000000
        TabOrder = 12
        Value = 8.000000000000000000
      end
      object nbK: TNumberBox
        Left = 88
        Top = 203
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 1
        Mode = nbmFloat
        MaxValue = 100.000000000000000000
        TabOrder = 13
        Value = 12.000000000000000000
      end
      object nbM: TNumberBox
        Left = 88
        Top = 236
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 1
        Mode = nbmFloat
        MaxValue = 100.000000000000000000
        TabOrder = 14
        Value = 76.000000000000000000
      end
      object nbAn: TNumberBox
        Left = 153
        Top = 101
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 0
        MaxValue = 10000.000000000000000000
        TabOrder = 15
        Value = 5.000000000000000000
      end
      object nbMn: TNumberBox
        Left = 153
        Top = 236
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 0
        MaxValue = 10000.000000000000000000
        TabOrder = 16
        Value = 760.000000000000000000
      end
      object nbKn: TNumberBox
        Left = 153
        Top = 203
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 0
        MaxValue = 10000.000000000000000000
        TabOrder = 17
        Value = 120.000000000000000000
      end
      object nbGn: TNumberBox
        Left = 153
        Top = 172
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 0
        MaxValue = 10000.000000000000000000
        TabOrder = 18
        Value = 80.000000000000000000
      end
      object nbFn: TNumberBox
        Left = 153
        Top = 136
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 0
        MaxValue = 10000.000000000000000000
        TabOrder = 19
        Value = 30.000000000000000000
      end
      object nbBn: TNumberBox
        Left = 153
        Top = 67
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 0
        MaxValue = 10000.000000000000000000
        TabOrder = 20
        Value = 4.000000000000000000
      end
      object nbOn: TNumberBox
        Left = 153
        Top = 36
        Width = 46
        Height = 21
        Alignment = taCenter
        Decimal = 0
        MaxValue = 10000.000000000000000000
        TabOrder = 21
        Value = 1.000000000000000000
      end
    end
    object SpinEdit: TSpinEdit
      Left = 136
      Top = 18
      Width = 57
      Height = 22
      MaxValue = 100000
      MinValue = 1000
      TabOrder = 2
      Value = 1000
      OnChange = SpinEditChange
    end
    object chbSmoothStars: TCheckBox
      Left = 32
      Top = 82
      Width = 113
      Height = 16
      Caption = #1050#1088#1091#1075#1083#1099#1077' '#1079#1074#1105#1079#1076#1099
      TabOrder = 3
    end
    object chbOnClasses: TCheckBox
      Left = 32
      Top = 112
      Width = 129
      Height = 17
      Caption = #1055#1086' '#1082#1083#1072#1089#1089#1072#1084
      TabOrder = 4
    end
    object ButtonClear: TButton
      Left = 64
      Top = 51
      Width = 75
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 5
      OnClick = ButtonClearClick
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 672
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 529
    object TreeView: TTreeView
      Left = 1
      Top = 1
      Width = 119
      Height = 670
      Align = alClient
      Images = VirtualImageList
      Indent = 19
      TabOrder = 0
      Items.NodeData = {
        070500000009540054007200650065004E006F00640065002500000000000000
        0000000000000000FFFFFFFF0000000000000000000000000001031A04430431
        040000250000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        00000000010328043004400400002F0000000000000000000000FFFFFFFFFFFF
        FFFF000000000000000000000000000108130435043A04410430044D04340440
        0400002B000000010000000100000001000000FFFFFFFF000000000000000000
        00000000010613043B043E0431044304410400002D0000000200000002000000
        02000000FFFFFFFF000000000000000000000000000107260438043B0438043D
        0434044004}
    end
  end
  object GLScene: TGLScene
    Left = 408
    Top = 32
    object LightSource: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000404000004040000000000000803F}
      SpotCutOff = 180.000000000000000000
    end
    object Camera: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = dcStarbox
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {0000004000000000000000000000803F}
    end
    object dcStarbox: TGLDummyCube
      Direction.Coordinates = {000000000000803F0000000000000000}
      RollAngle = 30.000000000000000000
      Up.Coordinates = {000000BF00000000D7B35DBF00000000}
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
    end
  end
  object GLSimpleNavigation: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer
    FormCaption = 'Starbox C - %FPS'
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
    Left = 580
    Top = 30
  end
  object GLCadencer: TGLCadencer
    Left = 410
    Top = 176
  end
  object MatLibColors: TGLMaterialLibrary
    Materials = <
      item
        Name = 'ClassO'
        Tag = 0
        Material.FrontProperties.Ambient.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Diffuse.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Emission.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Specular.Color = {00000000000000000000803F0000803F}
      end
      item
        Name = 'ClassB'
        Tag = 0
        Material.FrontProperties.Ambient.Color = {AE47613ED7A3303F52B85E3F0000803F}
        Material.FrontProperties.Diffuse.Color = {AE47613ED7A3303F52B85E3F0000803F}
        Material.FrontProperties.Emission.Color = {AE47613ED7A3303F52B85E3F0000803F}
        Material.FrontProperties.Specular.Color = {AE47613ED7A3303F52B85E3F0000803F}
      end
      item
        Name = 'ClassA'
        Tag = 0
        Material.FrontProperties.Ambient.Color = {EAEA6A3FEAEA6A3FA7AD2D3F0000803F}
        Material.FrontProperties.Diffuse.Color = {EAEA6A3FEAEA6A3FA7AD2D3F0000803F}
        Material.FrontProperties.Emission.Color = {EAEA6A3FEAEA6A3FA7AD2D3F0000803F}
        Material.FrontProperties.Specular.Color = {EAEA6A3FEAEA6A3FA7AD2D3F0000803F}
      end
      item
        Name = 'ClassF'
        Tag = 0
        Material.FrontProperties.Ambient.Color = {DCD6D63E938E0E3F938C0C3E0000803F}
        Material.FrontProperties.Diffuse.Color = {DCD6D63E938E0E3F938C0C3E0000803F}
        Material.FrontProperties.Emission.Color = {DCD6D63E938E0E3F938C0C3E0000803F}
        Material.FrontProperties.Specular.Color = {DCD6D63E938E0E3F938C0C3E0000803F}
      end
      item
        Name = 'ClassG'
        Tag = 0
        Material.FrontProperties.Ambient.Color = {0000803F0000803F000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F0000803F000000000000803F}
        Material.FrontProperties.Emission.Color = {0000803F0000803F000000000000803F}
        Material.FrontProperties.Specular.Color = {0000803F0000803F000000000000803F}
      end
      item
        Name = 'ClassK'
        Tag = 0
        Material.FrontProperties.Ambient.Color = {0000803F0000003F000000000000803F}
      end
      item
        Name = 'ClassM'
        Tag = 0
      end>
    Left = 761
    Top = 35
  end
  object MainMenu: TMainMenu
    Left = 784
    Top = 178
    object miFile: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object miNew: TMenuItem
        Caption = '&'#1053#1086#1074#1099#1081
      end
      object miOpen: TMenuItem
        Caption = '&'#1054#1090#1082#1088#1099#1090#1100'...'
      end
      object miSave: TMenuItem
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
      object miSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082'...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = '&'#1042#1099#1093#1086#1076
      end
    end
    object miView: TMenuItem
      Caption = '&'#1042#1080#1076
      object miProjections: TMenuItem
        Caption = '&'#1055#1088#1086#1077#1082#1094#1080#1080'...'
        OnClick = miProjectionsClick
      end
      object miStarLife: TMenuItem
        Caption = '&'#1042#1088#1077#1084#1103' '#1078#1080#1079#1085#1080'...'
        OnClick = miStarLifeClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Hide1: TMenuItem
        Caption = '&'#1062#1074#1077#1090#1086#1074#1072#1103' '#1096#1082#1072#1083#1072'...'
      end
    end
    object miTools: TMenuItem
      Caption = '&'#1054#1087#1094#1080#1080
      object miSettings: TMenuItem
        Caption = '&'#1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object miHide: TMenuItem
        Caption = '&'#1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1080
      end
      object miShow: TMenuItem
        Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100'...'
      end
    end
    object miHelp: TMenuItem
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      object miContent: TMenuItem
        Caption = #1042#1080#1082#1080'...'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = miAboutClick
      end
    end
  end
  object VirtualImageList: TVirtualImageList
    Images = <>
    ImageCollection = ImageCollection
    Width = 9
    Height = 9
    Left = 408
    Top = 506
  end
  object ImageCollection: TImageCollection
    Images = <>
    Left = 406
    Top = 378
  end
end
