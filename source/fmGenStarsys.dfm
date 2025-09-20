object frmGenStarsys: TfrmGenStarsys
  Left = 30
  Top = 20
  Caption = 'Star system generator'
  ClientHeight = 582
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
  TextHeight = 13
  object GLSceneViewerA: TGLSceneViewer
    Left = 345
    Top = 0
    Width = 555
    Height = 563
    Camera = GLCamera
    BeforeRender = GLSceneViewerABeforeRender
    Buffer.BackgroundColor = clBackground
    Buffer.AmbientColor.Color = {9A99193F9A99193F9A99193F0000803F}
    FieldOfView = 159.572052001953100000
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
    Width = 345
    Height = 563
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 538
    object ToolBarGB: TGroupBox
      Left = 1
      Top = 1
      Width = 343
      Height = 561
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitHeight = 536
      object Label2: TLabel
        Left = 20
        Top = 101
        Width = 32
        Height = 13
        Caption = 'Moons'
        ParentShowHint = False
        ShowHint = False
      end
      object Label6: TLabel
        Left = 25
        Top = 80
        Width = 27
        Height = 13
        Caption = 'Rings'
        ParentShowHint = False
        ShowHint = False
      end
      object CameraDistanceLabel: TLabel
        Left = 64
        Top = 424
        Width = 27
        Height = 13
        Hint = 'Camera Distance'
        Caption = '20.00'
      end
      object Label22: TLabel
        Left = 8
        Top = 408
        Width = 36
        Height = 13
        Caption = 'Camera'
      end
      object TimeLabel: TLabel
        Left = 8
        Top = 440
        Width = 52
        Height = 13
        Hint = 'Days Per Frame'
        Caption = 'Time Warp'
      end
      object Label9: TLabel
        Left = 194
        Top = 402
        Width = 63
        Height = 13
        Caption = 'Planet Picker'
      end
      object Label7: TLabel
        Left = 28
        Top = 125
        Width = 30
        Height = 13
        Caption = 'S3ds :'
        ParentShowHint = False
        ShowHint = False
      end
      object Label19: TLabel
        Left = 152
        Top = 100
        Width = 60
        Height = 13
        Caption = 'S3ds Scaler:'
        ParentShowHint = False
        ShowHint = False
      end
      object S3dsScalerLabel: TLabel
        Left = 224
        Top = 100
        Width = 21
        Height = 13
        Hint = 'Scale'
        Caption = '1.00'
      end
      object SunShineLabel: TLabel
        Left = 272
        Top = 440
        Width = 18
        Height = 13
        Hint = 'Sun Shine Size'
        Caption = '100'
      end
      object CFLLabel: TLabel
        Left = 8
        Top = 424
        Width = 12
        Height = 13
        Hint = 'Focal Length'
        Caption = '50'
      end
      object S3dsScalerScaleLabel: TLabel
        Left = 304
        Top = 100
        Width = 18
        Height = 13
        Hint = 'Scale Scale'
        Caption = '100'
      end
      object HourLabel: TLabel
        Left = 8
        Top = 456
        Width = 12
        Height = 13
        Hint = 'Hours of 24'
        Caption = '24'
      end
      object LabelLabel: TLabel
        Left = 208
        Top = 456
        Width = 15
        Height = 13
        Hint = 'Label Font Scale'
        Caption = '0.1'
      end
      object SunRG: TRadioGroup
        Left = 40
        Top = 34
        Width = 25
        Height = 39
        ItemIndex = 0
        Items.Strings = (
          'P'
          'M')
        TabOrder = 33
        OnClick = PlanetsRGClick
      end
      object CometRG: TRadioGroup
        Left = 248
        Top = 40
        Width = 25
        Height = 57
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
        Left = 312
        Top = 40
        Width = 25
        Height = 57
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
        Left = 184
        Top = 40
        Width = 25
        Height = 57
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
        Left = 196
        Top = 139
        Width = 143
        Height = 263
        Caption = 'Orbit'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object OrbitRotationEdit: TEdit
          Left = 8
          Top = 16
          Width = 58
          Height = 21
          Hint = 'OrbitRotation days:'
          Color = clAqua
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object iConstEdit: TEdit
          Left = 8
          Top = 64
          Width = 58
          Height = 21
          Hint = 'iConst: Inclination :'
          Color = clAqua
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object aConstEdit: TEdit
          Left = 8
          Top = 40
          Width = 58
          Height = 21
          Hint = 'aConst : Distance :1000 Kilometers'
          Color = clAqua
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object eConstEdit: TEdit
          Left = 8
          Top = 88
          Width = 58
          Height = 21
          Hint = 'eConst: Eccentricity :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object eVarEdit: TEdit
          Left = 72
          Top = 90
          Width = 58
          Height = 21
          Hint = 'Eccentricity Var:perehelion'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object EMaxEdit: TEdit
          Left = 72
          Top = 114
          Width = 57
          Height = 21
          Hint = 'Eccentricity Max:aphelion'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object aVarEdit: TEdit
          Left = 72
          Top = 40
          Width = 58
          Height = 21
          Hint = 'Var Distance :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object wVarEdit: TEdit
          Left = 72
          Top = 160
          Width = 58
          Height = 21
          Hint = 'Var Perihelion :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object wConstEdit: TEdit
          Left = 8
          Top = 160
          Width = 58
          Height = 21
          Hint = 'wConst Perihelion :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object NVarEdit: TEdit
          Left = 72
          Top = 136
          Width = 58
          Height = 21
          Hint = 'Var Longitude :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object NConstEdit: TEdit
          Left = 8
          Top = 136
          Width = 58
          Height = 21
          Hint = 'nConst Longitude :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
        end
        object MVarEdit: TEdit
          Left = 72
          Top = 184
          Width = 58
          Height = 21
          Hint = 'Var Anomaly :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object MConstEdit: TEdit
          Left = 8
          Top = 184
          Width = 58
          Height = 21
          Hint = 'mConst Anomaly :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
        end
        object iVarEdit: TEdit
          Left = 72
          Top = 64
          Width = 58
          Height = 21
          Hint = 'Var Inclination :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
        end
        object AlbedoEdit: TEdit
          Left = 72
          Top = 16
          Width = 58
          Height = 21
          Hint = 'Albedo :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
        end
        object VelocityEdit: TEdit
          Left = 8
          Top = 234
          Width = 58
          Height = 21
          Hint = 'Velocity :'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
        object AtmosphereCB: TComboBox
          Left = 8
          Top = 210
          Width = 65
          Height = 21
          Hint = 'Atmosphere'
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
          Left = 72
          Top = 210
          Width = 58
          Height = 21
          Hint = 'Velocity Type'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
        end
        object VelocityDirEdit: TEdit
          Left = 72
          Top = 234
          Width = 58
          Height = 21
          Hint = 'Velocity Direction'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
        end
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 138
        Width = 143
        Height = 263
        Caption = 'Object'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object MoonsLabel: TLabel
          Left = 39
          Top = 137
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moons'
        end
        object lbRings: TLabel
          Left = 38
          Top = 112
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rings :'
        end
        object lbRadius: TLabel
          Left = 15
          Top = 39
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Radius (km)'
        end
        object lbRotation: TLabel
          Left = 4
          Top = 63
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rotation (hour)'
        end
        object lbAxisTilt: TLabel
          Left = 32
          Top = 88
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Axis Tilt:'
        end
        object Label10: TLabel
          Left = 40
          Top = 14
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object Label17: TLabel
          Left = 16
          Top = 186
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Doc Index :'
        end
        object nbS3dLabel: TLabel
          Left = 29
          Top = 161
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'nbS3ds :'
        end
        object RadiusEdit: TEdit
          Left = 80
          Top = 40
          Width = 58
          Height = 21
          Color = clAqua
          TabOrder = 0
        end
        object ObjectRotationEdit: TEdit
          Left = 80
          Top = 64
          Width = 58
          Height = 21
          Color = clAqua
          TabOrder = 1
        end
        object AxisTiltEdit: TEdit
          Left = 80
          Top = 89
          Width = 58
          Height = 21
          Color = clAqua
          TabOrder = 2
        end
        object nbRingsEdit: TEdit
          Left = 80
          Top = 113
          Width = 58
          Height = 21
          TabOrder = 3
        end
        object nbMoonsEdit: TEdit
          Left = 80
          Top = 137
          Width = 58
          Height = 21
          TabOrder = 4
        end
        object NameEdit: TEdit
          Left = 80
          Top = 16
          Width = 57
          Height = 21
          Color = clAqua
          TabOrder = 5
        end
        object DocIndexEdit: TEdit
          Left = 80
          Top = 186
          Width = 58
          Height = 21
          TabOrder = 6
        end
        object ScaleObjectEdit: TEdit
          Left = 80
          Top = 234
          Width = 58
          Height = 21
          Hint = 'Scale Object'
          Color = clAqua
          TabOrder = 7
        end
        object nbS3dsEdit: TEdit
          Left = 80
          Top = 161
          Width = 58
          Height = 21
          TabOrder = 8
        end
        object nbS3dsCB: TCheckBox
          Left = 6
          Top = 161
          Width = 17
          Height = 17
          Hint = '3Ds Self Textured'
          TabOrder = 9
        end
        object ScaleDistanceEdit: TEdit
          Left = 5
          Top = 234
          Width = 58
          Height = 21
          Hint = 'Scale Distance'
          Color = clAqua
          TabOrder = 10
        end
        object RCDTypeEdit: TEdit
          Left = 8
          Top = 234
          Width = 25
          Height = 21
          Hint = 'RCD Type'
          Color = clAqua
          TabOrder = 11
          Text = 'RCD'
        end
        object RCDCountEdit: TEdit
          Left = 34
          Top = 234
          Width = 25
          Height = 21
          Hint = 'Count'
          Color = clAqua
          TabOrder = 12
          Text = '#'
        end
        object RCDXYSizeEdit: TEdit
          Left = 62
          Top = 234
          Width = 25
          Height = 21
          Hint = 'XY Size'
          Color = clAqua
          TabOrder = 13
          Text = 'XYSize'
        end
        object RCDZSizeEdit: TEdit
          Left = 88
          Top = 234
          Width = 25
          Height = 21
          Hint = 'Z Size'
          Color = clAqua
          TabOrder = 14
          Text = 'Z'
        end
        object RCDPositionEdit: TEdit
          Left = 112
          Top = 234
          Width = 25
          Height = 21
          Hint = 'Position'
          Color = clAqua
          TabOrder = 15
          Text = 'P'
        end
        object MassEdit: TEdit
          Left = 16
          Top = 210
          Width = 58
          Height = 21
          Hint = 'Mass (kg) :'
          TabOrder = 16
        end
        object DensityEdit: TEdit
          Left = 80
          Top = 210
          Width = 58
          Height = 21
          Hint = 'Density: (Comet Count)'
          TabOrder = 17
        end
      end
      object SSORG: TRadioGroup
        Left = 8
        Top = 8
        Width = 329
        Height = 33
        Caption = 'Celectial bodies'
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
        Left = 64
        Top = 48
        Width = 33
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        Text = '0'
      end
      object PlanetUpDown: TUpDown
        Left = 97
        Top = 48
        Width = 16
        Height = 21
        Hint = 'Planet'
        Associate = PlanetEdit
        TabOrder = 4
      end
      object AsteroidUpDown: TUpDown
        Left = 177
        Top = 48
        Width = 16
        Height = 21
        Hint = 'Asteroid'
        Associate = AsteroidEdit
        TabOrder = 5
      end
      object AsteroidEdit: TEdit
        Left = 144
        Top = 48
        Width = 33
        Height = 21
        TabOrder = 6
        Text = '0'
      end
      object CometUpDown: TUpDown
        Left = 241
        Top = 48
        Width = 16
        Height = 21
        Hint = 'Comet'
        Associate = CometEdit
        TabOrder = 7
      end
      object CometEdit: TEdit
        Left = 208
        Top = 48
        Width = 33
        Height = 21
        TabOrder = 8
        Text = '0'
      end
      object DebrisEdit: TEdit
        Left = 272
        Top = 48
        Width = 33
        Height = 21
        TabOrder = 9
        Text = '0'
      end
      object DebrisUpDown: TUpDown
        Left = 305
        Top = 48
        Width = 16
        Height = 21
        Hint = 'Debris'
        Associate = DebrisEdit
        TabOrder = 10
      end
      object RingsEdit: TEdit
        Left = 64
        Top = 72
        Width = 33
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 11
        Text = '0'
      end
      object RingsUpDown: TUpDown
        Left = 97
        Top = 72
        Width = 16
        Height = 21
        Hint = 'Rings'
        Associate = RingsEdit
        TabOrder = 12
      end
      object MoonsEdit: TEdit
        Left = 64
        Top = 96
        Width = 33
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 13
        Text = '0'
      end
      object MoonsUpDown: TUpDown
        Left = 97
        Top = 96
        Width = 16
        Height = 21
        Hint = 'Moons'
        Associate = MoonsEdit
        TabOrder = 14
      end
      object PlanetsRG: TRadioGroup
        Left = 112
        Top = 40
        Width = 25
        Height = 105
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
        Left = 60
        Top = 408
        Width = 100
        Height = 17
        Hint = 'Focal Length'
        Max = 10000
        Min = 50
        ParentShowHint = False
        Position = 50
        ShowHint = True
        TabOrder = 16
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = CFLTrackBarChange
      end
      object TimeTrackBar: TTrackBar
        Left = 60
        Top = 440
        Width = 100
        Height = 17
        Hint = 'Day Time Warp'
        Max = 729
        ParentShowHint = False
        Position = 1
        ShowHint = True
        TabOrder = 17
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = TimeTrackBarChange
      end
      object PlanetPickerCB: TComboBox
        Left = 194
        Top = 416
        Width = 145
        Height = 21
        Hint = 'Center of the Universe'
        TabOrder = 18
        OnChange = PlanetPickerCBChange
      end
      object SunShineCB: TCheckBox
        Left = 194
        Top = 440
        Width = 72
        Height = 17
        Hint = 'Sun Shine On'
        Caption = 'SunShine'
        Checked = True
        State = cbChecked
        TabOrder = 19
        OnClick = SunShineCBClick
      end
      object SunShineTB: TTrackBar
        Left = 288
        Top = 440
        Width = 50
        Height = 17
        Hint = 'Sun Shine Size'
        Max = 200
        Min = 1
        Position = 100
        TabOrder = 20
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = SunShineTBChange
      end
      object BtnPanel: TPanel
        Left = 156
        Top = 144
        Width = 36
        Height = 258
        TabOrder = 21
        object HelpBtn: TSpeedButton
          Left = 2
          Top = 157
          Width = 33
          Height = 22
          Caption = '?'
          ParentShowHint = False
          ShowHint = False
          OnClick = HelpBtnClick
        end
        object StoreBtn: TSpeedButton
          Left = 2
          Top = 80
          Width = 33
          Height = 22
          Caption = 'Store'
          ParentShowHint = False
          ShowHint = False
          OnClick = StoreBtnClick
        end
        object ShowBtn: TSpeedButton
          Left = 2
          Top = 54
          Width = 33
          Height = 22
          Caption = 'Show'
          ParentShowHint = False
          ShowHint = False
          OnClick = ShowBtnClick
        end
        object RunBtn: TSpeedButton
          Left = 2
          Top = 183
          Width = 33
          Height = 22
          Caption = 'Run'
          ParentShowHint = False
          ShowHint = False
          OnClick = RunBtnClick
        end
        object StopBtn: TSpeedButton
          Left = 2
          Top = 208
          Width = 33
          Height = 22
          Caption = 'Stop'
          ParentShowHint = False
          ShowHint = False
          OnClick = StopBtnClick
        end
        object ClearBtn: TSpeedButton
          Left = 2
          Top = 3
          Width = 33
          Height = 22
          Caption = 'Clear'
          ParentShowHint = False
          ShowHint = False
          OnClick = ClearBtnClick
        end
        object LoadBtn: TSpeedButton
          Left = 2
          Top = 29
          Width = 33
          Height = 22
          Caption = 'Load'
          ParentShowHint = False
          ShowHint = False
          OnClick = LoadBtnClick
        end
        object SaveBtn: TSpeedButton
          Left = 2
          Top = 106
          Width = 33
          Height = 22
          Caption = 'Save'
          ParentShowHint = False
          ShowHint = False
          OnClick = SaveBtnClick
        end
        object PrintBtn: TSpeedButton
          Left = 2
          Top = 131
          Width = 33
          Height = 22
          Caption = 'Print'
          ParentShowHint = False
          ShowHint = False
          OnClick = PrintBtnClick
        end
        object ExitBtn: TSpeedButton
          Left = 2
          Top = 234
          Width = 33
          Height = 22
          Caption = 'Exit'
          ParentShowHint = False
          ShowHint = False
          OnClick = ExitBtnClick
        end
      end
      object AS3dsEdit: TEdit
        Left = 144
        Top = 72
        Width = 33
        Height = 21
        TabOrder = 22
        Text = '0'
      end
      object AS3dsUpDown: TUpDown
        Left = 177
        Top = 72
        Width = 16
        Height = 21
        Hint = 'S3ds'
        Associate = AS3dsEdit
        TabOrder = 23
      end
      object CS3dsEdit: TEdit
        Left = 208
        Top = 72
        Width = 33
        Height = 21
        TabOrder = 24
        Text = '0'
      end
      object CS3dsUpDown: TUpDown
        Left = 241
        Top = 72
        Width = 16
        Height = 21
        Hint = 'S3ds'
        Associate = CS3dsEdit
        TabOrder = 25
      end
      object DS3dsEdit: TEdit
        Left = 272
        Top = 72
        Width = 33
        Height = 21
        TabOrder = 26
        Text = '0'
      end
      object DS3dsUpDown: TUpDown
        Left = 305
        Top = 72
        Width = 16
        Height = 21
        Hint = 'S3ds'
        Associate = DS3dsEdit
        TabOrder = 27
      end
      object Edit4: TEdit
        Left = 8
        Top = 48
        Width = 25
        Height = 21
        TabOrder = 31
        Text = '0'
      end
      object SS3dsUpDown: TUpDown
        Left = 33
        Top = 48
        Width = 16
        Height = 21
        Hint = 'S3ds'
        Associate = Edit4
        TabOrder = 32
      end
      object PS3dsUpDown: TUpDown
        Left = 97
        Top = 120
        Width = 16
        Height = 21
        Hint = 'S3ds'
        Associate = PS3dsEdit
        TabOrder = 34
      end
      object PS3dsEdit: TEdit
        Left = 64
        Top = 120
        Width = 33
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 35
        Text = '0'
      end
      object PickActiveCB: TCheckBox
        Left = 176
        Top = 408
        Width = 17
        Height = 17
        Hint = 'Mouse Pick Active'
        TabOrder = 36
        OnClick = PickActiveCBClick
      end
      object LabelsOnCB: TCheckBox
        Left = 160
        Top = 456
        Width = 17
        Height = 17
        Hint = 'Labels On'
        TabOrder = 37
        OnClick = LabelsOnCBClick
      end
      object UseOrbitalElementsCB: TCheckBox
        Left = 176
        Top = 440
        Width = 17
        Height = 17
        Hint = 'Use Orbital Elements'
        TabOrder = 38
        OnClick = UseOrbitalElementsCBClick
      end
      object OrbitTrailsOnCB: TCheckBox
        Left = 160
        Top = 408
        Width = 17
        Height = 17
        Hint = 'Orbit Trails On'
        TabOrder = 39
        OnClick = OrbitTrailsOnCBClick
      end
      object DocIndexLinkCB: TCheckBox
        Left = 176
        Top = 424
        Width = 17
        Height = 17
        Hint = 'Display Doc Index'
        TabOrder = 40
        OnClick = DocIndexLinkCBClick
      end
      object AtmosphereOnCB: TCheckBox
        Left = 160
        Top = 424
        Width = 17
        Height = 17
        Hint = 'Atmosphere On'
        TabOrder = 41
        OnClick = AtmosphereOnCBClick
      end
      object S3dsScalerTB: TTrackBar
        Left = 140
        Top = 116
        Width = 100
        Height = 17
        Hint = 'Scaler'
        Max = 200
        Min = 1
        Position = 100
        TabOrder = 42
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = S3dsScalerTBChange
      end
      object CameraDistanceUpDown: TUpDown
        Left = 112
        Top = 424
        Width = 41
        Height = 17
        Hint = 'Camera Distance'
        Min = -120
        Max = 120
        Orientation = udHorizontal
        ParentShowHint = False
        ShowHint = True
        TabOrder = 43
        OnClick = CameraDistanceUpDownClick
      end
      object S3dsScalerScalerTB: TTrackBar
        Left = 236
        Top = 116
        Width = 100
        Height = 17
        Hint = 'Scaler Scaler'
        Max = 1000
        Min = 1
        Position = 100
        TabOrder = 44
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = S3dsScalerTBChange
      end
      object HoursTimeTrackBar: TTrackBar
        Left = 60
        Top = 456
        Width = 100
        Height = 17
        Hint = '24 Hr Time Warp'
        Max = 24
        Min = 1
        Position = 24
        TabOrder = 45
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = TimeTrackBarChange
      end
      object LabelTB: TTrackBar
        Left = 236
        Top = 456
        Width = 100
        Height = 17
        Hint = 'Label Font Scale'
        Max = 2000
        Min = 1
        Position = 100
        TabOrder = 46
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = LabelTBChange
      end
      object DateTimePicker1: TDateTimePicker
        Left = 160
        Top = 456
        Width = 81
        Height = 21
        Date = 45346.000000000000000000
        Time = 0.830723009261419100
        TabOrder = 47
        Visible = False
        OnChange = DateTimePicker1Change
      end
      object DatePickerCB: TCheckBox
        Left = 160
        Top = 440
        Width = 17
        Height = 17
        Hint = 'Display Date Picker'
        TabOrder = 48
        OnClick = DatePickerCBClick
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 563
    Width = 900
    Height = 19
    Panels = <
      item
        Width = 86
      end>
    ExplicitTop = 538
    ExplicitWidth = 892
  end
  object GLCadencerA: TGLCadencer
    Scene = GLSceneA
    OnProgress = GLCadencerAProgress
    Left = 798
    Top = 114
  end
  object GLMaterialLibraryA: TGLMaterialLibrary
    Left = 600
    Top = 282
  end
  object GLSceneA: TGLScene
    ObjectsSorting = osNone
    VisibilityCulling = vcHierarchical
    Left = 798
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
  object OpenDialog: TOpenDialog
    Left = 1006
    Top = 184
  end
  object SaveDialog: TSaveDialog
    Left = 824
    Top = 332
  end
  object TimerA: TTimer
    OnTimer = TimerATimer
    Left = 614
    Top = 410
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
    Left = 812
    Top = 220
  end
  object WindowsBitmapFontA: TGLWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Left = 824
    Top = 450
  end
  object FontDialogA: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 1036
    Top = 310
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
