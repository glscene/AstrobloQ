object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  Caption = 'Options'
  ClientHeight = 555
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object PanelBottom: TPanel
    Left = 0
    Top = 520
    Width = 843
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 495
    ExplicitWidth = 835
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 9
    Width = 843
    Height = 511
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    ExplicitWidth = 835
    ExplicitHeight = 486
    object PageControl: TPageControl
      Left = 169
      Top = 5
      Width = 669
      Height = 501
      ActivePage = tsGalaxy
      Align = alClient
      Style = tsButtons
      TabOrder = 0
      ExplicitWidth = 661
      ExplicitHeight = 476
      object tsInterface: TTabSheet
        Caption = 'Interface'
        TabVisible = False
        object LabelProgram: TLabel
          Tag = 1000
          Left = 39
          Top = 3
          Width = 46
          Height = 15
          Alignment = taRightJustify
          Caption = 'Program'
        end
        object LabelData: TLabel
          Left = -34
          Top = 70
          Width = 97
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Data'
        end
        object PanelExePath: TPanel
          Left = 19
          Top = 25
          Width = 319
          Height = 30
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = 'FermiPX.exe'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object cbDataPath: TComboBox
          Left = 19
          Top = 92
          Width = 306
          Height = 38
          TabOrder = 1
        end
        object ButtonBrowsePathData: TButton
          Left = 331
          Top = 92
          Width = 23
          Height = 25
          Hint = 'Browse|Browse the directory'
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object CheckBoxLoadProject: TCheckBox
          Left = 27
          Top = 161
          Width = 184
          Height = 17
          Caption = 'Load when starting'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object CheckBoxSaveProject: TCheckBox
          Left = 200
          Top = 161
          Width = 176
          Height = 17
          Caption = 'Save when exiting'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object rgLanguage: TRadioGroup
          Left = 26
          Top = 224
          Width = 423
          Height = 57
          Caption = 'Language'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'English'
            'Russian'
            'Spanish')
          TabOrder = 5
        end
        object cbSplashStart: TCheckBox
          Left = 382
          Top = 161
          Width = 131
          Height = 18
          Caption = 'Show splash screen'
          TabOrder = 6
        end
      end
      object tsDisplay: TTabSheet
        Caption = 'Display'
        ImageIndex = 2
        TabVisible = False
        object LabelBackground: TLabel
          Left = 178
          Top = 23
          Width = 64
          Height = 15
          Caption = 'Background'
        end
        object LabelMapUnits: TLabel
          Left = 11
          Top = 146
          Width = 53
          Height = 15
          Caption = 'Map units'
        end
        object CheckBoxAxes: TCheckBox
          Left = 11
          Top = 24
          Width = 62
          Height = 17
          Caption = 'Axes'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object PanelBackground: TPanel
          Left = 278
          Top = 19
          Width = 25
          Height = 25
          Hint = 'Click to change background colour'
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
        end
        object CheckBoxCoordinates: TCheckBox
          Left = 11
          Top = 99
          Width = 131
          Height = 20
          Caption = 'Coordinates'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object ComboBoxMapUnits: TComboBox
          Left = 122
          Top = 143
          Width = 159
          Height = 23
          Hint = 'Map units'
          TabOrder = 3
          Text = 'Light Years, ly'
          Items.Strings = (
            'Light Years, ly'
            'Parsecs, pc'
            'Kiloparsecs, kpc')
        end
        object cbxTwoSideLighting: TCheckBox
          Left = 11
          Top = 62
          Width = 166
          Height = 17
          Caption = 'Two Side Lighting'
          TabOrder = 4
        end
        object gbStarColors: TGroupBox
          Left = 360
          Top = 23
          Width = 218
          Height = 306
          Caption = 'Star Colors'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object ShapeM: TShape
            Left = 152
            Top = 234
            Width = 41
            Height = 20
            Brush.Color = clRed
            OnMouseDown = ShapeColorMouseDown
          end
          object ShapeK: TShape
            Left = 152
            Top = 206
            Width = 41
            Height = 20
            Brush.Color = clFuchsia
            OnMouseDown = ShapeColorMouseDown
          end
          object ShapeG: TShape
            Left = 152
            Top = 176
            Width = 41
            Height = 20
            Brush.Color = clYellow
            OnMouseDown = ShapeColorMouseDown
          end
          object ShapeF: TShape
            Left = 153
            Top = 148
            Width = 41
            Height = 20
            Brush.Color = clMoneyGreen
            OnMouseDown = ShapeColorMouseDown
          end
          object ShapeA: TShape
            Left = 152
            Top = 121
            Width = 41
            Height = 20
            OnMouseDown = ShapeColorMouseDown
          end
          object ShapeO: TShape
            Left = 152
            Top = 62
            Width = 41
            Height = 20
            Brush.Color = clBlue
            OnMouseDown = ShapeColorMouseDown
          end
          object ShapeB: TShape
            Left = 152
            Top = 90
            Width = 41
            Height = 20
            Brush.Color = clSkyBlue
            OnMouseDown = ShapeColorMouseDown
          end
          object Label4: TLabel
            Left = 102
            Top = 34
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
          object Label3: TLabel
            Left = 22
            Top = 36
            Width = 30
            Height = 16
            Caption = 'Class'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ShapeW: TShape
            Left = 152
            Top = 262
            Width = 41
            Height = 20
            Brush.Color = clMaroon
            OnMouseDown = ShapeColorMouseDown
          end
          object chbStarColors: TCheckListBox
            Left = 16
            Top = 58
            Width = 65
            Height = 229
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemHeight = 27
            Items.Strings = (
              'O'
              'B'
              'A'
              'F'
              'G'
              'K'
              'M'
              'W')
            ParentFont = False
            TabOrder = 0
          end
          object ListBox2: TListBox
            Left = 95
            Top = 56
            Width = 51
            Height = 233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemHeight = 27
            Items.Strings = (
              '0.1'
              '0.4'
              '0.5'
              '3'
              '8'
              '12'
              '75'
              '1')
            ParentFont = False
            TabOrder = 1
          end
          object stColor: TStaticText
            Left = 152
            Top = 36
            Width = 34
            Height = 20
            Caption = 'Color'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object tsMaterial: TTabSheet
        Caption = 'Material'
        ImageIndex = 4
        TabVisible = False
        DesignSize = (
          661
          491)
        object ListView: TListView
          Left = 0
          Top = 0
          Width = 661
          Height = 217
          Align = alTop
          Columns = <
            item
              Caption = 'Model'
              MaxWidth = 100
              MinWidth = 100
              Width = 100
            end
            item
              Alignment = taCenter
              Caption = 'Table'
              MaxWidth = 400
              MinWidth = 400
              Width = 400
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          ExplicitWidth = 669
        end
        object ButtonModifyMat: TButton
          Left = 145
          Top = 273
          Width = 104
          Height = 24
          Caption = 'Modify...'
          TabOrder = 1
        end
        object chlbStarClasses: TCheckListBox
          Left = 455
          Top = 273
          Width = 104
          Height = 113
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 15
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 17
          Items.Strings = (
            '"O"'
            '"A"'
            '"B"'
            '"F"'
            '"G"'
            '"K"'
            '"M"')
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
      end
      object tsGalaxy: TTabSheet
        Caption = 'Galaxy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Segoe UI'
        Font.Style = []
        ImageIndex = 4
        ParentFont = False
        TabVisible = False
        object LabelDiameter: TLabel
          Left = 40
          Top = 72
          Width = 76
          Height = 17
          Caption = #1044#1080#1072#1084#1077#1090#1088', Dg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 40
          Top = 117
          Width = 78
          Height = 17
          Caption = #1058#1086#1083#1097#1080#1085#1072', Hg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 40
          Top = 19
          Width = 97
          Height = 17
          Caption = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076', Ns'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 49
          Top = 167
          Width = 68
          Height = 17
          Caption = #1054#1073#1098#1105#1084', Vg '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object EditDg: TEdit
          Left = 200
          Top = 69
          Width = 176
          Height = 25
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '100000'
        end
        object EditHg: TEdit
          Left = 200
          Top = 114
          Width = 176
          Height = 25
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '1000'
        end
        object EditNs: TEdit
          Left = 200
          Top = 16
          Width = 176
          Height = 25
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '400000000000'
        end
        object stVolume: TStaticText
          Left = 200
          Top = 167
          Width = 176
          Height = 27
          Alignment = taRightJustify
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object rgUnits: TRadioGroup
          Left = 406
          Top = 3
          Width = 212
          Height = 201
          Caption = #1045#1076#1080#1085#1080#1094#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemIndex = 2
          Items.Strings = (
            'Million Kilometers, mkm'
            'Astronomical Units, au'
            'Light Years, ly'
            'Parsecs, pc'
            'Kiloparsecs, kpc')
          ParentFont = False
          TabOrder = 4
          OnClick = rgUnitsClick
        end
      end
      object tsStars: TTabSheet
        Caption = 'Stars'
        ImageIndex = 5
        TabVisible = False
        object ColorGrid1: TColorGrid
          Left = 240
          Top = 88
          Width = 98
          Height = 98
          TabOrder = 0
        end
      end
      object tsPlanets: TTabSheet
        Caption = 'Planets'
        ImageIndex = 6
        TabVisible = False
        object ListBox1: TListBox
          Left = 32
          Top = 64
          Width = 202
          Height = 337
          ItemHeight = 17
          TabOrder = 0
        end
        object ComboBox1: TComboBox
          Left = 360
          Top = 272
          Width = 145
          Height = 38
          TabOrder = 1
          Text = 'ComboBox1'
        end
        object Memo1: TMemo
          Left = 336
          Top = 121
          Width = 185
          Height = 89
          Lines.Strings = (
            'Memo1')
          TabOrder = 2
        end
      end
      object tsGeneral: TTabSheet
        Caption = 'General'
        ImageIndex = 7
        TabVisible = False
        object LabelPrecision: TLabel
          Left = 168
          Top = 233
          Width = 48
          Height = 15
          Caption = 'Precision'
        end
        object gbxCoordinateSys: TGroupBox
          Left = 168
          Top = 24
          Width = 281
          Height = 169
          Caption = 'Coordinate system'
          TabOrder = 0
          object chbEquatorial: TCheckBox
            Left = 32
            Top = 32
            Width = 97
            Height = 17
            Caption = 'Equatorial'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object CheckBox1: TCheckBox
            Left = 32
            Top = 64
            Width = 97
            Height = 17
            Caption = 'Horizontal'
            TabOrder = 1
          end
          object CheckBox2: TCheckBox
            Left = 32
            Top = 97
            Width = 97
            Height = 17
            Caption = 'Galactic'
            TabOrder = 2
          end
          object CheckBox3: TCheckBox
            Left = 32
            Top = 133
            Width = 97
            Height = 17
            Caption = 'Ecliptic'
            TabOrder = 3
          end
          object rgrSystem: TRadioGroup
            Left = 144
            Top = 16
            Width = 129
            Height = 82
            Ctl3D = True
            ItemIndex = 0
            Items.Strings = (
              'Spherical'
              'Cartesian')
            ParentCtl3D = False
            TabOrder = 4
          end
        end
        object TrackBar1: TTrackBar
          Left = 472
          Top = 72
          Width = 150
          Height = 33
          Min = 1
          Position = 2
          TabOrder = 1
        end
        object PanelScale: TPanel
          Left = 168
          Top = 301
          Width = 313
          Height = 123
          BevelInner = bvLowered
          BevelKind = bkFlat
          TabOrder = 2
          object lblScaleX: TLabel
            Left = 33
            Top = 25
            Width = 43
            Height = 15
            Alignment = taRightJustify
            Caption = 'Factor X'
          end
          object Label1: TLabel
            Left = 33
            Top = 52
            Width = 43
            Height = 15
            Alignment = taRightJustify
            Caption = 'Factor Y'
          end
          object Label2: TLabel
            Left = 33
            Top = 81
            Width = 43
            Height = 15
            Alignment = taRightJustify
            Caption = 'Factor Z'
          end
          object Edit1: TEdit
            Left = 128
            Top = 16
            Width = 121
            Height = 23
            TabOrder = 0
            Text = 'Edit1'
          end
          object Edit2: TEdit
            Left = 128
            Top = 45
            Width = 121
            Height = 23
            TabOrder = 1
            Text = 'Edit1'
          end
          object Edit3: TEdit
            Left = 128
            Top = 74
            Width = 121
            Height = 23
            TabOrder = 2
            Text = 'Edit1'
          end
        end
        object SpinEditPrecision: TSpinEdit
          Left = 266
          Top = 223
          Width = 41
          Height = 23
          Hint = 'Precision'
          MaxValue = 18
          MinValue = 0
          TabOrder = 3
          Value = 2
        end
      end
      object tsFlights: TTabSheet
        Caption = 'Flights'
        ImageIndex = 8
        TabVisible = False
        object PanelTitle: TPanel
          Left = 0
          Top = 0
          Width = 669
          Height = 499
          Align = alClient
          TabOrder = 0
          object LabelA: TLabel
            Left = 88
            Top = 9
            Width = 31
            Height = 15
            Caption = 'Star A'
          end
          object LabelB: TLabel
            Left = 363
            Top = 9
            Width = 30
            Height = 15
            Caption = 'Star B'
          end
          object LabelDistance: TLabel
            Left = 94
            Top = 168
            Width = 60
            Height = 15
            Caption = 'Distance, ly'
          end
          object LabelVelocity: TLabel
            Left = 94
            Top = 216
            Width = 86
            Height = 15
            Caption = 'Velocity, km/sec'
          end
          object LabelFlightTime: TLabel
            Left = 94
            Top = 262
            Width = 90
            Height = 15
            Caption = 'Flight time, years'
          end
          object SearchBoxA: TSearchBox
            Left = 56
            Top = 30
            Width = 145
            Height = 23
            Alignment = taCenter
            AutoSize = False
            TabOrder = 0
            Text = 'Sol'
          end
          object trbVelocity: TTrackBar
            Left = 186
            Top = 211
            Width = 167
            Height = 29
            Max = 299792
            Min = 100
            Position = 30000
            TabOrder = 1
            OnChange = trbVelocityChange
          end
          object stFlightTime: TStaticText
            Left = 193
            Top = 262
            Width = 150
            Height = 19
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Caption = '100000'
            TabOrder = 2
          end
          object SearchBoxB: TSearchBox
            Left = 312
            Top = 30
            Width = 137
            Height = 23
            Alignment = taCenter
            AutoSize = False
            TabOrder = 3
            Text = 'TOI-700'
          end
          object EditDistance: TEdit
            Left = 193
            Top = 165
            Width = 150
            Height = 23
            Alignment = taCenter
            TabOrder = 4
            Text = '101.4'
          end
          object stTrackBar: TStaticText
            Left = 359
            Top = 216
            Width = 50
            Height = 19
            Caption = 'TrackBar'
            TabOrder = 5
          end
          object gbFindPath: TGroupBox
            Left = 72
            Top = 73
            Width = 359
            Height = 72
            Caption = 'Find Path'
            TabOrder = 6
            object chbOnTetramesh: TCheckBox
              Left = 102
              Top = 21
              Width = 211
              Height = 17
              Caption = 'On Delaunay Tetramesh'
              TabOrder = 0
            end
            object chbAvoidHazards: TCheckBox
              Left = 102
              Top = 44
              Width = 209
              Height = 17
              Caption = 'Avoiding Voronet Hazard Cells '
              TabOrder = 1
            end
          end
          object Button1: TButton
            Left = 400
            Top = 258
            Width = 75
            Height = 25
            Caption = 'Find'
            ModalResult = 1
            TabOrder = 7
          end
        end
      end
    end
    object tvOptions: TTreeView
      Left = 5
      Top = 5
      Width = 164
      Height = 501
      Align = alLeft
      AutoExpand = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      HotTrack = True
      Images = ImageList
      Indent = 19
      ParentFont = False
      TabOrder = 1
      OnClick = tvOptionsClick
      Items.NodeData = {
        070800000009540054007200650065004E006F00640065002D00000000000000
        00000000FFFFFFFFFFFFFFFF000000000000000000000000000107470065006E
        006500720061006C000000310000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000000010949006E007400650072006600610063006500
        00002D0000000000000000000000FFFFFFFFFFFFFFFF02000000000000000000
        000000010744006900730070006C006100790000002F00000000000000000000
        00FFFFFFFFFFFFFFFF0400000000000000000000000001084D00610074006500
        7200690061006C0000002B0000000000000000000000FFFFFFFFFFFFFFFF0000
        00000000000000000000000106470061006C0061007800790000002900000000
        00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001055300
        740061007200730000002D0000000000000000000000FFFFFFFFFFFFFFFF0000
        0000000000000000000000010750006C0061006E0065007400730000002D0000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000000107
        46006C0069006700680074007300}
      ExplicitHeight = 476
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 843
    Height = 9
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 835
  end
  object ImageList: TImageList
    Left = 57
    Top = 204
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF00
      0000BF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000000000000000000000000000BF000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000BF0000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000000000000000000000000000BF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BF0000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000000000000000000000000000BF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BF0000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000000000000000000000000000BF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000000000000000000000000000BF000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00808080000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000000000000000000000000000BF000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000080808000C0C0C000C0C0
      C0000000000000000000C0C0C000C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000000000008080800000FF000000FF
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF0000000000
      000000FFFF0080808000000000000000000080808000C0C0C000000000000000
      0000000000000000000000000000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000008080800000FF0000000000000000
      000000000000000000000000000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF008080
      800080808000FFFFFF008080800080808000FFFFFF008080800080808000FFFF
      FF008080800000000000000000000000000000000000BF000000FFFFFF00BF00
      0000BF000000FFFFFF00BF000000BF000000FFFFFF00BF000000BF0000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF00
      00000000000000FFFF0080808000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF00BF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008080800000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BF00BF00BF00BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFF80078007FFFFFFFF
      80078007F9FFF9FFBFF7BFD7F0FFF0FFA497A487F0FFF0FFBFF7BFC7E07FE07F
      A497A483C07FC07FBFF7BFCB843F843F800780011E3F1E3F80078005FE1FFE1F
      80078000FF1FFF1FFFFFFFF0FF8FFF8FFFFFFFF8FFC7FFC7FFFFFFF8FFE3FFE3
      FFFFFFFCFFF8FFF8FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ColorDialog: TColorDialog
    Left = 751
    Top = 581
  end
  object GLMaterialLibrary: TGLMaterialLibrary
    Materials = <
      item
        Name = 'StarO'
        Tag = 0
      end
      item
        Name = 'StarB'
        Tag = 0
      end
      item
        Name = 'StarA'
        Tag = 0
      end
      item
        Name = 'StarF'
        Tag = 0
      end
      item
        Name = 'StarG'
        Tag = 0
      end
      item
        Name = 'StarK'
        Tag = 0
      end
      item
        Name = 'StarM'
        Tag = 0
      end
      item
        Name = 'StarW'
        Tag = 0
      end>
    Left = 230
    Top = 332
  end
end
