object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Random stars in container'
  ClientHeight = 785
  ClientWidth = 1021
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
    Width = 835
    Height = 766
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 165.124389648437500000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 766
    Width = 1021
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
    ExplicitTop = 497
    ExplicitWidth = 788
  end
  object PanelLeft: TPanel
    Left = 835
    Top = 0
    Width = 186
    Height = 766
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 602
    ExplicitHeight = 497
    object Button2: TButton
      Left = 50
      Top = 300
      Width = 86
      Height = 25
      Caption = 'Clear scene'
      TabOrder = 0
      OnClick = Button2Click
    end
    object rgContainer: TRadioGroup
      Left = 19
      Top = 55
      Width = 149
      Height = 178
      Caption = 'Container'
      Items.Strings = (
        'Cube'
        'Sphere'
        'Sphere Surface'
        'Cylinder'
        'Cone'
        'Thorus')
      TabOrder = 1
    end
    object btnDraw: TButton
      Left = 38
      Top = 249
      Width = 116
      Height = 25
      Caption = 'Draw random stars'
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
      Value = 1000000
    end
    object StaticText1: TStaticText
      Left = 21
      Top = 22
      Width = 39
      Height = 17
      Caption = 'N Stars'
      TabOrder = 4
    end
  end
  object GLScene1: TGLScene
    Left = 24
    Top = 16
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000004000000040000000400000803F}
    end
    object GLLightSource1: TGLLightSource
      Ambient.Color = {0000803F0000803F0000803F0000803F}
      ConstAttenuation = 1.000000000000000000
      SpotCutOff = 180.000000000000000000
    end
    object GLDummyCube1: TGLDummyCube
      Scale.Coordinates = {00000040000000400000004000000000}
      ShowAxes = True
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
      object GLPoints1: TGLPoints
        NoZWrite = False
        Static = False
      end
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
