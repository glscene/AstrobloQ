object FormGalaxy: TFormGalaxy
  Left = 70
  Top = 80
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  Caption = 'Web Galaxy'
  ClientHeight = 936
  ClientWidth = 1476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 168
  DesignSize = (
    1476
    936)
  TextHeight = 23
  object StatusBar: TStatusBar
    Left = 0
    Top = 904
    Width = 1476
    Height = 32
    Cursor = crHandPoint
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
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
        Width = 88
      end>
    ExplicitTop = 697
    ExplicitWidth = 1904
  end
  object Panel1: TPanel
    Left = 0
    Top = 743
    Width = 1476
    Height = 161
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 536
    ExplicitWidth = 1904
    DesignSize = (
      1476
      161)
    object Label1: TLabel
      Left = 22
      Top = 6
      Width = 76
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'xRadius'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 22
      Top = 55
      Width = 76
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'yRadius'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 22
      Top = 104
      Width = 75
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'zRadius'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 351
      Top = 6
      Width = 54
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Slices'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 344
      Top = 55
      Width = 62
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Stacks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 953
      Top = 6
      Width = 69
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Bottom'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 1271
      Top = 55
      Width = 43
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Stop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 1271
      Top = 6
      Width = 46
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Start'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 658
      Top = 6
      Width = 37
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Top'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 1572
      Top = 6
      Width = 78
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akBottom]
      Caption = 'xyCurve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 1572
      Top = 55
      Width = 66
      Height = 27
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akBottom]
      Caption = 'zCurve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object zRadiusTrackBar: TTrackBar
      Left = 102
      Top = 99
      Width = 245
      Height = 54
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 100
      Min = 1
      PageSize = 1
      Position = 20
      TabOrder = 2
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object yRadiusTrackBar: TTrackBar
      Left = 102
      Top = 50
      Width = 245
      Height = 54
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 100
      Min = 1
      PageSize = 1
      Position = 20
      TabOrder = 1
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object xRadiusTrackBar: TTrackBar
      Left = 102
      Top = 1
      Width = 245
      Height = 54
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 100
      Min = 1
      PageSize = 1
      Position = 20
      TabOrder = 0
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object GridCheckBox: TCheckBox
      Left = 354
      Top = 105
      Width = 123
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Hide Grid'
      TabOrder = 5
      OnClick = GridCheckBoxClick
    end
    object ArrowsCheckBox: TCheckBox
      Left = 483
      Top = 105
      Width = 154
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Hide Arrows'
      TabOrder = 6
      OnClick = ArrowsCheckBoxClick
    end
    object StacksTrackBar: TTrackBar
      Left = 413
      Top = 50
      Width = 245
      Height = 54
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 128
      Min = 2
      PageSize = 4
      Position = 16
      TabOrder = 4
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object SlicesTrackBar: TTrackBar
      Left = 413
      Top = 6
      Width = 245
      Height = 51
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 128
      Min = 2
      PageSize = 4
      Position = 16
      TabOrder = 3
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object TopCapRadioGroup: TRadioGroup
      Left = 659
      Top = 83
      Width = 290
      Height = 51
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Top Cap'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'None'
        'Center'
        'Flat')
      TabOrder = 8
      OnClick = AnyChange
    end
    object BottomTrackBar: TTrackBar
      Left = 1022
      Top = 1
      Width = 245
      Height = 54
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 90
      PageSize = 5
      Position = 90
      TabOrder = 9
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object TopTrackBar: TTrackBar
      Left = 704
      Top = 6
      Width = 245
      Height = 51
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 90
      PageSize = 5
      Position = 90
      TabOrder = 7
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object BottomCapRadioGroup: TRadioGroup
      Left = 956
      Top = 83
      Width = 311
      Height = 51
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Bottom Cap'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'None'
        'Center'
        'Flat')
      TabOrder = 10
      OnClick = AnyChange
    end
    object Button1: TButton
      Left = 1322
      Top = 98
      Width = 238
      Height = 43
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Cube Map'
      TabOrder = 13
      OnClick = Button1Click
    end
    object StopTrackBar: TTrackBar
      Left = 1322
      Top = 53
      Width = 245
      Height = 52
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 360
      PageSize = 5
      Position = 360
      TabOrder = 12
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = StopTrackBarChange
    end
    object StartTrackBar: TTrackBar
      Left = 1322
      Top = 6
      Width = 245
      Height = 51
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akBottom]
      Max = 360
      PageSize = 5
      TabOrder = 11
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = StartTrackBarChange
    end
    object xyCurveTrackBar: TTrackBar
      Left = 1652
      Top = 1
      Width = 245
      Height = 54
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akBottom]
      Max = 100
      Min = 2
      PageSize = 5
      Position = 10
      TabOrder = 14
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
    object zCurveTrackBar: TTrackBar
      Left = 1652
      Top = 50
      Width = 245
      Height = 54
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akBottom]
      Max = 100
      Min = 2
      PageSize = 5
      Position = 10
      TabOrder = 15
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = AnyChange
    end
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 1476
    Height = 736
    Cursor = crHandPoint
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 72.706138610839840000
    PenAsTouch = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    OnMouseUp = GLSceneViewer1MouseUp
    TabOrder = 2
    ExplicitHeight = 529
  end
  object GLScene1: TGLScene
    Left = 40
    Top = 40
    object GLCamera1: TGLCamera
      DepthOfView = 1000.000000000000000000
      FocalLength = 500.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000F0410000A0410000F0410000803F}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object GLDummyCube1: TGLDummyCube
      Direction.Coordinates = {0000000000000000000080BF00000000}
      CubeSize = 1.000000000000000000
      EdgeColor.Color = {EC51B83ECDCC4C3EEC51B83D0000803F}
      object GLMesh1: TGLMesh
        Material.FrontProperties.Diffuse.Color = {B1A8A83EB1A8A83EB1A8A83E0000803F}
        Direction.Coordinates = {0000000000000000000080BF00000000}
        Mode = mmTriangles
      end
    end
    object ObjectsCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      EdgeColor.Color = {0000803F00000000000000000000803F}
      object ArrowZ: TGLArrowLine
        Material.FrontProperties.Emission.Color = {00000000000000000000803F0000803F}
        Position.Coordinates = {0000000000000000000000400000803F}
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
        BottomRadius = 0.050000000745058060
        Height = 4.000000000000000000
        TopRadius = 0.050000000745058060
        TopArrowHeadHeight = 0.500000000000000000
        TopArrowHeadRadius = 0.100000001490116100
        BottomArrowHeadHeight = 0.500000000000000000
        BottomArrowHeadRadius = 0.200000002980232200
      end
      object GLXYZGridXZ: TGLXYZGrid
        LineColor.Color = {B1A8A83EB1A8A83EB1A8A83E0000803F}
        XSamplingScale.Min = -10.000000000000000000
        XSamplingScale.Max = 10.000000000000000000
        XSamplingScale.Step = 1.000000000000000000
        YSamplingScale.Step = 1.000000000000000000
        ZSamplingScale.Min = -10.000000000000000000
        ZSamplingScale.Max = 10.000000000000000000
        ZSamplingScale.Step = 1.000000000000000000
        Parts = [gpX, gpZ]
      end
    end
    object GLHUDText1: TGLHUDText
      Position.Coordinates = {0000804000000000000000000000803F}
      BitmapFont = GLWindowsBitmapFont1
      Rotation = 0.000000000000000000
    end
  end
  object GLWindowsBitmapFont1: TGLWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCream
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Ranges = <
      item
        StartASCII = ' '
        StopASCII = #176
        StartGlyphIdx = 0
      end>
    Left = 225
    Top = 40
  end
end
