object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1041#1083#1086#1082' '#1089#1083#1091#1095#1072#1081#1085#1099#1093' '#1079#1074#1105#1079#1076
  ClientHeight = 445
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 602
    Height = 426
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 153.578933715820300000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 426
    Width = 788
    Height = 19
    Panels = <
      item
        Text = 'Exec Time:'
        Width = 670
      end
      item
        Text = 'FPS:'
        Width = 50
      end>
    ExplicitTop = 401
    ExplicitWidth = 780
  end
  object PanelLeft: TPanel
    Left = 602
    Top = 0
    Width = 186
    Height = 426
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 594
    ExplicitHeight = 401
    object ButtonClear: TButton
      Left = 58
      Top = 333
      Width = 86
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1083#1086#1082
      TabOrder = 0
      OnClick = ButtonClearClick
    end
    object rgBlock: TRadioGroup
      Left = 19
      Top = 55
      Width = 149
      Height = 157
      Caption = #1041#1083#1086#1082
      ItemIndex = 0
      Items.Strings = (
        #1050#1091#1073
        #1064#1072#1088
        #1057#1092#1077#1088#1072
        #1062#1080#1083#1080#1085#1076#1088)
      TabOrder = 1
    end
    object btnDraw: TButton
      Left = 38
      Top = 229
      Width = 116
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnDrawClick
    end
    object seNStars: TSpinEdit
      Left = 96
      Top = 17
      Width = 74
      Height = 22
      MaxValue = 1000000
      MinValue = 1
      TabOrder = 3
      Value = 1000
    end
    object StaticText1: TStaticText
      Left = 21
      Top = 22
      Width = 66
      Height = 17
      Caption = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076
      TabOrder = 4
    end
  end
  object GLScene1: TGLScene
    Left = 24
    Top = 16
    object dcBlock: TGLDummyCube
      Scale.Coordinates = {00000040000000400000004000000000}
      ShowAxes = True
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
      object Stars: TGLPoints
        NoZWrite = False
        Static = False
      end
    end
    object GLLightSource1: TGLLightSource
      Ambient.Color = {0000803F0000803F0000803F0000803F}
      ConstAttenuation = 1.000000000000000000
      SpotCutOff = 180.000000000000000000
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = dcBlock
      Position.Coordinates = {0000004000000040000000400000803F}
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 206
    Top = 28
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 348
    Top = 28
  end
  object MainMenu1: TMainMenu
    Left = 549
    Top = 32
  end
end
