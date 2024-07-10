object FormPX: TFormPX
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'FermiPC'
  ClientHeight = 779
  ClientWidth = 1376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 168
  TextHeight = 23
  object StatusBar1: TStatusBar
    Left = 0
    Top = 742
    Width = 1376
    Height = 37
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
  object PageControl1: TPageControl
    Left = 0
    Top = 51
    Width = 1376
    Height = 691
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = tsCatalog
    Align = alClient
    TabOrder = 1
    object tsAstronet: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Starnet'
      object GLSceneViewer1: TGLSceneViewer
        Left = 0
        Top = 0
        Width = 1106
        Height = 653
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Camera = GLCamera1
        Buffer.BackgroundColor = clBlack
        FieldOfView = 162.586807250976600000
        PenAsTouch = False
        Align = alClient
        OnMouseDown = GLSceneViewer1MouseDown
        OnMouseMove = GLSceneViewer1MouseMove
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 1106
        Top = 0
        Width = 262
        Height = 653
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        TabOrder = 1
        DesignSize = (
          262
          653)
        object LabelStarClass: TLabel
          Left = 36
          Top = 23
          Width = 79
          Height = 23
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Star class'
        end
        object CheckListBox1: TCheckListBox
          Left = 19
          Top = 56
          Width = 173
          Height = 253
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
          ItemHeight = 30
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
          OnClickCheck = CheckListBox1ClickCheck
        end
        object rgMode: TRadioGroup
          Left = 24
          Top = 350
          Width = 229
          Height = 155
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Mode'
          ItemIndex = 0
          Items.Strings = (
            'Stars'
            'Tetranet'
            'Polynet'
            'Galagrid')
          TabOrder = 1
        end
      end
    end
    object tsCatalog: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Catalog'
      ImageIndex = 1
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 1376
    Height = 51
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    RowSize = 46
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 19
      Top = 2
      Width = 263
      Height = 88
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ButtonHeight = 39
      ButtonWidth = 40
      Caption = 'ToolBar1'
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
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
    Left = 658
    Top = 120
    object miFile: TMenuItem
      Caption = 'File'
      object miStart: TMenuItem
        Caption = 'Open...'
        OnClick = miStartClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object miMode: TMenuItem
      Caption = 'Mode'
      object miStars: TMenuItem
        Caption = 'Stars'
        RadioItem = True
        OnClick = miStarsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miDelaunay: TMenuItem
        Caption = 'Tetranet'
        RadioItem = True
        OnClick = miDelaunayClick
      end
      object miVoronoi: TMenuItem
        Caption = 'Polynet'
        RadioItem = True
        OnClick = miVoronoiClick
      end
      object Galagrid1: TMenuItem
        Caption = 'Galagrid'
      end
    end
    object N3: TMenuItem
      Caption = 'View'
      object miCatalog: TMenuItem
        Caption = 'Catalog'
        OnClick = miCatalogClick
      end
      object miSpace: TMenuItem
        Caption = 'Scene'
      end
    end
    object ools1: TMenuItem
      Caption = 'Tools'
      object Starlife1: TMenuItem
        Caption = 'Starlife...'
        OnClick = Starlife1Click
      end
    end
    object N4: TMenuItem
      Caption = 'Help'
      object N5: TMenuItem
        Caption = 'Ruwiki...'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = 'About...'
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 250
    Top = 456
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
  object ImageList1: TImageList
    Left = 523
    Top = 114
  end
end
