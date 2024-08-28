object frmGalaktika: TfrmGalaktika
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Galaktika'
  ClientHeight = 844
  ClientWidth = 1352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 30
  object StatusBar: TStatusBar
    Left = 0
    Top = 815
    Width = 1352
    Height = 29
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <
      item
        Text = 'X:'
        Width = 150
      end
      item
        Text = 'Y:'
        Width = 150
      end
      item
        Text = 'Z:'
        Width = 150
      end>
  end
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 1352
    Height = 57
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    RowSize = 46
    TabOrder = 1
    object ToolBarMain: TToolBar
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
      Images = dmImages.ImageListInterface
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        ImageIndex = 0
        OnClick = miNewStarcubeClick
      end
      object ToolButton3: TToolButton
        Left = 40
        Top = 0
        ImageIndex = 2
        OnClick = miOpenClick
      end
      object ToolButton4: TToolButton
        Left = 80
        Top = 0
        ImageIndex = 3
        OnClick = miSaveAsClick
      end
      object ToolButton2: TToolButton
        Left = 120
        Top = 0
        ImageIndex = 1
      end
    end
    object ToolBarView: TToolBar
      Left = 306
      Top = 2
      Width = 263
      Height = 42
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ButtonHeight = 39
      ButtonWidth = 49
      Caption = 'ToolBarView'
      Images = dmImages.ImageListInterface
      TabOrder = 1
      object tbSolarcube: TToolButton
        Left = 0
        Top = 0
        Hint = 'Solarcube'
        ImageIndex = 82
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSolarcubeClick
      end
      object tbAddStars: TToolButton
        Left = 49
        Top = 0
        Hint = 'Add stars'
        ImageIndex = 38
        ParentShowHint = False
        ShowHint = True
        OnClick = ButtonAddStarsClick
      end
      object tbAxes: TToolButton
        Left = 98
        Top = 0
        Hint = 'Axes'
        ImageIndex = 103
        ParentShowHint = False
        ShowHint = True
        OnClick = tbAxesClick
      end
      object tbRotation: TToolButton
        Left = 147
        Top = 0
        Hint = 'Rotation'
        Caption = 'tbRotation'
        ImageIndex = 97
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object tbClearCubes: TToolButton
        Left = 196
        Top = 0
        Hint = 'Clear solarcube'
        ImageIndex = 122
        ParentShowHint = False
        ShowHint = True
        OnClick = ButtonClearClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 57
    Width = 1352
    Height = 758
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = tsGalacube
    Align = alClient
    TabOrder = 2
    object tsGalacube: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Space'
      object svGalacube: TGLSceneViewer
        Left = 0
        Top = 0
        Width = 973
        Height = 713
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Camera = Camera
        Buffer.BackgroundColor = clBlack
        FieldOfView = 154.704254150390600000
        PenAsTouch = False
        Align = alClient
        TabOrder = 0
      end
      object PanelRight: TPanel
        Left = 973
        Top = 0
        Width = 371
        Height = 713
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        TabOrder = 1
        object gbStars: TGroupBox
          Left = 10
          Top = 83
          Width = 353
          Height = 590
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Spectral classes'
          TabOrder = 0
          object shO: TShape
            Left = 84
            Top = 55
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Brush.Color = clHotLight
            Pen.Width = 2
          end
          object shB: TShape
            Left = 84
            Top = 107
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Brush.Color = clSkyBlue
            Pen.Width = 2
          end
          object shA: TShape
            Left = 84
            Top = 166
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Brush.Color = clCream
            Pen.Width = 2
          end
          object shG: TShape
            Left = 84
            Top = 291
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Brush.Color = clYellow
            Pen.Width = 2
          end
          object shK: TShape
            Left = 84
            Top = 349
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Brush.Color = clOrange
            Pen.Width = 2
          end
          object shF: TShape
            Left = 84
            Top = 226
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Brush.Color = clKhaki
            Pen.Width = 2
          end
          object shM: TShape
            Left = 84
            Top = 406
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Brush.Color = clRed
            Pen.Width = 2
          end
          object Label1: TLabel
            Left = 188
            Top = 40
            Width = 17
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '%'
          end
          object Label2: TLabel
            Left = 244
            Top = 40
            Width = 76
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Number'
          end
          object shW: TShape
            Left = 91
            Top = 478
            Width = 50
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ParentShowHint = False
            Pen.Width = 2
            ShowHint = True
          end
          object chbO: TCheckBox
            Left = 14
            Top = 60
            Width = 60
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'O'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
          object chbB: TCheckBox
            Left = 14
            Top = 119
            Width = 60
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'B'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
          end
          object chbA: TCheckBox
            Left = 14
            Top = 179
            Width = 60
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'A'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
          end
          object chbF: TCheckBox
            Left = 14
            Top = 236
            Width = 60
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'F'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
          end
          object chbG: TCheckBox
            Left = 14
            Top = 296
            Width = 60
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'G'
            Checked = True
            Color = clYellow
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 4
          end
          object chbK: TCheckBox
            Left = 14
            Top = 366
            Width = 60
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'K'
            Checked = True
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 5
          end
          object chbM: TCheckBox
            Left = 14
            Top = 415
            Width = 60
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'M'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
          end
          object nbO: TNumberBox
            Left = 153
            Top = 64
            Width = 80
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 7
            Value = 0.100000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbB: TNumberBox
            Left = 154
            Top = 117
            Width = 80
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 8
            Value = 0.400000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbA: TNumberBox
            Left = 154
            Top = 177
            Width = 80
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 9
            Value = 0.500000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbF: TNumberBox
            Left = 154
            Top = 238
            Width = 80
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 10
            Value = 3.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbG: TNumberBox
            Left = 154
            Top = 301
            Width = 80
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 11
            Value = 8.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbK: TNumberBox
            Left = 154
            Top = 355
            Width = 80
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 12
            Value = 12.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbM: TNumberBox
            Left = 154
            Top = 413
            Width = 80
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 13
            Value = 76.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbAn: TNumberBox
            Left = 244
            Top = 176
            Width = 93
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MaxValue = 100000.000000000000000000
            TabOrder = 14
            Value = 50.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbMn: TNumberBox
            Left = 244
            Top = 413
            Width = 93
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 15
            Value = 7600.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbKn: TNumberBox
            Left = 244
            Top = 349
            Width = 93
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 16
            Value = 1200.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbGn: TNumberBox
            Left = 244
            Top = 299
            Width = 93
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 17
            Value = 800.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbFn: TNumberBox
            Left = 246
            Top = 237
            Width = 93
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 18
            Value = 300.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbBn: TNumberBox
            Left = 244
            Top = 115
            Width = 93
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MaxValue = 100000.000000000000000000
            TabOrder = 19
            Value = 40.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbOn: TNumberBox
            Left = 244
            Top = 64
            Width = 93
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MaxValue = 100000.000000000000000000
            TabOrder = 20
            Value = 10.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object chbD: TCheckBox
            Left = 10
            Top = 477
            Width = 71
            Height = 43
            Hint = 'White Dwaft'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'D'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 21
          end
          object nbWn: TNumberBox
            Left = 252
            Top = 482
            Width = 79
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmInt64
            MinValue = 100.000000000000000000
            MaxValue = 100000.000000000000000000
            ParentShowHint = False
            ShowHint = True
            TabOrder = 22
            Value = 100.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
        end
        object seNStars: TSpinEdit
          Left = 210
          Top = 32
          Width = 127
          Height = 41
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          MaxValue = 1000000
          MinValue = 1000
          TabOrder = 1
          Value = 10000
          OnChange = seNStarsChange
        end
        object chbAll: TCheckBox
          Left = 36
          Top = 32
          Width = 133
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'All stars'
          TabOrder = 2
          OnClick = chbAllClick
        end
      end
    end
    object tsDatacat: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Data'
      ImageIndex = 2
      object DBGrid: TDBGrid
        Left = 700
        Top = 0
        Width = 644
        Height = 688
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -21
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object MemoTable: TMemo
        Left = 0
        Top = 0
        Width = 659
        Height = 713
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Lines.Strings = (
          'MemoTable')
        TabOrder = 1
      end
    end
  end
  object GLScene: TGLScene
    Left = 271
    Top = 156
    object dcAxes: TGLDummyCube
      Position.Coordinates = {0000000000007A44000000000000803F}
      CubeSize = 1.000000000000000000
      object ArrowY: TGLArrowLine
        Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {000000000000003F000000000000803F}
        Direction.Coordinates = {000000000000803F0000000000000000}
        Position.Coordinates = {0000000000007AC4000000000000803F}
        Scale.Coordinates = {00004843000048430000FA4300000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        BottomRadius = 0.050000000745058060
        Height = 2.000000000000000000
        TopRadius = 0.050000000745058060
        Parts = [alLine, alTopArrow, alBottomArrow]
        TopArrowHeadHeight = 0.200000002980232200
        TopArrowHeadRadius = 0.100000001490116100
        BottomArrowHeadHeight = 0.200000002980232200
        BottomArrowHeadRadius = 0.100000001490116100
      end
      object ArrowX: TGLArrowLine
        Material.FrontProperties.Diffuse.Color = {0000803F00000000000000000000803F}
        Direction.Coordinates = {0000803F000000000000000000000000}
        Position.Coordinates = {0000000000007AC4000000000000803F}
        Scale.Coordinates = {00004843000048430000FA4300000000}
        BottomRadius = 0.050000000745058060
        Height = 2.000000000000000000
        TopRadius = 0.050000000745058060
        Parts = [alLine, alTopArrow, alBottomArrow]
        TopArrowHeadHeight = 0.200000002980232200
        TopArrowHeadRadius = 0.100000001490116100
        BottomArrowHeadHeight = 0.200000002980232200
        BottomArrowHeadRadius = 0.100000001490116100
      end
      object ArrowZ: TGLArrowLine
        Material.FrontProperties.Diffuse.Color = {00000000000000000000803F0000803F}
        Position.Coordinates = {0000000000007AC4000000000000803F}
        Scale.Coordinates = {00004843000048430000FA4300000000}
        BottomRadius = 0.050000000745058060
        Height = 2.000000000000000000
        TopRadius = 0.050000000745058060
        Parts = [alLine, alTopArrow, alBottomArrow]
        TopArrowHeadHeight = 0.200000002980232200
        TopArrowHeadRadius = 0.100000001490116100
        BottomArrowHeadHeight = 0.200000002980232200
        BottomArrowHeadRadius = 0.100000001490116100
      end
      object SpaceTextX: TGLSpaceText
        Material.FrontProperties.Diffuse.Color = {0000803F00000000000000000000803F}
        Direction.Coordinates = {0000803F000000000000000000000000}
        Position.Coordinates = {0080224400806DC4000048C20000803F}
        RollAngle = 90.000000000000000000
        Scale.Coordinates = {0000C8420000C8420000C84200000000}
        Up.Coordinates = {00000000000080BF2EBD3BB300000000}
        Extrusion = 0.200000002980232200
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'X')
        CharacterRange = stcrAlphaNum
      end
      object SpaceTextZ: TGLSpaceText
        Material.FrontProperties.Diffuse.Color = {00000000000000000000803F0000803F}
        Position.Coordinates = {0000484200806DC4008022440000803F}
        Scale.Coordinates = {0000C8420000C8420000C84200000000}
        Up.Coordinates = {00000080000080BF0000000000000000}
        Extrusion = 0.200000002980232200
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Z')
        CharacterRange = stcrAlphaNum
      end
      object SpaceTextY: TGLSpaceText
        Material.FrontProperties.Diffuse.Color = {000000000000003F000000000000803F}
        Direction.Coordinates = {30BD3BB30CD8CC34000080BF00000000}
        Position.Coordinates = {000048420000AFC3000000000000803F}
        Scale.Coordinates = {0000C8420000C8420000C84200000000}
        TurnAngle = 90.000000000000000000
        Up.Coordinates = {000000000000803F0DD8CC3400000000}
        Extrusion = 0.200000002980232200
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Y')
        CharacterRange = stcrAlphaNum
      end
    end
    object Camera: TGLCamera
      DepthOfView = 10000.000000000000000000
      FocalLength = 80.000000000000000000
      TargetObject = dcGalacube
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {0050434700606A4700B888470000803F}
      object Lighting: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object dcSolcube: TGLDummyCube
      Direction.Coordinates = {000000000000803F0000000000000000}
      Up.Coordinates = {0000000000000000000080BF00000000}
      CubeSize = 1000.000000000000000000
      VisibleAtRunTime = True
      object dotStars: TGLPoints
        NoZWrite = False
        Static = False
      end
      object LightSol: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object dcGalacube: TGLDummyCube
      CubeSize = 100000.000000000000000000
      VisibleAtRunTime = True
      object diskGalaxy: TGLDisk
        Material.MaterialLibrary = dmImages.GLMatLib
        Material.LibMaterialName = 'Milkyway'
        Direction.Coordinates = {000000000000803F0000000000000000}
        Up.Coordinates = {0000000000000000000080BF00000000}
        OuterRadius = 50000.000000000000000000
        Slices = 64
        SweepAngle = 360.000000000000000000
      end
      object XYZGrid: TGLXYZGrid
        Direction.Coordinates = {000000000000803F0000000000000000}
        ShowAxes = True
        Up.Coordinates = {0000000000000000000080BF00000000}
        XSamplingScale.Min = -50000.000000000000000000
        XSamplingScale.Max = 50000.000000000000000000
        XSamplingScale.Step = 1000.000000000000000000
        YSamplingScale.Min = -50000.000000000000000000
        YSamplingScale.Max = 50000.000000000000000000
        YSamplingScale.Step = 1000.000000000000000000
        ZSamplingScale.Min = -500.000000000000000000
        ZSamplingScale.Max = 500.000000000000000000
        ZSamplingScale.Origin = -500.000000000000000000
        ZSamplingScale.Step = 1000.000000000000000000
        Parts = [gpX, gpY, gpZ]
      end
    end
  end
  object MainMenu: TMainMenu
    Images = dmImages.ImageListInterface
    Left = 728
    Top = 179
    object miFile: TMenuItem
      Caption = '&File'
      object miNewStarcube: TMenuItem
        Caption = 'New...'
        OnClick = miNewStarcubeClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miOpen: TMenuItem
        Caption = 'Open...'
        ImageIndex = 2
        OnClick = miOpenClick
      end
      object miSave: TMenuItem
        Caption = 'Save'
      end
      object miSaveAs: TMenuItem
        Caption = 'Save as...'
        OnClick = miSaveAsClick
      end
      object miN2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'Exit'
        ImageIndex = 14
        OnClick = miExitClick
      end
    end
    object miEdit: TMenuItem
      Caption = '&Edit'
      object miUndo: TMenuItem
        Caption = 'Cancel'
        ShortCut = 16474
      end
      object miN4: TMenuItem
        Caption = '-'
      end
      object miCut: TMenuItem
        Caption = 'Cut'
        ShortCut = 16472
      end
      object miCopy: TMenuItem
        Caption = 'Copy'
        ShortCut = 16451
      end
      object miPaste: TMenuItem
        Caption = 'Insert'
        ShortCut = 16470
      end
      object miN3: TMenuItem
        Caption = '-'
      end
      object miFind: TMenuItem
        Caption = 'Find...'
      end
      object miReplace: TMenuItem
        Caption = 'Replace...'
      end
      object miGoTo: TMenuItem
        Caption = 'Go to...'
      end
      object miN1: TMenuItem
        Caption = '-'
      end
      object miObject: TMenuItem
        Caption = 'Object'
      end
    end
    object miView: TMenuItem
      Caption = '&View'
      object miExoplanets: TMenuItem
        Caption = 'Exoplanets...'
        OnClick = miExoplanetsClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miLithosphere: TMenuItem
        Caption = 'Lithosphere...'
        OnClick = miLithosphereClick
      end
      object miBiosphere: TMenuItem
        Caption = 'Biosphere...'
        OnClick = miBiosphereClick
      end
      object miTechnosphere: TMenuItem
        Caption = 'Technosphere...'
        OnClick = miTechnosphereClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miPanelShow: TMenuItem
        Caption = 'Panels'
        Checked = True
        OnClick = miPanelShowClick
      end
    end
    object miTools: TMenuItem
      Caption = '&Tools'
      object miSettings: TMenuItem
        Caption = 'Settings...'
        ImageIndex = 130
        OnClick = miSettingsClick
      end
      object miN5: TMenuItem
        Caption = '-'
      end
      object miAnalyser: TMenuItem
        Caption = 'Analyser...'
        OnClick = miAnalyserClick
      end
      object miMonitor: TMenuItem
        Caption = 'Monitor...'
        OnClick = miMonitorClick
      end
      object miProjection: TMenuItem
        Caption = 'Star projections...'
        OnClick = miProjectionClick
      end
      object miParadox: TMenuItem
        Caption = 'Paradox...'
        OnClick = miParadoxClick
      end
    end
    object miHelp: TMenuItem
      Caption = '&Help'
      object miRuwiki: TMenuItem
        Caption = 'Ruwiki...'
      end
      object miN6: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = 'About...'
        OnClick = miAboutClick
      end
    end
  end
  object GLAsyncTimer: TGLAsyncTimer
    OnTimer = GLAsyncTimerTimer
    Left = 537
    Top = 179
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    OnProgress = GLCadencerProgress
    Left = 557
    Top = 212
  end
  object GLSimpleNavigation: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = svGalacube
    FormCaption = 'Galaxy - %FPS'
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
    Left = 676
    Top = 355
  end
end
