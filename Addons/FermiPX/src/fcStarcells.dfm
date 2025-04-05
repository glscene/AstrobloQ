object FormPС: TFormPС
  Left = 0
  Top = 0
  Caption = 'Starnetc'
  ClientHeight = 542
  ClientWidth = 887
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 521
    Width = 887
    Height = 21
    Panels = <
      item
        Text = 'Total points:'
        Width = 250
      end
      item
        Text = 'FPS:'
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 887
    Height = 492
    ActivePage = tsSolarCube
    Align = alClient
    TabOrder = 1
    object tsSolarCube: TTabSheet
      Caption = #1057#1086#1083#1072#1088#1082#1091#1073
      object GLSceneViewer1: TGLSceneViewer
        Left = 0
        Top = 0
        Width = 729
        Height = 464
        Camera = GLCamera1
        Buffer.BackgroundColor = clBlack
        FieldOfView = 155.675598144531300000
        PenAsTouch = False
        Align = alClient
        OnMouseDown = GLSceneViewer1MouseDown
        OnMouseMove = GLSceneViewer1MouseMove
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 729
        Top = 0
        Width = 150
        Height = 464
        Align = alRight
        TabOrder = 1
        DesignSize = (
          150
          464)
        object LabelStarClass: TLabel
          Left = 21
          Top = 13
          Width = 29
          Height = 13
          Caption = #1050#1083#1072#1089#1089
        end
        object chlbClass: TCheckListBox
          Left = 11
          Top = 32
          Width = 99
          Height = 145
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 15
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 17
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
          TabOrder = 0
          OnClickCheck = chlbClassClickCheck
        end
      end
    end
    object tsCatalog: TTabSheet
      Caption = #1050#1072#1090#1072#1083#1086#1075
      ImageIndex = 1
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 887
    Height = 29
    Align = alTop
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 19
      Top = 2
      Width = 150
      Height = 22
      Caption = 'ToolBar1'
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'ToolButton1'
        ImageIndex = 0
      end
    end
  end
  object GLScene1: TGLScene
    Left = 862
    Top = 134
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
    Left = 388
    Top = 330
  end
  object MainMenu: TMainMenu
    Left = 82
    Top = 160
    object miFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object miStart: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'..'
        OnClick = miStartClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miExitClick
      end
    end
    object miMode: TMenuItem
      Caption = #1052#1077#1090#1086#1076
      object miStars: TMenuItem
        Caption = #1047#1074#1105#1079#1076#1099
        RadioItem = True
        OnClick = miStarsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miTetranet: TMenuItem
        Caption = #1058#1077#1090#1088#1072#1085#1077#1090
        RadioItem = True
        OnClick = miTetranetClick
      end
      object miPolynet: TMenuItem
        Caption = #1055#1086#1083#1080#1085#1077#1090
        RadioItem = True
        OnClick = miPolynetClick
      end
      object miGalagrid: TMenuItem
        Caption = #1043#1072#1083#1072#1075#1088#1080#1076
      end
    end
    object N3: TMenuItem
      Caption = #1042#1080#1076
      object miCatalog: TMenuItem
        Caption = #1050#1072#1090#1072#1083#1086#1075
        OnClick = miCatalogClick
      end
      object miSpace: TMenuItem
        Caption = #1057#1094#1077#1085#1072
      end
      object Starlife1: TMenuItem
        Caption = 'Starlife...'
        OnClick = Starlife1Click
      end
    end
    object ools1: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      object miOptions: TMenuItem
        Caption = #1054#1087#1094#1080#1080'...'
        OnClick = miOptionsClick
      end
    end
    object N4: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N5: TMenuItem
        Caption = 'Ruwiki...'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = miAboutClick
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 250
    Top = 336
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\dgoni\Documents\Embarcadero\Studio\STARS_DB\DA' +
        'TA\A_Delaunay.sqlite'
      'DriverID=SQLite')
    Left = 994
    Top = 347
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
