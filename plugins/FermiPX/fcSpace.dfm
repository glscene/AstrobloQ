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
    ActivePage = tsAstronet
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
    object tsParadox: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Paradox'
      ImageIndex = 2
      object TreeViewParadox: TTreeView
        Left = 0
        Top = 0
        Width = 351
        Height = 653
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        AutoExpand = True
        Indent = 33
        TabOrder = 0
        Items.NodeData = {
          070400000009540054007200650065004E006F00640065003700000000000000
          00000000FFFFFFFFFFFFFFFF00000000000000000003000000010C23043D0438
          043A0430043B044C043D043E04410442044C0400004B00000000000000000000
          00FFFFFFFFFFFFFFFF0000000000000000000000000001161B04380442043E04
          41044404350440044B0420003C0430043B043E044704380441043B0435043D04
          3D044B0400003B0000000000000000000000FFFFFFFFFFFFFFFF000000000000
          00000000000000010E110438043E0441044404350440044B0420004004350434
          043A0438040000430000000000000000000000FFFFFFFFFFFFFFFF0000000000
          000000000000000001121D043E043E0441044404350440044B04200035043404
          38043D04380447043D044B0420000000370000000000000000000000FFFFFFFF
          FFFFFFFF0000000000000000000C000000010C1A043004420430044104420440
          043E044404380437043C0400003B0000000000000000000000FFFFFFFFFFFFFF
          FF00000000000000000000000000010E2D0432043E043B044E04460438044F04
          2000370432045104370434040000470000000000000000000000FFFFFFFFFFFF
          FFFF000000000000000000000000000114130430043C043C0430042D00320441
          043F044B0448043A0438042000380420003F043E043B044F0400004700000000
          00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001141E04
          400431043804420430043B044C043D044B043504200034043204380436043504
          3D0438044F040000430000000000000000000000FFFFFFFFFFFFFFFF00000000
          0000000000000000000112100441044204350440043E04380434044B04200038
          0420003A043E043C04350442044B040000490000000000000000000000FFFFFF
          FFFFFFFFFF000000000000000000000000000115220435043A0442043E043D04
          38043A043004200038042000320443043B043A0430043D04380437043C040000
          430000000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000
          0001121404350433044004300434043004460438044F0420003A043B0438043C
          0430044204300400003F0000000000000000000000FFFFFFFFFFFFFFFF000000
          0000000000000000000001101B043004420435043D0442043D044B0435042000
          320438044004430441044B0400003D0000000000000000000000FFFFFFFFFFFF
          FFFF00000000000000000000000000010F200435043304400435044104410420
          0041043E044604380443043C04300400003F0000000000000000000000FFFFFF
          FFFFFFFFFF00000000000000000000000000011013043B043E04310430043B04
          4C043D044B043504200032043E0439043D044B0400004F000000000000000000
          0000FFFFFFFFFFFFFFFF0000000000000000000000000001182D043A0441043F
          043504400438043C0435043D04420430043B044C043D0430044F042000440438
          04370438043A04300400003F0000000000000000000000FFFFFFFFFFFFFFFF00
          0000000000000000000000000110130435043D043D0430044F04200038043D04
          360435043D043504400438044F040000450000000000000000000000FFFFFFFF
          FFFFFFFF0000000000000000000000000001132D043A0441043F043E043D0435
          043D044604380430043B044C043D044B04390420001804180400003B00000000
          00000000000000FFFFFFFFFFFFFFFF00000000000000000007000000010E1D04
          35043A043E043D04420430043A0442043D043E04410442044C04000053000000
          0000000000000000FFFFFFFFFFFFFFFF00000000000000000000000000011A1E
          0442044104430442044104420432043804350420004204350445043D043E043B
          043E043304380439042000430045005400490000004700000000000000000000
          00FFFFFFFFFFFFFFFF0000000000000000000000000001141D04350442042000
          430441043B043E04320438043904200034043B044F0420004D00450054004900
          0000470000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
          000000011417043E043E043F04300440043A042000260438043E043B043A043E
          04320441043A043E0433043E040000330000000000000000000000FFFFFFFFFF
          FFFFFF00000000000000000000000000010A1A04410435043D043E0444043E04
          310438044F040000430000000000000000000000FFFFFFFFFFFFFFFF00000000
          0000000000000000000112210442044004300445042000420451043C043D043E
          0433043E0420003B0435044104300400004F0000000000000000000000FFFFFF
          FFFFFFFFFF00000000000000000000000000011812044B0441043E043A043804
          390420003F043E0440043E043304200030044104420440043E043A043B044304
          3104300400004D0000000000000000000000FFFFFFFFFFFFFFFF000000000000
          0000000000000001171F044304410442043E0439042000410435043A0442043E
          0440042000330430043B0430043A04420438043A04380400001F000000000000
          0000000000FFFFFFFFFFFFFFFF000000000000000000000000000100}
      end
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
      object miParadox: TMenuItem
        Caption = 'Paradox'
      end
      object N9: TMenuItem
        Caption = '-'
      end
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
