inherited frmSettings: TfrmSettings
  Caption = 'Settings'
  ClientHeight = 665
  ClientWidth = 982
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 998
  ExplicitHeight = 704
  TextHeight = 30
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 799
    Height = 618
    ActivePage = tsInterface
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 791
    ExplicitHeight = 593
    object tsGeneral: TTabSheet
      Caption = 'General'
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
        Left = 315
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
        Left = 315
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
        Caption = ' Device setup '
        TabOrder = 4
        object lblMidiOutDevice: TLabel
          Left = 28
          Top = 42
          Width = 184
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'MIDI output device:'
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
        Width = 590
        Height = 296
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = ' Traning and examenation settings '
        TabOrder = 5
        object lblStage: TLabel
          Left = 28
          Top = 42
          Width = 56
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Stage:'
        end
        object lblSimpleNotes: TLabel
          Left = 14
          Top = 210
          Width = 119
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Simple notes'
        end
        object lblIntervals: TLabel
          Left = 154
          Top = 210
          Width = 78
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Intervals'
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
          Caption = 'The big octave'
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
          Caption = 'The small octave'
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
          Caption = 'The first octave'
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
          Caption = 'The second octave'
          TabOrder = 6
        end
        object pgcMode: TPageControl
          Left = 238
          Top = 84
          Width = 338
          Height = 198
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ActivePage = tabIntervals
          TabOrder = 7
          object tabSimpleNotes: TTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Simple notes'
            object chkWhiteNotes: TCheckBox
              Left = 14
              Top = 9
              Width = 296
              Height = 30
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Caption = 'White keys notes'
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
              Caption = 'Black key notes'
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
            Caption = 'Intervals'
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
          Width = 212
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
      Caption = 'Interface'
      ImageIndex = 1
      object GroupBoxMIDIdevice: TGroupBox
        Left = 0
        Top = 432
        Width = 791
        Height = 141
        Align = alBottom
        Caption = 'MIDI device'
        TabOrder = 0
        ExplicitTop = 407
        ExplicitWidth = 783
        object chbReleaseMIDIOutput: TCheckBox
          Left = 253
          Top = 65
          Width = 396
          Height = 40
          Caption = 'Release MIDI Output Device'
          TabOrder = 0
          OnClick = chbReleaseMIDIOutputClick
        end
      end
    end
    object tsConstellations: TTabSheet
      Caption = 'Constellations'
      ImageIndex = 2
    end
    object tsColorwheels: TTabSheet
      Caption = 'Colorwheels'
      ImageIndex = 3
    end
    object tsSounds: TTabSheet
      Caption = 'Sounds'
      ImageIndex = 4
      object grpStatistics: TGroupBox
        Left = 0
        Top = 420
        Width = 799
        Height = 153
        Align = alBottom
        Caption = ' Statistics '
        TabOrder = 0
        ExplicitWidth = 791
        object lblPlayed: TLabel
          Left = 17
          Top = 38
          Width = 173
          Height = 30
          Caption = 'Played note count:'
        end
        object lblCorrect: TLabel
          Left = 13
          Top = 62
          Width = 181
          Height = 30
          Caption = 'Correctly answered:'
        end
        object lblRatio: TLabel
          Left = 78
          Top = 86
          Width = 53
          Height = 30
          Caption = 'Ratio:'
        end
        object Label1: TLabel
          Left = 403
          Top = 44
          Width = 56
          Height = 30
          Caption = 'Stage:'
        end
        object edtStagePlayed: TEdit
          Left = 144
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
          Left = 192
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
          Left = 144
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
          Left = 192
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
          Left = 144
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
          Left = 192
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
          Left = 144
          Top = 14
          Width = 41
          Height = 17
          BevelOuter = bvLowered
          Caption = 'Stage'
          TabOrder = 6
        end
        object Panel2: TPanel
          Left = 192
          Top = 14
          Width = 41
          Height = 17
          BevelOuter = bvLowered
          Caption = 'Total'
          TabOrder = 7
        end
        object btnReset: TBitBtn
          Left = 10
          Top = 82
          Width = 57
          Height = 21
          Caption = 'Reset'
          TabOrder = 8
        end
        object btnRepeat: TBitBtn
          Left = 262
          Top = 72
          Width = 113
          Height = 25
          Caption = 'Repeat'
          TabOrder = 9
        end
        object btnNext: TBitBtn
          Left = 262
          Top = 33
          Width = 113
          Height = 25
          Caption = 'Next >>'
          TabOrder = 10
        end
        object tabMode: TTabControl
          Left = 400
          Top = 72
          Width = 137
          Height = 25
          Style = tsButtons
          TabOrder = 11
          Tabs.Strings = (
            'Training'
            'Testing')
          TabIndex = 0
        end
        object ComboBox1: TComboBox
          Left = 451
          Top = 36
          Width = 97
          Height = 38
          Style = csDropDownList
          TabOrder = 12
        end
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 618
    Width = 982
    Height = 47
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 593
    ExplicitWidth = 974
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
  object tvSettings: TTreeView
    Left = 799
    Top = 0
    Width = 183
    Height = 618
    Align = alRight
    Indent = 19
    TabOrder = 2
    Items.NodeData = {
      070600000009540054007200650065004E006F00640065002D00000000000000
      0000000000000000FFFFFFFF000000000000000000000000000107470065006E
      006500720061006C00000031000000010000000100000001000000FFFFFFFF00
      000000000000000000000000010949006E007400650072006600610063006500
      00003B000000020000000200000002000000FFFFFFFF00000000000000000000
      000000010E43006F006E007300740065006C006C006100740069006F006E0073
      00000035000000030000000300000003000000FFFFFFFF000000000000000000
      00000000010B43006F006C006F00720077006800650065006C00730000002B00
      0000040000000400000004000000FFFFFFFF0000000000000000000000000001
      0653006F0075006E006400730000001F0000000000000000000000FFFFFFFFFF
      FFFFFF000000000000000000000000000100}
    ExplicitLeft = 791
    ExplicitHeight = 593
  end
end
