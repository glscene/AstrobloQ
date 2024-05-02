object FormSettings: TFormSettings
  Left = 0
  Top = 0
  Hint = #1042#1088#1077#1084#1103' '#1078#1080#1079#1085#1080' '#1079#1074#1077#1079#1076#1099
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 775
  ClientWidth = 1313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 30
  object PanelBottom: TPanel
    Left = 0
    Top = 704
    Width = 1313
    Height = 71
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1313
      71)
    object ButtonOK: TButton
      Left = 1054
      Top = 2
      Width = 172
      Height = 54
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOKClick
    end
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 16
    Width = 1313
    Height = 688
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object PageControl: TPageControl
      Left = 292
      Top = 5
      Width = 1016
      Height = 678
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ActivePage = tsGalaxy
      Align = alClient
      Style = tsButtons
      TabOrder = 0
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
        object rgLanguage: TRadioGroup
          Left = 46
          Top = 392
          Width = 740
          Height = 100
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1071#1079#1099#1082
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            #1056#1091#1089#1089#1082#1080#1081
            #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081
            #1048#1089#1087#1072#1085#1089#1082#1080#1081)
          TabOrder = 5
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
          TabOrder = 6
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
        object PanelBackground: TPanel
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
          Width = 1008
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
          Top = 5
          Width = 223
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1044#1080#1072#1084#1077#1090#1088' '#1043#1072#1083#1072#1082#1090#1080#1082#1080', l.y.'
          Visible = False
        end
        object nbGxDiameter: TNumberBox
          Left = 530
          Top = 5
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
          Visible = False
          SpinButtonOptions.ButtonWidth = 30
        end
        object grbDrakeFormula: TGroupBox
          Left = 28
          Top = 45
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
            Width = 845
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Fl - '#1076#1086#1083#1103' '#1079#1074#1105#1079#1076' '#1089' '#1082#1072#1084#1077#1085#1085#1099#1084#1080' '#1087#1083#1072#1085#1077#1090#1072#1084#1080' '#1074' '#1079#1086#1085#1072#1093' '#1086#1073#1080#1090#1072#1077#1084#1086#1089#1090#1080
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
            Width = 618
            Height = 38
            Hint = 'Number of civilisations'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Ls - '#1089#1088#1077#1076#1085#1077#1077' '#1074#1088#1077#1084#1103' '#1078#1080#1079#1085#1080' '#1074#1089#1077#1093' '#1082#1083#1072#1089#1089#1086#1074' '#1079#1074#1105#1079#1076
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
              OnClick = ButtonCalculateClick
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
              Text = '1000'
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
              Text = '0.01'
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
              Text = '0.001'
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
              Text = '0.001'
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
          1008
          668)
        object ColorGrid1: TColorGrid
          Left = 406
          Top = 100
          Width = 172
          Height = 172
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
        end
        object chlbStarClasses: TCheckListBox
          Left = 117
          Top = 100
          Width = 182
          Height = 198
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
          TabOrder = 1
        end
      end
      object tsPlanets: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Planets'
        ImageIndex = 6
        TabVisible = False
        object grbPlanetGuts: TGroupBox
          Left = 28
          Top = 42
          Width = 309
          Height = 351
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1083#1086#1080', '#1076#1086#1083#1080' '#1088#1072#1076#1080#1091#1089#1072
          TabOrder = 0
          object LabelIce: TLabel
            Left = 42
            Top = 70
            Width = 36
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1051#1105#1076
          end
          object LabelWater: TLabel
            Left = 42
            Top = 126
            Width = 46
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1042#1086#1076#1072
          end
          object LabelCrust: TLabel
            Left = 42
            Top = 182
            Width = 47
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1050#1086#1088#1072
          end
          object LabelMantle: TLabel
            Left = 42
            Top = 235
            Width = 74
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1052#1072#1085#1090#1080#1103
          end
          object LabelCore: TLabel
            Left = 42
            Top = 302
            Width = 47
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1071#1076#1088#1086
          end
          object nbIce: TNumberBox
            Left = 168
            Top = 54
            Width = 85
            Height = 38
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
            Top = 107
            Width = 85
            Height = 38
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
            Top = 167
            Width = 85
            Height = 38
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
            Top = 227
            Width = 85
            Height = 38
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
            Top = 291
            Width = 85
            Height = 38
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
        object grbPlanetShow: TGroupBox
          Left = 737
          Top = 42
          Width = 258
          Height = 477
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080
          TabOrder = 1
          object chbRotate: TCheckBox
            Left = 57
            Top = 52
            Width = 145
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1042#1088#1072#1097#1077#1085#1080#1077
            Checked = True
            State = cbChecked
            TabOrder = 0
            StyleName = 'Windows'
          end
          object chbShowAxes: TCheckBox
            Left = 83
            Top = 225
            Width = 133
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1054#1089#1080
            TabOrder = 1
            StyleName = 'Windows'
          end
          object CheckBox4: TCheckBox
            Left = 47
            Top = 284
            Width = 183
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1047#1072#1090#1077#1085#1077#1085#1080#1077
            TabOrder = 2
            StyleName = 'Windows'
          end
          object chbPlanetGuts: TCheckBox
            Left = 60
            Top = 104
            Width = 170
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1071#1076#1088#1086
            TabOrder = 3
            StyleName = 'Windows'
          end
          object ButtonGrid: TButton
            Left = 47
            Top = 165
            Width = 178
            Height = 43
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1057#1077#1090#1082#1072
            TabOrder = 4
          end
        end
        object GroupBox1: TGroupBox
          Left = 364
          Top = 42
          Width = 337
          Height = 477
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
          TabOrder = 2
          object LabelPlanetTilt: TLabel
            Left = 14
            Top = 289
            Width = 147
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1053#1072#1082#1083#1086#1085' '#1086#1089#1080', '#1075#1088'.'
          end
          object LabelPlanetDensity: TLabel
            Left = 14
            Top = 233
            Width = 164
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100', '#1075'/'#1089#1084'3'
          end
          object LabelPlanetRadius: TLabel
            Left = 14
            Top = 51
            Width = 102
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1056#1072#1076#1080#1091#1089', '#1082#1084
          end
          object Label3: TLabel
            Left = 14
            Top = 103
            Width = 139
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1056#1072#1076#1080#1091#1089' '#1101#1082#1074', '#1082#1084
          end
          object Label4: TLabel
            Left = 14
            Top = 164
            Width = 143
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1056#1072#1076#1080#1091#1089' '#1087#1086#1083', '#1082#1084
          end
          object LabelGravityAccel: TLabel
            Left = 14
            Top = 345
            Width = 151
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1059#1089#1082#1086#1088#1077#1085#1080#1077' '#1089'.'#1087'., '
          end
          object Label6: TLabel
            Left = 14
            Top = 401
            Width = 149
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', '#1057
          end
          object nbTilt: TNumberBox
            Left = 202
            Top = 280
            Width = 113
            Height = 38
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
            Left = 200
            Top = 221
            Width = 113
            Height = 38
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
            Top = 49
            Width = 113
            Height = 38
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
          object nbRadiusEcv: TNumberBox
            Left = 202
            Top = 106
            Width = 113
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            MaxValue = 100000.000000000000000000
            TabOrder = 3
            Value = 6378.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbRadiusPol: TNumberBox
            Left = 196
            Top = 161
            Width = 113
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            MaxValue = 100000.000000000000000000
            TabOrder = 4
            Value = 6357.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object nbGravityAccel: TNumberBox
            Left = 202
            Top = 336
            Width = 113
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 5
            Value = 9.800000000000000000
            SpinButtonOptions.ButtonWidth = 30
          end
          object NumberBox7: TNumberBox
            Left = 202
            Top = 392
            Width = 113
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Decimal = 0
            MinValue = -373.000000000000000000
            MaxValue = 1000.000000000000000000
            TabOrder = 6
            Value = 27.000000000000000000
            SpinButtonOptions.ButtonWidth = 30
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
          Left = 56
          Top = 416
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
          Width = 519
          Height = 296
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1080#1089#1090#1077#1084#1072' '#1082#1086#1086#1088#1076#1080#1085#1072#1090
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
            Caption = #1069#1082#1074#1072#1090#1086#1088#1080#1072#1083#1100#1085#1072#1103
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object CheckBox1: TCheckBox
            Left = 56
            Top = 112
            Width = 197
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1040#1079#1080#1084#1091#1090#1072#1083#1100#1085#1072#1103
            TabOrder = 1
          end
          object CheckBox2: TCheckBox
            Left = 56
            Top = 170
            Width = 214
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1043#1072#1083#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103
            TabOrder = 2
          end
          object CheckBox3: TCheckBox
            Left = 56
            Top = 233
            Width = 211
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1069#1082#1083#1080#1087#1090#1080#1095#1077#1089#1082#1072#1103
            TabOrder = 3
          end
          object rgrSystem: TRadioGroup
            Left = 280
            Top = 28
            Width = 211
            Height = 144
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Ctl3D = True
            ItemIndex = 0
            Items.Strings = (
              #1057#1092#1077#1088#1080#1095#1077#1089#1082#1072#1103
              #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1072#1103)
            ParentCtl3D = False
            TabOrder = 4
          end
        end
        object rgUnits: TRadioGroup
          Left = 639
          Top = 42
          Width = 188
          Height = 172
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1045#1076#1080#1085#1080#1094#1099
          ItemIndex = 0
          Items.Strings = (
            #1057#1074#1077#1090#1086#1074#1086#1081' '#1075#1086#1076
            #1055#1072#1088#1089#1077#1082
            #1050#1080#1083#1086#1087#1072#1088#1089#1077#1082)
          TabOrder = 1
        end
        object SpinEditPrecision: TSpinEdit
          Left = 214
          Top = 404
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
        object PanelScale: TPanel
          Left = 378
          Top = 404
          Width = 548
          Height = 215
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          BevelInner = bvLowered
          BevelKind = bkFlat
          TabOrder = 3
          object lblScaleX: TLabel
            Left = 59
            Top = 44
            Width = 74
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taRightJustify
            Caption = 'Factor X'
          end
          object Label1: TLabel
            Left = 59
            Top = 91
            Width = 74
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taRightJustify
            Caption = 'Factor Y'
          end
          object Label2: TLabel
            Left = 59
            Top = 142
            Width = 74
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taRightJustify
            Caption = 'Factor Z'
          end
          object Edit1: TEdit
            Left = 224
            Top = 28
            Width = 212
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            TabOrder = 0
            Text = 'Edit1'
          end
          object Edit2: TEdit
            Left = 224
            Top = 79
            Width = 212
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            TabOrder = 1
            Text = 'Edit1'
          end
          object Edit3: TEdit
            Left = 224
            Top = 130
            Width = 212
            Height = 38
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            TabOrder = 2
            Text = 'Edit1'
          end
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
          Width = 1008
          Height = 668
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          TabOrder = 0
          object LabelA: TLabel
            Left = 154
            Top = 16
            Width = 84
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1047#1074#1077#1079#1076#1072' A'
          end
          object LabelB: TLabel
            Left = 635
            Top = 16
            Width = 82
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1047#1074#1077#1079#1076#1072' B'
          end
          object LabelDistance: TLabel
            Left = 165
            Top = 294
            Width = 136
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077', ly'
          end
          object LabelVelocity: TLabel
            Left = 165
            Top = 378
            Width = 166
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1057#1082#1086#1088#1086#1089#1090#1100', km/sec'
          end
          object LabelFlightTime: TLabel
            Left = 165
            Top = 459
            Width = 175
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1042#1088#1077#1084#1103' '#1087#1086#1083#1105#1090#1072', '#1083#1077#1090
          end
          object SearchBoxA: TSearchBox
            Left = 98
            Top = 53
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
            Left = 326
            Top = 369
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
            Left = 338
            Top = 459
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
            Left = 546
            Top = 53
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
            Left = 338
            Top = 289
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
            Left = 628
            Top = 378
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
            Left = 126
            Top = 128
            Width = 841
            Height = 126
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1055#1086#1080#1089#1082' '#1082#1088#1072#1090#1095#1072#1081#1096#1077#1075#1086' '#1087#1091#1090#1080
            TabOrder = 6
            object chbOnTetramesh: TCheckBox
              Left = 179
              Top = 37
              Width = 369
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1055#1086' '#1090#1077#1090#1088#1072#1101#1076#1088#1072#1084' '#1044#1077#1083#1086#1085#1077
              TabOrder = 0
            end
            object chbAvoidHazards: TCheckBox
              Left = 179
              Top = 77
              Width = 365
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1055#1086' '#1087#1086#1083#1080#1101#1076#1088#1072#1084' '#1042#1086#1088#1086#1085#1086#1075#1086
              TabOrder = 1
            end
          end
        end
      end
    end
    object tvSettings: TTreeView
      Left = 5
      Top = 5
      Width = 287
      Height = 678
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      AutoExpand = True
      HotTrack = True
      Images = ImageList
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
        00000000000001091D0430043204380433043004460438044F04}
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 1313
    Height = 16
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
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
