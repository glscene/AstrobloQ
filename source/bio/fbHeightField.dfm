object FormHeightField: TFormHeightField
  Left = 343
  Top = 207
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Height field'
  ClientHeight = 299
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  TextHeight = 13
  object GLSceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 517
    Height = 266
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 138.793518066406300000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewerMouseDown
    OnMouseMove = GLSceneViewerMouseMove
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 266
    Width = 517
    Height = 33
    Align = alBottom
    TabOrder = 1
    object LabelOpacity: TLabel
      Left = 288
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Opacity'
      Enabled = False
    end
    object Panel4: TPanel
      Left = 437
      Top = 1
      Width = 87
      Height = 31
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 429
      ExplicitHeight = 32
      object btnRun: TBitBtn
        Left = 3
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Close'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnRunClick
      end
    end
    object cbGrid: TCheckBox
      Left = 10
      Top = 8
      Width = 63
      Height = 17
      Caption = 'Grid'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbGridClick
    end
    object cbAxis: TCheckBox
      Left = 60
      Top = 8
      Width = 49
      Height = 17
      Caption = 'Axis'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = cbAxisClick
    end
    object tbAlpha: TTrackBar
      Left = 360
      Top = 4
      Width = 65
      Height = 25
      Enabled = False
      Max = 100
      Position = 100
      TabOrder = 3
      TickStyle = tsNone
      OnChange = tbAlphaChange
    end
    object cbColorMode: TComboBox
      Left = 176
      Top = 6
      Width = 107
      Height = 32
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
      Left = 115
      Top = 7
      Width = 49
      Height = 16
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
