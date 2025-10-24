object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'StarViewer'
  ClientHeight = 498
  ClientWidth = 795
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 479
    Width = 795
    Height = 19
    Panels = <
      item
        Text = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076':'
        Width = 680
      end
      item
        Text = #1042#1088#1077#1084#1103':'
        Width = 100
      end>
    ExplicitTop = 454
    ExplicitWidth = 787
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 154
    Top = 0
    Width = 641
    Height = 479
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 147.415298461914100000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    TabOrder = 1
    ExplicitWidth = 633
    ExplicitHeight = 454
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 154
    Height = 479
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 454
    object Label2: TLabel
      Left = 26
      Top = 16
      Width = 79
      Height = 16
      Caption = #1050#1083#1072#1089#1089#1099' '#1079#1074#1105#1079#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ShapeO: TShape
      Left = 97
      Top = 38
      Width = 41
      Height = 25
      Brush.Color = clBlue
    end
    object ShapeA: TShape
      Left = 97
      Top = 100
      Width = 41
      Height = 25
    end
    object ShapeF: TShape
      Left = 97
      Top = 131
      Width = 41
      Height = 25
      Brush.Color = clLime
    end
    object ShapeG: TShape
      Left = 97
      Top = 162
      Width = 41
      Height = 25
      Brush.Color = clYellow
    end
    object ShapeK: TShape
      Left = 97
      Top = 193
      Width = 41
      Height = 25
      Brush.Color = clFuchsia
    end
    object ShapeM: TShape
      Left = 97
      Top = 224
      Width = 41
      Height = 25
      Brush.Color = clRed
    end
    object ShapeB: TShape
      Left = 97
      Top = 69
      Width = 41
      Height = 25
      Brush.Color = clAqua
    end
    object Button1: TButton
      Left = 7
      Top = 448
      Width = 141
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1094#1077#1085#1091
      TabOrder = 0
      OnClick = Button1Click
    end
    object chbO: TCheckBox
      Left = 8
      Top = 38
      Width = 33
      Height = 25
      Caption = 'O'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = chbOClick
    end
    object chbB: TCheckBox
      Left = 8
      Top = 69
      Width = 41
      Height = 25
      Caption = 'B'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      OnClick = chbBClick
    end
    object chbA: TCheckBox
      Left = 8
      Top = 100
      Width = 34
      Height = 25
      Caption = 'A'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
      OnClick = chbAClick
    end
    object chbF: TCheckBox
      Left = 8
      Top = 131
      Width = 33
      Height = 25
      Caption = 'F'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 4
      OnClick = chbFClick
    end
    object chbG: TCheckBox
      Left = 8
      Top = 162
      Width = 33
      Height = 25
      Caption = 'G'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 5
      OnClick = chbGClick
    end
    object chbK: TCheckBox
      Left = 8
      Top = 193
      Width = 33
      Height = 25
      Caption = 'K'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 6
      OnClick = chbKClick
    end
    object chbM: TCheckBox
      Left = 8
      Top = 224
      Width = 33
      Height = 25
      Caption = 'M'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 7
      OnClick = chbMClick
    end
  end
  object GLScene1: TGLScene
    Left = 250
    Top = 18
    object GLCamera1: TGLCamera
      DepthOfView = 10000.000000000000000000
      FocalLength = 70.000000000000000000
      TargetObject = GLDummyCube1
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {0000004000000040000000400000803F}
    end
    object GLDummyCube1: TGLDummyCube
      ShowAxes = True
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
      object GLTypeM: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLTypeK: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLTypeG: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLTypeF: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLTypeA: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLTypeB: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLTypeO: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLPoints1: TGLPoints
        NoZWrite = False
        Static = False
      end
    end
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      SpotCutOff = 180.000000000000000000
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 372
    Top = 18
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 370
    Top = 106
  end
  object MainMenu1: TMainMenu
    Left = 250
    Top = 106
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenCSV1: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' CSV...'
        OnClick = OpenCSV1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = Exit1Click
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 604
    Top = 36
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer1
    FormCaption = 'StarViewer - %FPS'
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
    Left = 608
    Top = 128
  end
end
