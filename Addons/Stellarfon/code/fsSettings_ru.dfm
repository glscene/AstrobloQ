inherited frmSettings: TfrmSettings
  Caption = 'Settings'
  ClientHeight = 665
  ClientWidth = 940
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 956
  ExplicitHeight = 704
  TextHeight = 30
  object tvSettings: TTreeView
    Left = 0
    Top = 0
    Width = 183
    Height = 618
    Align = alLeft
    Indent = 19
    TabOrder = 0
    OnClick = tvSettingsClick
    Items.NodeData = {
      070500000009540054007200650065004E006F00640065002D00000000000000
      0000000000000000FFFFFFFF00000000000000000000000000010713043B0430
      0432043D043E043504000031000000010000000100000001000000FFFFFFFF00
      000000000000000000000000010918043D044204350440044404350439044104
      000031000000020000000200000002000000FFFFFFFF00000000000000000000
      000000010921043E043704320435043704340438044F04000033000000030000
      000300000003000000FFFFFFFF00000000000000000000000000010A1A043204
      38043D0442043E043A0440044304330400002900000004000000040000000400
      0000FFFFFFFF0000000000000000000000000001051704320443043A043804}
    ExplicitHeight = 593
  end
  object PageControl: TPageControl
    Left = 183
    Top = 0
    Width = 757
    Height = 618
    ActivePage = tsInterface
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 749
    ExplicitHeight = 593
    object tsGeneral: TTabSheet
      Caption = #1043#1083#1072#1074#1085#1086#1077
      object Edit1: TEdit
        Left = 70
        Top = 465
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
        Left = 434
        Top = 465
        Width = 212
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 1
        Text = 'Edit2'
      end
      object Edit3: TEdit
        Left = 70
        Top = 513
        Width = 212
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 2
        Text = 'Edit3'
      end
      object Edit4: TEdit
        Left = 434
        Top = 513
        Width = 212
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 3
        Text = 'Edit4'
      end
      object grpDeviceSetup: TGroupBox
        Left = 14
        Top = 12
        Width = 590
        Height = 102
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1042#1099#1073#1086#1088' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099
        TabOrder = 4
        object lblMidiOutDevice: TLabel
          Left = 28
          Top = 42
          Width = 147
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1042#1099#1093#1086#1076' '#1085#1072' MIDI '
        end
        object cmbMidiOutDev: TComboBox
          Left = 210
          Top = 37
          Width = 352
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csDropDownList
          TabOrder = 0
        end
      end
      object grpTrainExamSettings: TGroupBox
        Left = 14
        Top = 126
        Width = 659
        Height = 296
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1058#1088#1077#1085#1080#1085#1075' '#1080' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
        TabOrder = 5
        object lblStage: TLabel
          Left = 28
          Top = 42
          Width = 67
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1057#1090#1072#1076#1080#1103
        end
        object lblSimpleNotes: TLabel
          Left = 14
          Top = 210
          Width = 138
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1088#1086#1089#1090#1099#1077' '#1085#1086#1090#1099
        end
        object lblIntervals: TLabel
          Left = 154
          Top = 210
          Width = 108
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1048#1085#1090#1077#1088#1074#1072#1083#1099
        end
        object cmbStage: TComboBox
          Left = 98
          Top = 37
          Width = 366
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
        end
        object btnAdd: TBitBtn
          Left = 476
          Top = 37
          Width = 37
          Height = 37
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '+'
          TabOrder = 1
        end
        object btnDel: TBitBtn
          Left = 525
          Top = 37
          Width = 37
          Height = 37
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '-'
          TabOrder = 2
        end
        object btnBigOctave: TCheckBox
          Left = 28
          Top = 84
          Width = 212
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1041#1086#1083#1100#1096#1072#1103' '#1086#1082#1090#1072#1074#1072
          TabOrder = 3
        end
        object btnSmallOctave: TCheckBox
          Left = 28
          Top = 112
          Width = 212
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1052#1072#1083#1072#1103' '#1086#1082#1090#1072#1074#1072
          TabOrder = 4
        end
        object btnFirstOctave: TCheckBox
          Left = 28
          Top = 140
          Width = 212
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1055#1077#1088#1074#1072#1103' '#1086#1082#1090#1072#1074#1072
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object btnSecondOctave: TCheckBox
          Left = 28
          Top = 168
          Width = 212
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #1042#1090#1086#1088#1072#1103' '#1086#1082#1090#1072#1074#1072
          TabOrder = 6
        end
        object pgcMode: TPageControl
          Left = 302
          Top = 84
          Width = 338
          Height = 198
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ActivePage = tabSimpleNotes
          TabOrder = 7
          object tabSimpleNotes: TTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1055#1088#1086#1089#1090#1099#1077' '#1085#1086#1090#1099
            object chkWhiteNotes: TCheckBox
              Left = 16
              Top = 5
              Width = 296
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1053#1086#1090#1099' '#1073#1077#1083#1099#1093' '#1082#1083#1072#1074#1080#1096
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object chkBlackNotes: TCheckBox
              Left = 14
              Top = 37
              Width = 296
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = #1053#1086#1090#1099' '#1095#1105#1088#1085#1099#1093' '#1082#1083#1074#1080#1096
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
          object tabIntervals: TTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = #1048#1085#1090#1077#1088#1074#1072#1083#1099
            ImageIndex = 1
            object chkInt0: TCheckBox
              Left = 0
              Top = -2
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Prima'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object chkInt1: TCheckBox
              Left = 0
              Top = 23
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'min.2'
              TabOrder = 1
            end
            object chkInt2: TCheckBox
              Left = 0
              Top = 47
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'maj.2'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object chkInt3: TCheckBox
              Left = 0
              Top = 72
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'min.3'
              TabOrder = 3
            end
            object chkInt4: TCheckBox
              Left = 0
              Top = 96
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'maj.3'
              Checked = True
              State = cbChecked
              TabOrder = 4
            end
            object chkInt5: TCheckBox
              Left = 0
              Top = 121
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'cl.4'
              Checked = True
              State = cbChecked
              TabOrder = 5
            end
            object chkInt6: TCheckBox
              Left = 81
              Top = -2
              Width = 85
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'red.5'
              TabOrder = 6
            end
            object chkInt7: TCheckBox
              Left = 81
              Top = 23
              Width = 85
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'cl.5'
              Checked = True
              State = cbChecked
              TabOrder = 7
            end
            object chkInt8: TCheckBox
              Left = 81
              Top = 47
              Width = 85
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'min.6'
              TabOrder = 8
            end
            object chkInt9: TCheckBox
              Left = 81
              Top = 72
              Width = 85
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'maj.6'
              Checked = True
              State = cbChecked
              TabOrder = 9
            end
            object chkInt10: TCheckBox
              Left = 81
              Top = 96
              Width = 85
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'min.7'
              TabOrder = 10
            end
            object chkInt11: TCheckBox
              Left = 81
              Top = 121
              Width = 85
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'maj.7'
              Checked = True
              State = cbChecked
              TabOrder = 11
            end
            object chkInt12: TCheckBox
              Left = 161
              Top = -2
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'cl.8'
              Checked = True
              State = cbChecked
              TabOrder = 12
            end
            object chkIntMore8: TCheckBox
              Left = 161
              Top = 23
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '&> 8'
              TabOrder = 13
            end
            object chkIntMore16: TCheckBox
              Left = 161
              Top = 47
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = '&> 16'
              TabOrder = 14
            end
            object chkIntUp: TCheckBox
              Left = 161
              Top = 72
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Up'
              Checked = True
              State = cbChecked
              TabOrder = 15
            end
            object chkIntDown: TCheckBox
              Left = 161
              Top = 96
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Down'
              Checked = True
              State = cbChecked
              TabOrder = 16
            end
            object chkIntHarm: TCheckBox
              Left = 161
              Top = 121
              Width = 86
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'Harm.'
              TabOrder = 17
            end
            object chkIntFromWhite: TCheckBox
              Left = 242
              Top = 0
              Width = 85
              Height = 44
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'from White'
              TabOrder = 18
              WordWrap = True
            end
            object chkIntFromBlack: TCheckBox
              Left = 242
              Top = 49
              Width = 85
              Height = 44
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'from Black'
              TabOrder = 19
              WordWrap = True
            end
            object chkIntFromC1: TCheckBox
              Left = 249
              Top = 98
              Width = 78
              Height = 44
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'from C'
              TabOrder = 20
              WordWrap = True
            end
          end
        end
        object trkModeRatio: TTrackBar
          Left = 14
          Top = 238
          Width = 248
          Height = 44
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          PageSize = 5
          TabOrder = 8
          ThumbLength = 26
        end
      end
    end
    object tsInterface: TTabSheet
      Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089
      ImageIndex = 1
      object GroupBoxMIDIdevice: TGroupBox
        Left = 0
        Top = 464
        Width = 749
        Height = 109
        Align = alBottom
        Caption = 'MIDI device'
        TabOrder = 0
        ExplicitTop = 439
        ExplicitWidth = 741
        object chbReleaseMIDIOutput: TCheckBox
          Left = 253
          Top = 41
          Width = 324
          Height = 24
          Caption = 'Release MIDI Output Device'
          TabOrder = 0
          OnClick = chbReleaseMIDIOutputClick
        end
      end
    end
    object tsConstellations: TTabSheet
      Caption = 'Constellations'
      ImageIndex = 2
      TabVisible = False
    end
    object tsColorwheels: TTabSheet
      Caption = #1050#1074#1080#1085#1090#1086#1082#1088#1091#1075
      ImageIndex = 3
      TabVisible = False
    end
    object tsSounds: TTabSheet
      Caption = #1047#1074#1091#1082#1080
      ImageIndex = 4
      object Label1: TLabel
        Left = 428
        Top = 290
        Width = 67
        Height = 30
        Caption = #1057#1090#1072#1076#1080#1103
      end
      object tabMode: TTabControl
        Left = 423
        Top = 184
        Width = 226
        Height = 25
        Style = tsButtons
        TabOrder = 0
        Tabs.Strings = (
          #1058#1088#1077#1085#1080#1085#1075
          #1058#1077#1089#1090#1080#1085#1075)
        TabIndex = 0
      end
      object btnRepeat: TBitBtn
        Left = 392
        Top = 246
        Width = 113
        Height = 25
        Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1100
        TabOrder = 1
      end
      object btnNext: TBitBtn
        Left = 382
        Top = 215
        Width = 113
        Height = 25
        Caption = #1057#1083#1077#1076#1091#1102#1097#1072#1103' >>'
        TabOrder = 2
      end
      object grpStatistics: TGroupBox
        Left = 62
        Top = 204
        Width = 307
        Height = 133
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
        TabOrder = 3
        object lblPlayed: TLabel
          Left = 32
          Top = 44
          Width = 151
          Height = 30
          Caption = #1057#1095#1105#1090' '#1095#1080#1089#1083#1072' '#1085#1086#1090':'
        end
        object lblCorrect: TLabel
          Left = 32
          Top = 63
          Width = 206
          Height = 30
          Caption = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1093' '#1086#1090#1074#1077#1090#1086#1074':'
        end
        object lblRatio: TLabel
          Left = 110
          Top = 82
          Width = 53
          Height = 30
          Caption = 'Ratio:'
        end
        object edtStagePlayed: TEdit
          Left = 192
          Top = 36
          Width = 41
          Height = 36
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object edtTotalPlayed: TEdit
          Left = 240
          Top = 36
          Width = 41
          Height = 36
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
        object edtStageCorrect: TEdit
          Left = 192
          Top = 60
          Width = 41
          Height = 36
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
          Text = '0'
        end
        object edtTotalCorrect: TEdit
          Left = 240
          Top = 60
          Width = 41
          Height = 36
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
          Text = '0'
        end
        object edtStageRatio: TEdit
          Left = 192
          Top = 84
          Width = 41
          Height = 36
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 4
          Text = '0%'
        end
        object edtTotalRatio: TEdit
          Left = 240
          Top = 84
          Width = 41
          Height = 36
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
          Text = '0%'
        end
        object Panel1: TPanel
          Left = 192
          Top = 14
          Width = 41
          Height = 17
          BevelOuter = bvLowered
          Caption = #1057#1090#1072#1076#1080#1103
          TabOrder = 6
        end
        object Panel2: TPanel
          Left = 240
          Top = 14
          Width = 41
          Height = 17
          BevelOuter = bvLowered
          Caption = #1042#1089#1077#1075#1086
          TabOrder = 7
        end
        object btnReset: TBitBtn
          Left = 113
          Top = 17
          Width = 57
          Height = 21
          Caption = #1057#1073#1088#1086#1089
          TabOrder = 8
        end
      end
      object ComboBox1: TComboBox
        Left = 560
        Top = 283
        Width = 93
        Height = 38
        Style = csDropDownList
        TabOrder = 4
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 618
    Width = 940
    Height = 47
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 593
    ExplicitWidth = 932
    object ButtonOk: TButton
      Left = 672
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOkClick
    end
  end
end
