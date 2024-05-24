object FormPX: TFormPX
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'FermiPX - '#1089#1080#1084#1091#1083#1103#1090#1086#1088' '#1087#1072#1088#1072#1076#1086#1082#1089#1072' '#1060#1077#1088#1084#1080
  ClientHeight = 779
  ClientWidth = 1376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 168
  DesignSize = (
    1376
    779)
  TextHeight = 23
  object LabelStarClass: TLabel
    Left = 1243
    Top = 37
    Width = 105
    Height = 23
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = #1050#1083#1072#1089#1089' '#1079#1074#1105#1079#1076
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 746
    Width = 1376
    Height = 33
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <
      item
        Text = 'Total points:'
        Width = 438
      end
      item
        Text = 'FPS:'
        Width = 88
      end>
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = -18
    Width = 1233
    Height = 762
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 165.047180175781300000
    PenAsTouch = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 1
  end
  object CheckListBox1: TCheckListBox
    Left = 1243
    Top = 70
    Width = 133
    Height = 197
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 26
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 26
    Items.Strings = (
      '"A"'
      '"B"'
      '"F"'
      '"G"'
      '"K"'
      '"M"'
      '"O"')
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    OnClickCheck = CheckListBox1ClickCheck
  end
  object GLScene1: TGLScene
    Left = 232
    Top = 8
    object GLCamera1: TGLCamera
      DepthOfView = 200.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = dcGalablock
      Position.Coordinates = {0000004000000040000000400000803F}
    end
    object dcGalablock: TGLDummyCube
      ShowAxes = True
      CubeSize = 10.000000000000000000
      VisibleAtRunTime = True
      object GLLines1: TGLLines
        Visible = False
        NodeColor.Color = {0000803F0000803F0000803F0000803F}
        Nodes = <>
        Options = []
      end
      object GLStars: TGLPoints
        Visible = False
        NoZWrite = False
        Static = False
      end
      object GLPolygon1: TGLPolygon
        Nodes = <>
      end
      object GLTetrahedron1: TGLTetrahedron
        Material.Texture.BorderColor.Color = {9A93133FE4DB5B3FEBE0E03E0000803F}
        Direction.Coordinates = {000000000000803F0000000000000000}
        Position.Coordinates = {0000803F0000803F0000803F0000803F}
        Up.Coordinates = {8B8F67BF000000004A51DABE00000000}
        Visible = False
      end
      object GLFreeForm1: TGLFreeForm
        Material.FrontProperties.Diffuse.Color = {EBE0E03EE4DB5B3F9A93133F0000803F}
      end
    end
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000000000000000000040400000803F}
      LightStyle = lsParallel
      Specular.Color = {0000803F0000803F0000803F0000803F}
      SpotCutOff = 180.000000000000000000
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 234
    Top = 106
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 360
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 658
    Top = 8
    object Start1: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnClick = Start1Click
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = Exit1Click
      end
    end
    object Mode1: TMenuItem
      Caption = #1056#1077#1078#1080#1084
      object Points1: TMenuItem
        Caption = #1047#1074#1105#1079#1076#1099
        RadioItem = True
        OnClick = Points1Click
      end
      object Delaunay1: TMenuItem
        Caption = #1058#1077#1090#1088#1072#1089#1077#1090#1100' '#1044#1077#1083#1086#1085#1077
        RadioItem = True
        OnClick = Delaunay1Click
      end
      object Voronoi1: TMenuItem
        Caption = #1055#1086#1083#1080#1089#1077#1090#1100' '#1042#1086#1088#1086#1085#1086#1075#1086
        RadioItem = True
        OnClick = Voronoi1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
    end
    object Data1: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1094#1072
      OnClick = Data1Click
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 502
    Top = 8
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\dgoni\Documents\Embarcadero\Studio\STARS_DB\DA' +
        'TA\A_Delaunay.sqlite'
      'DriverID=SQLite')
    Left = 136
    Top = 198
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 258
    Top = 198
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 444
    Top = 198
  end
end
