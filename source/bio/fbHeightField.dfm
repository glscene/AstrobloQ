object FormHeightField: TFormHeightField
  Left = 343
  Top = 207
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Height field'
  ClientHeight = 524
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 24
  object GLSceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 904
    Height = 466
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 155.776901245117200000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewerMouseDown
    OnMouseMove = GLSceneViewerMouseMove
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 466
    Width = 904
    Height = 58
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alBottom
    TabOrder = 1
    object LabelOpacity: TLabel
      Left = 504
      Top = 18
      Width = 63
      Height = 24
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Opacity'
      Enabled = False
    end
    object Panel4: TPanel
      Left = 750
      Top = 1
      Width = 153
      Height = 56
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnRun: TBitBtn
        Left = 5
        Top = 11
        Width = 132
        Height = 43
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Close'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnRunClick
      end
    end
    object cbGrid: TCheckBox
      Left = 18
      Top = 14
      Width = 109
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Grid'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbGridClick
    end
    object cbAxis: TCheckBox
      Left = 105
      Top = 14
      Width = 85
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Axis'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = cbAxisClick
    end
    object tbAlpha: TTrackBar
      Left = 630
      Top = 7
      Width = 113
      Height = 43
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Enabled = False
      Max = 100
      Position = 100
      TabOrder = 3
      ThumbLength = 35
      TickStyle = tsNone
      OnChange = tbAlphaChange
    end
    object cbColorMode: TComboBox
      Left = 308
      Top = 11
      Width = 188
      Height = 32
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ItemIndex = 0
      TabOrder = 4
      Text = 'Ambient'
      OnChange = cbColorModeChange
      Items.Strings = (
        'Ambient'
        'Ambient+Diffuse'
        'Diffuse'
        'Emission'
        'None')
    end
    object cbLighting: TCheckBox
      Left = 202
      Top = 12
      Width = 85
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Light'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = cbLightingClick
    end
  end
  object GLScene: TGLScene
    Left = 12
    Top = 14
    object LightCube: TGLDummyCube
      Direction.Coordinates = {0000000000000000000080BF00000000}
      CubeSize = 1.000000000000000000
      object Light: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        Position.Coordinates = {0000F041000048420000C8420000803F}
        LightStyle = lsParallel
        Specular.Color = {0000803F0000803F0000803F0000803F}
        SpotCutOff = 180.000000000000000000
      end
    end
    object FocusCube: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object Grid: TGLXYZGrid
      Position.Coordinates = {0000000000000000CDCCCCBD0000803F}
      XSamplingScale.Step = 0.100000001490116100
      YSamplingScale.Step = 0.100000001490116100
      ZSamplingScale.Step = 0.100000001490116100
    end
    object XAxis: TGLArrowLine
      Material.FrontProperties.Emission.Color = {CDCC4C3FCDCC4C3FCDCC4C3F0000803F}
      Direction.Coordinates = {0000803F000000000000000000000000}
      Position.Coordinates = {0000000000000000CDCCCCBD0000803F}
      BottomRadius = 0.100000001490116100
      Height = 1.000000000000000000
      TopRadius = 0.100000001490116100
      TopArrowHeadHeight = 0.500000000000000000
      TopArrowHeadRadius = 0.200000002980232200
      BottomArrowHeadHeight = 0.500000000000000000
      BottomArrowHeadRadius = 0.200000002980232200
    end
    object YAxis: TGLArrowLine
      Material.FrontProperties.Emission.Color = {CDCC4C3FCDCC4C3FCDCC4C3F0000803F}
      Direction.Coordinates = {000000000000803F0000000000000000}
      Position.Coordinates = {0000000000000000CDCCCCBD0000803F}
      Up.Coordinates = {0000000000000000000080BF00000000}
      BottomRadius = 0.100000001490116100
      Height = 1.000000000000000000
      TopRadius = 0.100000001490116100
      TopArrowHeadHeight = 0.500000000000000000
      TopArrowHeadRadius = 0.200000002980232200
      BottomArrowHeadHeight = 0.500000000000000000
      BottomArrowHeadRadius = 0.200000002980232200
    end
    object HeatField: TGLHeightField
      Material.BlendingMode = bmTransparency
      XSamplingScale.Step = 0.100000001490116100
      YSamplingScale.Step = 0.100000001490116100
      ColorMode = hfcmAmbient
    end
    object Camera: TGLCamera
      DepthOfView = 1000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = FocusCube
      Position.Coordinates = {000020410000A0400000A0410000803F}
      Direction.Coordinates = {000000000000803F0000000000000000}
      Up.Coordinates = {00000000000000000000803F00000000}
    end
  end
end
