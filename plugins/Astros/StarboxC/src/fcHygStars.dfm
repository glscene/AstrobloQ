object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Stars of HYG catalog'
  ClientHeight = 446
  ClientWidth = 771
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 771
    Height = 19
    Panels = <
      item
        Text = 'Total stars:'
        Width = 680
      end
      item
        Text = 'FPS:'
        Width = 50
      end>
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 135
    Top = 0
    Width = 635
    Height = 377
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 150.288558959960900000
    PenAsTouch = False
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 1
  end
  object ButtonDraw: TButton
    Left = 8
    Top = 396
    Width = 134
    Height = 25
    Caption = 'Draw Hyg stars'
    TabOrder = 2
    OnClick = ButtonDrawClick
  end
  object Button3: TButton
    Left = 640
    Top = 396
    Width = 123
    Height = 25
    Caption = 'Clear scene'
    TabOrder = 3
    OnClick = Button3Click
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 8
    Width = 121
    Height = 369
    ItemHeight = 17
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 346
    Top = 400
    Width = 160
    Height = 17
    Caption = 'Random stars in SolarBlock'
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object GLScene1: TGLScene
    Left = 250
    Top = 18
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000004000000040000000400000803F}
    end
    object GLDummyCube1: TGLDummyCube
      ShowAxes = True
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
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
      Caption = 'File'
      object OpenCSV1: TMenuItem
        Caption = 'Open CSV'
        OnClick = OpenCSV1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 772
    Top = 10
  end
end
