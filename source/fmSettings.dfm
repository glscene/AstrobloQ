inherited frmSettings: TfrmSettings
  Caption = 'Settings'
  ClientHeight = 759
  ClientWidth = 1313
  Font.Height = -19
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1329
  ExplicitHeight = 798
  TextHeight = 25
  object PanelBottom: TPanel
    Left = 0
    Top = 687
    Width = 1313
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 662
    ExplicitWidth = 1305
    object ButtonOk: TButton
      Left = 1079
      Top = 10
      Width = 131
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOKClick
    end
  end
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 1313
    Height = 687
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1305
    ExplicitHeight = 662
    object tvSettings: TTreeView
      Left = 1
      Top = 1
      Width = 218
      Height = 685
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      AutoExpand = True
      HotTrack = True
      Indent = 33
      TabOrder = 0
      OnClick = tvSettingsClick
      Items.NodeData = {
        070800000009540054007200650065004E006F00640065002D00000000000000
        00000000FFFFFFFFFFFFFFFF000000000000000000000000000107470065006E
        006500720061006C000000310000000000000000000000FFFFFFFFFFFFFFFF01
        000000000000000000000000010949006E007400650072006600610063006500
        00002D0000000000000000000000FFFFFFFFFFFFFFFF02000000000000000000
        000000010744006900730070006C006100790000002F00000000000000000000
        00FFFFFFFFFFFFFFFF0300000000000000000000000001084D00610074006500
        7200690061006C0000002B0000000000000000000000FFFFFFFFFFFFFFFF0400
        00000000000000000000000106470061006C0061007800790000002900000000
        00000000000000FFFFFFFFFFFFFFFF0500000000000000000000000001055300
        740061007200730000002D0000000000000000000000FFFFFFFFFFFFFFFF0600
        0000000000000000000000010750006C0061006E0065007400730000002D0000
        000000000000000000FFFFFFFFFFFFFFFF070000000000000000000000000107
        5000610074006800770061007900}
      ExplicitHeight = 660
    end
    object PageControl: TPageControl
      Left = 219
      Top = 1
      Width = 1093
      Height = 685
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ActivePage = tsStars
      Align = alClient
      Style = tsButtons
      TabOrder = 1
      ExplicitWidth = 1085
      ExplicitHeight = 660
      object tsInterface: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Interface'
        TabVisible = False
        object Label2: TLabel
          Left = 495
          Top = 88
          Width = 140
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Style of interface'
        end
        object CheckBoxLoadProject: TCheckBox
          Left = 47
          Top = 226
          Width = 294
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Loading at start'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CheckBoxSaveProject: TCheckBox
          Left = 351
          Top = 226
          Width = 269
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Save on exit'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxSplashStart: TCheckBox
          Left = 669
          Top = 226
          Width = 256
          Height = 31
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Show splash'
          TabOrder = 2
        end
        object ComboBoxVclStyles: TComboBox
          Left = 700
          Top = 85
          Width = 239
          Height = 33
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csDropDownList
          DropDownCount = 5
          TabOrder = 3
          OnChange = ComboBoxVclStylesChange
        end
      end
      object tsDisplay: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Display'
        ImageIndex = 2
        TabVisible = False
        object CheckBoxAxes: TCheckBox
          Left = 89
          Top = 42
          Width = 109
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Axes'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CheckBoxCoordinates: TCheckBox
          Left = 89
          Top = 117
          Width = 230
          Height = 35
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Coordinates'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxRotate: TCheckBox
          Left = 519
          Top = 42
          Width = 145
          Height = 29
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Rotation'
          Checked = True
          State = cbChecked
          TabOrder = 2
          StyleName = 'Windows'
        end
      end
      object tsMaterial: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Material'
        ImageIndex = 4
        TabVisible = False
        object ListView: TListView
          Left = 0
          Top = 0
          Width = 1085
          Height = 380
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
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
        end
        object ButtonModifyMat: TButton
          Left = 254
          Top = 478
          Width = 182
          Height = 42
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Change...'
          TabOrder = 1
        end
      end
      object tsGalaxy: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Galaxy'
        ImageIndex = 4
        TabVisible = False
        object LabelRg: TLabel
          Left = 42
          Top = 44
          Width = 113
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Galaxy radius'
        end
        object LabelNs: TLabel
          Left = 42
          Top = 138
          Width = 194
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Number of galaxy stars'
        end
        object LabelLs: TLabel
          Left = 42
          Top = 244
          Width = 147
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Longevity of stars'
        end
        object LabelLt: TLabel
          Left = 42
          Top = 292
          Width = 179
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Longevity of technets'
        end
        object LabelHg: TLabel
          Left = 42
          Top = 98
          Width = 138
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Galaxy thickness'
        end
        object LabelVg: TLabel
          Left = 658
          Top = 34
          Width = 193
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Volume of Galaxy, ly^3'
        end
        object LabelDs: TLabel
          Left = 658
          Top = 135
          Width = 288
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Average distance between stars, ly'
        end
        object Label1: TLabel
          Left = 42
          Top = 191
          Width = 189
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Fraction of single stars'
        end
        object nbRg: TNumberBox
          Left = 385
          Top = 32
          Width = 150
          Height = 33
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Decimal = 0
          Mode = nbmInt64
          MinValue = 1.000000000000000000
          MaxValue = 1000000.000000000000000000
          TabOrder = 0
          Value = 50000.000000000000000000
          SpinButtonOptions.ButtonWidth = 30
          NegativeValueColor = clRed
        end
        object StaticTextRg: TStaticText
          Left = 327
          Top = 40
          Width = 29
          Height = 34
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Rg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object StaticTextNs: TStaticText
          Left = 327
          Top = 136
          Width = 30
          Height = 34
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Ns'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 2
        end
        object StaticTextLt: TStaticText
          Left = 327
          Top = 293
          Width = 23
          Height = 34
          Hint = 'Longevity of technospheres'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Lt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object EditLt: TEdit
          Left = 385
          Top = 285
          Width = 153
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = '10000'
          TextHint = 'Avarage life time for civilisation'
        end
        object EditLs: TEdit
          Left = 385
          Top = 237
          Width = 150
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = '10000000000'
          TextHint = 'Mean lifitime for planet'
        end
        object StaticTextLs: TStaticText
          Left = 327
          Top = 241
          Width = 24
          Height = 34
          Hint = 'Longevity of stars'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Ls'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object nbHg: TNumberBox
          Left = 385
          Top = 80
          Width = 150
          Height = 33
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Decimal = 0
          Mode = nbmInt64
          MinValue = 1.000000000000000000
          MaxValue = 1000000.000000000000000000
          TabOrder = 7
          Value = 1000.000000000000000000
          SpinButtonOptions.ButtonWidth = 30
          NegativeValueColor = clRed
        end
        object StaticTextHg: TStaticText
          Left = 327
          Top = 92
          Width = 32
          Height = 34
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Hg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 8
        end
        object StaticTextVg: TStaticText
          Left = 658
          Top = 74
          Width = 30
          Height = 34
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Vg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 9
        end
        object EditVg: TEdit
          Left = 749
          Top = 74
          Width = 246
          Height = 39
          Hint = 'Number os noospheres'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taCenter
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Text = '1'
        end
        object EditNs: TEdit
          Left = 385
          Top = 127
          Width = 153
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          Text = '400000000000'
        end
        object EditDs: TEdit
          Left = 749
          Top = 170
          Width = 246
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taCenter
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Text = '1'
        end
        object ButtonCalculate: TButton
          Left = 427
          Top = 615
          Width = 164
          Height = 43
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Calculate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          OnClick = ButtonCalculateClick
        end
        object StaticTextDs: TStaticText
          Left = 658
          Top = 179
          Width = 26
          Height = 29
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Ds'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
        end
        object StaticTextLr: TStaticText
          Left = 658
          Top = 237
          Width = 22
          Height = 29
          Hint = 'Ratio of longevities'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Lr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
        object EditLr: TEdit
          Left = 749
          Top = 224
          Width = 246
          Height = 39
          Hint = 'Ratio of longevities'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taCenter
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 16
          Text = '1'
        end
        object EditKs: TEdit
          Left = 385
          Top = 183
          Width = 153
          Height = 33
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          TabOrder = 17
          Text = '0.5'
        end
        object StaticText2: TStaticText
          Left = 326
          Top = 190
          Width = 27
          Height = 34
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Ks'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 18
        end
      end
      object tsStars: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Stars'
        ImageIndex = 5
        TabVisible = False
        DesignSize = (
          1085
          675)
        object chlbStarClasses: TCheckListBox
          Left = 562
          Top = 61
          Width = 149
          Height = 200
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akTop, akRight]
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 26
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 26
          Items.Strings = (
            'O'
            'B'
            'A'
            'F'
            'G'
            'K'
            'M')
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object GroupBox2: TGroupBox
          Left = 56
          Top = 42
          Width = 253
          Height = 183
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Constellations'
          TabOrder = 1
          object chbConstFigures: TCheckBox
            Left = 45
            Top = 120
            Width = 138
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Figures'
            TabOrder = 0
          end
          object chbConstLines: TCheckBox
            Left = 45
            Top = 42
            Width = 138
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Lines'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chbConstBounds: TCheckBox
            Left = 45
            Top = 81
            Width = 138
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Borders'
            TabOrder = 2
          end
        end
      end
      object tsGeneral: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'General'
        ImageIndex = 7
        TabVisible = False
        object LabelPrecision: TLabel
          Left = 644
          Top = 387
          Width = 77
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Precision'
        end
        object rgUnits: TRadioGroup
          Left = 613
          Top = 42
          Width = 342
          Height = 253
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Units'
          ItemIndex = 0
          Items.Strings = (
            'Astronomical unit'
            'Light year'
            'Kilolight year'
            'Parsec'
            'Kiloparsec')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object SpinEditPrecision: TSpinEdit
          Left = 886
          Top = 376
          Width = 71
          Height = 36
          Hint = 'Precision'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          MaxValue = 18
          MinValue = 0
          TabOrder = 1
          Value = 2
        end
        object RadioGroup1: TRadioGroup
          Left = 70
          Top = 42
          Width = 309
          Height = 295
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Coordinate system'
          ItemIndex = 0
          Items.Strings = (
            'Equatorial'
            'Horizontal'
            'Geocentric'
            'Heliocentric'
            'Galactic'
            'Supergalactic')
          TabOrder = 2
        end
      end
      object tsPathway: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Pathway'
        ImageIndex = 8
        TabVisible = False
        object PanelTitle: TPanel
          Left = 0
          Top = 0
          Width = 1085
          Height = 675
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          TabOrder = 0
          object LabelStarI: TLabel
            Left = 75
            Top = 70
            Width = 42
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Star I'
          end
          object LabelStarII: TLabel
            Left = 566
            Top = 70
            Width = 47
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Star II'
          end
          object LabelDistance: TLabel
            Left = 409
            Top = 195
            Width = 72
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Distance'
          end
          object LabelVelocity: TLabel
            Left = 409
            Top = 281
            Width = 66
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Velocity'
          end
          object LabelFlightTime: TLabel
            Left = 404
            Top = 362
            Width = 89
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Flight time'
          end
          object SearchBoxA: TSearchBox
            Left = 181
            Top = 67
            Width = 198
            Height = 40
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            AutoSize = False
            TabOrder = 0
            Text = 'Sol'
            ButtonWidth = 42
          end
          object trbVelocity: TTrackBar
            Left = 500
            Top = 272
            Width = 292
            Height = 51
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Max = 299792
            Min = 100
            Position = 30000
            TabOrder = 1
            ThumbLength = 35
            OnChange = trbVelocityChange
          end
          object stFlightTime: TStaticText
            Left = 574
            Top = 362
            Width = 200
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Caption = '100000'
            TabOrder = 2
          end
          object SearchBoxB: TSearchBox
            Left = 644
            Top = 67
            Width = 197
            Height = 40
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            AutoSize = False
            TabOrder = 3
            Text = 'TOI-700'
            ButtonWidth = 42
          end
          object EditDistance: TEdit
            Left = 512
            Top = 192
            Width = 262
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            TabOrder = 4
            Text = '101.4'
          end
          object stTrackBar: TStaticText
            Left = 802
            Top = 281
            Width = 77
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'TrackBar'
            TabOrder = 5
          end
          object gbFindPath: TGroupBox
            Left = 44
            Top = 192
            Width = 239
            Height = 183
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Shortest path'
            TabOrder = 6
            object chbIsTetranet: TCheckBox
              Left = 31
              Top = 93
              Width = 186
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Tetranet'
              TabOrder = 0
            end
            object chbIsPolynet: TCheckBox
              Left = 31
              Top = 133
              Width = 214
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Polynet'
              TabOrder = 1
            end
            object chbIsGridnet: TCheckBox
              Left = 31
              Top = 53
              Width = 158
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Gridnet'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
          end
        end
      end
      object tsPlanets: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Planets'
        ImageIndex = 7
        TabVisible = False
        object chlbPlanetsize: TCheckListBox
          Left = 756
          Top = 41
          Width = 239
          Height = 224
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ItemHeight = 25
          Items.Strings = (
            'All'
            'Terrain'
            'Superterrain'
            'Cold Neptunian'
            'Hot Neptunian'
            'Hot Jovian'
            'Cold Jovian')
          TabOrder = 0
        end
        object CheckListBox1: TCheckListBox
          Left = 756
          Top = 355
          Width = 238
          Height = 141
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ItemHeight = 25
          Items.Strings = (
            'Gaseous'
            'Watery'
            'Rocky'
            'Icy')
          TabOrder = 1
        end
        object grbPlanetShow: TGroupBox
          Left = 28
          Top = 16
          Width = 673
          Height = 287
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Show'
          TabOrder = 2
          object chbShowAxes: TCheckBox
            Left = 57
            Top = 193
            Width = 133
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Axis'
            TabOrder = 0
            StyleName = 'Windows'
          end
          object CheckBox4: TCheckBox
            Left = 237
            Top = 190
            Width = 183
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Shading'
            TabOrder = 1
            StyleName = 'Windows'
          end
          object chbCore: TCheckBox
            Left = 237
            Top = 55
            Width = 170
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Core'
            TabOrder = 2
            StyleName = 'Windows'
          end
          object chbAtmosfera: TCheckBox
            Left = 55
            Top = 123
            Width = 156
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Atmosphere'
            TabOrder = 3
            StyleName = 'Windows'
          end
          object chbClouds: TCheckBox
            Left = 237
            Top = 128
            Width = 170
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Clouds'
            TabOrder = 4
            StyleName = 'Windows'
          end
          object CheckBox1: TCheckBox
            Left = 433
            Top = 114
            Width = 170
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Planet grid'
            TabOrder = 5
            StyleName = 'Windows'
          end
          object chbHidePlanet: TCheckBox
            Left = 433
            Top = 55
            Width = 170
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Hide planet'
            TabOrder = 6
            StyleName = 'Windows'
          end
          object CheckBox3: TCheckBox
            Left = 433
            Top = 184
            Width = 170
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Sky grid'
            TabOrder = 7
            StyleName = 'Windows'
          end
        end
        object grbTerraLayers: TGroupBox
          Left = 28
          Top = 333
          Width = 309
          Height = 309
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Layers'
          TabOrder = 3
          object LabelIce: TLabel
            Left = 42
            Top = 38
            Width = 24
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Ice'
          end
          object LabelWater: TLabel
            Left = 42
            Top = 94
            Width = 50
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Water'
          end
          object LabelCrust: TLabel
            Left = 42
            Top = 147
            Width = 44
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Crust'
          end
          object LabelMantle: TLabel
            Left = 42
            Top = 198
            Width = 59
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Mantle'
          end
          object LabelCore: TLabel
            Left = 42
            Top = 251
            Width = 40
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Core'
          end
          object nbIce: TNumberBox
            Left = 168
            Top = 22
            Width = 85
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            TabOrder = 0
            Value = 0.010000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbWater: TNumberBox
            Left = 168
            Top = 75
            Width = 85
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            TabOrder = 1
            Value = 0.090000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbCrust: TNumberBox
            Left = 168
            Top = 135
            Width = 85
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            TabOrder = 2
            Value = 0.100000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbMantle: TNumberBox
            Left = 168
            Top = 195
            Width = 85
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            TabOrder = 3
            Value = 0.600000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbCore: TNumberBox
            Left = 168
            Top = 243
            Width = 85
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            TabOrder = 4
            Value = 0.200000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
        end
        object GroupBox1: TGroupBox
          Left = 364
          Top = 333
          Width = 337
          Height = 309
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Params'
          TabOrder = 4
          object LabelPlanetTilt: TLabel
            Left = 19
            Top = 146
            Width = 61
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Axis tilt'
          end
          object LabelPlanetDensity: TLabel
            Left = 19
            Top = 106
            Width = 62
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Density'
          end
          object LabelPlanetRadius: TLabel
            Left = 19
            Top = 47
            Width = 56
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Radius'
          end
          object LabelGravityAccel: TLabel
            Left = 19
            Top = 209
            Width = 64
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Gravity '
          end
          object Label6: TLabel
            Left = 19
            Top = 257
            Width = 106
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = 'Temperature'
          end
          object nbTilt: TNumberBox
            Left = 202
            Top = 143
            Width = 113
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmFloat
            MinValue = -90.000000000000000000
            MaxValue = 90.000000000000000000
            TabOrder = 0
            Value = 32.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbDensity: TNumberBox
            Left = 202
            Top = 95
            Width = 113
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Mode = nbmFloat
            MaxValue = 30.000000000000000000
            TabOrder = 1
            Value = 5.510000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbRadius: TNumberBox
            Left = 202
            Top = 36
            Width = 113
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            MaxValue = 100000.000000000000000000
            TabOrder = 2
            Value = 6371.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbGravityAccel: TNumberBox
            Left = 202
            Top = 206
            Width = 113
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 3
            Value = 9.800000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object NumberBox7: TNumberBox
            Left = 193
            Top = 254
            Width = 113
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MinValue = -373.000000000000000000
            MaxValue = 1000.000000000000000000
            TabOrder = 4
            Value = 27.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
        end
      end
    end
  end
  object ImageList: TImageList
    Left = 99
    Top = 302
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
end
