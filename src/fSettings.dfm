inherited FormSettings: TFormSettings
  HelpContext = 0
  Caption = 'Settings'
  ClientHeight = 759
  ClientWidth = 1313
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  ExplicitWidth = 1329
  ExplicitHeight = 798
  TextHeight = 30
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
    object Button2: TButton
      Left = 1059
      Top = 15
      Width = 131
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object ButtonOk: TButton
      Left = 866
      Top = 15
      Width = 131
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 1
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
      Height = 660
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      AutoExpand = True
      HotTrack = True
      Images = dfImages.ImageList
      Indent = 33
      TabOrder = 0
      OnClick = tvSettingsClick
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
        0000000000000000000000010750006C0061006E006500740073000000330000
        000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000000010A
        530074006100720066006C006900670068007400}
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
      ActivePage = tsGeneral
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
        object LabelProgram: TLabel
          Tag = 1000
          Left = 33
          Top = 5
          Width = 79
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Location'
        end
        object LabelData: TLabel
          Left = 33
          Top = 123
          Width = 170
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          AutoSize = False
          Caption = 'Database'
        end
        object PanelExePath: TPanel
          Left = 33
          Top = 44
          Width = 559
          Height = 52
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = 'AstrobloQ.exe'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object cbDataPath: TComboBox
          Left = 33
          Top = 161
          Width = 536
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 1
        end
        object ButtonBrowsePathData: TButton
          Left = 579
          Top = 161
          Width = 41
          Height = 44
          Hint = 'Browse|Browse the directory'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object CheckBoxLoadProject: TCheckBox
          Left = 47
          Top = 282
          Width = 322
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Loading at start'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object CheckBoxSaveProject: TCheckBox
          Left = 351
          Top = 282
          Width = 196
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Save on exit'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object cbSplashStart: TCheckBox
          Left = 669
          Top = 282
          Width = 172
          Height = 31
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Show splash'
          TabOrder = 5
        end
        object rgLanguages: TRadioGroup
          Left = 47
          Top = 354
          Width = 444
          Height = 109
          Caption = 'Language'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'English'
            'Russian')
          TabOrder = 6
          OnClick = rgLanguagesClick
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
        object LabelBackground: TLabel
          Left = 312
          Top = 40
          Width = 110
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Background'
        end
        object CheckBoxAxis: TCheckBox
          Left = 89
          Top = 42
          Width = 109
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Axis'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object PanelBkg: TPanel
          Left = 487
          Top = 33
          Width = 43
          Height = 44
          Hint = 'Click to change background colour'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
        end
        object CheckBoxCoordinates: TCheckBox
          Left = 89
          Top = 173
          Width = 230
          Height = 35
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Coordinates'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbxTwoSideLighting: TCheckBox
          Left = 89
          Top = 109
          Width = 192
          Height = 29
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Twoside lighting'
          TabOrder = 3
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
        object LabelDiameter: TLabel
          Left = 360
          Top = 35
          Width = 62
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Radius'
        end
        object nbRadius: TNumberBox
          Left = 485
          Top = 32
          Width = 156
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taCenter
          Decimal = 0
          TabOrder = 0
          Value = 50000.000000000000000000
          SpinButtonOptions.ButtonWidth = 30
        end
        object grbDrakeFormula: TGroupBox
          Left = 28
          Top = 75
          Width = 1009
          Height = 318
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Drake formula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object PanelDrake: TPanel
            Left = 28
            Top = 36
            Width = 925
            Height = 189
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            TabOrder = 0
            object lbEquals: TLabel
              Left = 103
              Top = 20
              Width = 20
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '='
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbMult1: TLabel
              Left = 257
              Top = 20
              Width = 13
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbMult2: TLabel
              Left = 376
              Top = 20
              Width = 13
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbMult3: TLabel
              Left = 509
              Top = 20
              Width = 13
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbMult4: TLabel
              Left = 649
              Top = 19
              Width = 13
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbDivide: TLabel
              Left = 747
              Top = 19
              Width = 12
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '/'
              Color = clBackground
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label1: TLabel
              Left = 748
              Top = 67
              Width = 12
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '/'
              Color = clBackground
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object ButtonCalculate: TButton
              Left = 629
              Top = 131
              Width = 250
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
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = ButtonCalculateClick
            end
            object EditLc: TEdit
              Left = 646
              Top = 67
              Width = 99
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Text = '10000'
              TextHint = 'Avarage life time for civilisation'
            end
            object EditLs: TEdit
              Left = 770
              Top = 67
              Width = 141
              Height = 38
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Text = '10000000000'
              TextHint = 'Mean lifitime for planet'
            end
            object EditNs: TEdit
              Left = 116
              Top = 68
              Width = 171
              Height = 39
              Hint = 'Number of stars in MW'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Text = '400000000000'
            end
            object EditNc: TEdit
              Left = 14
              Top = 68
              Width = 92
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
              TabOrder = 4
              Text = '40'
            end
            object StaticTextFl: TStaticText
              Left = 304
              Top = 16
              Width = 27
              Height = 42
              Hint = 'Fraction of stars with lithospheres'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Fl'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object nbFl: TNumberBox
              Left = 297
              Top = 68
              Width = 69
              Height = 39
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI'
              Font.Style = []
              Mode = nbmFloat
              MaxValue = 1.000000000000000000
              ParentFont = False
              TabOrder = 6
              Value = 0.100000000000000000
              SpinButtonOptions.ButtonWidth = 30
            end
            object nbFb: TNumberBox
              Left = 410
              Top = 68
              Width = 69
              Height = 39
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI'
              Font.Style = []
              Mode = nbmFloat
              MaxValue = 1.000000000000000000
              ParentFont = False
              TabOrder = 7
              Value = 0.100000000000000000
              SpinButtonOptions.ButtonWidth = 30
            end
            object nbFn: TNumberBox
              Left = 550
              Top = 68
              Width = 69
              Height = 39
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI'
              Font.Style = []
              Mode = nbmFloat
              MaxValue = 1.000000000000000000
              ParentFont = False
              TabOrder = 8
              Value = 0.010000000000000000
              SpinButtonOptions.ButtonWidth = 30
            end
            object StaticTextDc: TStaticText
              Left = 31
              Top = 140
              Width = 38
              Height = 42
              Hint = 'Number of noospheres'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Dc'
              TabOrder = 9
            end
            object StaticText2: TStaticText
              Left = 103
              Top = 140
              Width = 24
              Height = 42
              Hint = 'Number of noospheres'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '='
              TabOrder = 10
            end
            object nbDc: TNumberBox
              Left = 164
              Top = 138
              Width = 243
              Height = 39
              Hint = 'Distance'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI'
              Font.Style = []
              Mode = nbmInt64
              MaxValue = 100000.000000000000000000
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              Value = 100000.000000000000000000
              SpinButtonOptions.ButtonWidth = 30
            end
          end
          object StaticTextNc: TStaticText
            Left = 59
            Top = 56
            Width = 39
            Height = 42
            Hint = 'Number of noospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Nc'
            TabOrder = 1
          end
          object StaticTextNs: TStaticText
            Left = 192
            Top = 56
            Width = 38
            Height = 42
            Hint = 'Number of galaxy stars'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Ns'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object StaticTextFb: TStaticText
            Left = 457
            Top = 52
            Width = 36
            Height = 42
            Hint = 'Fraction of planets with biospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fb'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object StaticTextFn: TStaticText
            Left = 605
            Top = 52
            Width = 36
            Height = 42
            Hint = 'Fraction of planets with noospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fn'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object StaticTextLc: TStaticText
            Left = 734
            Top = 51
            Width = 31
            Height = 42
            Hint = 'Mean lifetime of noospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Lc'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
          end
          object StaticTextLs: TStaticText
            Left = 797
            Top = 51
            Width = 30
            Height = 42
            Hint = 'Mean lifetime of stars'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Ls'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
          end
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
        object ColorGrid1: TColorGrid
          Left = 546
          Top = 324
          Width = 172
          Height = 172
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
        end
        object chlbStarClasses: TCheckListBox
          Left = 372
          Top = 324
          Width = 182
          Height = 223
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
          TabOrder = 1
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
          TabOrder = 2
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
          Width = 83
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Precision'
        end
        object gbxCoordinateSys: TGroupBox
          Left = 56
          Top = 42
          Width = 421
          Height = 251
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Coordinate system'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          object chbEquatorial: TCheckBox
            Left = 56
            Top = 56
            Width = 214
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Heliocentric'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object CheckBox2: TCheckBox
            Left = 56
            Top = 112
            Width = 214
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Galactic'
            TabOrder = 1
          end
          object CheckBox1: TCheckBox
            Left = 56
            Top = 166
            Width = 214
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Supergalactic'
            TabOrder = 2
          end
        end
        object rgUnits: TRadioGroup
          Left = 613
          Top = 42
          Width = 342
          Height = 296
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
          TabOrder = 1
        end
        object SpinEditPrecision: TSpinEdit
          Left = 886
          Top = 376
          Width = 71
          Height = 41
          Hint = 'Precision'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          MaxValue = 18
          MinValue = 0
          TabOrder = 2
          Value = 2
        end
      end
      object tsFlights: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Flights'
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
          object LabelA: TLabel
            Left = 129
            Top = 70
            Width = 14
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'A'
          end
          object LabelB: TLabel
            Left = 566
            Top = 70
            Width = 12
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'B'
          end
          object LabelDistance: TLabel
            Left = 409
            Top = 195
            Width = 80
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Distance'
          end
          object LabelVelocity: TLabel
            Left = 409
            Top = 281
            Width = 72
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Velocity'
          end
          object LabelFlightTime: TLabel
            Left = 404
            Top = 362
            Width = 98
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Flight time'
          end
          object SearchBoxA: TSearchBox
            Left = 153
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
            Left = 588
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
            Height = 38
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
            Width = 83
            Height = 34
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
            object chbOnTetramesh: TCheckBox
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
            object chbAvoidHazards: TCheckBox
              Left = 31
              Top = 133
              Width = 214
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Polinet'
              TabOrder = 1
            end
            object CheckBox4: TCheckBox
              Left = 31
              Top = 53
              Width = 158
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Galagrid'
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
          Left = 196
          Top = 252
          Width = 239
          Height = 169
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ItemHeight = 30
          Items.Strings = (
            'Jupiterlike'
            'Neptunelike'
            'Superearth'
            'Earthlike'
            'Plutolike')
          TabOrder = 0
        end
        object CheckListBox1: TCheckListBox
          Left = 556
          Top = 252
          Width = 238
          Height = 169
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ItemHeight = 30
          Items.Strings = (
            'Gaseous'
            'Watery'
            'Rocky'
            'Icy')
          TabOrder = 1
        end
      end
    end
  end
end
