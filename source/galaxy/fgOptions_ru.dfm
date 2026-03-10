inherited FormOptions: TFormOptions
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 701
  ClientWidth = 1236
  Font.Height = -19
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1252
  ExplicitHeight = 740
  TextHeight = 25
  object PanelBottom: TPanel
    Left = 0
    Top = 629
    Width = 1236
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 604
    ExplicitWidth = 1228
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
    Width = 1236
    Height = 629
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1228
    ExplicitHeight = 604
    object tvSettings: TTreeView
      Left = 1
      Top = 1
      Width = 218
      Height = 627
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
        070800000009540054007200650065004E006F00640065002900000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001051E04310449
        04380435040000310000000000000000000000FFFFFFFFFFFFFFFF0100000000
        0000000000000000010918043D04420435044004440435043904410400002D00
        00000000000000000000FFFFFFFFFFFFFFFF0200000000000000000000000001
        071404380441043F043B043504390400002F0000000000000000000000FFFFFF
        FFFFFFFFFF0300000000000000000000000001081C0430044204350440043804
        30043B040000310000000000000000000000FFFFFFFFFFFFFFFF040000000000
        000000000000000109130430043B0430043A04420438043A04300400002B0000
        000000000000000000FFFFFFFFFFFFFFFF050000000000000000000000000106
        170432045104370434044B0400002D0000000000000000000000FFFFFFFFFFFF
        FFFF0600000000000000000000000001071F043B0430043D04350442044B0400
        00270000000000000000000000FFFFFFFFFFFFFFFF0700000000000000000000
        000001041F04430442043804}
      ExplicitHeight = 602
    end
    object PageControl: TPageControl
      Left = 219
      Top = 1
      Width = 1016
      Height = 627
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ActivePage = tsStars
      Align = alClient
      Style = tsButtons
      TabOrder = 1
      ExplicitWidth = 1008
      ExplicitHeight = 602
      object tsInterface: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Interface'
        TabVisible = False
        object Label2: TLabel
          Left = 271
          Top = 88
          Width = 160
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1090#1080#1083#1100' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072
        end
        object CheckBoxLoadProject: TCheckBox
          Left = 47
          Top = 226
          Width = 234
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077
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
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
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
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1089#1090#1072#1074#1082#1091
          TabOrder = 2
        end
        object ComboBoxVclStyles: TComboBox
          Left = 540
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
          Caption = #1054#1089#1080
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
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
          Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099
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
          Caption = #1042#1088#1072#1097#1077#1085#1080#1077
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
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
          Left = 25
          Top = 51
          Width = 90
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1056#1072#1076#1080#1091#1089', Rg'
        end
        object LabelNs: TLabel
          Left = 30
          Top = 143
          Width = 136
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076', Ns'
        end
        object LabelLs: TLabel
          Left = 583
          Top = 101
          Width = 185
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1088#1086#1082' '#1078#1080#1079#1085#1080' '#1079#1074#1105#1079#1076', Ls '
        end
        object LabelHg: TLabel
          Left = 25
          Top = 101
          Width = 166
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1058#1086#1083#1097#1080#1085#1072' '#1076#1080#1089#1082#1072', Hg'
        end
        object LabelVg: TLabel
          Left = 30
          Top = 192
          Width = 90
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1054#1073#1098#1105#1084', Vg'
        end
        object Label5: TLabel
          Left = 25
          Top = 241
          Width = 254
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1052#1077#1078#1079#1074#1105#1079#1076#1085#1086#1077' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077', Ds'
        end
        object LabelTitle: TLabel
          Left = 312
          Top = 0
          Width = 306
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1043#1072#1083#1072#1082#1090#1080#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelRc: TLabel
          Left = 583
          Top = 53
          Width = 71
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1071#1076#1088#1086', Rc'
        end
        object nbRg: TNumberBox
          Left = 288
          Top = 48
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
        object EditLs: TEdit
          Left = 839
          Top = 91
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
          TabOrder = 1
          Text = '10000000000'
          TextHint = 'Mean lifitime for planet'
        end
        object nbHg: TNumberBox
          Left = 289
          Top = 91
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
          TabOrder = 2
          Value = 1000.000000000000000000
          SpinButtonOptions.ButtonWidth = 30
          NegativeValueColor = clRed
        end
        object EditVg: TEdit
          Left = 288
          Top = 184
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
          TabOrder = 3
          Text = '1'
        end
        object EditNs: TEdit
          Left = 288
          Top = 136
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
          TabOrder = 4
          Text = '400000000000'
        end
        object EditDs: TEdit
          Left = 289
          Top = 233
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
          TabOrder = 5
          Text = '1'
        end
        object NumberBoxRc: TNumberBox
          Left = 839
          Top = 48
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
          TabOrder = 6
          Value = 10000.000000000000000000
          SpinButtonOptions.ButtonWidth = 30
          NegativeValueColor = clRed
        end
        object GroupBox1: TGroupBox
          Left = 583
          Top = 139
          Width = 410
          Height = 201
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1044#1086#1083#1075#1086#1083#1077#1090#1080#1077
          TabOrder = 7
          object LabelLt: TLabel
            Left = 27
            Top = 154
            Width = 118
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1058#1077#1093#1085#1086#1089#1092#1077#1088', Lt'
          end
          object Label6: TLabel
            Left = 30
            Top = 119
            Width = 107
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1053#1086#1086#1089#1092#1077#1088', Ln'
          end
          object Label3: TLabel
            Left = 30
            Top = 76
            Width = 105
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1041#1080#1086#1089#1092#1077#1088', Lb'
          end
          object Label1: TLabel
            Left = 29
            Top = 41
            Width = 109
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1051#1080#1090#1086#1089#1092#1077#1088', Ll'
          end
          object EditLt: TEdit
            Left = 240
            Top = 155
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
            TabOrder = 0
            Text = '1000000'
            TextHint = 'Avarage life time for civilisation'
          end
          object Edit3: TEdit
            Left = 240
            Top = 116
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
            TabOrder = 1
            Text = '10000000'
            TextHint = 'Avarage life time for civilisation'
          end
          object Edit2: TEdit
            Left = 240
            Top = 75
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
            TabOrder = 2
            Text = '100000000'
            TextHint = 'Avarage life time for civilisation'
          end
          object Edit1: TEdit
            Left = 240
            Top = 34
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
            TabOrder = 3
            Text = '1000000000'
            TextHint = 'Avarage life time for civilisation'
          end
        end
        object Button1: TButton
          Left = 860
          Top = 559
          Width = 125
          Height = 43
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1073#1088#1086#1089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
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
          617)
        object chlbStarClasses: TCheckListBox
          Left = -67
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
          TabOrder = 0
          ExplicitLeft = -75
        end
        object gbConstells: TGroupBox
          Left = 128
          Top = 53
          Width = 253
          Height = 183
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1086#1079#1074#1077#1079#1076#1080#1103
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
            Caption = #1043#1088#1072#1085#1080#1094#1099
            TabOrder = 2
          end
        end
        object gbStars: TGroupBox
          Left = 686
          Top = 159
          Width = 201
          Height = 330
          Caption = #1057#1087#1077#1082#1090#1088#1072#1083#1100#1085#1099#1077' '#1082#1083#1072#1089#1089#1099
          TabOrder = 2
          object shO: TShape
            Left = 48
            Top = 39
            Width = 29
            Height = 24
            Brush.Color = clHotLight
          end
          object shB: TShape
            Left = 48
            Top = 69
            Width = 29
            Height = 24
            Brush.Color = clSkyBlue
          end
          object shA: TShape
            Left = 48
            Top = 103
            Width = 29
            Height = 24
            Brush.Color = clCream
          end
          object shG: TShape
            Left = 48
            Top = 174
            Width = 29
            Height = 24
            Brush.Color = clYellow
          end
          object shK: TShape
            Left = 48
            Top = 207
            Width = 29
            Height = 24
            Brush.Color = clOrange
          end
          object shF: TShape
            Left = 48
            Top = 137
            Width = 29
            Height = 24
            Brush.Color = clKhaki
          end
          object shM: TShape
            Left = 48
            Top = 251
            Width = 29
            Height = 24
            Brush.Color = clRed
          end
          object Label4: TLabel
            Left = 107
            Top = 23
            Width = 16
            Height = 25
            Caption = '%'
          end
          object Label7: TLabel
            Left = 139
            Top = 18
            Width = 54
            Height = 25
            Caption = #1063#1080#1089#1083#1086
          end
          object shD: TShape
            Left = 52
            Top = 281
            Width = 29
            Height = 24
            ParentShowHint = False
            ShowHint = True
          end
          object chbO: TCheckBox
            Left = 8
            Top = 42
            Width = 34
            Height = 17
            Caption = 'O'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
          object chbB: TCheckBox
            Left = 8
            Top = 76
            Width = 34
            Height = 17
            Caption = 'B'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
          end
          object chbA: TCheckBox
            Left = 8
            Top = 110
            Width = 34
            Height = 17
            Caption = 'A'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
          end
          object chbF: TCheckBox
            Left = 8
            Top = 143
            Width = 34
            Height = 17
            Caption = 'F'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
          end
          object chbG: TCheckBox
            Left = 8
            Top = 177
            Width = 34
            Height = 17
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
            Left = 8
            Top = 217
            Width = 34
            Height = 17
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
            Left = 8
            Top = 258
            Width = 34
            Height = 17
            Caption = 'M'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
          end
          object nbO: TNumberBox
            Left = 87
            Top = 45
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 7
            Value = 0.100000000000000000
          end
          object nbB: TNumberBox
            Left = 88
            Top = 75
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 8
            Value = 0.400000000000000000
          end
          object nbA: TNumberBox
            Left = 88
            Top = 109
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 9
            Value = 0.500000000000000000
          end
          object nbF: TNumberBox
            Left = 88
            Top = 144
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 10
            Value = 3.000000000000000000
          end
          object nbG: TNumberBox
            Left = 88
            Top = 180
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 11
            Value = 8.000000000000000000
          end
          object nbK: TNumberBox
            Left = 88
            Top = 211
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 12
            Value = 12.000000000000000000
          end
          object nbM: TNumberBox
            Left = 88
            Top = 244
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 13
            Value = 76.000000000000000000
          end
          object nbAn: TNumberBox
            Left = 139
            Top = 109
            Width = 54
            Height = 33
            Alignment = taCenter
            Decimal = 0
            MaxValue = 100000.000000000000000000
            TabOrder = 14
            Value = 50.000000000000000000
          end
          object nbMn: TNumberBox
            Left = 139
            Top = 244
            Width = 54
            Height = 33
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 15
            Value = 7600.000000000000000000
          end
          object nbKn: TNumberBox
            Left = 139
            Top = 207
            Width = 54
            Height = 33
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 16
            Value = 1200.000000000000000000
          end
          object nbGn: TNumberBox
            Left = 139
            Top = 179
            Width = 54
            Height = 33
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 17
            Value = 800.000000000000000000
          end
          object nbFn: TNumberBox
            Left = 141
            Top = 143
            Width = 53
            Height = 33
            Alignment = taCenter
            Decimal = 0
            MaxValue = 1000000.000000000000000000
            TabOrder = 18
            Value = 300.000000000000000000
          end
          object nbBn: TNumberBox
            Left = 139
            Top = 74
            Width = 54
            Height = 33
            Alignment = taCenter
            Decimal = 0
            MaxValue = 100000.000000000000000000
            TabOrder = 19
            Value = 40.000000000000000000
          end
          object nbOn: TNumberBox
            Left = 139
            Top = 45
            Width = 54
            Height = 33
            Alignment = taCenter
            Decimal = 0
            MaxValue = 100000.000000000000000000
            TabOrder = 20
            Value = 10.000000000000000000
          end
          object chbD: TCheckBox
            Left = 6
            Top = 281
            Width = 40
            Height = 24
            Hint = 'White Dwaft'
            Caption = 'D'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 21
          end
          object nbDn: TNumberBox
            Left = 144
            Top = 283
            Width = 45
            Height = 33
            Alignment = taCenter
            Mode = nbmInt64
            MinValue = 100.000000000000000000
            MaxValue = 100000.000000000000000000
            ParentShowHint = False
            ShowHint = True
            TabOrder = 22
            Value = 100.000000000000000000
          end
          object nbD: TNumberBox
            Left = 87
            Top = 283
            Width = 46
            Height = 33
            Alignment = taCenter
            Decimal = 1
            Mode = nbmFloat
            MaxValue = 100.000000000000000000
            TabOrder = 23
            Value = 76.000000000000000000
          end
        end
        object seNStars: TSpinEdit
          Left = 734
          Top = 93
          Width = 129
          Height = 36
          MaxValue = 1000000
          MinValue = 1000
          TabOrder = 3
          Value = 10000
        end
        object chbAll: TCheckBox
          Left = 701
          Top = 56
          Width = 164
          Height = 23
          Caption = #1042#1089#1077' '#1079#1074#1105#1079#1076#1099
          TabOrder = 4
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
          Width = 1008
          Height = 617
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          TabOrder = 0
          object LabelStarI: TLabel
            Left = 75
            Top = 70
            Width = 68
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1047#1074#1077#1079#1076#1072' I'
          end
          object LabelStarII: TLabel
            Left = 566
            Top = 70
            Width = 73
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1047#1074#1077#1079#1076#1072' II'
          end
          object LabelDistance: TLabel
            Left = 393
            Top = 195
            Width = 100
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077
          end
          object LabelVelocity: TLabel
            Left = 409
            Top = 281
            Width = 81
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1057#1082#1086#1088#1086#1089#1090#1100
          end
          object LabelFlightTime: TLabel
            Left = 404
            Top = 362
            Width = 120
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1042#1088#1077#1084#1103' '#1087#1086#1083#1105#1090#1072
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
            Left = 660
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
            Caption = #1050#1088#1072#1090#1095#1072#1081#1096#1080#1081' '#1087#1091#1090#1100
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
        object LabelPlanets: TLabel
          Left = 398
          Top = 3
          Width = 118
          Height = 37
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1083#1072#1085#1077#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CheckListBox1: TCheckListBox
          Left = 740
          Top = 363
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
          TabOrder = 0
        end
        object grbPlanetShow: TGroupBox
          Left = 28
          Top = 50
          Width = 673
          Height = 287
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100
          TabOrder = 1
          object chbShowAxes: TCheckBox
            Left = 57
            Top = 193
            Width = 133
            Height = 29
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1054#1089#1080
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
            Caption = #1056#1072#1079#1088#1077#1079
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
            Caption = #1040#1090#1084#1086#1089#1092#1077#1088#1072
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
            Caption = #1054#1073#1083#1072#1082#1072
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
          Top = 347
          Width = 309
          Height = 309
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1083#1086#1081
          TabOrder = 2
          object LabelIce: TLabel
            Left = 42
            Top = 38
            Width = 33
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1051#1105#1076
          end
          object LabelWater: TLabel
            Left = 42
            Top = 94
            Width = 42
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1042#1086#1076#1072
          end
          object LabelCrust: TLabel
            Left = 42
            Top = 147
            Width = 43
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1050#1086#1088#1072
          end
          object LabelMantle: TLabel
            Left = 42
            Top = 198
            Width = 67
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1052#1072#1085#1090#1080#1103
          end
          object LabelCore: TLabel
            Left = 42
            Top = 251
            Width = 43
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1071#1076#1088#1086
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
        object GroupBoxParams: TGroupBox
          Left = 364
          Top = 347
          Width = 337
          Height = 309
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
          TabOrder = 3
          object LabelTilt: TLabel
            Left = 19
            Top = 146
            Width = 100
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1053#1072#1082#1083#1086#1085' '#1086#1089#1080
          end
          object LabelDensity: TLabel
            Left = 19
            Top = 106
            Width = 92
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
          end
          object LabelRadius: TLabel
            Left = 19
            Top = 47
            Width = 60
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1056#1072#1076#1080#1091#1089
          end
          object LabelGravity: TLabel
            Left = 19
            Top = 209
            Width = 101
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1043#1088#1072#1074#1080#1090#1072#1094#1080#1103
          end
          object LabelTemperature: TLabel
            Left = 19
            Top = 257
            Width = 113
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
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
          object nbGravity: TNumberBox
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
          object nbTemperature: TNumberBox
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
        object chlbPlanetsize: TCheckListBox
          Left = 740
          Top = 65
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
          TabOrder = 4
        end
      end
    end
  end
  object ImageList: TImageList
    Left = 83
    Top = 278
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
