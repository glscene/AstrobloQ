object frmStarblock: TfrmStarblock
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1088#1073#1083#1086#1082' '#1057#1086#1083#1085#1094#1072
  ClientHeight = 552
  ClientWidth = 910
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 533
    Width = 910
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
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 154
    Top = 0
    Width = 756
    Height = 533
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 150.565795898437500000
    PenAsTouch = False
    Align = alClient
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 154
    Height = 533
    Align = alLeft
    TabOrder = 2
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
    object ButtonClear: TButton
      Left = 7
      Top = 448
      Width = 141
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1090#1072#1088#1073#1083#1086#1082
      TabOrder = 0
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
      CubeSize = 1000.000000000000000000
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
    Left = 372
    Top = 18
  end
  object Timer1: TTimer
    Left = 370
    Top = 106
  end
  object MainMenu1: TMainMenu
    Left = 762
    Top = 34
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenCSV1: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' CSV...'
        Hint = #1050#1072#1090#1072#1083#1086#1075' Hyg '#1080#1083#1080' '#1089#1083#1091#1095#1072#1081#1085#1091#1102' '#1075#1077#1085#1077#1088#1072#1094#1080#1102
        OnClick = OpenCSV1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = #1042#1099#1093#1086#1076
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
    FormCaption = 'HygViewer - %FPS'
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
    Left = 256
    Top = 104
  end
end
