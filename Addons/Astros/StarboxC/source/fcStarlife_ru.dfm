object FormLife: TFormLife
  Left = 0
  Top = 0
  Caption = #1069#1074#1086#1083#1102#1094#1080#1103' '#1079#1074#1105#1079#1076#1085#1086#1075#1086' '#1089#1082#1086#1087#1083#1077#1085#1080#1103
  ClientHeight = 660
  ClientWidth = 957
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 755
    Height = 660
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 146.283203125000000000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 755
    Top = 0
    Width = 202
    Height = 660
    Align = alRight
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 76
      Width = 70
      Height = 16
      Caption = #1042#1088#1077#1084#1103': m.y.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ShapeO: TShape
      Left = 149
      Top = 158
      Width = 41
      Height = 25
      Brush.Color = clBlue
      OnMouseDown = ShapeOMouseDown
    end
    object ShapeB: TShape
      Left = 149
      Top = 185
      Width = 41
      Height = 25
      Brush.Color = clSkyBlue
      OnMouseDown = ShapeBMouseDown
    end
    object ShapeA: TShape
      Left = 149
      Top = 212
      Width = 41
      Height = 25
      OnMouseDown = ShapeAMouseDown
    end
    object ShapeF: TShape
      Left = 149
      Top = 239
      Width = 41
      Height = 25
      Brush.Color = clMoneyGreen
      OnMouseDown = ShapeFMouseDown
    end
    object ShapeG: TShape
      Left = 149
      Top = 266
      Width = 41
      Height = 25
      Brush.Color = clYellow
      OnMouseDown = ShapeGMouseDown
    end
    object ShapeK: TShape
      Left = 149
      Top = 293
      Width = 41
      Height = 25
      Brush.Color = clFuchsia
      OnMouseDown = ShapeKMouseDown
    end
    object ShapeM: TShape
      Left = 149
      Top = 320
      Width = 41
      Height = 25
      Brush.Color = clRed
      OnMouseDown = ShapeMMouseDown
    end
    object Label2: TLabel
      Left = 6
      Top = 132
      Width = 33
      Height = 16
      Caption = #1050#1083#1072#1089#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 70
      Top = 132
      Width = 12
      Height = 16
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnStart: TButton
      Left = 51
      Top = 18
      Width = 103
      Height = 33
      Caption = #1057#1090#1072#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnStartClick
    end
    object chbSpeed10: TCheckBox
      Left = 144
      Top = 77
      Width = 57
      Height = 17
      Caption = 'x 10 '
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = chbSpeed10Click
    end
    object stColor: TStaticText
      Left = 152
      Top = 132
      Width = 33
      Height = 20
      Caption = #1062#1074#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object chbO: TCheckBox
      Left = 16
      Top = 164
      Width = 105
      Height = 17
      Caption = 'O       0.1'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
      OnClick = chbOClick
    end
    object chbB: TCheckBox
      Left = 16
      Top = 191
      Width = 97
      Height = 17
      Caption = 'B       0.4'
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
    object chbA: TCheckBox
      Left = 16
      Top = 218
      Width = 105
      Height = 17
      Caption = 'A       0.5'
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
    object chbF: TCheckBox
      Left = 16
      Top = 245
      Width = 105
      Height = 17
      Caption = 'F       3'
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
    object chbK: TCheckBox
      Left = 16
      Top = 302
      Width = 105
      Height = 17
      Caption = 'K       12'
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
    object chbG: TCheckBox
      Left = 16
      Top = 273
      Width = 105
      Height = 17
      Caption = 'G       8'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 8
    end
    object chbM: TCheckBox
      Left = 16
      Top = 329
      Width = 105
      Height = 17
      Caption = 'M       76'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 9
      OnClick = chbMClick
    end
  end
  object GLScene1: TGLScene
    Left = 792
    Top = 44
    object GLSkyDome1: TGLSkyDome
      Bands = <
        item
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 15.000000000000000000
        end
        item
          StartAngle = 15.000000000000000000
          StopAngle = 90.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          Stacks = 4
        end>
      Stars = <
        item
          Color = clWhite
        end>
    end
    object GLCamera1: TGLCamera
      DepthOfView = 10000000000.000000000000000000
      FocalLength = 100.000000000000000000
      TargetObject = dcStarbox
      Position.Coordinates = {0080BB4400007A440080BB440000803F}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object dcStarbox: TGLDummyCube
      CubeSize = 1000.000000000000000000
      VisibleAtRunTime = True
      object StarsO: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
        Style = psSmoothAdditive
      end
      object StarsB: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
        Style = psSmooth
      end
      object StarsA: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
        Style = psSmooth
      end
      object StarsF: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
        Style = psSmooth
      end
      object StarsG: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
        Style = psSmooth
      end
      object StarsK: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
        Style = psSmooth
      end
      object StarsM: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
        Style = psSmooth
      end
    end
    object GLLensFlare1: TGLLensFlare
      Seed = 1465
      NumStreaks = 10
      NumSecs = 10
      Resolution = 10
      FlareIsNotOccluded = False
      Position.Coordinates = {000080C4000080C4000000000000803F}
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 334
    Top = 20
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer1
    FormCaption = #1069#1074#1086#1083#1102#1094#1080#1103' '#1089#1082#1086#1087#1083#1077#1085#1080#1103' '#1079#1074#1105#1079#1076' - %FPS'
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
    Left = 476
    Top = 20
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 597
    Top = 236
  end
  object ColorDialog1: TColorDialog
    Left = 218
    Top = 113
  end
end
