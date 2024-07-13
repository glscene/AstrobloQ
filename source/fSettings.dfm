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
      ActivePage = tsPathway
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
          Caption = 'Database path'
        end
        object Label2: TLabel
          Left = 33
          Top = 46
          Width = 155
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Style of interface'
        end
        object cbDataPath: TComboBox
          Left = 252
          Top = 113
          Width = 317
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
        end
        object ButtonBrowsePathData: TButton
          Left = 579
          Top = 110
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
          TabOrder = 1
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
          TabOrder = 2
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
          TabOrder = 3
        end
        object cbSplashStart: TCheckBox
          Left = 669
          Top = 226
          Width = 256
          Height = 31
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Show splash'
          TabOrder = 4
        end
        object rgLanguage: TRadioGroup
          Left = 33
          Top = 298
          Width = 388
          Height = 109
          Caption = 'Language'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'English'
            'Russian')
          TabOrder = 5
          OnClick = rgLanguageClick
        end
        object cbxVclStyles: TComboBox
          Left = 252
          Top = 43
          Width = 317
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csDropDownList
          DropDownCount = 5
          TabOrder = 6
          OnChange = cbxVclStylesChange
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
        object LabelRg: TLabel
          Left = 42
          Top = 44
          Width = 123
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Galaxy radius'
        end
        object LabelNs: TLabel
          Left = 42
          Top = 138
          Width = 215
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Number of galaxy stars'
        end
        object LabelLs: TLabel
          Left = 42
          Top = 187
          Width = 163
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Longevity of stars'
        end
        object LabelLt: TLabel
          Left = 42
          Top = 232
          Width = 255
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Longevity of technospheres'
        end
        object LabelHg: TLabel
          Left = 42
          Top = 98
          Width = 152
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Galaxy thickness'
        end
        object LabelVg: TLabel
          Left = 658
          Top = 34
          Width = 213
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Volume of Galaxy, ly^3'
        end
        object LabelDs: TLabel
          Left = 658
          Top = 179
          Width = 25
          Height = 30
          Hint = 'Distance between stars'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Ds'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label5: TLabel
          Left = 658
          Top = 135
          Width = 319
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Average distance between stars, ly'
        end
        object nbRg: TNumberBox
          Left = 385
          Top = 32
          Width = 150
          Height = 38
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
        object grbDrakeFormula: TGroupBox
          Left = 20
          Top = 340
          Width = 1025
          Height = 235
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Drake formula for technospheres'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object lbNs: TLabel
            Left = 263
            Top = 54
            Width = 34
            Height = 38
            Hint = 'Number of stars'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Ns'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lbNt: TLabel
            Left = 65
            Top = 54
            Width = 33
            Height = 38
            Hint = 'Number of noospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Nt'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lbFl: TLabel
            Left = 545
            Top = 49
            Width = 31
            Height = 38
            Hint = 'Number of lithospheres suitable for life'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Nl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lbFb: TLabel
            Left = 668
            Top = 49
            Width = 32
            Height = 38
            Hint = 'Fraction of biospheres among lithospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fb'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lbFn: TLabel
            Left = 795
            Top = 50
            Width = 32
            Height = 38
            Hint = 'Fraction of noospheres among biospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lbFt: TLabel
            Left = 935
            Top = 50
            Width = 26
            Height = 38
            Hint = 'Fraction of technospheres among noospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Ft'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object LabelDt: TLabel
            Left = 562
            Top = 168
            Width = 32
            Height = 38
            Hint = 'Distance between technospheres'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Dt'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lbFp: TLabel
            Left = 427
            Top = 50
            Width = 32
            Height = 38
            Hint = 'Fraction of stars with planetary systems'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label4: TLabel
            Left = 22
            Top = 178
            Width = 411
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Average distance between technospheres, ly'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object nbFn: TNumberBox
            Left = 771
            Top = 102
            Width = 92
            Height = 39
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 0
            Value = 0.001000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbFb: TNumberBox
            Left = 645
            Top = 100
            Width = 89
            Height = 39
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 1
            Value = 0.001000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbNl: TNumberBox
            Left = 518
            Top = 102
            Width = 76
            Height = 39
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            Mode = nbmInt64
            MinValue = 1.000000000000000000
            MaxValue = 100.000000000000000000
            ParentFont = False
            TabOrder = 2
            Value = 3.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object EditNt: TEdit
            Left = 5
            Top = 102
            Width = 164
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
            TabOrder = 3
            Text = '1'
          end
          object stMult1: TStaticText
            Left = 368
            Top = 50
            Width = 17
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '*'
            TabOrder = 4
          end
          object stMult2: TStaticText
            Left = 604
            Top = 55
            Width = 17
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '*'
            TabOrder = 5
          end
          object stMult3: TStaticText
            Left = 744
            Top = 55
            Width = 17
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '*'
            TabOrder = 6
          end
          object stMult4: TStaticText
            Left = 873
            Top = 55
            Width = 17
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '*'
            TabOrder = 7
          end
          object stEqual: TStaticText
            Left = 177
            Top = 54
            Width = 24
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '='
            TabOrder = 8
          end
          object nbFt: TNumberBox
            Left = 900
            Top = 98
            Width = 102
            Height = 39
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 9
            Value = 0.001000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object EditDt: TEdit
            Left = 645
            Top = 168
            Width = 164
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
            TabOrder = 10
            Text = '1'
          end
          object nbFp: TNumberBox
            Left = 407
            Top = 102
            Width = 76
            Height = 39
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            Mode = nbmFloat
            MaxValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 11
            Value = 0.333000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object stMult5: TStaticText
            Left = 493
            Top = 50
            Width = 17
            Height = 42
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '*'
            TabOrder = 12
          end
          object nbNs: TNumberBox
            Left = 213
            Top = 102
            Width = 172
            Height = 39
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            Mode = nbmInt64
            MinValue = 1.000000000000000000
            MaxValue = 1000000000000.000000000000000000
            ParentFont = False
            TabOrder = 13
            Value = 400000000000.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
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
          TabOrder = 2
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
          TabOrder = 3
        end
        object StaticTextLt: TStaticText
          Left = 327
          Top = 232
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
          TabOrder = 4
        end
        object EditLt: TEdit
          Left = 385
          Top = 224
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
          TabOrder = 5
          Text = '1000'
          TextHint = 'Avarage life time for civilisation'
        end
        object EditLs: TEdit
          Left = 385
          Top = 176
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
          TabOrder = 6
          Text = '10000000000'
          TextHint = 'Mean lifitime for planet'
        end
        object StaticTextLs: TStaticText
          Left = 327
          Top = 180
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
          TabOrder = 7
        end
        object nbHg: TNumberBox
          Left = 385
          Top = 80
          Width = 150
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Decimal = 0
          Mode = nbmInt64
          MinValue = 1.000000000000000000
          MaxValue = 1000000.000000000000000000
          TabOrder = 8
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
          TabOrder = 9
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
          TabOrder = 10
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
          TabOrder = 11
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
          TabOrder = 12
          Text = '400000000000'
        end
        object EditDs: TEdit
          Left = 749
          Top = 175
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
          TabOrder = 13
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
          TabOrder = 14
          OnClick = ButtonCalculateClick
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
          Left = 784
          Top = 53
          Width = 172
          Height = 172
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
        end
        object chlbStarClasses: TCheckListBox
          Left = 426
          Top = 53
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
          Height = 41
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
          Height = 169
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Coordinate system'
          ItemIndex = 0
          Items.Strings = (
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
            Width = 47
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Star I'
          end
          object LabelStarII: TLabel
            Left = 566
            Top = 70
            Width = 53
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Star II'
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
          Left = 168
          Top = 252
          Width = 239
          Height = 169
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ItemHeight = 30
          Items.Strings = (
            'Jupiterian'
            'Neptunian'
            'Superterrain'
            'Terrain'
            'Plutonian')
          TabOrder = 0
        end
        object CheckListBox1: TCheckListBox
          Left = 500
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
