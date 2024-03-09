object FormABCreator: TFormABCreator
  Left = 30
  Top = 20
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Planet System Creator'
  ClientHeight = 831
  ClientWidth = 1306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000990
    0000000009990000000999999000099900000100099900000009990000000999
    1000999009990000000990009990009999999990099900000009999999900000
    9999997009990000000099999000000000000000000000000000000000000000
    0000000000000000000000000000000099999100099999999000999991000099
    9999999009999999900999999990099990000990099900000099900009900999
    0000099009990000009990000990099000999990099900000000000099900990
    0099990009990000000009999990099000000000099900000009999990000999
    0000010009990000000999000000009910009990099900000009900099900099
    9999999009990000000999999990000999999970099900000000999999000000
    0000000000000000000000000000000000000000000000000000000000000000
    9999910009999999900099999100000999009990099999999009999099900999
    9000099009990000009990000990099900000990099900000099900009900990
    0099999009990000000000079990099000999990099900000000099999000990
    0000000009990000000999990000099900000100099900000009990000000999
    1000999009990000000990009990079999999990099900000009999999900009
    9999990009990000000099999000000000000000000000000000000000009FF8
    FE078FB8FE3F8718FE71C018FE01F018FF07FFFFFFFFFFFFFFFFF0380703C018
    06018798FC798F98FC799C18FFF19C38FF819FF8FE078FB8FE3FC718FE71C018
    FE01E018FF03FFFFFFFFFFFFFFFFF0380703E31806118798FC798F98FC799C18
    FFE19C18FF839FF8FE0F8FB8FE3F8718FE718018FE01E038FF07FFFFFFFF}
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 24
  object GLSceneViewerA: TGLSceneViewer
    Left = 604
    Top = 0
    Width = 702
    Height = 797
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = GLCamera
    BeforeRender = GLSceneViewerABeforeRender
    Buffer.BackgroundColor = clBackground
    Buffer.AmbientColor.Color = {9A99193F9A99193F9A99193F0000803F}
    FieldOfView = 163.785507202148400000
    PenAsTouch = False
    OnMouseEnter = GLSceneViewerAMouseEnter
    Align = alClient
    PopupMenu = PopupMenuA
    OnDblClick = GLSceneViewerADblClick
    OnMouseDown = GLSceneViewerAMouseDown
    OnMouseUp = GLSceneViewerAMouseUp
    TabOrder = 1
  end
  object SolarDataPanel: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 797
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    TabOrder = 0
    object ToolBarGB: TGroupBox
      Left = 1
      Top = 1
      Width = 602
      Height = 795
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object Label2: TLabel
        Left = 35
        Top = 177
        Width = 68
        Height = 24
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Moons :'
        ParentShowHint = False
        ShowHint = False
      end
      object Label6: TLabel
        Left = 44
        Top = 140
        Width = 58
        Height = 24
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Rings :'
        ParentShowHint = False
        ShowHint = False
      end
      object CameraDistanceLabel: TLabel
        Left = 112
        Top = 742
        Width = 45
        Height = 24
        Hint = 'Camera Distance'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '20.00'
      end
      object Label22: TLabel
        Left = 14
        Top = 714
        Width = 66
        Height = 24
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Camera'
      end
      object TimeLabel: TLabel
        Left = 14
        Top = 770
        Width = 93
        Height = 24
        Hint = 'Days Per Frame'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Time Warp'
      end
      object Label9: TLabel
        Left = 340
        Top = 704
        Width = 109
        Height = 24
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Planet Picker'
      end
      object Label7: TLabel
        Left = 49
        Top = 219
        Width = 52
        Height = 24
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'S3ds :'
        ParentShowHint = False
        ShowHint = False
      end
      object Label19: TLabel
        Left = 266
        Top = 175
        Width = 105
        Height = 24
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'S3ds Scaler:'
        ParentShowHint = False
        ShowHint = False
      end
      object S3dsScalerLabel: TLabel
        Left = 392
        Top = 175
        Width = 35
        Height = 24
        Hint = 'Scale'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '1.00'
      end
      object SunShineLabel: TLabel
        Left = 462
        Top = 770
        Width = 30
        Height = 24
        Hint = 'Sun Shine Size'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '100'
      end
      object CFLLabel: TLabel
        Left = 14
        Top = 742
        Width = 20
        Height = 24
        Hint = 'Focal Length'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '50'
      end
      object S3dsScalerScaleLabel: TLabel
        Left = 532
        Top = 175
        Width = 30
        Height = 24
        Hint = 'Scale Scale'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '100'
      end
      object HourLabel: TLabel
        Left = 14
        Top = 798
        Width = 20
        Height = 24
        Hint = 'Hours of 24'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '24'
      end
      object LabelLabel: TLabel
        Left = 364
        Top = 798
        Width = 25
        Height = 24
        Hint = 'Label Font Scale'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '0.1'
      end
      object SunRG: TRadioGroup
        Left = 70
        Top = 60
        Width = 44
        Height = 68
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ItemIndex = 0
        Items.Strings = (
          'P'
          'M')
        TabOrder = 33
        OnClick = PlanetsRGClick
      end
      object CometRG: TRadioGroup
        Left = 434
        Top = 70
        Width = 44
        Height = 100
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ItemIndex = 0
        Items.Strings = (
          'P'
          'M')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 29
        OnClick = PlanetsRGClick
      end
      object DebrisRG: TRadioGroup
        Left = 546
        Top = 70
        Width = 44
        Height = 100
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ItemIndex = 0
        Items.Strings = (
          'P'
          'M')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 30
        OnClick = PlanetsRGClick
      end
      object AsteroidRG: TRadioGroup
        Left = 322
        Top = 70
        Width = 44
        Height = 100
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ItemIndex = 0
        Items.Strings = (
          'P'
          'M')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 28
        OnClick = PlanetsRGClick
      end
      object OrbitGroupBox: TGroupBox
        Left = 340
        Top = 242
        Width = 250
        Height = 460
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Orbit '
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object OrbitRotationEdit: TEdit
          Left = 14
          Top = 28
          Width = 102
          Height = 32
          Hint = 'OrbitRotation days:'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object iConstEdit: TEdit
          Left = 14
          Top = 112
          Width = 102
          Height = 32
          Hint = 'iConst: Inclination :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object aConstEdit: TEdit
          Left = 14
          Top = 70
          Width = 102
          Height = 32
          Hint = 'aConst : Distance :1000 Kilometers'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object eConstEdit: TEdit
          Left = 14
          Top = 154
          Width = 102
          Height = 32
          Hint = 'eConst: Eccentricity :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object eVarEdit: TEdit
          Left = 126
          Top = 158
          Width = 102
          Height = 32
          Hint = 'Eccentricity Var:perehelion'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object EMaxEdit: TEdit
          Left = 126
          Top = 200
          Width = 100
          Height = 32
          Hint = 'Eccentricity Max:aphelion'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object aVarEdit: TEdit
          Left = 126
          Top = 70
          Width = 102
          Height = 32
          Hint = 'Var Distance :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object wVarEdit: TEdit
          Left = 126
          Top = 280
          Width = 102
          Height = 32
          Hint = 'Var Perihelion :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object wConstEdit: TEdit
          Left = 14
          Top = 280
          Width = 102
          Height = 32
          Hint = 'wConst Perihelion :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object NVarEdit: TEdit
          Left = 126
          Top = 238
          Width = 102
          Height = 32
          Hint = 'Var Longitude :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object NConstEdit: TEdit
          Left = 14
          Top = 238
          Width = 102
          Height = 32
          Hint = 'nConst Longitude :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
        end
        object MVarEdit: TEdit
          Left = 126
          Top = 322
          Width = 102
          Height = 32
          Hint = 'Var Anomaly :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object MConstEdit: TEdit
          Left = 14
          Top = 322
          Width = 102
          Height = 32
          Hint = 'mConst Anomaly :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
        end
        object iVarEdit: TEdit
          Left = 126
          Top = 112
          Width = 102
          Height = 32
          Hint = 'Var Inclination :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
        end
        object AlbedoEdit: TEdit
          Left = 126
          Top = 28
          Width = 102
          Height = 32
          Hint = 'Albedo :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
        end
        object VelocityEdit: TEdit
          Left = 14
          Top = 410
          Width = 102
          Height = 32
          Hint = 'Velocity :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
        object AtmosphereCB: TComboBox
          Left = 14
          Top = 368
          Width = 114
          Height = 32
          Hint = 'Atmosphere'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          Items.Strings = (
            'None'
            'Limited'
            'Cloudy'
            'Covered'
            'Stormy'
            'Particle'
            'Electric'
            'Plasma')
        end
        object VelocityTypeEdit: TEdit
          Left = 126
          Top = 368
          Width = 102
          Height = 32
          Hint = 'Velocity Type'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
        end
        object VelocityDirEdit: TEdit
          Left = 126
          Top = 410
          Width = 102
          Height = 32
          Hint = 'Velocity Direction'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
        end
      end
      object GroupBox6: TGroupBox
        Left = 18
        Top = 242
        Width = 250
        Height = 460
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Object'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object MoonsLabel: TLabel
          Left = 56
          Top = 240
          Width = 68
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = 'Moons :'
        end
        object RingsLabel: TLabel
          Left = 66
          Top = 196
          Width = 58
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = 'Rings :'
        end
        object Label4: TLabel
          Left = 19
          Top = 68
          Width = 105
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = 'Radius (km):'
        end
        object Label16: TLabel
          Left = 6
          Top = 110
          Width = 118
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = 'Rotate (hours)'
        end
        object Label14: TLabel
          Left = 54
          Top = 154
          Width = 70
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = 'Axis Tilt:'
        end
        object Label10: TLabel
          Left = 70
          Top = 25
          Width = 56
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Name:'
        end
        object Label17: TLabel
          Left = 28
          Top = 326
          Width = 96
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = 'Doc Index :'
        end
        object nbS3dLabel: TLabel
          Left = 50
          Top = 282
          Width = 74
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = 'nbS3ds :'
        end
        object RadiusEdit: TEdit
          Left = 140
          Top = 70
          Width = 102
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 0
        end
        object ObjectRotationEdit: TEdit
          Left = 140
          Top = 112
          Width = 102
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 1
        end
        object AxisTiltEdit: TEdit
          Left = 140
          Top = 156
          Width = 102
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 2
        end
        object nbRingsEdit: TEdit
          Left = 140
          Top = 198
          Width = 102
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 3
        end
        object nbMoonsEdit: TEdit
          Left = 140
          Top = 240
          Width = 102
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 4
        end
        object NameEdit: TEdit
          Left = 140
          Top = 28
          Width = 100
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 5
        end
        object DocIndexEdit: TEdit
          Left = 140
          Top = 326
          Width = 102
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 6
        end
        object ScaleObjectEdit: TEdit
          Left = 140
          Top = 410
          Width = 102
          Height = 32
          Hint = 'Scale Object'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 7
        end
        object nbS3dsEdit: TEdit
          Left = 140
          Top = 282
          Width = 102
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 8
        end
        object nbS3dsCB: TCheckBox
          Left = 11
          Top = 282
          Width = 29
          Height = 30
          Hint = '3Ds Self Textured'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 9
        end
        object ScaleDistanceEdit: TEdit
          Left = 9
          Top = 410
          Width = 101
          Height = 32
          Hint = 'Scale Distance'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 10
        end
        object RCDTypeEdit: TEdit
          Left = 14
          Top = 410
          Width = 44
          Height = 32
          Hint = 'RCD Type'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 11
          Text = 'RCD'
        end
        object RCDCountEdit: TEdit
          Left = 60
          Top = 410
          Width = 43
          Height = 32
          Hint = 'Count'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 12
          Text = '#'
        end
        object RCDXYSizeEdit: TEdit
          Left = 109
          Top = 410
          Width = 43
          Height = 32
          Hint = 'XY Size'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 13
          Text = 'XYSize'
        end
        object RCDZSizeEdit: TEdit
          Left = 154
          Top = 410
          Width = 44
          Height = 32
          Hint = 'Z Size'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 14
          Text = 'Z'
        end
        object RCDPositionEdit: TEdit
          Left = 196
          Top = 410
          Width = 44
          Height = 32
          Hint = 'Position'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clAqua
          TabOrder = 15
          Text = 'P'
        end
        object MassEdit: TEdit
          Left = 28
          Top = 368
          Width = 102
          Height = 32
          Hint = 'Mass (kg) :'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 16
        end
        object DensityEdit: TEdit
          Left = 140
          Top = 368
          Width = 102
          Height = 32
          Hint = 'Density: (Comet Count)'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 17
        end
      end
      object SSORG: TRadioGroup
        Left = 14
        Top = 14
        Width = 576
        Height = 58
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Create Planet System Objects'
        Columns = 5
        ItemIndex = 0
        Items.Strings = (
          'Star'
          'Planets'
          'Asteroids'
          'Comets'
          'Debris')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = PlanetsRGClick
      end
      object PlanetEdit: TEdit
        Left = 112
        Top = 84
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        Text = '0'
      end
      object PlanetUpDown: TUpDown
        Left = 170
        Top = 84
        Width = 28
        Height = 32
        Hint = 'Planet'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = PlanetEdit
        TabOrder = 4
      end
      object AsteroidUpDown: TUpDown
        Left = 310
        Top = 84
        Width = 28
        Height = 32
        Hint = 'Asteroid'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = AsteroidEdit
        TabOrder = 5
      end
      object AsteroidEdit: TEdit
        Left = 252
        Top = 84
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 6
        Text = '0'
      end
      object CometUpDown: TUpDown
        Left = 422
        Top = 84
        Width = 28
        Height = 32
        Hint = 'Comet'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = CometEdit
        TabOrder = 7
      end
      object CometEdit: TEdit
        Left = 364
        Top = 84
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 8
        Text = '0'
      end
      object DebrisEdit: TEdit
        Left = 476
        Top = 84
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 9
        Text = '0'
      end
      object DebrisUpDown: TUpDown
        Left = 534
        Top = 84
        Width = 28
        Height = 32
        Hint = 'Debris'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = DebrisEdit
        TabOrder = 10
      end
      object RingsEdit: TEdit
        Left = 112
        Top = 126
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 11
        Text = '0'
      end
      object RingsUpDown: TUpDown
        Left = 170
        Top = 126
        Width = 28
        Height = 32
        Hint = 'Rings'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = RingsEdit
        TabOrder = 12
      end
      object MoonsEdit: TEdit
        Left = 112
        Top = 168
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 13
        Text = '0'
      end
      object MoonsUpDown: TUpDown
        Left = 170
        Top = 168
        Width = 28
        Height = 32
        Hint = 'Moons'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = MoonsEdit
        TabOrder = 14
      end
      object PlanetsRG: TRadioGroup
        Left = 196
        Top = 70
        Width = 44
        Height = 184
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ItemIndex = 0
        Items.Strings = (
          'P'
          'M'
          'R'
          'S')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 15
        OnClick = PlanetsRGClick
      end
      object CFLTrackBar: TTrackBar
        Left = 105
        Top = 714
        Width = 175
        Height = 30
        Hint = 'Focal Length'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Max = 10000
        Min = 50
        ParentShowHint = False
        Position = 50
        ShowHint = True
        TabOrder = 16
        ThumbLength = 26
        TickStyle = tsNone
        OnChange = CFLTrackBarChange
      end
      object TimeTrackBar: TTrackBar
        Left = 105
        Top = 770
        Width = 175
        Height = 30
        Hint = 'Day Time Warp'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Max = 729
        ParentShowHint = False
        Position = 1
        ShowHint = True
        TabOrder = 17
        ThumbLength = 26
        TickStyle = tsNone
        OnChange = TimeTrackBarChange
      end
      object PlanetPickerCB: TComboBox
        Left = 340
        Top = 728
        Width = 253
        Height = 32
        Hint = 'Center of the Universe'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 18
        OnChange = PlanetPickerCBChange
      end
      object SunShineCB: TCheckBox
        Left = 340
        Top = 770
        Width = 112
        Height = 30
        Hint = 'Sun Shine On'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'SunShine'
        Checked = True
        State = cbChecked
        TabOrder = 19
        OnClick = SunShineCBClick
      end
      object SunShineTB: TTrackBar
        Left = 504
        Top = 770
        Width = 88
        Height = 30
        Hint = 'Sun Shine Size'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Max = 200
        Min = 1
        Position = 100
        TabOrder = 20
        ThumbLength = 26
        TickStyle = tsNone
        OnChange = SunShineTBChange
      end
      object BtnPanel: TPanel
        Left = 273
        Top = 252
        Width = 63
        Height = 452
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 21
        object HelpBtn: TSpeedButton
          Left = 4
          Top = 275
          Width = 57
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '?'
          ParentShowHint = False
          ShowHint = False
          OnClick = HelpBtnClick
        end
        object StoreBtn: TSpeedButton
          Left = 4
          Top = 140
          Width = 57
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Store'
          ParentShowHint = False
          ShowHint = False
          OnClick = StoreBtnClick
        end
        object ShowBtn: TSpeedButton
          Left = 4
          Top = 95
          Width = 57
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Show'
          ParentShowHint = False
          ShowHint = False
          OnClick = ShowBtnClick
        end
        object RunBtn: TSpeedButton
          Left = 4
          Top = 320
          Width = 57
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Run'
          ParentShowHint = False
          ShowHint = False
          OnClick = RunBtnClick
        end
        object StopBtn: TSpeedButton
          Left = 4
          Top = 364
          Width = 57
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Stop'
          ParentShowHint = False
          ShowHint = False
          OnClick = StopBtnClick
        end
        object ClearBtn: TSpeedButton
          Left = 4
          Top = 5
          Width = 57
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Clear'
          ParentShowHint = False
          ShowHint = False
          OnClick = ClearBtnClick
        end
        object LoadBtn: TSpeedButton
          Left = 4
          Top = 51
          Width = 57
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Load'
          ParentShowHint = False
          ShowHint = False
          OnClick = LoadBtnClick
        end
        object SaveBtn: TSpeedButton
          Left = 4
          Top = 186
          Width = 57
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Save'
          ParentShowHint = False
          ShowHint = False
          OnClick = SaveBtnClick
        end
        object PrintBtn: TSpeedButton
          Left = 4
          Top = 229
          Width = 57
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Print'
          ParentShowHint = False
          ShowHint = False
          OnClick = PrintBtnClick
        end
        object ExitBtn: TSpeedButton
          Left = 4
          Top = 410
          Width = 57
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Exit'
          ParentShowHint = False
          ShowHint = False
          OnClick = ExitBtnClick
        end
      end
      object AS3dsEdit: TEdit
        Left = 252
        Top = 126
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 22
        Text = '0'
      end
      object AS3dsUpDown: TUpDown
        Left = 310
        Top = 126
        Width = 28
        Height = 32
        Hint = 'S3ds'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = AS3dsEdit
        TabOrder = 23
      end
      object CS3dsEdit: TEdit
        Left = 364
        Top = 126
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 24
        Text = '0'
      end
      object CS3dsUpDown: TUpDown
        Left = 422
        Top = 126
        Width = 28
        Height = 32
        Hint = 'S3ds'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = CS3dsEdit
        TabOrder = 25
      end
      object DS3dsEdit: TEdit
        Left = 476
        Top = 126
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 26
        Text = '0'
      end
      object DS3dsUpDown: TUpDown
        Left = 534
        Top = 126
        Width = 28
        Height = 32
        Hint = 'S3ds'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = DS3dsEdit
        TabOrder = 27
      end
      object Edit4: TEdit
        Left = 14
        Top = 84
        Width = 44
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 31
        Text = '0'
      end
      object SS3dsUpDown: TUpDown
        Left = 58
        Top = 84
        Width = 28
        Height = 32
        Hint = 'S3ds'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = Edit4
        TabOrder = 32
      end
      object PS3dsUpDown: TUpDown
        Left = 170
        Top = 210
        Width = 28
        Height = 32
        Hint = 'S3ds'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Associate = PS3dsEdit
        TabOrder = 34
      end
      object PS3dsEdit: TEdit
        Left = 112
        Top = 210
        Width = 58
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 35
        Text = '0'
      end
      object PickActiveCB: TCheckBox
        Left = 308
        Top = 714
        Width = 30
        Height = 30
        Hint = 'Mouse Pick Active'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 36
        OnClick = PickActiveCBClick
      end
      object LabelsOnCB: TCheckBox
        Left = 280
        Top = 798
        Width = 30
        Height = 30
        Hint = 'Labels On'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 37
        OnClick = LabelsOnCBClick
      end
      object UseOrbitalElementsCB: TCheckBox
        Left = 308
        Top = 770
        Width = 30
        Height = 30
        Hint = 'Use Orbital Elements'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 38
        OnClick = UseOrbitalElementsCBClick
      end
      object OrbitTrailsOnCB: TCheckBox
        Left = 280
        Top = 714
        Width = 30
        Height = 30
        Hint = 'Orbit Trails On'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 39
        OnClick = OrbitTrailsOnCBClick
      end
      object DocIndexLinkCB: TCheckBox
        Left = 308
        Top = 742
        Width = 30
        Height = 30
        Hint = 'Display Doc Index'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 40
        OnClick = DocIndexLinkCBClick
      end
      object AtmosphereOnCB: TCheckBox
        Left = 280
        Top = 742
        Width = 30
        Height = 30
        Hint = 'Atmosphere On'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 41
        OnClick = AtmosphereOnCBClick
      end
      object S3dsScalerTB: TTrackBar
        Left = 245
        Top = 203
        Width = 175
        Height = 30
        Hint = 'Scaler'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Max = 200
        Min = 1
        Position = 100
        TabOrder = 42
        ThumbLength = 26
        TickStyle = tsNone
        OnChange = S3dsScalerTBChange
      end
      object CameraDistanceUpDown: TUpDown
        Left = 196
        Top = 742
        Width = 72
        Height = 30
        Hint = 'Camera Distance'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Min = -120
        Max = 120
        Orientation = udHorizontal
        ParentShowHint = False
        ShowHint = True
        TabOrder = 43
        OnClick = CameraDistanceUpDownClick
      end
      object S3dsScalerScalerTB: TTrackBar
        Left = 413
        Top = 203
        Width = 175
        Height = 30
        Hint = 'Scaler Scaler'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Max = 1000
        Min = 1
        Position = 100
        TabOrder = 44
        ThumbLength = 26
        TickStyle = tsNone
        OnChange = S3dsScalerTBChange
      end
      object HoursTimeTrackBar: TTrackBar
        Left = 105
        Top = 798
        Width = 175
        Height = 30
        Hint = '24 Hr Time Warp'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Max = 24
        Min = 1
        Position = 24
        TabOrder = 45
        ThumbLength = 26
        TickStyle = tsNone
        OnChange = TimeTrackBarChange
      end
      object LabelTB: TTrackBar
        Left = 413
        Top = 798
        Width = 175
        Height = 30
        Hint = 'Label Font Scale'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Max = 2000
        Min = 1
        Position = 100
        TabOrder = 46
        ThumbLength = 26
        TickStyle = tsNone
        OnChange = LabelTBChange
      end
      object DateTimePicker1: TDateTimePicker
        Left = 280
        Top = 798
        Width = 142
        Height = 32
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Date = 45346.000000000000000000
        Time = 0.830723009261419100
        TabOrder = 47
        Visible = False
        OnChange = DateTimePicker1Change
      end
      object DatePickerCB: TCheckBox
        Left = 280
        Top = 770
        Width = 30
        Height = 30
        Hint = 'Display Date Picker'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 48
        OnClick = DatePickerCBClick
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 797
    Width = 1306
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <
      item
        Width = 150
      end>
  end
  object GLCadencerA: TGLCadencer
    Scene = GLSceneA
    OnProgress = GLCadencerAProgress
    Left = 392
    Top = 72
  end
  object GLMaterialLibraryA: TGLMaterialLibrary
    Left = 488
    Top = 16
  end
  object GLSceneA: TGLScene
    ObjectsSorting = osNone
    VisibilityCulling = vcHierarchical
    Left = 392
    Top = 16
    object SunShineFlare: TGLLensFlare
      Tag = 20
      Size = 100
      Seed = 1465
      NumStreaks = 8
      StreakWidth = 3.000000000000000000
      NumSecs = 16
      FlareIsNotOccluded = True
      ObjectsSorting = osNone
    end
    object DCLabels: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLFlatTextLabel: TGLFlatText
        Direction.Coordinates = {0000000000000000000080BF00000000}
        Scale.Coordinates = {CDCCCC3DCDCCCC3DCDCCCC3D00000000}
        BitmapFont = WindowsBitmapFontA
        Text = 'Sun'
        Alignment = taCenter
        Layout = tlTop
        ModulateColor.Color = {0AD7633FD7A3F03ECDCC4C3E0000803F}
        Options = [ftoTwoSided]
      end
    end
    object DCOrbitTrails: TGLDummyCube
      CubeSize = 1.000000000000000000
      object OrbitLines: TGLLines
        Nodes = <>
        Options = []
      end
    end
    object DCComet: TGLDummyCube
      CubeSize = 1.000000000000000000
      object CometSprite: TGLSprite
        Tag = 19
        Material.MaterialLibrary = CometGLMaterialLibrary
        Material.LibMaterialName = 'BlueBall'
        ObjectsSorting = osRenderFarthestFirst
        Visible = False
        Hint = '1'
        Width = 1.000000000000000000
        Height = 1.000000000000000000
        Rotation = 0.000000000000000000
      end
    end
    object DCSolarSystem: TGLDummyCube
      VisibilityCulling = vcNone
      CubeSize = 1.000000000000000000
    end
    object GLCamera: TGLCamera
      DepthOfView = 16000.000000000000000000
      FocalLength = 50.000000000000000000
      NearPlaneBias = 0.001000000047497451
      TargetObject = DCSolarSystem
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {00000000000000000000A0C10000803F}
      Direction.Coordinates = {00000000000000000000803F00000000}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        LightStyle = lsOmni
        Specular.Color = {0000803F0000803F0000803F0000803F}
        SpotCutOff = 180.000000000000000000
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 600
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 600
    Top = 80
  end
  object TimerA: TTimer
    OnTimer = TimerATimer
    Left = 600
    Top = 144
  end
  object PopupMenuA: TPopupMenu
    Left = 680
    Top = 80
    object DisplayToolbar1: TMenuItem
      Caption = 'Display Toolbar'
      Checked = True
      OnClick = DisplayToolbar1Click
    end
    object FullScreen1: TMenuItem
      Caption = 'FullScreen'
      OnClick = FullScreen1Click
    end
    object DisplayFPS1: TMenuItem
      Caption = 'Display FPS'
      Checked = True
      OnClick = DisplayFPS1Click
    end
    object TextureLoading1: TMenuItem
      Caption = 'Texture Loading'
      object PlanetsLoadFakeTexture: TMenuItem
        Caption = 'Planets: Load Fake Texture'
        OnClick = PlanetsLoadFakeTextureClick
      end
      object RingsLoadFakeTexture: TMenuItem
        Caption = 'RingsLoadFakeTexture'
        OnClick = RingsLoadFakeTextureClick
      end
      object MoonsLoadFakeTexture: TMenuItem
        Caption = 'Moons: Load Fake Texture'
        OnClick = MoonsLoadFakeTextureClick
      end
      object S3dsLoadFakeTexture: TMenuItem
        Caption = 'S3ds: Load Fake Texture'
        OnClick = S3dsLoadFakeTextureClick
      end
      object AsteroidsLoadFakeTexture: TMenuItem
        Caption = 'Asteroids: Load Fake Texture'
        OnClick = AsteroidsLoadFakeTextureClick
      end
      object CometsLoadFakeTexture: TMenuItem
        Caption = 'CometsLoadFakeTexture'
        OnClick = CometsLoadFakeTextureClick
      end
      object DebrisLoadFakeTexture: TMenuItem
        Caption = 'DebrisLoadFakeTexture'
        OnClick = DebrisLoadFakeTextureClick
      end
    end
    object MoonScaling1: TMenuItem
      Caption = 'Moon Scaling'
      object MoonScalex0: TMenuItem
        Caption = 'x 0'
        RadioItem = True
        OnClick = MoonScalex0Click
      end
      object MoonScalex10: TMenuItem
        Caption = 'x 10'
        Checked = True
        RadioItem = True
        OnClick = MoonScalex10Click
      end
      object MoonScalex50: TMenuItem
        Caption = 'x 50'
        RadioItem = True
        OnClick = MoonScalex50Click
      end
    end
    object SunScaling1: TMenuItem
      Caption = 'Sun Scaling'
      object SunScale20: TMenuItem
        Caption = 'x 20'
        RadioItem = True
        OnClick = SunScale20Click
      end
      object SunScale200: TMenuItem
        Caption = 'x 200'
        Checked = True
        RadioItem = True
        OnClick = SunScale200Click
      end
      object SunScale2000: TMenuItem
        Caption = 'x 2000'
        RadioItem = True
        OnClick = SunScale2000Click
      end
    end
    object OrbitTrails1: TMenuItem
      Caption = 'Orbit Trails'
      object OrbitTrails36: TMenuItem
        Caption = '36'
        RadioItem = True
        OnClick = OrbitTrails36Click
      end
      object OrbitTrails360: TMenuItem
        Caption = '360'
        Checked = True
        RadioItem = True
        OnClick = OrbitTrails360Click
      end
      object OrbitTrails1000: TMenuItem
        Caption = '1000'
        RadioItem = True
        OnClick = OrbitTrails1000Click
      end
      object OrbitTrails3600: TMenuItem
        Caption = '3600'
        RadioItem = True
        OnClick = OrbitTrails3600Click
      end
    end
    object SelectFontMenu: TMenuItem
      Caption = 'Select Font'
      OnClick = SelectFontMenuClick
    end
    object SpudVersionConvertor1: TMenuItem
      Caption = 'Spud Version Convertor'
      OnClick = SpudVersionConvertor1Click
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = ExitBtnClick
    end
  end
  object CometGLMaterialLibrary: TGLMaterialLibrary
    Materials = <
      item
        Name = 'BlueBall'
        Tag = 0
        Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Emission.Color = {F3F2F23EF3F2F23E0000803F0000803F}
        Material.BlendingMode = bmTransparency
        Material.Texture.ImageAlpha = tiaAlphaFromIntensity
        Material.Texture.MinFilter = miLinear
        Material.Texture.TextureMode = tmModulate
        Material.Texture.TextureFormat = tfLuminanceAlpha
        Material.Texture.Disabled = False
      end>
    Left = 392
    Top = 136
  end
  object WindowsBitmapFontA: TGLWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Left = 488
    Top = 72
  end
  object FontDialogA: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 672
    Top = 16
  end
  object GLSimpleNavigation: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewerA
    FormCaption = 'Planet System Creator - %FPS'
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
    Left = 954
    Top = 60
  end
end
