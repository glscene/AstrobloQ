inherited FormSettings: TFormSettings
  HelpContext = 0
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1080
  ClientHeight = 759
  ClientWidth = 1223
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  ExplicitWidth = 1239
  ExplicitHeight = 798
  TextHeight = 30
  inherited PanelTop: TPanel
    Width = 1223
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 1215
  end
  inherited PanelMiddle: TPanel
    Width = 1223
    Height = 683
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 1215
    ExplicitHeight = 658
    inherited Memo: TMemo
      Left = 458
      Top = 308
      Width = 648
      Height = 326
      Align = alNone
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 458
      ExplicitTop = 308
      ExplicitWidth = 648
      ExplicitHeight = 326
    end
    object tvSettings: TTreeView
      Left = 1
      Top = 1
      Width = 218
      Height = 681
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      AutoExpand = True
      HotTrack = True
      Images = dfImages.ImageList
      Indent = 33
      TabOrder = 1
      OnClick = tvSettingsClick
      Items.NodeData = {
        070800000009540054007200650065004E006F00640065002D00000000000000
        00000000FFFFFFFFFFFFFFFF00000000000000000000000000010713043B0430
        0432043D044B0435040000310000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000000010918043D044204350440044404350439044104
        00002D0000000000000000000000FFFFFFFFFFFFFFFF02000000000000000000
        00000001071404380441043F043B043504390400002F00000000000000000000
        00FFFFFFFFFFFFFFFF0400000000000000000000000001081C04300442043504
        4004380430043B040000310000000000000000000000FFFFFFFFFFFFFFFF0000
        00000000000000000000000109130430043B0430043A04420438043A04300400
        002B0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00000106170432045104370434044B0400002D0000000000000000000000FFFF
        FFFFFFFFFFFF0000000000000000000000000001071F043B0430043D04350442
        044B040000310000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000000109170432043504370434043E043B0451044204}
      ExplicitHeight = 656
    end
    object PageControl: TPageControl
      Left = 219
      Top = 1
      Width = 1003
      Height = 681
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ActivePage = tsInterface
      Align = alClient
      Style = tsButtons
      TabOrder = 2
      ExplicitWidth = 995
      ExplicitHeight = 656
      object tsInterface: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Interface'
        TabVisible = False
        object LabelProgram: TLabel
          Tag = 1000
          Left = 38
          Top = 5
          Width = 111
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
        end
        object LabelData: TLabel
          Left = -4
          Top = 123
          Width = 170
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
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
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object CheckBoxSaveProject: TCheckBox
          Left = 350
          Top = 282
          Width = 308
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object cbSplashStart: TCheckBox
          Left = 669
          Top = 282
          Width = 229
          Height = 31
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1089#1090#1072#1074#1082#1091
          TabOrder = 5
        end
        object Фон: TStaticText
          Left = 667
          Top = 44
          Width = 43
          Height = 34
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1060#1086#1085
          TabOrder = 6
        end
        object rgLanguages: TRadioGroup
          Left = 47
          Top = 354
          Width = 545
          Height = 109
          Caption = #1071#1079#1099#1082
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081
            #1056#1091#1089#1089#1082#1080#1081)
          TabOrder = 7
          OnClick = rgLanguagesClick
        end
        object PanelBackground: TPanel
          Left = 769
          Top = 53
          Width = 58
          Height = 34
          Hint = 'Click to change background colour'
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 8
          OnClick = PanelBackgroundClick
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
          Width = 39
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1060#1086#1085
        end
        object CheckBoxAxes: TCheckBox
          Left = 89
          Top = 42
          Width = 109
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1054#1089#1080
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object Panel1: TPanel
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
          Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbxTwoSideLighting: TCheckBox
          Left = 89
          Top = 109
          Width = 291
          Height = 29
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1044#1074#1091#1093#1089#1090#1086#1088#1086#1085#1085#1077#1077' '#1086#1089#1074#1077#1097#1077#1085#1080#1077
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
          Width = 995
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
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
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
          Left = 226
          Top = 32
          Width = 223
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1044#1080#1072#1084#1077#1090#1088' '#1043#1072#1083#1072#1082#1090#1080#1082#1080', l.y.'
        end
        object nbGxDiameter: TNumberBox
          Left = 530
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
          Value = 100000.000000000000000000
          SpinButtonOptions.ButtonWidth = 30
        end
        object grbDrakeFormula: TGroupBox
          Left = 28
          Top = 80
          Width = 939
          Height = 583
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '                  '#1060#1086#1088#1084#1091#1083#1072' '#1044#1088#1077#1081#1082#1072' '#1076#1083#1103' '#1085#1086#1086#1089#1092#1077#1088' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label7: TLabel
            Left = 58
            Top = 236
            Width = 720
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Nc - '#1095#1080#1089#1083#1086' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1081' '#1074' '#1076#1072#1085#1085#1099#1081' '#1084#1086#1084#1077#1085#1090' '#1074#1088#1077#1084#1077#1085#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 58
            Top = 284
            Width = 394
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Ns - '#1095#1080#1089#1083#1086' '#1079#1074#1105#1079#1076' '#1074' '#1043#1072#1083#1072#1082#1090#1080#1082#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 58
            Top = 332
            Width = 614
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fl - '#1080#1079' '#1085#1080#1093' '#1076#1086#1083#1103' '#1079#1074#1105#1079#1076' '#1089' '#1083#1080#1090#1086#1089#1092#1077#1088#1072#1084#1080' '#1087#1083#1072#1085#1077#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 58
            Top = 380
            Width = 528
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fb - '#1080#1079' '#1085#1080#1093' '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1073#1080#1086#1089#1092#1077#1088#1072#1084#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 58
            Top = 428
            Width = 527
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fn - '#1080#1079' '#1085#1080#1093' '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1085#1086#1086#1089#1092#1077#1088#1072#1084#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 59
            Top = 476
            Width = 732
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Lc - '#1089#1088#1077#1076#1085#1077#1077' '#1074#1088#1077#1084#1103' '#1078#1080#1079#1085#1080' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1080' '#1089' '#1085#1086#1086#1089#1092#1077#1088#1086#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 59
            Top = 526
            Width = 614
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Ls - '#1089#1088#1077#1076#1085#1077#1077' '#1074#1088#1077#1084#1103' '#1078#1080#1079#1085#1080' '#1079#1074#1105#1079#1076' '#1089' '#1087#1083#1072#1085#1077#1090#1072#1084#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -28
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PanelDrake: TPanel
            Left = 28
            Top = 36
            Width = 869
            Height = 189
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            TabOrder = 0
            object Label5: TLabel
              Left = 30
              Top = 20
              Width = 35
              Height = 38
              Hint = 'Number of civilisations'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Nc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
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
            object lbNs: TLabel
              Left = 170
              Top = 20
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
            object lbFl: TLabel
              Left = 309
              Top = 20
              Width = 23
              Height = 38
              Hint = 'Fraction of stars with lithospheres'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Fl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbFb: TLabel
              Left = 429
              Top = 20
              Width = 32
              Height = 38
              Hint = 'Fraction of planets with biospheres'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Fb'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object kbFn: TLabel
              Left = 570
              Top = 20
              Width = 32
              Height = 38
              Hint = 'Fraction of planets with noospheres'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Fn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbLc: TLabel
              Left = 710
              Top = 19
              Width = 27
              Height = 38
              Hint = 'Lifetime of Noosphere'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Lc'
              Color = clRed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lbLs: TLabel
              Left = 783
              Top = 19
              Width = 26
              Height = 38
              Hint = 'Lifetime of a star'
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Ls'
              Color = clRed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
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
              Color = clRed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -28
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object ButtonCalculate: TButton
              Left = 14
              Top = 126
              Width = 250
              Height = 43
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object stNc: TStaticText
              Left = 14
              Top = 68
              Width = 85
              Height = 33
              Hint = #1063#1080#1089#1083#1086' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1081
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSunken
              Caption = '1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object EditLc: TEdit
              Left = 672
              Top = 67
              Width = 183
              Height = 38
              Hint = #1042#1088#1077#1084#1103' '#1078#1080#1079#1085#1080' '#1085#1086#1086#1089#1092#1077#1088#1099
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
              Text = '10000'
              TextHint = 'Avarage life time for civilisation'
            end
            object EditLs: TEdit
              Left = 672
              Top = 109
              Width = 183
              Height = 38
              Hint = #1042#1088#1077#1084#1103' '#1078#1080#1079#1085#1080' '#1079#1074#1077#1079#1076#1099
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
              TabOrder = 3
              Text = '10000000000'
              TextHint = 'Mean lifitime for planet'
            end
            object EditNs: TEdit
              Left = 116
              Top = 68
              Width = 171
              Height = 39
              Hint = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076
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
              TabOrder = 4
              Text = '400000000000'
            end
            object EditFl: TEdit
              Left = 297
              Top = 68
              Width = 69
              Height = 39
              Hint = #1044#1086#1083#1103' '#1079#1074#1105#1079#1076' '#1089' '#1083#1080#1090#1086#1089#1092#1077#1088#1072#1084#1080
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
              TabOrder = 5
              Text = '0.1'
            end
            object EditFb: TEdit
              Left = 418
              Top = 68
              Width = 69
              Height = 39
              Hint = #1048#1079' '#1085#1080#1093' '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1073#1080#1086#1089#1092#1077#1088#1072#1084#1080
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
              TabOrder = 6
              Text = '0.1'
            end
            object EditFn: TEdit
              Left = 544
              Top = 68
              Width = 69
              Height = 39
              Hint = #1048#1079' '#1085#1080#1093' '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1085#1086#1086#1089#1092#1077#1088#1072#1084#1080
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
              TabOrder = 7
              Text = '0.01'
            end
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
          995
          671)
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
          Left = 322
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
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1086#1079#1074#1077#1079#1076#1080#1103
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
            Caption = #1060#1080#1075#1091#1088#1099
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
            Caption = #1051#1080#1085#1080#1080
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
            Caption = #1043#1088#1072#1085#1080#1094#1099
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
          Width = 89
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1058#1086#1095#1085#1086#1089#1090#1100
        end
        object gbxCoordinateSys: TGroupBox
          Left = 56
          Top = 42
          Width = 421
          Height = 251
          Hint = #1044#1077#1082#1072#1088#1090#1086#1074#1099#1077' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1053#1077#1073#1077#1089#1085#1099#1077' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099
          ParentShowHint = False
          ShowHint = True
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
            Caption = #1043#1077#1083#1080#1086#1094#1077#1085#1090#1088#1080#1095#1077#1089#1082#1072#1103
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
            Caption = #1043#1072#1083#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103
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
            Caption = #1057#1074#1077#1088#1093#1075#1072#1083#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103
            TabOrder = 2
          end
        end
        object rgUnits: TRadioGroup
          Left = 613
          Top = 42
          Width = 342
          Height = 296
          Hint = 'https://ru.ruwiki.ru/wiki/'#1040#1089#1090#1088#1086#1085#1086#1084#1080#1095#1077#1089#1082#1072#1103'_'#1077#1076#1080#1085#1080#1094#1072
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1045#1076#1080#1085#1080#1094#1099
          ItemIndex = 0
          Items.Strings = (
            #1040#1089#1090#1088#1086#1085#1086#1084#1080#1095#1077#1089#1082#1072#1103' - '#1072'.'#1077'., au'
            #1057#1074#1077#1090#1086#1074#1086#1081' '#1075#1086#1076' - '#1089'.'#1075'., ly '
            #1050#1080#1083#1086#1089#1074#1077#1090#1086#1074#1086#1081' '#1075#1086#1076' - '#1082'.'#1089'.'#1075'., kly'
            #1055#1072#1088#1089#1077#1082' - '#1087#1082', pc'
            #1050#1080#1083#1086#1087#1072#1088#1089#1077#1082' - '#1082#1087#1082', kpc')
          ParentShowHint = False
          ShowHint = True
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
          Width = 995
          Height = 671
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          TabOrder = 0
          object LabelA: TLabel
            Left = 153
            Top = 30
            Width = 84
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1047#1074#1077#1079#1076#1072' A'
          end
          object LabelB: TLabel
            Left = 634
            Top = 30
            Width = 82
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1047#1074#1077#1079#1076#1072' B'
          end
          object LabelDistance: TLabel
            Left = 185
            Top = 420
            Width = 136
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077', ly'
          end
          object LabelVelocity: TLabel
            Left = 185
            Top = 504
            Width = 166
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1057#1082#1086#1088#1086#1089#1090#1100', km/sec'
          end
          object LabelFlightTime: TLabel
            Left = 185
            Top = 585
            Width = 175
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1042#1088#1077#1084#1103' '#1087#1086#1083#1105#1090#1072', '#1083#1077#1090
          end
          object SearchBoxA: TSearchBox
            Left = 97
            Top = 67
            Width = 254
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
            Left = 346
            Top = 495
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
            Left = 358
            Top = 585
            Width = 262
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
            Left = 545
            Top = 67
            Width = 240
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
            Left = 358
            Top = 415
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
            Left = 648
            Top = 504
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
            Left = 70
            Top = 140
            Width = 841
            Height = 183
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1055#1086#1080#1089#1082' '#1082#1088#1072#1090#1095#1072#1081#1096#1077#1075#1086' '#1087#1091#1090#1080
            TabOrder = 6
            object chbOnTetramesh: TCheckBox
              Left = 179
              Top = 93
              Width = 369
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1058#1077#1090#1088#1072#1085#1077#1090' '#1044#1077#1083#1086#1085#1077
              TabOrder = 0
            end
            object chbAvoidHazards: TCheckBox
              Left = 179
              Top = 133
              Width = 365
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1055#1086#1083#1080#1085#1077#1090' '#1042#1086#1088#1086#1085#1086#1075#1086
              TabOrder = 1
            end
            object CheckBox4: TCheckBox
              Left = 179
              Top = 53
              Width = 369
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1043#1072#1083#1072#1075#1088#1080#1076' AStar 3D'
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
          Left = 154
          Top = 154
          Width = 239
          Height = 169
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ItemHeight = 30
          Items.Strings = (
            #1070#1087#1080#1090#1077#1088#1099
            #1053#1077#1087#1090#1091#1085#1099
            #1057#1091#1087#1077#1088#1079#1077#1084#1083#1080
            #1047#1077#1084#1083#1077#1087#1086#1076#1086#1073#1085#1099#1077
            #1055#1083#1091#1090#1086#1085#1099)
          TabOrder = 0
        end
        object CheckListBox1: TCheckListBox
          Left = 490
          Top = 154
          Width = 238
          Height = 169
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ItemHeight = 30
          Items.Strings = (
            #1043#1072#1079#1086#1074#1099#1077
            #1042#1086#1076#1085#1099#1077
            #1050#1072#1084#1077#1085#1085#1099#1077
            #1051#1077#1076#1103#1085#1099#1077)
          TabOrder = 1
        end
      end
    end
  end
  inherited PanelBottom: TPanel
    Top = 718
    Width = 1223
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 693
    ExplicitWidth = 1215
    inherited ButtonOK: TButton
      Left = 768
      Top = 3
      OnClick = ButtonOKClick
      ExplicitLeft = 768
      ExplicitTop = 3
    end
    inherited ButtonCancel: TButton
      Left = 942
      Top = 3
      ExplicitLeft = 942
      ExplicitTop = 3
    end
  end
end
