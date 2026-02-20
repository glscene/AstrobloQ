object FormSolarBlock: TFormSolarBlock
  Left = 0
  Top = 0
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SolarBlock'
  ClientHeight = 656
  ClientWidth = 898
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
  OnShow = FormShow
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 712
    Height = 656
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 155.905944824218800000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
  end
  object PanelLeft: TPanel
    Left = 712
    Top = 0
    Width = 186
    Height = 656
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 704
    ExplicitHeight = 631
    object Label1: TLabel
      Left = 16
      Top = 103
      Width = 47
      Height = 13
      Caption = 'FPS: 0.00'
    end
    object btnDraw: TButton
      Left = 38
      Top = 72
      Width = 116
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnDrawClick
    end
    object seNStars: TSpinEdit
      Left = 96
      Top = 17
      Width = 74
      Height = 22
      MaxValue = 1000000
      MinValue = 1
      TabOrder = 2
      Value = 100000
    end
    object StaticText1: TStaticText
      Left = 21
      Top = 22
      Width = 67
      Height = 17
      Caption = #1063#1080#1089#1083#1086' '#1090#1086#1095#1077#1082
      TabOrder = 1
    end
    object cbContainer: TComboBox
      Left = 16
      Top = 45
      Width = 153
      Height = 21
      TabOrder = 3
      Text = #1050#1091#1073
      Items.Strings = (
        #1050#1091#1073
        #1057#1092#1077#1088#1072
        #1062#1080#1083#1080#1085#1076#1088
        #1050#1086#1085#1091#1089)
    end
    object ButtonClear: TButton
      Left = 56
      Top = 240
      Width = 75
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 4
      OnClick = ButtonClearClick
    end
  end
  object GLScene1: TGLScene
    Left = 40
    Top = 104
    object GLCamera1: TGLCamera
      DepthOfView = 100000.000000000000000000
      FocalLength = 70.000000000000000000
      TargetObject = dcBlock
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {0000000000000000000040400000803F}
    end
    object dcBlock: TGLDummyCube
      Scale.Coordinates = {00000040000000400000004000000000}
      ShowAxes = True
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
      object Stars: TGLPoints
        NoZWrite = False
        Static = False
        Size = 10.000000000000000000
        Style = psSmooth
      end
    end
    object GLLightSource1: TGLLightSource
      Ambient.Color = {0000803F0000803F0000803F0000803F}
      ConstAttenuation = 1.000000000000000000
      SpotCutOff = 180.000000000000000000
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 142
    Top = 108
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 620
    Top = 92
  end
  object MainMenu1: TMainMenu
    Left = 549
    Top = 96
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object miOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miExitClick
      end
    end
    object N4: TMenuItem
      Caption = #1052#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077
      object miTetranet: TMenuItem
        Caption = #1057#1077#1090#1100' '#1090#1077#1090#1088#1072#1101#1076#1088#1086#1074'...'
      end
      object miUnifornet: TMenuItem
        Caption = #1059#1085#1080#1092#1086#1088#1084#1085#1072#1103' '#1089#1077#1090#1100'...'
      end
      object miInterpolate: TMenuItem
        Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103'...'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object miConvolute: TMenuItem
        Caption = #1057#1074#1105#1088#1090#1082#1072'...'
      end
    end
    object N2: TMenuItem
      Caption = #1042#1080#1076
      object miType: TMenuItem
        Caption = #1055#1088#1086#1077#1082#1094#1080#1080' '#1079#1074#1105#1079#1076'...'
        OnClick = miTypeClick
      end
      object N7: TMenuItem
        Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072' '#1043#1056'...'
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N8: TMenuItem
        Caption = 'RuWiki'
        ShortCut = 112
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = miAboutClick
      end
    end
  end
end
