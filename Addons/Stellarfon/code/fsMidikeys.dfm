object FormMidikeys: TFormMidikeys
  Left = 190
  Top = 105
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Keyboards'
  ClientHeight = 631
  ClientWidth = 868
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 177
    Height = 631
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 606
    object grpInstruments: TGroupBox
      Left = 1
      Top = 1
      Width = 175
      Height = 104
      Align = alTop
      Caption = '`'
      TabOrder = 0
      object lblVelocity: TLabel
        Left = 21
        Top = 54
        Width = 40
        Height = 13
        Caption = 'Velocity:'
      end
      object lblVelocityValue: TLabel
        Left = 141
        Top = 54
        Width = 18
        Height = 13
        Alignment = taRightJustify
        Caption = '127'
      end
      object cbInstruments: TComboBox
        Left = 21
        Top = 27
        Width = 146
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnClick = cbInstrumentsClick
        Items.Strings = (
          '0. Acoustic grand piano'
          '1. Bright acoustic piano'
          '2. Electric grand piano'
          '3. Honky-tonk piano'
          '4. Rhodes piano'
          '5. Chorused piano'
          '6. Harpsichord'
          '7. Clavinet'
          '8. Celesta'
          '9. Glockenspiel'
          '10. Music box'
          '11. Vibraphone'
          '12. Marimba'
          '13. Xylophone'
          '14. Tubular bells'
          '15. Dulcimer'
          '16. Hammond organ'
          '17. Percussive organ'
          '18. Rock organ'
          '19. Church organ'
          '20. Reed organ'
          '21. Accordion'
          '22. Harmonica'
          '23. Tango accordion'
          '24. Acoustic guitar (nylon)'
          '25. Acoustic guitar (steel)'
          '26. Electric guitar (jazz)'
          '27. Electric guitar (clean)'
          '28. Electric guitar (muted)'
          '29. Overdriven guitar'
          '30. Distortion guitar'
          '31. Guitar harmonics'
          '32. Acoustic bass'
          '33. Electric bass (finger)'
          '34. Electric bass (pick)'
          '35. Fretless bass'
          '36. Slap bass 1'
          '37. Slap bass 2'
          '38. Synth bass 1'
          '39. Synth bass 2'
          '40. Violin'
          '41. Viola'
          '42. Cello'
          '43. Contrabass'
          '44. Tremolo strings'
          '45. Pizzicato strings'
          '46. Orchestral harp'
          '47. Timpani'
          '48. String ensemble 1'
          '49. String ensemble 2'
          '50. Synth. strings 1'
          '51. Synth. strings 2'
          '52. Choir Aahs'
          '53. Voice Oohs'
          '54. Synth voice'
          '55. Orchestra hit'
          '56. Trumpet'
          '57. Trombone'
          '58. Tuba'
          '59. Muted trumpet'
          '60. French horn'
          '61. Brass section'
          '62. Synth. brass 1'
          '63. Synth. brass 2'
          '64. Soprano sax'
          '65. Alto sax'
          '66. Tenor sax'
          '67. Baritone sax'
          '68. Oboe'
          '69. English horn'
          '70. Bassoon'
          '71. Clarinet'
          '72. Piccolo'
          '73. Flute'
          '74. Recorder'
          '75. Pan flute'
          '76. Bottle blow'
          '77. Shakuhachi'
          '78. Whistle'
          '79. Ocarina'
          '80. Lead 1 (square)'
          '81. Lead 2 (sawtooth)'
          '82. Lead 3 (calliope lead)'
          '83. Lead 4 (chiff lead)'
          '84. Lead 5 (charang)'
          '85. Lead 6 (voice)'
          '86. Lead 7 (fifths)'
          '87. Lead 8 (brass + lead)'
          '88. Pad 1 (new age)'
          '89. Pad 2 (warm)'
          '90. Pad 3 (polysynth)'
          '91. Pad 4 (choir)'
          '92. Pad 5 (bowed)'
          '93. Pad 6 (metallic)'
          '94. Pad 7 (halo)'
          '95. Pad 8 (sweep)'
          '96. FX 1 (rain)'
          '97. FX 2 (soundtrack)'
          '98. FX 3 (crystal)'
          '99. FX 4 (atmosphere)'
          '100. FX 5 (brightness)'
          '101. FX 6 (goblins)'
          '102. FX 7 (echoes)'
          '103. FX 8 (sci-fi)'
          '104. Sitar'
          '105. Banjo'
          '106. Shamisen'
          '107. Koto'
          '108. Kalimba'
          '109. Bagpipe'
          '110. Fiddle'
          '111. Shanai'
          '112. Tinkle Bell'
          '113. Agogo'
          '114. Steel Drums'
          '115. Woodblock'
          '116. Taiko Drum'
          '117. Melodic Drum'
          '118. Synth Drum'
          '119. Reverse Cymbal'
          '120. Guitar fret noise'
          '121. Breath noise'
          '122. Seashore'
          '123. Bird tweet'
          '124. Telephone ring'
          '125. Helicopter'
          '126. Applause'
          '127. Gunshot')
      end
      object trkVelocity: TTrackBar
        Left = 17
        Top = 73
        Width = 142
        Height = 25
        Max = 127
        PageSize = 8
        Frequency = 8
        Position = 127
        TabOrder = 1
        ThumbLength = 15
        OnChange = trkVelocityChange
      end
    end
    object tvEnsemble: TTreeView
      Left = 1
      Top = 105
      Width = 175
      Height = 126
      Align = alTop
      Images = DataModuleImages.ImageListInterface
      Indent = 27
      MultiSelect = True
      TabOrder = 1
      Items.NodeData = {
        070700000009540054007200650065004E006F00640065003100000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001094100630063
        006F007200640065006F006E000000290000000000000000000000FFFFFFFFFF
        FFFFFF00000000000000000000000000010542006100790061006E0000002900
        00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001
        055000690061006E006F000000290000000000000000000000FFFFFFFFFFFFFF
        FF0000000000000000000000000001054400720075006D00730000002B000000
        0000000000000000FFFFFFFFFFFFFFFF00000000000000000000000000010647
        00750069007400610072000000310000000000000000000000FFFFFFFFFFFFFF
        FF00000000000000000000000000010942006100730047007500690074006100
        72000000370000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        0000000000010C43006F006E007300740065006C006C00610074006F006E00}
    end
    object GroupBoxNoteColors: TGroupBox
      Left = 1
      Top = 231
      Width = 175
      Height = 399
      Align = alClient
      Caption = 'Note colors'
      TabOrder = 2
      ExplicitHeight = 374
      object PanelSi: TPanel
        Left = 2
        Top = 345
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Si'
        ShowCaption = False
        TabOrder = 0
        object ShapeSi: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'B'
          Align = alLeft
          Brush.Color = clFuchsia
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object chbSi: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Si'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 315
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'La#'
        ShowCaption = False
        TabOrder = 1
        object ShapeLaSharp: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'A#'
          Align = alLeft
          Brush.Color = clPurple
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxLaSharp: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'La#'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object PanelLa: TPanel
        Left = 2
        Top = 285
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'La'
        ShowCaption = False
        TabOrder = 2
        object ShapeLa: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'A'
          Align = alLeft
          Brush.Color = clBlue
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxLa: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'La'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object PanelSolSharp: TPanel
        Left = 2
        Top = 255
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Sol#'
        ShowCaption = False
        TabOrder = 3
        object ShapeSolSharp: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'G#'
          Align = alLeft
          Brush.Color = clDeepskyblue
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxSolSharp: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Sol#'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object PanelSol: TPanel
        Left = 2
        Top = 225
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Do'
        ShowCaption = False
        TabOrder = 4
        object ShapeSol: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'G'
          Align = alLeft
          Brush.Color = clAqua
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxSol: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Sol'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object PanelFaSharp: TPanel
        Left = 2
        Top = 195
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Do'
        ShowCaption = False
        TabOrder = 5
        object ShapeFaSharp: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'F#'
          Align = alLeft
          Brush.Color = clLime
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxFaSharp: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Fa#'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object Panel14: TPanel
        Left = 2
        Top = 165
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Do'
        ShowCaption = False
        TabOrder = 6
        object ShapeFa: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'F'
          Align = alLeft
          Brush.Color = clLightgreen
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxFa: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Fa'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object PanelMi: TPanel
        Left = 2
        Top = 135
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Mi'
        ShowCaption = False
        TabOrder = 7
        object ShapeMiSharp: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'E'
          Align = alLeft
          Brush.Color = clYellow
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxMi: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Mi'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object Panel16: TPanel
        Left = 2
        Top = 105
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Re#'
        ShowCaption = False
        TabOrder = 8
        object ShapeReSharp: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'D#'
          Align = alLeft
          Brush.Color = clBurlywood
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxReSharp: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Re#'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object Panel17: TPanel
        Left = 2
        Top = 75
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Do'
        ShowCaption = False
        TabOrder = 9
        object ShapeRe: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'D'
          Align = alLeft
          Brush.Color = clOrange
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxRe: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Re'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object Panel18: TPanel
        Left = 2
        Top = 45
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Do#'
        ShowCaption = False
        TabOrder = 10
        object ShapeDoSharp: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'C#'
          Align = alLeft
          Brush.Color = clOrangered
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object CheckBoxDoSharp: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Do#'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object Panel19: TPanel
        Left = 2
        Top = 15
        Width = 171
        Height = 30
        Align = alTop
        Caption = 'Do'
        ShowCaption = False
        TabOrder = 11
        object ShapeDo: TShape
          Left = 1
          Top = 1
          Width = 88
          Height = 28
          Hint = 'C'
          Align = alLeft
          Brush.Color = clRed
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
          OnMouseDown = ShapeDoMouseDown
        end
        object CheckBoxDo: TCheckBox
          Left = 89
          Top = 1
          Width = 81
          Height = 28
          Align = alClient
          Caption = 'Do'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  object PanelKeyboards: TPanel
    Left = 177
    Top = 0
    Width = 691
    Height = 631
    Align = alClient
    Caption = 'Keyboards'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 683
    ExplicitHeight = 606
    object GroupBoxAccordeon: TGroupBox
      Left = 1
      Top = 1
      Width = 689
      Height = 169
      Align = alTop
      Caption = 'Accordeon'
      TabOrder = 0
      ExplicitWidth = 681
      object GroupBoxAccordeonRK: TGroupBox
        Left = 2
        Top = 15
        Width = 479
        Height = 152
        Align = alLeft
        Caption = 'Right keys'
        TabOrder = 0
        object panKeyboard: TPanel
          Left = 2
          Top = 15
          Width = 475
          Height = 135
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = 'panKeyboard'
          Color = 32928
          ShowCaption = False
          TabOrder = 0
          object btnWhiteC1: TBitBtn
            Left = 16
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 0
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteD1: TBitBtn
            Left = 32
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 2
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteE1: TBitBtn
            Left = 48
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 4
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteF1: TBitBtn
            Left = 64
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 5
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteG1: TBitBtn
            Left = 80
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 7
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteA1: TBitBtn
            Left = 96
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 9
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteH1: TBitBtn
            Left = 112
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 11
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteC2: TBitBtn
            Left = 128
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 12
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteD2: TBitBtn
            Left = 144
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 14
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteE2: TBitBtn
            Left = 160
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 16
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteF2: TBitBtn
            Left = 176
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 17
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteG2: TBitBtn
            Left = 192
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 19
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteA2: TBitBtn
            Left = 208
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 21
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteH2: TBitBtn
            Left = 224
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 23
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteC3: TBitBtn
            Left = 240
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 24
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteD3: TBitBtn
            Left = 256
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 26
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteE3: TBitBtn
            Left = 272
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 28
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteF3: TBitBtn
            Left = 288
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 29
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteG3: TBitBtn
            Left = 304
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 31
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteA3: TBitBtn
            Left = 320
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 33
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteH3: TBitBtn
            Left = 336
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 35
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteC4: TBitBtn
            Left = 352
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 36
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteD4: TBitBtn
            Left = 368
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 38
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteE4: TBitBtn
            Left = 384
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 40
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteF4: TBitBtn
            Left = 400
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 41
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteG4: TBitBtn
            Left = 416
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 43
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteA4: TBitBtn
            Left = 432
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 45
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnWhiteH4: TBitBtn
            Left = 448
            Top = 17
            Width = 17
            Height = 97
            Spacing = 0
            TabOrder = 47
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackC1: TBitBtn
            Left = 26
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 1
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackD1: TBitBtn
            Left = 42
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 3
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackF1: TBitBtn
            Left = 74
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 6
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackG1: TBitBtn
            Left = 90
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 8
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackA1: TBitBtn
            Left = 106
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 10
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackC2: TBitBtn
            Left = 138
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 13
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackD2: TBitBtn
            Left = 154
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 15
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackF2: TBitBtn
            Left = 186
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 18
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackG2: TBitBtn
            Left = 202
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 20
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackA2: TBitBtn
            Left = 218
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 22
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackC3: TBitBtn
            Left = 250
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 25
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackD3: TBitBtn
            Left = 266
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 27
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackF3: TBitBtn
            Left = 298
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 30
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackG3: TBitBtn
            Left = 314
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 32
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackA3: TBitBtn
            Left = 330
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 34
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackC4: TBitBtn
            Left = 362
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 37
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackD4: TBitBtn
            Left = 378
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 39
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackF4: TBitBtn
            Left = 410
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 42
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackG4: TBitBtn
            Left = 426
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 44
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
          object btnBlackA4: TBitBtn
            Left = 442
            Top = 17
            Width = 13
            Height = 57
            Spacing = 0
            TabOrder = 46
            OnClick = btnPianoClick
            OnEnter = btnWhiteC1Enter
            OnExit = btnWhiteC1Exit
            OnMouseDown = btnWhiteC1MouseDown
            OnMouseMove = btnWhiteC1MouseMove
            OnMouseUp = btnWhiteC1MouseUp
          end
        end
      end
    end
    object GroupBoxBayan: TGroupBox
      Left = 1
      Top = 170
      Width = 689
      Height = 291
      Align = alTop
      Caption = 'Bayan'
      TabOrder = 1
      ExplicitWidth = 681
      object GroupBoxBayanLK: TGroupBox
        Left = 5
        Top = 129
        Width = 672
        Height = 156
        Caption = 'Left keys'
        Color = clBtnFace
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object Panel4: TPanel
          Left = 2
          Top = 15
          Width = 668
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object Shape16: TShape
            Left = 1
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape17: TShape
            Left = 31
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape18: TShape
            Left = 421
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape19: TShape
            Left = 391
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape20: TShape
            Left = 361
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape21: TShape
            Left = 331
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape22: TShape
            Left = 301
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape23: TShape
            Left = 271
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape24: TShape
            Left = 211
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape27: TShape
            Left = 151
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape37: TShape
            Left = 121
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape38: TShape
            Left = 91
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape39: TShape
            Left = 61
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape40: TShape
            Left = 451
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape41: TShape
            Left = 241
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape42: TShape
            Left = 541
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape43: TShape
            Left = 181
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape46: TShape
            Left = 481
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape47: TShape
            Left = 571
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape48: TShape
            Left = 511
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 41
          Width = 668
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object Shape49: TShape
            Left = 16
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape50: TShape
            Left = 46
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape51: TShape
            Left = 436
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape52: TShape
            Left = 406
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape53: TShape
            Left = 376
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape54: TShape
            Left = 346
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape55: TShape
            Left = 316
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape56: TShape
            Left = 286
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape57: TShape
            Left = 226
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape60: TShape
            Left = 166
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape85: TShape
            Left = 136
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape86: TShape
            Left = 106
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape87: TShape
            Left = 76
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape88: TShape
            Left = 466
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape89: TShape
            Left = 256
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape90: TShape
            Left = 556
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape91: TShape
            Left = 196
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape94: TShape
            Left = 496
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape95: TShape
            Left = 586
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape96: TShape
            Left = 526
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape45: TShape
            Left = 1
            Top = 1
            Width = 15
            Height = 24
            Align = alLeft
            Brush.Color = clGray
            Pen.Color = clGray
            Shape = stSquare
          end
        end
        object Panel6: TPanel
          Left = 2
          Top = 67
          Width = 668
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 2
          object Shape97: TShape
            Left = 31
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape98: TShape
            Left = 61
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape99: TShape
            Left = 451
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape100: TShape
            Left = 421
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape101: TShape
            Left = 391
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape102: TShape
            Left = 361
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape103: TShape
            Left = 331
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape104: TShape
            Left = 301
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape105: TShape
            Left = 241
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape107: TShape
            Left = 1
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clGray
            Pen.Color = clGray
            Shape = stSquare
          end
          object Shape108: TShape
            Left = 181
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape109: TShape
            Left = 151
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape110: TShape
            Left = 121
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape111: TShape
            Left = 91
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape112: TShape
            Left = 481
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape113: TShape
            Left = 271
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape114: TShape
            Left = 571
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape115: TShape
            Left = 211
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape118: TShape
            Left = 511
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape119: TShape
            Left = 601
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape120: TShape
            Left = 541
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
        end
        object Panel7: TPanel
          Left = 2
          Top = 119
          Width = 668
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 3
          object Shape121: TShape
            Left = 61
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape122: TShape
            Left = 91
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape123: TShape
            Left = 481
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape124: TShape
            Left = 451
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape125: TShape
            Left = 421
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape126: TShape
            Left = 391
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape127: TShape
            Left = 361
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape128: TShape
            Left = 331
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape132: TShape
            Left = 271
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape147: TShape
            Left = 1
            Top = 1
            Width = 60
            Height = 24
            Align = alLeft
            Brush.Color = clGray
            Pen.Color = clGray
            Shape = stSquare
          end
          object Shape148: TShape
            Left = 211
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape149: TShape
            Left = 181
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape150: TShape
            Left = 151
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape159: TShape
            Left = 121
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape160: TShape
            Left = 511
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape161: TShape
            Left = 301
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape162: TShape
            Left = 601
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape163: TShape
            Left = 241
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape166: TShape
            Left = 541
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape167: TShape
            Left = 631
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape168: TShape
            Left = 571
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
        end
        object Panel8: TPanel
          Left = 2
          Top = 93
          Width = 668
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 4
          object Shape169: TShape
            Left = 46
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape170: TShape
            Left = 76
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape171: TShape
            Left = 466
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape172: TShape
            Left = 436
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape173: TShape
            Left = 406
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape174: TShape
            Left = 376
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape175: TShape
            Left = 346
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape176: TShape
            Left = 316
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape177: TShape
            Left = 256
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape179: TShape
            Left = 1
            Top = 1
            Width = 45
            Height = 24
            Align = alLeft
            Brush.Color = clGray
            Pen.Color = clGray
            Shape = stSquare
          end
          object Shape180: TShape
            Left = 196
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape181: TShape
            Left = 166
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape182: TShape
            Left = 136
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape183: TShape
            Left = 106
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape184: TShape
            Left = 496
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape185: TShape
            Left = 286
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape186: TShape
            Left = 586
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape187: TShape
            Left = 226
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape190: TShape
            Left = 526
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape191: TShape
            Left = 616
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape192: TShape
            Left = 556
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
        end
      end
      object GroupBoxBayanRK: TGroupBox
        Left = 5
        Top = 21
        Width = 584
        Height = 106
        Caption = 'Right keys'
        Color = clBtnFace
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        object Panel1: TPanel
          Left = 2
          Top = 15
          Width = 580
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object Shape129: TShape
            Left = 16
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            ParentShowHint = False
            Shape = stCircle
            ShowHint = False
            ExplicitLeft = 17
          end
          object Shape130: TShape
            Left = 46
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 47
          end
          object Shape131: TShape
            Left = 436
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 437
          end
          object Shape133: TShape
            Left = 406
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 407
          end
          object Shape134: TShape
            Left = 376
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 377
          end
          object Shape135: TShape
            Left = 346
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 347
          end
          object Shape136: TShape
            Left = 316
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 317
          end
          object Shape137: TShape
            Left = 286
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 287
          end
          object Shape138: TShape
            Left = 226
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 227
          end
          object Shape141: TShape
            Left = 166
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 167
          end
          object Shape142: TShape
            Left = 136
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 137
          end
          object Shape143: TShape
            Left = 106
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 107
          end
          object Shape144: TShape
            Left = 76
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 77
          end
          object Shape145: TShape
            Left = 466
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 467
          end
          object Shape151: TShape
            Left = 256
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 257
          end
          object Shape153: TShape
            Left = 196
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 197
          end
          object Shape156: TShape
            Left = 496
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 497
          end
          object Shape10: TShape
            Left = 526
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 527
          end
          object Shape106: TShape
            Left = 1
            Top = 1
            Width = 15
            Height = 24
            Align = alLeft
            Brush.Color = clGray
            Pen.Color = clGray
            Shape = stSquare
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 41
          Width = 580
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object Shape1: TShape
            Left = 1
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape2: TShape
            Left = 31
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape3: TShape
            Left = 421
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape4: TShape
            Left = 391
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape5: TShape
            Left = 361
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape6: TShape
            Left = 331
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape7: TShape
            Left = 301
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape8: TShape
            Left = 271
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape9: TShape
            Left = 211
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape12: TShape
            Left = 151
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape13: TShape
            Left = 121
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape14: TShape
            Left = 91
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape15: TShape
            Left = 61
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape28: TShape
            Left = 451
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape29: TShape
            Left = 241
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape30: TShape
            Left = 541
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape31: TShape
            Left = 181
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
          end
          object Shape34: TShape
            Left = 481
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
          object Shape36: TShape
            Left = 511
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
          end
        end
        object Panel3: TPanel
          Left = 2
          Top = 67
          Width = 580
          Height = 26
          Align = alTop
          Caption = 'Panel1'
          Color = clGray
          ParentBackground = False
          ShowCaption = False
          TabOrder = 2
          object Shape61: TShape
            Left = 16
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 31
          end
          object Shape62: TShape
            Left = 46
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 61
          end
          object Shape63: TShape
            Left = 436
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 451
          end
          object Shape64: TShape
            Left = 406
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 421
          end
          object Shape65: TShape
            Left = 376
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 391
          end
          object Shape66: TShape
            Left = 346
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 361
          end
          object Shape67: TShape
            Left = 316
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 331
          end
          object Shape68: TShape
            Left = 286
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 301
          end
          object Shape69: TShape
            Left = 226
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 241
          end
          object Shape72: TShape
            Left = 166
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 181
          end
          object Shape73: TShape
            Left = 136
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 151
          end
          object Shape74: TShape
            Left = 106
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 121
          end
          object Shape75: TShape
            Left = 76
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 91
          end
          object Shape76: TShape
            Left = 466
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Brush.Color = clBlack
            Shape = stCircle
            ExplicitLeft = 481
          end
          object Shape77: TShape
            Left = 256
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 271
          end
          object Shape79: TShape
            Left = 196
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 211
          end
          object Shape82: TShape
            Left = 496
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 511
          end
          object Shape84: TShape
            Left = 526
            Top = 1
            Width = 30
            Height = 24
            Align = alLeft
            Shape = stCircle
            ExplicitLeft = 541
          end
          object Shape116: TShape
            Left = 1
            Top = 1
            Width = 15
            Height = 24
            Align = alLeft
            Brush.Color = clGray
            Pen.Color = clGray
            Shape = stSquare
          end
        end
      end
    end
    object GroupBoxConstellaton: TGroupBox
      Left = 1
      Top = 461
      Width = 689
      Height = 169
      Align = alClient
      Caption = 'Constellaton'
      TabOrder = 2
      ExplicitWidth = 681
      ExplicitHeight = 144
      object ImageConstelton: TImage
        Left = 2
        Top = 15
        Width = 685
        Height = 152
        Align = alClient
        Picture.Data = {
          0A544A504547496D61676516920000FFD8FFE000104A46494600010101006000
          600000FFDB0043000302020302020303030304030304050805050404050A0707
          06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
          1816141812141514FFDB00430103040405040509050509140D0B0D1414141414
          1414141414141414141414141414141414141414141414141414141414141414
          14141414141414141414141414FFC0001108011C024603012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FAEE
          8A28AFF3E8FDB428A28A0028A28A0028A28A0028A28A0028A2B9DF1B78FB44F8
          7BA7417DAE5CB5ADBCD2F928C913484B609C6141EC0D7660F0589CC2BC30B83A
          72A9525A28C53726FC92D599D4A90A3073A8D24BABD8E8A8AF2BFF00869CF87B
          FF004179BFF00E6FFE26957F69BF87A5803AC4AA09EA6CA6E3FF001DAFB0FF00
          5078B7FE8555FF00F054FF00F913CFFED5C07FCFF87FE04BFCCF53A2BCC7FE1A
          53E1CFFD0C07FF0000AE3FF8DD1FF0D29F0E7FE8603FF80571FF00C6EB3FF517
          8B3FE85388FF00C1353FF911FF006A603FE7FC3FF025FE67A1EABAB59687612D
          F6A3770D8D9C58324F7120445C900649E39240FA9AF3CFF8694F873FF4301FFC
          01B8FF00E375E0BFB457C68B3F88D7165A4E88F249A2D9B99DE774282E252B80
          42B00C0282C39C64B1E3806BC5EBFA7F827C02C2E6794431BC4B52AD2AD53554
          E3CB1708F4E7E684DF33DEDA72A766AF7B7C4E65C553A38874B06A328AEAEEEE
          FCACD69F99F717FC34A7C39FFA180FFE015C7FF1BA3FE1A53E1CFF00D0C07FF0
          06E3FF008DD7C3B457DF7FC4BA709FFD04E23FF03A7FFCA8F2BFD6FC7FF243EE
          7FFC91FA15FF000B3FC1BFF436E85FF83287FF008AA3FE167F837FE86DD0BFF0
          650FFF00155F9EB45787FF0012DD94FF00D0C2A7FE0313ABFD71AFFF003E97DE
          CFD0AFF859FE0DFF00A1B742FF00C1943FFC551FF0B3FC1BFF00436E85FF0083
          287FF8AAFCF5A28FF896ECA7FE86153FF01887FAE35FFE7D2FBD9FA15FF0B3FC
          1BFF00436E85FF0083287FF8AA8AEBE2C782ECED669DFC57A3324485D8457D1C
          8E40193B55492C7D00049ED5F9F54538FD1BF284D7366152DFE1883E31C474A4
          BEF67D45E32FDB02DAD279EDFC31A38BE08404BED458A46C439C9112E18A951C
          12C87E6E578C1CBFF86E4F17FF00D00B44FF00BE26FF00E395F38D15FA9E1BC1
          7E05C3D08D0A997AA8D7DA9CA52937A6ADDD2E9B249765A9F3B5F3DCC3113E69
          54B79249247D1DFF000DC9E2FF00FA01689FF7C4DFFC728FF86E4F17FF00D00B
          44FF00BE26FF00E395E09A0E949AA5CBACA596345C9DBD49EC3F9FE55BBFF089
          597F7A6FFBE87F8573D6F0A7C3BA13E49E550BFF00DBDFFC91EEE03059EE6541
          62284FDD7A6AD2DBE47AF7FC37278BFF00E805A27FDF137FF1CA3FE1B93C5FFF
          00402D13FEF89BFF008E5790FF00C22565FDF9BFEFA1FE147FC22363FDF9FF00
          EFA1FE158FFC42FF000E7FE8550FFC9BFF00923D1FEC4E22FE75F7AFF23D7BFE
          1B93C5FF00F402D13FEF89BFF8E55ED27F6E9D761B966D53C31A75E5B942152D
          2792DD836460966DE08C678C771CF1CF88C9E11B4F2DB63CE5F07682CBD7B76A
          C0FEC0D43FE7D9BF31FE357FF1097C39C5C250796412FF0014E2FE4D4D3FB99E
          662F0B9FE0251E6BCAFF00CAB9BEFB23EA3FF86F3FFA91BFF2AFFF00DA297FE1
          BCC7FD08DFF957FF00ED15F2DFF606A1FF003ECDF98FF1AA93DBC96B298E5428
          E3AA9AE48F815E1ACDDA39727FF71ABFFF002D3CBAD8FCE30F1E6ADCD15E704B
          F389F57FFC379FFD48DFF957FF00ED147FC379FF00D48DFF00957FFED15F2651
          5A7FC405F0E7FE859FF95ABFFF002D393FB6B1FF00F3F3F08FF91F597FC379FF
          00D48DFF00957FFED1593ABFEDD3AECD72ADA5F8634EB3B7D80325DCF25C396C
          9C90CBE580318E31D8F3CF1F31D15D343C0CF0EF0F3F690CAD37E752B497DD2A
          8D7E0279CE3E4ACEA7E0BFC8FA3BFE1B93C5FF00F402D13FEF99BFF8E51FF0DC
          9E2FFF00A01689FF007C4DFF00C72BE71AEA748F857E31F1069D0EA1A6F86355
          BFB1981315C5BDA3BA38048382060F208FC2AF19E15F86D974155C6E5F469C5B
          B272938ABF6BB92D74D850CCB30A8ED09B7E9FF0C7B2FF00C37278BFFE805A27
          FDF137FF001CAFA33E0AFC75D1BE336993B5B45FD99AC5B7371A64B287654CF1
          223606F4E40270083C11CA93F1668FFB39FC49D77CEFB3784AFA2F2B1BBED852
          D739CE36F9ACBBBA738CE38CF515EB3FB3EFC0FF00897F0EBE29697AADF6842C
          F4B2B2417AEDA8C3B4C4C87A88DD8B618290B8C12064AFDE1F84F893C11E164F
          21C57F636270D87C6D18B9C146BC39A4D2E6F66E0E6EFCEB48E974DA69D9B4FD
          ACBF19992AD1F6B194A0F4778BD3CEF6E87D8B451457F9D67DD0514514005145
          145C614628A29DD882BC7FE32FC55F16FC34BF825B5D12C6E3449942A5EC85DC
          9979CAB005761F41CE40C83D42FA278D3C6363E04D026D63514B87B58995185B
          44646CB1C0CF6039EA481DBA900F966B1FB48F803C41A5DCE9DA8E9FA95DD95C
          A18E585EDD30C3FEFE641EE08E41008E6BF5CE01C8730C4E2E199BC9E58EC226
          E13493F2BB8B4D7BD14D357BA77B3B6EBBF0B4A4E5CFECF9A2709FF0D69E25FF
          00A04695FF007CCBFF00C5D1FF000D69E25FFA04695FF7CCBFFC5D78A5DAC0B7
          730B57924B60E444F2A04765CF058024038EC09FAD435FE8147C2BE099454965
          90D7FC5FE67D3FD4B0FF00C87B83FED69E272A42695A4AB76252523FF43A8BFE
          1ACBC5BFF40DD17FEFCCDFFC76BC528AD23E1670547459653FC7FCC3EA587FE4
          47B5FF00C35978B7FE81BA2FFDF99BFF008ED1FF000D65E2EFFA06E8BFF7E26F
          FE3B5E29455FFC42EE0BFF00A1653FB9FF0098FEA787FE447B5FFC35978BBFE8
          1DA2FF00DF89BFF8ED27FC358F8BBFE81DA2FF00DF89BFF8ED78A330552C7A01
          9E2B23FE1248BFE78BFE62BC8C7702787D96B8C71780A51E6DB4974F4B9E8617
          2396353787A3CD6DFF00AB9F40BFED63E3031B04D3F43127F09682623F1FDED6
          04DFB67F8EA095A37D27C3E1D4E08FB3CFFF00C7ABC7BFE12487FE78BFE62B33
          55BE8EFE547442842E0E7BD7E77C47C1DC09528AAD9650829AD1C52959AF9F55
          F97C8FAFC9B87210AAE9E3B089C5F576D1FDFB33DC7FE1B57C6FFF0040AF0FFF
          00E03CFF00FC7A8FF86D5F1BFF00D02BC3FF00F80F3FFF001EAF00A2BF3BFF00
          54B22FFA048FE3FE67D8FF00AB393FFD0344F7FF00F86D5F1BFF00D02BC3FF00
          F80F3FFF001EAC1D53F6B0F891A85F4B3C1AB5B69B13E36DADAD944D1A6001C1
          915DB9C67963C938C0C0AF1EA2B6A5C2F925197347090F9C53FC1DCD69F0EE51
          49DE38687CD5FF003B9EADFF000D49F13BFE8651FF008016DFFC6EB83F16F8C3
          55F1CEB526ADADDC25DEA32AAA493AC11C45C28C0C84500900019C67000EC2B1
          68AF570B95E030537530B4214E4D5AF18C62EDDAE92D3447A387CBB05849FB4C
          3D18C25B5E3149DBD520A28A2BD33D10A28A2803F47A9F1A06CE6995245D0D7E
          0FC1183C3E3B3CA387C5414E0D4AE9EAB48B6BF13F9625B0BE52FBD1E52FBD3E
          8AFE9DFF0055322FFA0387FE02657633CA5F7A3CA5F7A7D147FAA9917FD01C3F
          F010BB19E52FBD1E52FBD3E8A3FD54C8BFE80E1FF8085D8CF297DE8F297DE9F4
          51FEAA645FF4070FFC042EC8A411C48CEEC111412CCC7000F535F9F5F133E266
          ADF13F5F6BFD464F2EDA22CB69648D98EDD09E83D58E0658F2703A0000FBDBC5
          374B63E18D5EE5F9486CE69186E55E0213D58803EA481EA457E6DD7EC9E1C70B
          E4D82C456CC30F85846AC528C6496A94AFCD6ED7D15F7B5D5ECDDFF3BE2EC454
          51A5454BDD776D77B5AC1451457EFE7E68145145001451450014514500145145
          00145145001456DF82ACD2FBC51611380537172197703B54B631F857B17F64D8
          FF00CF9DBFFDFA5FF0AFCC78A78E6870C62E1849D0751CA3CDA3B5936D767D99
          F159E71352C92BC684A9B936AFBDBAB5DBC8F02A2BDF7FB26C7FE7CEDFFEFD2F
          F851FD9363FF003E76FF00F7E97FC2BE33FE22EE1BFE80E5FF0081AFF23E77FD
          7FA3FF0040EFFF00025FE4796783900B6B97EECE01FC07FF005CD7415DC2595B
          C49B120891339DAA800CFAFE8297ECD0FF00CF24FF00BE4578588F12E8D7AB2A
          9F556AFF00DE5FE47E939578D984CBB054F0AF0327CB7D79D756DFF2F99C3515
          DCFD9A1FF9E49FF7C8A6FD86DBFE7DE2FF00BE05631F1170FF006B0F2FBD7F91
          ED43C78C03F8F0335E938BFD11C4515DBFD86DBFE7DE2FFBE051F61B6FF9F78B
          FEF8157FF11170BFF40F2FBD1A7FC477CB7FE80A7FF8144E22B3B55D06D75495
          252AD04A176BB46C4F98727E620E707040E3030A38CE49EF757821834AB9290C
          4A4AA8DC235C8F987438E3F0FEB5C9D7DF70F67CB38A12C5E1E2E16938EFE49F
          DDA9FACF0C71065FE206572C5FB06A119B8F2CACF5493BA6BCA5E5D4C0FF0084
          3EDFFE7BCBFA53D7C216607CD2CE4FA8651FD2B728AFAC78DC43FB6CFA45C399
          4ADA82FC7FCCC4FF008446C7FE7A5C7FDF6BFF00C4D7A1FC11F81BA0FC4BF155
          DE9BA9DE6A36F04364F700DA491AB160F1A8C964231863C63D3918E797AF52FD
          9DBC61A4782BC6B7B7BAD5E8B1B5974F78524646605CC91B01F283D95BF2AF84
          E39CCB3AA1C378DAB944E7F58507C9C8AF2BDD6C926DBF91862787F2DF632E4C
          3ABF95CF44FF00861FF027FD057C43FF0081307FF19AF60F875E00D3BE197856
          DB40D2A6BCB8B3819DD5EF66F31F2CC58F4015464F45007538C924E27FC2FCF0
          0FFD0C517FDF89BFF88A3FE17E7807FE8628BFEFC4DFFC457F9C79EE27C4EE26
          C2AC16714B175A9292972CA94EDCC9349E905D1BFBCF068E551C3CB9E951B3F4
          67A0515CDF857E23F86FC6D713DBE8BAB437D3C28247882B2305CE32030048CE
          0123A6467A8AE92BF1EC6E031796D6786C751952A8B78CE2E3257D568D27A9D1
          28CA0ED256614514570901451583E2DF1D685E05B582E35CD412C229DCC71651
          9D9C819385504E07738C0C8F515D984C1E2730AF1C2E0E94AA5496D18A7293EB
          A2576F4EC5462E4ED15766F515E73FF0D0FF000FBFE860FF00C93B8FFE3747FC
          343FC3EFFA183FF24EE3FF008DD7D5FF00A8DC57FF0042AC47FE09A9FF00C89B
          FD5ABFF23FB998F75FB51F832DAE668447A9CA23729E625B2856C1C646581C1F
          700FB545FF000D53E0DFF9F7D57FF01D3FF8BAF94F5992D25D5EF9EC3CEFB0B4
          EED07DA31E679658EDDD8E376319C719AA75FDD947C04E0E9D28CA51AC9B4B79
          EBB75F7773E9165987B75FBCFA57E227ED03E0EF19F82757D1961D5565BA8711
          1F2230048A43264EF3F2EE55CF19C671CD7CD54515FADF08F06E59C1584A982C
          AB9BD9CE5CCD4A5CDAD92D345D12FB8EDA187861E2E30D828A28AFBA3A428A28
          A0028A28A003A56149E1B632315994292700AF6ADDA2BC5CCB27C1E6EA0B170B
          F2DEDAB5BEFB7A23D3C166389CBDC9E1E56E6DF44F6F5398BED164B283CD322B
          A838200C5675757ACA6FD366E324608FCC57295F847156574329C7468E195A2E
          29EF7EAD75F43F54C871D5730C2BA95DDE4A4D76E89FEA1451457C69F4814514
          5001451450014514500145145007E90F947D453D5768A7515EF653C239464B88
          FAD6129DA76B26DB76BEF6BEDDAFD8FE536DB0A28A2BEC890A28A2800A2A45B5
          99941586420F4214D23C3246BB99195738C91819AE1863B09527ECE1562E57B5
          9495EFDAD7DC57432B9AF89778FA7FC39F145C47335BCB1E9772D1CAAFB595FC
          A6DA41EC738C7BD74B5C57C69FF924FE2AFF00AF093F957B7828A9E2A945ECE5
          1FCD1CF8A93861EA49744FF23F3F371F53451457F559FCF61451450014514500
          145145001450064815DAFF00C22FA78E3CB73EE5CD71E23174F0B6E7BEA7BF95
          64B89CE39FEAED2E4B5EEEDBDEDD1F638AA2BB5FF84634FF00F9E6DFF7D9AADA
          8785E0FB23FD9633E78C6D05F83CF3D6B96399D09494755FD7A9ED56E0ECCA8D
          3954F75D95EC9B6DFA2B6ACE4E8AD4FF00846751FF009E03FEFE2FF8D1FF0008
          CEA5FF003EE3FEFE2FF8D76FD6A87FCFC5F7A3E73FB2331FFA069FFE012FF234
          FE1BA06F15DB9232551C8FFBE48FEB5EC35E53E02D367D3B5E5B9BB516F0A46C
          32E7A93C6062BD29757B366005C264F1CF15FCBBE26617138CCEA3530F4E538A
          A715749B5BC9DAEB4EA7E1BC69906715F318D4A583AB28A82D5539B5BCBAD8B9
          451457E247E3C14514500145145001451450057D42D4DEDA49087D85BBE3DF35
          89FF0008BCDFF3D93F235D1D15F4D96711E6394517430934A2DDF64F5D17E88F
          D0B87B8F73DE17C2CB07965551A7293934E317AB493776AFB25F71CA5F6852D8
          DB9999D5D410085078ACCAEF4804104641E08A8FECB0FF00CF24FF00BE457DCE
          5FE20D6A349C71B4B9E57DD351D3B5AC7EC591F8E389C2E19D3CDF0FEDAA5DDA
          516A0ADA696E5E9AEBD4E1A8AEE7ECD0FF00CF24FF00BE451F6687FE7927FDF2
          2BD3FF00888D43FE819FFE04BFC8FA1FF88F383FFA17CBFF00035FFC89C3515D
          CFD9A1FF009E49FF007C8A825D22CE572ED02EE3D7048FE55BD1F1130727FBEA
          124BC9A7F9F2FE676617C77CAA726B1583A915FDD7193BFA370FBEEFD0D2F81F
          F1134DF869E29BCD4B5382EA7866B36B65168AACC18BA37219978F94F7FC2BDB
          7FE1AC7C23FF0040ED6BFEFC43FF00C76BE7E1A2D92F4817F124D32E748B45B6
          94AC0A182120E4F5C57E59C4595F05718E69FDA198E1EB3AB2518DD49455968B
          4BB36FF88C5C378EC5461F56ADEF34AED416FA7F3B3E84FF0086B1F08FFD03B5
          AFFBF10FFF001DAC6B8FDAF2C5679041E1AB89210C423C976A8CCB9E09014E0E
          3B64FD4D7CCF457D6D0F02F8228B6E7879CFD6A4FF00F6D713FA0D65B875D3F1
          3E94FF0086BDB6FF00A15E5FFC0D1FFC4579CFC63F8C717C55834A8E3D29F4DF
          B1348C4B4E24DFB82FFB2318DBFAD798D15F5192F859C25C3D9853CD32DC2385
          6A77E57ED2A3B5D38BD25369E8DEE8DA9E0E852929C23AAF361451457EB07685
          145140051451400514514005145140051451400515D9D8FC19F196AFA6477965
          A5A18A783CE82492E2250E0AEE5E3764678C647719C0E6A8FF00C290F89DFF00
          4018FF00F02EDFFF008E57CC63B88B0780A8A9B529B7FC8B992F26EFBF91DB86
          C3471316FDB4236FE6924CF2FBCD46E649268DA53B0B11B7B63354ABD17C59F0
          43C47E0DF07CBE21D6D21B57FB5243F634916470ADBB2EC54ED0321400092771
          CE31CF9D57F39E36AE22AD572C43937D399B6EDF33F6CC04F0B5295F08E2E2B4
          6E36B5D7A6E14514579E7A414514500145141200249000EE6B5A54AA579C6952
          8B949BB2495DB6FA24B76635AB53C3D3956AD2518C55DB6EC925BB6DE8920A01
          0393C8F4CD4770627B37613A6F0EA045F36E6043648E3181819C9CFCC300F38A
          35FB4F0F78732CCB091C563A72A52BBBC1C1A765EAD3D7D0FC0789FC5486558D
          9E0F2EA70AD0E5569C669ABB5E49AD3D5963EDCDFDC4FD7FC68AAF457ED3FEA7
          641FF4091FC7FCCFC0FF00D7AE25FF00A0E9FDEBFC8FD38A28A2BF9E0FD4828A
          2A8EB3AC5BE8762D7571B8A02142A637313D8648FAFE15955AB0A10955A8ED15
          AB65C2129C9462AED9A31C124D9F2D19F1D768CD6AE916455653343D7006F5AE
          1B4BF8BBA5593CC24B5BC28C14AB2AA139E7391BBE9DFD7A639EEBC39E23B4F1
          469A2F6CC48B1EF285655C3291D8E091D083C1EF5FCB5E21F1B66352189CAF0B
          492C3B714AAA6D37F0C9DB5FE64D7A18E370F8AC3C5BA94DA8F7353A53648D65
          428EA194F506B95F1C78ECF8324B353A7B5DADC0621FCE0806DC71D093D7D076
          EBCE39CB7F8DD1CB71123E8EC88CC0332DCEE20679206D19FA6457E0983CA333
          AB086330B076DD35249DD3DD6A9A69AF531A395636BD355A942F17D6EBFCEE7A
          2FF665AFFCF21F99ACFF0010784EC3C41A16A3A64F6F0C915E5BC9032CE1993E
          652390ACA4F5ECCA7D083CD6D515D10E29CFA9C94E38FAB75AFF00127FE67952
          94A49C64F467E6BFC5AF835ABFC1CBDD3ED758BED32EE6BD479234B0999D9154
          8197565520127838C1C373C1AE0ABF53F5EF08E85E2A107F6D68BA7EB1E46EF2
          BEDF6B1CFE5EEC6EDBBC1C670338F415C96AFF00B3D7C38D6EE567B8F08E9D1B
          AA0402D15AD9319279588A8279EA467A7A0AFEE1E1BFA4FE0E9606952E21C1D4
          9D749F3CE9F259BBBB5A2E51B696BEBB9F0B88E1D94A6DD0924BA277FCF53F37
          68AFD14FF8663F863FF42A41FF008133FF00F1747FC331FC31FF00A1520FFC09
          9FFF008BAFAFFF0089A1E12FFA03C4FF00E034BFF969C9FEAE62BF9E3F8FF91F
          9D75E99F027E0BB7C6AD7B51D3FF00B5BFB1E3B3B6F3CCDF6569F712C142F555
          1D49E5B3C700F247D9D69FB347C33B6BA8E74F09DB33C79C092695D0E4639567
          20FE238AEC3C2DF0FBC35E0992E24D0744B3D25EE02ACAD6B1052E067009FC4D
          7EB191789D80E2ECA3FB4729A5529DDB8AE7514D34F5D14A4AC7E77C418C964F
          5A582FF97964D35B6BEBFE47CD7FF0C123FE8793FF00829FFEDF47FC3048FF00
          A1E4FF00E0A3FF00B7D7D69456FF00EB0667FF003F7F08FF0091F0BFDB78FF00
          F9F9F847FC8F91AEBF60F92DADA59A1F19FDA658D0BA4274BD9E61032177095B
          19E99C1C7A1E95E67FF084788FFE801AA7FE0149FF00C4D7E82D152F3BC555FE
          3BE6EDB2B7DC8FB6E1DE3FC66431AB19525579EDBFBB6B5FB2D773F3808C5257
          B6FC49F81BE39F1078F75DD4ACB41824B3B9BA79217B7B986357427862ACE0EE
          2396C8E58935E2D3C125ACF243346D14D1B1478DC619581C1047620D7B946B42
          B4538BFF00807F59E559C60F37A31A986AB194AC9CA3192938B6B676F9AD95EC
          47451456E7B614F89774883D4814CA7C3FEBA3FF00787F3ACEA36A126BB18576
          E34A6D6E93FC8EEE8A28AFE303FC990A28A2800A28A2800A28A2800A28A2800A
          2A0BD9DADACE799402D1C6CE01E990335E43FF000B0F5FFF009FE1FF007E53FF
          0089AFB8E1CE10C7F13C2ACF07384553693E66D6F7DAD1976F23E9B27E1FC567
          519CB0F28A51B5F99B5BF6B267B2D15E35FF000B0F5FFF009FE1FF007E53FF00
          89A3FE161EBFFF003FC3FEFCC7FF00C4D7D8FF00C427CF3FE7F52FFC0A7FFC81
          F43FEA1E67FF003F29FDF2FF00E44F65A2BC6BFE161EBFFF003FC3FEFCC7FF00
          C4D7A9786AFE5D4F41B2BA9C833491E58818C9E99C7E15F2BC45C1798F0D61E1
          89C64E128C9F2AE5726EF66FAC5763C2CDF86F1793528D6C44A2D376F75BDED7
          EA9762F5CDCC5676F24F3388E28D4B331EC2B19FC65A24C8D1FF00682A6F1B77
          34526067B9C2935378BBFE45BBFF00F73FA8AF21AF89A2ACD4D6E99FD33E0A78
          4B91F1E6575B36CD2B558CE8D6E58AA72828B4A3196BCD093DDF46B43ACFED9B
          2FF9F81FF7CB7F8531F5CB35C6252FF453FD4572D457E9EF8F3346ACA105F297
          FF00247FA04B853029FC52FBD7FF00227656B7715E47BE26DC01C107820D4D5C
          7417B3DAA91148501392055BB2D46F6E2F208967F99E4551BBA7271CD7D16178
          FB0EA8C7EB74DF3F571B5BE5777D8F1711C29554E4E84D72F4BDEFF823A6A2BB
          BFF85623FE8247FEFC7FF6547FC2B11FF4123FF7E3FF00B2AF47FE222F0BFF00
          D05FFE4953FF00903E3BEA55FF0097F15FE670945775FF000AC47FD048FF00DF
          8FFECA9975F0D5E3B67682F7CD9C0CAA347B437B67271550F10F862738C238BD
          5BB6B09A5F36E2925E6F60783AE95F97F2388A2BA1FF00841359FF009F74FF00
          BFABFE353C1F0EF54990976B780E71B5DC927DF806BDAA9C5B90538F34B1B4FE
          524FF057664B0F59FD9672F45759FF000ADB52FF009F8B4FFBE9FF00F89ACAD7
          BC3373E1E5B73712C3279C580111624631D7207AFE95A60B89F26CC6BC70B84C
          4C675257B25BBB2BBFC15C52A1560B9A51B23228A28AFA8303DAAD3F667BCB8B
          48657D760477456655B76600919C03B867EB815EEF69A3D9D9DAC3025AC01224
          540162503006381DAA5D3FFE3C2DBFEB92FF0021562BF1FC5E6188C634AB4AF6
          BDB65F91E14EACE7F130A28A2BCC31386F8CDE08BDF883E02BBD274E9228EF0C
          91CD189C90AFB5B2572338C8CE3DF1D3A8F9BFFE196FC73FF3C6C3FF000287F8
          57D934579D88C051C4CF9E77B9F4D96F10E372BA2E850B72DEFAAFF82BB1F1FD
          9FECA3E34B9DFE64DA55A6DC63CEB973BBE9B51BF5F5AB3FF0C8FE2FFF00A096
          89FF007FE6FF00E355F5BD15CEB28C379FDE7A4F8C7346EE9C57C8F8FF0052FD
          953C5DA6E9D7576D7DA3CCB6F13CA638A797730504E066303271DC81EF547E0B
          7ECFD7DF18ECAFAF21D5EDF4BB6B49D217F322691CE464900103818EFCFB57DA
          768A1AEA1560082EA083DF9AE9ACB4FB5D3A2315A5B436B193B8A4318404FAE0
          77E0576E1720C3D6A8A6FE15BAEFF3E87E61C6FE2DE6F90E17EA7858A55EA59C
          6A595A293D572B4D4AEB45DBCCF1A87F63FF008791C488D06A32B2A80647BC20
          B1F5380064FB015E69FB457ECF1E0FF87BF0C2EF5BD1A2BC86FA1B8850192E0B
          A90CDB48208F7FD2BEB7AE37E2FC51DC780AFE39634963678494750C0E245238
          3E8403F857D4FF00B1646BFB4D504FD8FBF64926F975D1F4F53F9C32BE2FE28C
          F730A19662332AB28579C60D39C9C5A9349DD5F55AEC7E63D15F5AFF00675AFF
          00CFB43FF7EC5793F8ABE0A5CDC5DEA37FA75CDBAABB34B15924453DF60E48CF
          A76CFA0E9EDF0F78C79466D88950CC21F56DB95B97326DBB5B48AE5EF77A6FAA
          3F6BCD7C3FC7E0692A98597B6EE92B34ADBEADDFE5A9E45452ED3E868AFE803F
          2D3ECDD0B5B9B41D416EA101F82AE8DD194F51EDDBF2AEA7FE1694BFF40E4FFB
          FA7FC2B85A2BFCB4C1E758FCBE9FB2C355E58DEF6B27F9A67F6C56C161F112E7
          AB1BBF99D96A1F1267BCB29E04B2485A5429BFCC27683C12381CD71B9268A2B9
          F1B98E2B3192962A7CCD6DB2FC9234A186A5864D528DAE15A161E21D4F4B80C3
          677F716D116DC52290A8CFAE0567D15E4CE9C2A2E59A4D799B4E11A8AD3575E6
          69EB7E24D4BC472C526A374D72D102A80A850B9EB800019F7F61E9542DFF00E3
          E22FF787F3A8EA4B7FF8F88BFDE1FCEA634E14A9F2538A49745A214610A70E48
          2B25D1687D49451457F369F8585145140051451400E4EB4FA6C7DE9D5FE85783
          B47D970861E77BF3CAA3F4F7DC7F4BFCCFE62E3AA9CF9E548DBE1515FF0092A7
          FA8514515FB59F9F85145140057C29E22F00F8C352F106A778DE12D6626B8BA9
          65289652C817739380C170C39EA3AD7DD74576E17152C2B6E2AF73EF38578B2A
          F0ACEB4E8D15375125AB6AD6BF6EF7FC0FCF6D5BC21AF6816CB71A9E89A8E9D6
          ECC104B77692448588240CB00338078F635915F6C7ED15FF00246FC41FF6EFFF
          00A51157C4F5F5183C43C4D3736ADAD8FEA9E0DE24A9C5197CF19569A838CDC6
          C9DD68A2EFAFF8BF00A7236C756F439A6D15DAD26ACCFBA92524E2F666DFFC25
          137FCF14FCCD1FF0944DFF003C53F33589457CA7FAA992FF00D032FBDFF99F99
          FF00C434E11FFA008FDF2FFE48EE2D2E05DDB473052A1C6707B54D585A2DCEA5
          756FE558E9935F2C230C608D9F6E738CE01C7FF5ABD43C03F0CAFBC5FA4CB797
          E67D11D2531AC53DB126400025864A9C64E3F03CD7E1F9A70AE3F0756A4E14D7
          B3E676F7A37B5DDB46EFB1FC9F9C784DC4B471959E070A9D1E79727EF217E5BB
          E5F8A49ED6DF538CA2BD63FE1440FF00A0D9FF00C04FFECEB8AD67C03ACE95AA
          5CDAC5A7DDDEC51B612E20B672AEBD411804743C8CF0722BE66B65F8AA094AA4
          34F93FC8F89CD381F88B26A51AD8CC23516ECACE33D77DA0E4D6DD4E728AD56F
          09EB88A59B46D41540C926D5F03F4ACAAE194250F8958F8FAF85C4616DEDE9B8
          5F6BA6AFF785145150729475B9920D1EF6491D51042D966381C8C0FD6BC16BD6
          FE277FC8B07FEBB27F5AF24AFEABF0A306A96555B157D673B5BB72AFD6E7EE7C
          098750C054AF7D652B7DCBFE08514515FB69FA50568DA788F54B08160B7BE9A2
          857EEA2B703E959D4573D7C350C54793110535BD9A4D5FE663568D3AF1E5AB15
          25D9ABFE66B3F89354BE1E4DC5F4D2C2DF7919B83F5A8EA8DBFF00AE5ABD5FCC
          3E26E170F85CC68470F4D41387D9497DA7D8FEBCF056953A3936269D28A8C7DA
          DEC9595F923AD97A20A28A2BF1D3FA1429C9F7D7EB4DAEAF45F855E30D78C0D6
          5E1CD4648E65592399E031C4EA71821DB0B8390739E9CF4AB8C253768AB9855A
          D4A8479AAC94579B4BF33E803D68ADC3E0AD6813FE80DFF7DAFF008D56BEF0D6
          A7A65B99EE6CDE384100BE41033EB83C57E613CBB1B4E2E73A32496EDC5FF91F
          944713464D28CD37EA8CCA28A2BCE3A028A28A002BD0FC2DF0D7C3BE2DF0BDBC
          DAC69E2FA469598334AE85704AE015238FF3D863CF2BD73E127FC8B771FF005F
          6DFF00A02578B9B6331797D0589C156952A916AD28B7196B75A34D35B9F01C71
          5ABD0CA7DA50A8E0D4A3B369B5AE975F7FC8769FF063C15A6799E4F87AD5F7E3
          3F682F36319E9BC9C75ED573FE1567843FE85BD37FF01D7FC2BA9A2BE1AA7136
          7B5A6EA55C756949F57526DFDFCC7F3ACB1F8C93BCAB49BFF13FF3336EA24864
          548D4228518551802A1AD8AC9946257038009AFE99F0E78AA79D61BFB36AD37C
          D420BDF72E6E6D6DD52B7DECFD1320CC9E2E9FD5E51D6096B7BDFF00AF98DA28
          A2BF673EB428A28A0028A28A009AC416BD800049DE381F5AEB2B9FD03FE3F5FF
          00EB99FE62BA0AF7B011B536FB9FCC3E26E2DD6CDA9E1ED6F6705AF7E6D42B8F
          F8B3FF00223DEFFBF1FF00E862BB0AE3FE2CFF00C88F7BFEFC7FFA18AE2E20FF
          0091462FFEBDCFFF004967C87077FC94797FFD7EA7FF00A523C0A8A28AFE413F
          D250CD14514005157F5FD3E3D2B5CBFB38999A282778D4BF5201C0CFBD50A884
          D54829C766AE4C24A71538ECC28AF67F829690BF86EF2568636737654B941B88
          08840CFA7278F73EB5E83F6583FE78C7FF007C8AFD6B2AE039E6782A58CFACF2
          F3ABDB96F6F9F32FC8FE7CE20F1769E459A57CB7EA4E7EC9DB9B9ED7D174E476
          FBCF9B341F0D5DF889E65B631A08802CF2B1039E83804F63F956B37C35D581C0
          92D987A873FF00C4D7B2EBF6F144D0B24688CC0825540240C63F99FCEB2ABDC8
          703E070F1F655E4E725BB5A7E1AF4F33EC326E2FAD9EE069E634A9FB38CEFEEB
          F7AD66E3BE97D55F6471FA37C3CB28AC546A31F9B74492C5246DA0760318ABE9
          E02D151D585B3641C8FDEB7F8D7435241099DF6838E339AF471197E4B9560E55
          F134A2A9D35772714DD9757A36DFE66D88CD2B538CAB55AAD456AF5765F23A4B
          6B85B8895832B36D05829E86A5AC7B08FEC523313BC918F4ABDF6EFF0063F5AF
          E0CCFF000381A198D48E5155D5A1A34DAE5DF56ACECF47A6CBF53E0E79B6039B
          DDA9A7A3FF0022D515E77F14FE325B7C30B7D39A5D365D426BD6708892845554
          0BB896C1E72CB818F5E4639F3CFF0086BDB6FF00A15E5FFC0D1FFC457D364FE1
          9716E7F82866396E09CE8CEF6973D357B369E929A7A34D6DD0F6B0D46A63292A
          F415E2F67F8753E87A2BE79FF86BDB6FFA15E5FF00C0D1FF00C456969BFB5B78
          7E5858EA1A36A56B36EC04B731CCA570392C590839CF18FC6BD79783FC7349A9
          4F2E76BAFB74DFDEA336EDDD9B4F03898C5BE47F2B5CF7855DB4B5C7785FE307
          843C65AAAE9BA46B29737CC8CEB0B43244580EBB77A804E39C0E7009E80D7635
          FDF39564984E1EC1C32DC0D374E942F68B6DDAEDB7AC9B7BB7D4FE31CE5E653C
          64AA66B0946AC926F9A3CAED6B276B2D34EC1451457AC7861451450079FF008A
          7E3E780FC15AF5D68DAD6BBF63D4ADB6F9B07D8E7936EE50EBF32C641CAB03C1
          EF593FF0D4BF0C3FE867FF00CA7DD7FF001AAF94FF006A5FF92EFE27FF00B75F
          FD258ABCA6BF39C5711E2E8622A528C6368C9AD9F476EE7F74F0E7815C359BE4
          B82CCABE22BA9D6A54E724A54EC9CE0A4ED7A4DDAEF4BB6EDD59F66FC67FDA0B
          C01E2DF86BAC693A56BFF6ABFB8F27CA8BEC7709BB6CC8C7968C01C293C9AF97
          D356B491D51670CCC7006D6E4FE55C95391DA360CA4AB0E411DABA30BC6B8FC3
          2E4F67071BDDE92BFF00E947EC9C3FE18E51C33839E0F0356A494A4E579B8B77
          692E908E9EEAFC753B6A2BD03F644D32CFC4BF11F53B6D5ED20D56D934992458
          6F631322B79D080C158119C1233EE6BEB8FF00856BE11FFA15744FFC1743FF00
          C4D7839F78EF96E438D782AB829C9A49DD4A3D4F91CE5FF6362DE12A7BCD24EE
          BCCF81E8AFBE3FE15AF847FE855D13FF0005D0FF00F1347FC2B5F08FFD0ABA27
          FE0BA1FF00E26BE77FE264329FFA17D4FF00C0A2787FDAD0FE5678AFECCEA478
          4B543C60DF11D79FF569DABD82BC3FE3DF88AFBE1B78C2CF4DF0B343A1584D60
          97125B595B471A34864914B9017A90AA33EC2BCD7FE172F8CFFE83B37FDFB8FF
          00F89AFD97298D4E2DC0D2CF682508575CCA2DDDA5B6B656E86EA94B10BDAC74
          4CFAEA8AE2FE0FEBB7DE23F01D95F6A5706EAEDDE55695800480E40E8076AED2
          BCFAD49D0AB2A52DE2DAFB8E494795B8B0AF96F5A9165D62FDD183A34F215653
          9046E3822BEA4AF3CF8B5A169D0F85AE2F22B1B78AEFCF4733C71057249E7247
          27393D6BE6739C2CB11479D3B725D9F8978A9C3B5B3ACA962E95451586539B4D
          3F7959689F4DBFE18F12A28A2BF3E3F880E4BE277FC8B07FEBB27F5AF24AFAEF
          E12687A77887C5A2D354B1B7D46D3C87736F751892362318CA9E0E33DFBF3DAB
          D17E22FECF7E15F1B78665D374FD334DF0E5EF989245A858E9F1ABA1079042ED
          2C08246338CE0F6AFBDE1CF18B29E0B953C8B32A33E594B99D45AA8A9595DC55
          E4ED6BBB5DDB64DE87F40F0341CB296FFBF2FC91F9FF00457D4FFF000C37FF00
          53AFFE52BFFB752FFC30DFFD4EBFF94AFF00EDD5FB2FFC472F0F7FE865FF0094
          ABFF00F2B3F40F6723E57A2BD3FE387C0F9BE0C5D690ADABC7ABDBEA29294904
          0617468CAEE057730C61D7073EBC0C027CC2BF5AC933BCBF88F2FA59A65757DA
          50A97E5959ABD9B8BD24935669AD52D8869A766496FF00EB96AF553B442F2E46
          00519393572BF9EFC53A909E6B46117771A7AF95E4DEBF2D4FEBEF072954864D
          5E728B4A551D9F7B4629DBBEBA7A8514515F8B9FBE057E8AF873FE45ED2FFEBD
          62FF00D0057CF9F013E0B7853C65E078F58D6AC65BEBA926963DA6E1E3450080
          301083F99EE7DABE918A2486348E3458E3401555460003A002BEC729C34E8C5D
          496D24AC7E2BC5F9A51C6558E169A7CD4DC93BEDD36D7CBC87D66789BFE45ED4
          7FEB83FF002AD3ACCF137FC8BDA8FF00D707FE55E963BFDD6AFF00865F933E0A
          87F1A1EABF33C5E8A28AFE5F3F510A28A2800AF5CF847FF22DDCFF00D7DB7FE8
          095E475E99F0C35FD3B4ED16E2DEEAF22B698DC170B2B6DC82AA0104FB835F3D
          9F427530525057775B1F05C6F46A57C9E51A51727CD1D95FAF91E8F451457E50
          7F320563B316624F53CD6B48E2342CDD05649EBC74AFE93F076834B1B5E50767
          C894ACEDA733924F6BABC5B5BEA8FD078520FF007D36BB24FEFBAFC828AB5FD9
          37DFF3E771FF007E9BFC28FEC9BEFF009F3B8FFBF4DFE15FD19EDA97F32FBCFB
          CF690FE6455A2AD7F64DF7FCF9DC7FDFA6FF000A64BA7DD4119792DA68D07567
          8C803F1A6AAD36ECA4BEF05520F44D10514515A966D68B6BE5A8B9DD9DEA576E
          3DFF00FAD5AC1C639EBE954749FF00907C5F8FF3356EBF8FF30F14F89B23CE71
          F85A35633A71A95231538A7CA949A4D72F2BBA4BAB69EED367E6F9E70C65D9DE
          27DBE2A2D4D6974ED74BA3DD7E09F98FDE3DEB9CF8836177ACF856EEC6C6DCDC
          5C4CC8028755C00E1892588FEEFEB5D0515E556F18B8A3114A742B3A728CD38B
          5C96D1A6BA34FA9C380E0ECAB2EC5D1C6D08CB9E9CA325793B5E2D357F2BA3C0
          BFE157789FFE81BFF91E2FFE2AB3F5AF05EB3E1EB45B9D42CFC8819C461BCC46
          F98827F849F435F46D53D5B47B2D76CDAD2FE05B88090DB49230474208C11F85
          7C7D1E30C4FB48FB784793AD93BDBCAF2B1FB452E26C473AF6B15CBD6C9DFE57
          67CC7457B95F7C20F0FDDCAAD12DCD9A8182904B907DFE70C73F8D15F4F1E2BC
          B64AEDC97CBFC8F7E3C45816AEEEBE471BF1A2248FC496ACA8AAD25B02EC060B
          1DCC327D78007E15E7F5EFBE35F87F0F8CA4B6944E6D2E62F90CB8DC0A7271B7
          239CFB8EA7AF15CCFF00C2891FF41B3FF809FF00D9D7D9F076419A6759352C46
          0A8F3415E37E68AD53F39267C8C78F387B24A54F0798E2792A25B72CE5A6B6D6
          316BF1B9A3F04AE22FF846EEE1F353CE176CC63DC3760A260E3D383F91AF45AF
          3DF0CFC241E1DD72D7513AA9B8F2093E57D9F6EECA91D771F5F4AF42AFEB0E18
          A38DC2E5B0C363A97B394345AA775DF4BDB7B5AFD2E7F2171E6272BC7E79571D
          94E23DB42AFBCFDD947965B38FBC937A24EF6EB6E818AC3D62D8CD7994DA30A0
          1F73FF00EAC56E565DEFFC7CBFE1FCABE43C4DE20C6F0E64D4F1581B73CAA463
          AABE8E337F7FBA8E6E0EC555C1E64EB517AA8BFCD14859C400CAE7DF269F1C09
          11255704D49457F116273FCDF194E54B138BA9384B74E7269F5D9BB1FA8D4C76
          2AAC5C6A55934FA36EDF70514515E09C27CF9FB5974F0B7FDBD7FED1AF9F2BDF
          FF006B0B889AE3C3300950CE8B70ED1061B9558C61491D40255B07BED3E95E01
          5FE9A783F171E07C026ADFC4FF00D3B50FDEF8653594D1BFF7BFF4A61451457E
          C87D412413CB6B3C734323C3346C1D248D8AB2B0E41047435AFF00F09C788FFE
          83FAA7FE06C9FF00C55625152E29EE8C2A61E8D677A9052F5499B7FF0009C788
          FF00E83FAA7FE06C9FFC551FF09C788FFE83FAA7FE06C9FF00C556257B0FECE7
          F0F342F1EEA9AD7F6E5A35EC5690C7E5C5E6B46B9663963B48391B71D71C9E3A
          63E678933CC170B6535F38C6C1BA74926D4527277928AB26D2DDADDA38EAE1B0
          7460EA4A946CBFBA8F1BD4FE2B78DA2BF9953C63AFAA86E00D527C0FFC7EAAFF
          00C2D9F1C7FD0E7E20FF00C1A4FF00FC5D7D23E25FD8A6C755D76F6F34DF13C9
          A6594F2178ACE4B1F3CC20F55DFE6AE4039C6467180493C9F97FC6DE159BC11E
          2CD5342B89E3B99AC663134B10215FB8201E9C1AFE50C17186038871355E5D59
          DF5972B524E29BDBB697B3B36BE47EB992AE1CCCE9C68E1E8D394E31575ECD27
          D13DE367AF66CCED5756BED76FE5BED4AF6E350BD971E65CDD4AD2C8F8000CB3
          124E0003E80554A28AF55B6DDD9F7D084294153A6928A564968925B24BB05145
          148D0FB7FF00651F00E85A77C3CD23C556F63E5EBF7D05C5BDC5DF9D21DF18B9
          6006C2DB47FAB4E40078F735EE95E69FB37E9B77A47C16F0DDADF5A4F65748B3
          9682E6331BA837123292A402320823D4106BD2EBF8BB892BD4C46718A9549B95
          AA4D2BBBE8A4EC97925B2D8FE4ECF6B4EBE678894E4E5EFC92D6FA293B25E496
          C1451457CD9E11F27FED65FF0025134DFF00B0547FFA3A6AF14AF6BFDACBFE4A
          2E9BFF0060A8FF00F474D5E295FEB3785DFF00245E59FF005ED7E6CFB7C1FF00
          BBC3D0E9342F88BE23F0D580B2D37559AD6D4317110556009EB8C838FA56C7FC
          2F2F1BFF00D06BFF002520FF00E22B83A2BF479E0F0D51F34E9C5BF348E974E0
          F5691F69782B559F57F0768FA85E481AE27B48E5964C05058A8C9C0E07AFA579
          FF00C64F883A25FF0080AF6D74CD6ADAE2EE6922558EDA40CC4070C7A74185EB
          F877AF19B1F8A9E2AD37445D22DB57922B0588C2A9E5A165439E0395DC3AF1CF
          1C6318AE4EBE630FC3EA35DD5ACD593BA4B6B5F677470FD4E33BAA8934FA746B
          B32CFF00695DFF00CFCCBFF7D9A3FB4AEFFE7E65FF00BECD56A2BE97EA384FF9
          F51FFC057F918FF63E5BFF0040D0FF00C023FE47D6BFB3CD8DB37C3DB2D40C11
          1BF95E647BA283CC65F30F05BAE381C7B57A8D79AFECF1FF0024AF4DFF00AEB3
          FF00E8C6AF4AAFF2BF8EDBFF005A7328F455AA25E4949D92F25D11F836674A9D
          1C7D78528A8A529689596E1451457C21E61CA78DFE16785BE23BDA3F88B4A5D4
          5ED032C2DE7491150D8C8CA32E7EE8EB9C76EA6BE22F8D9E10D37C17F13F5BD1
          B4CB7582C2DDA230C60B36D0F123E32CC49C6EEA4FE5D2BF422BE11FDA67FE4B
          6F88FF00EDDBFF0049A2AFDD7C36E26CF30F89965F471D56342306E305526A31
          7CD1DA37B2BB6DBB2D5B67EC9E166030798E735A8E368C6A47D9376945495D4E
          0AFAA7D1B3CB955501DAA067D052D1457ED15F115B1551D5AF37393EADB6FEF6
          7F6061B0B43074D51C353508AE91492FB968145145739D47DFFF00B3FF00C25D
          73C2FF000C34DB6D40DAC571316BA11ACA5B6ABFCCA090319C7A135E8DFF0008
          55F7FCF5B7FF00BE9BFC2BA0F08FFC8A9A2FFD7943FF00A2D6B5ABA619C62A94
          5422D59791FC698ECE31588C555AB3B5E526F6F33869BC1D7B0C2F21920608A5
          880C7271F85791789BE2043776F7165650F9B14B1EC33B923AF5C2FD3D7FFD7E
          CFF13BC68DE0AD01678ED45D4B72E6DD033ED542518EE3C738C74E33EA2BE5EA
          F9FCDF8931BC9F568492BEFA6B67D3B6BF7F99F65C37879E3212C4E25689AE5F
          96FF007681451457E727E8614514500145145007AB27C5FD3CA297B1B957C7CC
          14A900FB1C8CD751E0AF10278EA4BA4B1B696216C14C8F3150A376768E093938
          6ED8E3AF4AF01AF59FD9FEF9ACEFB59057744F1C6490DC8605B1C77EA79CF1EF
          9E3E77FB1328A2FDA62EF1A6B7777A76EFD6C7E519C706E5586C154AD8783525
          6B7BCFBAEFE47AADA7864B4B8BB0AF0E3EEAB1E4D5F8BC37A7412A4896FB5D08
          653E637047E3562DF528EE64D801538CFCD8AB5B87A8AFD37876A6070B8274F2
          8ACDD2726DFBCF7B24EFB74B1F9F51A72C1C3D9536D27AEE2D154EF750168CAA
          144848C9F9B18AE67C75F13F4FF879E17BDF106AB04A74EB20AD37D9FE790EE6
          0AA15780496651C9039C93C544F88B2BA78E5974AB7EF9B4AD696EED657B5B5B
          AEA7552C2D6AF28C69C6EDE8BCD9D9535D165464750EAC3055864115E0BE14FD
          B67E1BF89F55FB0CD26A5A0031B3ADD6AD0224248C7CBBA3772091923200E319
          C900F65FF0D27F0C7FE874D33FEFE1FF000AFA6E5927B1DF5726CCA84B967879
          A7FE16FF0023D2B15CF6AB696E2F5CAC51E5BE66C28EB562C3C4DA57897418F5
          1D2B50B7D42C6EA3DD0CF6EE1D5C74E31E87208EC41CF4AA15F8B71EE7FEC69C
          72EC34BDE7EF39296AACDAB34BFCFE46387A73A726E574D6961000A000300740
          2968A2BF036DC9DDEE7685145148028A28A0028A28A007275A7D22AE3EB4B5FE
          94F873C3D8AE19E1EA581C6B5ED1B726974E6D795F9AD9F4BEC7F28715667473
          6CD2788C3FC2924AFD6DD7D1F40A28A2BF4C3E442B2EF7FE3E5FF0FE55A9546E
          AD659276655C838EFED5F8978B996E3734C86952C0D195592AB16D462E4EDC93
          57B2BBB5DAFBCFA9E1DAD4A862E52AB2515CAF776EA8A745717E30F8C7E0FF00
          00EB274AD7B581637E23594C3F669A4C2B74394423B7AD627FC34BFC36FF00A1
          907FE00DCFFF001BAFE3596419BC24E32C2544D74E497F91FB961F20CDF17463
          88C3E0EA4E1249A9461269A7B34D2B34FA347A7D15E63FF0D2DF0DBFE8641FF8
          0573FF00C6E8FF008696F86DFF004320FF00C02B9FFE3751FD879AFF00D02D4F
          FC025FE4747FAB19EFFD0056FF00C173FF00E44F03F8E9299BE2B6BECD8043C4
          BC7A08907F4AE0EBA7F897E22B2F1678E757D5B4D90CD63732830C8CA577A850
          BBB07919C679C1F500F15CC57FAA9C2B46587E1FCBE8CE3CAE346926BB3508AB
          7C8FDBF014A747094695456946314D3DD3495D3F40A28A2BEA4EE3D1BC1BF017
          C51E38D020D62C05945653B3088DC4FB59C2B1527001C0DC08E7078F4C67A38B
          F650F17C8819AFB4788FF75A79491F9466BDB3F678FF00923BE1FF00FB78FF00
          D2892BD1ABFCFBE2AF1B78B32CCF71D97615D38D3A356A423EE5DF2C26E2AEDB
          DECB5F3EC7CC56CC6BC2A4A11B59367C953FECA7E308B1B2EF489B3D764F20C7
          E718A3E11D87887E197C6BB4F0FDE66D4DD6E8AE6204345711EC664753DF9190
          4608E41C7CC2BEB5AE5A6F867E1E9FC68BE2B6B37FEDB520F9FE73ED2426C076
          E71F7703A76AF22878D99866F80C7659C4D08D4A5568D48C3929ABFB56BDC6EF
          249453D6E9369A4D2EA66B3094E32856D534FA753A9AF883F6B9F03D97857E21
          43A95949313AD46D753C52B9709286C3152790A783B7B738C0C01F6FD78AFC7E
          F82717C59D4B49B85D68E9735945244EBF66F38306208FE25C1E0FAE723A77FC
          D3C37589A99FC28E1D36A5197325B592BABF44AF6D7BD9753DBE13CC6196E671
          A95A7CB4DA6A5BBE9A68AFD6C7C2D457D27FF0C71FF537FF00E533FF00B756B7
          83BF632B1BAD5EF975BF105C5CE9D1C49E47D822104ACE49C96DE1D400178032
          4EECFCB8C37F5DD3CA719526A0A1ABF35FE67EB999F1DE4194E0EA63B135DF24
          2D7B464DEAD25656EED1F2B5393EF8FAD7DADFF0C51E06FF00A0A7883FF0260F
          FE335D57FC32D7C3003FE459FF00CA85D7FF001DAF4D70D636CDC9C55BCDBFC9
          33F2CC478FBC2345C5538D6A97FE58455BD79E71DFCAFE763D468A28AFF38651
          716E325668F834D3574145145481F27FED65FF0025174DFF00B0547FFA3A6AF1
          4AF6BFDACBFE4A2E9BFF0060A8FF00F474D5E295FEB3785DFF00245E59FF005E
          D7E6CFB7C1FF00BBC3D028A28AFD48EC0A28A2800A28ABD6DA26A1790ACB059C
          D2C4DD1D50906B9EBE268E163CF5E6A2B6BB692FC4A5172D123EAEFD9E3FE495
          E9BFF5D67FFD18D5E955F32FC3AD6B5FF0AF86A3B25BC92D90C8D2AC270DB01C
          71C838E99C0F5F5CD74FFF0009FF00883FE824FF00F7C27F857F99FC659154C6
          711E6189C3D58CA13AB39269BD9C9BE8ADF71F9DE3381330C6626A626152094D
          B693E6BEAEFAFBA7B9D31E68E33867553E84E2BC3FFE13FF00107FD049FF00EF
          84FF000AC5BDBD9F51BA92E2E6569A790E59D8F26BE52970C556FF007B5125E5
          77F9D89C378738A949FD66BC62BFBA9C9DFE7CA7D11F6987FE7AA7FDF42BE14F
          DA564497E35F88DA36575FF47195391916F103FAD7AED7807C53FF0091EF52FA
          45FF00A292BF43E0FC9A39763A7579F9AF06B6B758BEEFB1FAC701F094721CCA
          A62556E7BC1C6DCB6DE5177DDF6393A28A2BF5D3F770A28A2803F597C25FF22A
          68BFF5E50FFE8B5AD6AC9F08FF00C8A9A2FF00D7943FFA2D6B5ABCD7B9FC315F
          F8B3F57F99C47C57F06DFF008D745B4B5D3DA15962B8F35BCE62A31B48EC0FAD
          7CD7776B2D95D4D6F32EC9A1731BAE41C30382323DEBECBAF917C5D198BC57AD
          21C12B7B3038FF00AE8D5F2F9BD18C5C6AADD9FA570862EA4E33C2CADCB1D577
          D5EA64D14579CEB3E35D52DB56BC86195238A295A3551183C038EFF4AEAE1DE1
          9C6F1356A94704E29C15DF33696F6E899F7F5ABC2824E5D4F46A5C1F435E45A8
          F8AF53D52D5ADE7B8CC2C4165450BBB1C8071D467071EC3D2B2735FAB613C20C
          554A5CD8BC64613ED18B92B7AB943EEB7CCF3E599453F763747B6DC5D4169B7C
          F9A387774F3182E7F3A20BB82EB779334736DEBE5B06C7D715E2357F45D626D0
          EF85CC20336D2A5589C107D71FE78AEBC4F845ECF0B3961F14E7552764E2A29B
          EDF13B5F6BDFCC98E63792BC6C8F64AE27E2678AAF7C1DFD81A9D95C5C4260D4
          125923B79DA232AAFCDB091D8E3DFE9547FE1665E27CCF690320E48058123EBC
          E2BCD3C71F11AEFC6D15B4325B4769040C5F6212C598F1924FB76F73F84706F8
          699CD2CEE857CC2845E1E37E7F793D1C64AD64EFAF92F9A3E3F8C73CC261F2CA
          986E66AA545EEE8FA357D763EA1FF86E7F0CFF00D0BBAB7FDF517FF1547FC373
          F867FE85DD5BFEFA8BFF008AAF8C28AFD1FF00E25E7C3FFF00A059FF00E0D9FF
          0099F827F6EE3BF997DC8FB62D3F6E3F07BEEFB4E89ADC38C6DF2921933EB9CC
          8B8AE3BE38FED4FE16F887F0BF50D0349B0D505E6A122237DB112210AC6E926F
          2559B764A85007FB44E30377CB148DD057C67147823C1DC3782FED6CBA94E356
          9CA0E37A926AFCCBA3FBF73EFF008171D5B32CF28D0C4EB157976D62AEBF1436
          8A2B67C21A341AFEBD0595C348913AB126220370A4F706BE00FEAEAD5A387A52
          AB3DA29B7F23EFEFD987FE484F853FEB94DFFA3E4AF51AF933C35F1175DF0778
          734DD0F46BB5B1D3EC21F291044923392C58BB1707E6258F4C0F402BEA5D0AFA
          4D4F44D3EF250AB2DC5BC72B841800B28271EDCD7F25F18F0EE2F29C54F1B5E5
          171AD39B8D9BBAD6FADD2E8FA367F3866125571356B47694A4D7A3772F514515
          F9D9E705145140051451400514138A2A945BD90C968A2BE48F8C5FB50F8C7C29
          F11F5AD17495B0B7B0B0944082483CC7621412CC49EE49E001818EBC93FEB163
          B1F472FA6AA56BD9BB687F2D708F06E67C6B8C9E0B2BE5E684799B93B2B5D2E8
          9BBDDF63EB7A2BE15FF86C1F887FF3DB4EFF00C031FE349FF0D81F10FF00E7BE
          9DFF008063FC6BC5FF0059B03DA5F77FC13F59FF008803C5DFCD47FF000397FF
          00207DD7457C29FF000D81F10FFE7BE9DFF8063FC68FF86C0F887FF3DF4EFF00
          C031FE347FACD81ED2FBBFE087FC401E2EFE6A3FF81CBFF900FDB07FE4B24FFF
          005E307F235E255D27C41F1F6ABF12FC4D3EB9AC7922EE5554096F1EC8D157A2
          80493F9927DEB9BAFCE31D5A388C4D4AB0DA4DB47F767096575F25C830596E2A
          DED29538C65677574ACECF40A28A2B84FAD3AFD33FE41F6FFEE0AB355B4CFF00
          907DBFFB82BB4D3BE15F8AF56B182F2D7459E4B69D43C6E5957729E87048383D
          47A8E6BFAB301569D1C050752497B91DDDBECA3F9FF1D251C555BBFB4FF36729
          45769FF0A6BC67FF004029BFEFE47FFC551FF0A6BC67FF004029BFEFE47FFC55
          75FD770BFF003F63F7AFF3383DA43BA3EA1FD9E3FE48EF87FF00EDE3FF004A24
          AF46AE1BE08E8D79E1FF00863A369DA843F67BD83CEF3222C18AEE99D8648247
          4607F1AEE6BFC8AE39D78AB357DF1159FC9D4934FE68F88C46B5A6FCDFE61451
          457C41CE15CEEADFF21097F0FE42BA2AE7756FF9084BF87F215FBDF833FF0023
          FAFF00F5E65FFA5D33B30BF1BF42A56CF877FE5E3FE03FD6B1AAFE95A8258B49
          BD598381CAFB7FFAEBFB530D250AAA527A7FC03C1E30C162330C8F1186C2C39A
          72E5B25D6D38B7F8267474532299268D5D1832B0C834FCD7D3277D51FC713A73
          A72709A69AD1A7BA7D8C4F1A78960F06785B55D7AE62927B7D3EDDAE1E28B1BD
          828E833C57CFFF00F0DCFE19FF00A17756FF00BEA2FF00E2ABD6BF680B88ADFE
          0BF8C1A5912253A7BA067600166C051F524800772457E6B57CDE03C15E0DE23A
          D89CCB30C3C9D4A936DDAA492BBD5BB27D5BBBF37D8FD8B87388330782545C95
          A1EEAD16C968BE5B1F67FF00C373F867FE85DD5BFEFA8BFF008AA3FE1B9FC33F
          F42EEADFF7D45FFC557C61457B3FF12F3E1FFF00D02CFF00F06CFF00CCFAAFED
          DC77F32FB91ECBF18FE3B587C4EF1645A9DB69771636F05A25AA2CB22B3BE19D
          8B10381CBE3193D33DF0337C33683C4D60D77148614590C655D7272003EBEE2B
          CB2BD6BE147FC8B737FD7D37FE8295F5D9F65B86E0BE1AA787C917B38D2E5846
          EF9ACBFEDEBDEE7D6643C419862310B0D5269C6CFA2343FE1127FF009F95FF00
          BE3FFAF47FC224FF00F3F2BFF7C7FF005EBA3A2BF14FF5BF39FF009FDFF92C7F
          C8FD0FEB75BB9CCCBE1591226659D5D80C852B8CD6157797FF00F1E373FF005C
          DBF91AE0EBF4EE11CD7199AD1AB3C5CF99C5A4B44BA797F91E9612ACEAC5B9B0
          AF57F04FFC8B165FF03FFD0DABCA2BD5FC13FF0022C597FC0FFF00436AF90F16
          BFE44747FEBEC7FF004899F47977F15FA7EA8DCA28A2BF92CFA10A28A2800AE5
          3C47F0D348F136A6D7F70D7305C3A857F22400391C062181C1C607181C0E3392
          7ABA2B7A35EA50973527666D4AAD4A32E6A6ECCE03FE14AE85FF003F3A87FDFD
          4FFE228FF852BA17FCFCEA1FF7F53FF88AEFE8AEBFED2C5FFCFC6757F6862BFE
          7E3381FF00852BA17FCFCDFF00FDFD4FFE228FF852DA17FCFC5FFF00DFD4FF00
          E22BBEA921B69AE5B6C313CADC708A49E4803A7B903EA45279962D2BBA8C4F30
          C4AD5D467D87A64115B69B690C09E5C31C488899276A8000193D78AB350D982B
          6900230422E41FA54D5F728FE5B9BBC9B0AF923C684378C75D2A4106FE7208EF
          FBC6AFADEBC5FF0069BD1AC34DF859AAEA7676505A6A22E216FB5DBC62394969
          006258609CE4E7359FF65CF38AF47094E4A2E524AEFCF43EA787331860312D4E
          2DF3D969D353C5EBC73C4031AF6A3FF5F127FE8468FF00848354FF00A08DDFFD
          FF006FF1AA3248F348D248CCEEC4B3331C927D49AFDFF82B82B11C2D88AD5AB5
          68CD4E29689AD9DFA9FA462B14B10924AD61B451457EB679C1599E24D763F0DE
          8F3DFC90CB7023C011C2A49624E064F619EE7F53806CDFEAD63A58437B796F66
          24CEC3712AA6EC6338C9E7191F9D71FF00103E2043A5F87CC9A2EA96535EB4AA
          83CA9525655E4921727D31C8EFF4AF371B8BA786A3524E6934BC9BFBAEAE6B4E
          0E724AC624BF1D61C3A368D2AB630419C71FF8ED67E81E288B5E9A68D20785A3
          50DF3104115C45A7DA3C61E222D7D74EF71724B3CC402785E38E806063DABB7F
          0FF85E2D0259A449DE669142FCC0000579FC2B8BCEF1B8855A32E6C3F33526D4
          53D15F6DFAAD8F84E377944287B1AF7FAC28DE1F175767E5D1EE6DD14515FB39
          F8285009E39A2807041C66B9B13456228CE9349DD35AEC74E16B3C3D78554DAE
          569E9B8CAEC7E1659FDA3C4A66DFB7ECF0B3E319DD9F971EDD735A7F03FE1F69
          9F12FC6C746D4E4BBB7B6FB34936FB49155F7295C7DE5618E7D2BE9AF0DFECC5
          E13F0BC93C96B77AACB2CA02EF9A78C9503A80046073C7507A0C639CFF001766
          1C33986595FEAF89494AD7D1DF73FB02AF1665D9BE5F53EA526DC935AAB7AFE0
          798D7D85E12FF915345FFAF287FF0045AD7947FC295D0FFE7E750FFBF89FFC45
          7A25B5C4967636D690B9486DE358931D48518193F4AFCAB8C381F32E24861E8D
          09462A2DB6E4DECD74493B9F9BD4A329DAC75345612EB93AA8055188EE41E698
          DACDCB31219547A05AFC7697843C49526E32F6714BAB9BB3F4B45BFBD239BEAD
          50E82AA5E48CB280AC40C678AC9FED7BAFEF8FFBE455882E64BA4DD210581C64
          0C579B9CF8759B70DE15E3F1B3A7282697BAE4DEBB6F15F99E0E774EA50C1B9A
          76D56C4FE749FDF6FCE8F3A4FEFB7E74CA2BE0F963D8FCE7DBD6FE77F7B1C657
          3FC6DF9D14DA29A56D83DBD5FE77F7B36ABF3A7F682FF92CFE2CFF00AFC3FF00
          A08A3FE1A0BE227FD0D97FF9AFF85713ABEAF7BAF6A773A8EA37325E5EDCB992
          59E56CB3B1EE6BFD03CE338A399518D3A7169A77D6DD8FE90F0BBC2ECCF81733
          AF8EC757A7523529F2250E6BDF9A2EEEF15A6853A28A2BE48FE970A28A2800A2
          8A2803EC1F807E05F0DEADF09F43BCBEF0FE977D77379E649EE6CE391DB13C8A
          32CC09E0003F0AF41FF8569E10FF00A15744FF00C1743FFC4D735FB3A7FC91AF
          0F7D2E3FF4A25AF49AFD0B0B4A9BA14DB8AD974F23F9C335C56223986212A8EC
          A72EAFF99986FE05F0DC9B77787B4A6DAA1066CA238500003EEF400003D856E5
          1457A0E526945BD16C784E4E5AB770A28A2A493434CD4D6CE378E442549DC197
          924F7047E03F3AD4B5BF86ECE109DD8C9523915CDD68E85FF1F6FF00EE1FE62B
          F01F103817289E071B9EA5255D2E7D25A37A2D534F47BE96D7ADB438EBD18D9C
          FA9B9451457F1C1E5953FB5AD7FE7AFF00E3A7FC2B12FE65B8BB9244CED38C13
          F4C541457F7DF0CF00657C298B9E33053A929CA3CBEFB8B566D3D2D18EB748F6
          69D18D37741451457E946E14514500709F1D3ECFFF000A8FC51F69F2FCBFB19C
          79B8C6FC8D9D7BEEDB8F7C639AF80ABEEBFDA4FF00E48A7893E96FFF00A51157
          C295FB8702C6D97D597F7DFF00E931FF0033F29E2D7FED905FDDFD58514515FA
          41F1015EC3F0C6258FC2B1B28C1795D9BDCE71FC80AF1EAF64F869FF00229DBF
          FD747FFD0ABF26F135B591C52EB523F948FAEE1849E39FF85FE68EA68A28AFE5
          63F5520BFF00F8F1B9FF00AE6DFC8D7075EA7E1DB58AFBC41A65B4E824866B98
          A3911864329600820FB57B07FC28EF04FF00D0107FE054FF00FC5D7EA3C1F9A5
          1CBE8D68558B776B6B76F368F4B095A34A2D33E4CAF57F04FF00C8B165FF0003
          FF00D0DABD73FE1477827FE8083FF02A7FFE2EB660F87DE1FB6823862D35228A
          3508AA923800018F5E4FA9EA4F279A8E3897FACD9753C1E0FDD9466A4DCB4565
          192E97D7DE3DAC2E634A84DCA49EDE5FE6793515A7E25B0874CD76F2DA005614
          6F9549CE0100E3F5ACCAFE55AF46587AB3A33DE2DA7F2763ECE9CD54829AD9AB
          85145158161451450014515B9E15F07DF78BEE278ACDA18FC950CEF3310393C0
          E0139EBDBB5635AB53C3D3756ACAD15BB66556AC28C1D4A8EC97527F8751A4BE
          35D283A870242D8619E42920FE04035F42D7977847E166A9A0F88ACEFEE2E6CD
          E18598B2C4CE58E54818CA8EE7D6BD46BF1EE27C5D0C662A13A13E64A3D3BDD9
          F99E7F89A58AC4465465CC947F566BC5ACC6235DE8C1B1CEDC63F9D3BFB661FE
          EC9F90FF001AC6A2BD48F1F67514A2A51D3FBA7C7FD5E9947E207C5AD1FE1BE8
          D1EA7AA5BDECB6F24A20516B1AB31720903058760C73D3E53DF00FCFDF1B7F69
          3D03E22F812E341D274DD4A39AE258D9A5BD58D151558371B5D892718C71D739
          ED5EA7F197E1F4BF123C316BA6457A96262BC5B8323C65F2023AE3191FDE1F95
          7CF3E3EFD9FAF3C0DE17BAD68EB105EC56CC9E645E498CE1982020E4E4E5871C
          719E7B1FEA9F0BF89B86F30C3E15E73884B30954B46294D26F99286C9C6EDF76
          BCCF43072CAE8D6A74EACED56EACB5EFA74B1E4D451457F651F7814551BED7B4
          CD2E6115E6A36969295DC1279D5188E99C13D383F9557FF84BF41FFA0DE9DFF8
          171FF8D612AF4A2ED29A4FD515CB27B2382F8C7E13D4F56B98352B48166B5B6B
          57F38F98AA630A4B138246783DB2783ED9F3DF01780B5DF89DE2BB1F0D786AC7
          FB4B5BBDF33ECF6BE7245BF62348DF33B2A8C2A31E48E98EB8AF6CF13F8A745B
          8F0CEAF145AC58492C96732A225D212C4A100019E4D53FD82FFE4EB7C13F4BEF
          FD21B8AFC938AA14A855962284AEE49B7ADD5D7A1DCEBD4A183A9512D609B57F
          24DEA74DF0EBF605F8C92F884C9A9E8765A0DBC1049209AFB52824595B1B446A
          21690EE3BB3960170A7241C03A7F153F674F18FC1ED1AD355D7E2B33617371F6
          5596D2E449B642A58290403C85639008F979C6467F4FEBE6AFDBE7FE48F68FFF
          0061D87FF49EE2B9781F8B731A59851CAE2A3ECAACF5D1DF556D1DFC91F82F11
          5679B49E32BAB4A31B2B6D64DBEB7EECF81E8A28AFEB13F390A28AF7FD2FF629
          F1CEA7A6DA5E0D4742B71710A4DE4CB7136F4DCA0ED6DB111919C1C123D09AE3
          C4E330F8449D79A8DF6B9CB5F13470C93AD251BF731FF64BFF0092B1FF006E13
          7F35AFB46BC33E0C7ECC9E25F853E2F7D7757D434AB9B516AF004B192477DCC5
          719DC8A00E0F73DB8EE3DCEBF08E2EC4D2C5665ED28CB9972AD7EF3F60E10C45
          2C465AE7464A4B99EDF20A28AD6874069624769829619C0191F9E6BE429D29D5
          7682B9EE66B9DE5F92C23531F579149D968DDFE4937F3D8C9A2B46F7463676ED
          289438523236E2B3A954A72A4F966ACCD72CCDB059CD0788C0D4E78276BD9AD5
          59DACD27D50558B6B95850AB027273C557A2BE7F38C9F099EE11E0B1A9B8369E
          8ECEE8EBC5E12963693A359685EFB7C7FDD6A3EDF1FF0075AA8D15F9FF00FC42
          EE1CFE49FF00E06CF0FF00D5CC0767F797BEDF1FF75A8AA18CD147FC42EE1CFE
          49FF00E06C3FD5CCBFB3FBCFCDAA28A2BACFED50A28A2800A28A2800A28A2803
          EDEFD9D3FE48D787BE971FFA51257A4579BFECE9FF00246BC3DF4B8FFD2892BD
          22BF46C2FF00BBD3FF000AFC8FE67CDBFE46388FF1CFFF004A6145145751E485
          1451400C9A64B789E495C471A0DCCCC7000AF1CD5B5AB89F5AB8B982F27DA267
          303891815524F4F4E2BD5FC41FF201D4BFEBDA4FFD04D789D7E4FC73889FEEB0
          DF65A6DF9F4FB8FACC8E9464A751FA1A1FF0916ABFF413BCFF00C087FF001A1B
          C43AABC5244DA9DE347229574370E4303D4119E4567D15F91FB0A5FC8BEE47D3
          FB1A7FCABEE3AEF02EA77DA878AAC20B8BEB996162C591E6620E1188C8CFA815
          EC5E4C7FF3CD7F2AF14F871FF23969FF00F6D3FF0045B57B757C67126638D862
          A118D7925CBFCCFBBF33F02F102A4E8E674E14DB8AF669D969F6A5FE433C88FF
          00E79AFE549E447FDC5FCAA4A2BE53FB531FFF003FE7FF00814BFCCFCC7EB35B
          F9DFDECF38F8D1AD5EF87746D3E5D36736924970559900C91B49C722BC8BFE16
          3F893FE82D37E4BFE15E9FFB40FF00C8034CFF00AF93FF00A01AF0CAFE87E0EC
          762AA64F4DCEAC9BBCB793EEFCCFC0B8BF3CCD70D9B4E950C5D48C528E8A724B
          6EC99A9AEF8A355F136992E9DAA5EBDE58CD8F320900DAF8E467039C1C1FA807
          A8AF27F889E1CD3749D1219ED2D12094DC2A16527A15638EBEC2BD12BA1F067C
          27D2FE30DDDD68DA9DEDDD88822FB5C4F6817960C14EEDD9E30E78C7BE78C1FD
          A384737C4E1738C3A9D792A7CDEF2E6767A7557D4F9CCA73BC74F32A35317889
          C95F5BCA4F4D7BBD4F95A8AF6CF1FF00ECA5E33F0F78AAF6CB40D26EF5DD1D76
          B5B5F831A9752A090577F054E57B676E700115C4789FE0BF8DFC1BA449AA6B3E
          1CBCB2D3E365592E182B2A1270376D27009C0C9E3240EA457F6652C7E12BA8BA
          7562EFB2BABFDDBDFC8FDFE9E330F552E4A89DF6D55FEEDCE2AB5F4AF16EADA2
          5B7D9ECEF0C50E776C28AC01F6DC0E2B228AD71384C3E369FB2C5538CE3BDA49
          35F73BA3D1A55AA50973D2938BEE9DBF23A4FF00858DE21FF9FF001FF7E23FFE
          268FF858DE21FF009FF1FF007E23FF00E26B9BA2BC9FF57726FF00A02A5FF82E
          1FE475FF0068E37FE7F4BFF027FE67A1FC3FF1BEB7AAF8F3C39653DDC72C173A
          95B432472DBC6CACAD2A8208C0C8C1F5AFBD6BF397C01A95B68DE3BF0E6A1792
          F936769A8DBCF348413B1165566381927001E95FA2B6D730DEDB45716F2A4F6F
          32092396260C8EA46430238208E722BF2BE32CBB0B80AD47EA94634E2D3BF2C5
          45377F24AECFD1785B1353114AAFB59B934D6EEFA5BCC968A28AFCECFB82BDC7
          82345D4E53757565E6CF20059FCD75CF18E8081517FC2B9F0EFF00D03BFF0023
          49FF00C5574307FA94FF00745495FE7F66B98E36598621BAD2F8E5F69FF333F2
          1AF9D6670AB38C7155124DE8A72496BEA735FF000AE7C3BFF40EFF00C8D27FF1
          55E59E33D32DF47F12DE5A5AA948232A55492719407193F5AF78AF11F88FFF00
          239EA1FF006CFF00F45AD7A9C3D8BC457C4CE156A392E5BEADBEABB9FA0F01E6
          58DC6665529E26BCA71E46ED2936AFCD1D757E6735451457E807EEA15E9FF03F
          FE3EB57FF722FE6D5E615E9FF03FFE3E757FF722FE6D5F37C45FF22BADF2FF00
          D291E1E77FF22FABF2FCD1EB3451457E167E461451450057BDFF00543FDEAF30
          F8FDFF0024935DFF00B61FFA511D7A7DF7FAA1FEF57987C7EFF924BAEFFDB0FF
          00D288EBF4AE02FF0092932AFF00B08A3FFA7227C956FF0091DD0FF143FF004A
          47C77451457FADC7EE07877C72FF0091B2D3FEBC53FF0046495E775F545EE87A
          6EA72896F34FB4BB942ED0F3C0AEC073C648E9C9FCEA4D23C27A17F68C20E85A
          5B8625487B1898608C742BFF00EAAFCE337C86ACE75F1AA6AD672B6BD15CD713
          9AD3CBB05531138B6A9C5C9DBAF2A6F4FB8F94EBDFFF0060C3FF00195DE08FA5
          F7FE90DC57ABFF00C205E19FFA17349FFC018BFF0089ABFA1685A6F85F558353
          D1B4FB4D2352B7DDE4DE5840B04D1EE52ADB5D40232AC41C1E848EF5F8C56CD6
          1529CA0A2F54D1FCCF8AF1FF002CC461EA51581A8B9935F147AAB1FA275E1DFB
          5F6896BAFF00C33D3EDAED59A31AB44E0AB6082229B9FC891F8D783CFE3AF12D
          D2049BC43AACC80E42C97B2B0CFAF2D59B7DAB5F6A7B3ED9797177B33B7CF959
          F6E7AE3278E82BC1C3D7AD84AB1AF426E338BBA6B4699F90E6FE26D3C760AAE1
          B0D4250949594B9969E7A2FD4E462F877A0C71856B36948FE3799F27F22053BF
          E15FE81FF40F1FF7FA4FFE2ABA2A2BDE7C4D9E49B6F1D57FF064FF00CCFC71E7
          599B77FACCFF00F0397F99CF7FC2BFD03FE81E3FEFF49FFC557DF7A6B07D3AD5
          822C60C484220C2AF03803B0AF896BED8D27FE41767FF5C53FF4115F65C3599E
          3B3095558CAF3A9CB6B7349CAD7BDED76ED73D8CB71B8AC5B9AC45594ED6B733
          6EDBED70D4E17B8B29238D7739C607E22B0FFB1EF3FE78FF00E3C3FC6BA6A2BE
          BAB61A15A5CD26CFD6321E32C7F0F61A585C2C2128B9397BCA4DDDA4BA4969A7
          6399FEC7BCFF009E3FF8F0FF001AE8AD50C76D0A30C32A0047BE2A4A29D1C342
          836E2DEA639FF16E3B88E953A58B8422A0EEB9535BAB6B793296B3FF0020E97F
          0FE62B9AAE9B58FF009074DF87F315CCD7978FFE2AF4FF0033F69F0C3FE44D57
          FEBECBFF004880514515E69FAF05145140051451401F9B39A3359B457DEFFC42
          7A1FF418FF00F005FF00C91B7FC469C47FD00C7FF037FF00C89A59A3359B451F
          F109E87FD063FF00C017FF00241FF11A711FF4031FFC0DFF00F226966BD53C25
          FB34F8EBC65A05AEB167630416774BBE0FB5CE237913B385EBB4F627A8E47041
          3E335FA1BFB2AFFC904F0B7D2EBFF4AA6AFC37C5FC8EBF8799151CD7035D5494
          EAC69B52874709CAEAD2FEE5BE676617C58C6E6537468E1A34DA57BB6E5D95AD
          68F7DCF9C3FE1907E217FCF1D3BFF02C7F851FF0C83F10BFE78E9DFF008183FC
          2BEE7A2BF90FFE224677DA1FF80BFF00E48F57FD7CCDBB43FF00017FE679C7C2
          BF8717FE09F87FA368D74F09BAB6898CBB5CB00ECECEC01C0E01623FC7AD74CF
          A45D2B101038F50C31FAD743457AF86F17788F0F64D53924AD67176FC249FE27
          C556C7D6AF5675AA5AF26DBF56EE73BFD9377FF3CBFF001E1FE3514F6735B006
          542A0F00E41AE9EB3B5DFF008F44FF007C7F235F6FC31E29E739CE7386CBF134
          692854959B8A9A7B3DAF36BF0269E2252928B461D14515FD467A066F8958AF87
          F51238FF004771FA1AF16AFA5F4CF075BEBFA55CA5FF009F1C73298C2A7CA769
          5FBC091CF5E3B71DEB9ABBF813A25ADC32FDB6FD90E1906F4040C74276F3C827
          3C75F6C9FCC33FCB6BE7D9842860ACDC62EF7765B87FADB95F0EE1EA54C749A5
          75B2BEE786D15EDBFF000A4F42FF009FAD43FEFE27FF001147FC292D0FFE7EB5
          0FFBF89FFC4578DFEA1675FCB1FF00C08F37FE22F70B7F3CFF00F00679BFC38F
          F91CB4FF00FB69FF00A2DABDBAB9ED3BE16E9DE1CD4A0D46D6F2E59E12711CC5
          486054AF603D73F857435F83F1D65589C9F33861B149297227A3BE8E52FF0023
          F3DE24E22C071362A18DCBA4DC14545DD34EE9C9DB5F26B55A0514515F9D1F26
          795FED03FF00200D33FEBE8FFE806BC2EBDD3F681FF900699FF5F47FF4035E17
          5FD19C17FF00226A7EB2FCD9FCDFC6DFF239A9E91FC9057AC7ECDF139F196A12
          04631AD83297C7009923C0CFBE0FE46BC9EBD9FF00669FF90A6B9FF5C62FFD09
          ABF58C863CD99515E7F9267CAE5EAF8A87F5D0F7BAE33E33E9777AD7C28F15D9
          585BC97779369F2AC5042BB9E43B738503927D00E4F6AECE8AFDDA95474AA46A
          2E8D3FB8FD069CDD39C66BA3B9F982FF0008BC731940DE0DD7D4B9DAA0E9930D
          C704E07CBCF009FC2AB6ADF0DBC5BA0E9F2DFEA5E17D674FB1871E65CDD584B1
          C699200CB328032481F522BF515FA563F8A7C3769E30F0DEA5A25F99059DFC0F
          6F2B42DB5D430C6549046475190471C835F99717F8FF008BE14E218655530519
          51F71CE5CD2E6B49FBD65B5D2DBCCFE81E1FC12CEB2EFAE49F2CAED5BA687E57
          D15F707FC3107813FE829E21FF00C0983FF8CD7CFF00F1CFE015E7C3AF19258F
          876C759D5F489AD9268EE1ED8CA55F2432178C6188201E8A406031D19BF5FE17
          F19F8438B730FECDCBEBCA35395C973C7913B5AEAEDDAFADEDD9334C46538AC2
          C3DA4D69E5A9E3F5FA17F0926B79FE17F84DAD5E29221A65BA9309057788C071
          C770C181F7073CD7E7DDF69F75A5DD3DB5EDB4D697298DD0CF19475C8C8C83C8
          E0835064FAD7E8F9DE4F1CFE8538C2AF2A4EE9A5CC9A6BD57DE6D94E68F29A93
          9B8735D5B7B7E8CFD38A2BF31F27D4D193EA6BE37FD40FFA8AFF00C93FFB63EA
          3FD70FFA87FF00C9BFFB53F52ED64592DD0A306006320E791C11F8115266BF2C
          327D68C9F535FCEF8BFA322C4E22A5759C5B9A4DDBD85ED777B5FDB2BFDC8F84
          AB88552A4A695AEDBDFF00E01F7AFC6FF8FD0FC1BBCD2AD57485D667BD8E4959
          05EAC2D12A901491B58E1896C1200F94E09C1C7CE7ACFED2D77AEEAB7D7F73A0
          C2B24F21312C572408D000155B2A771007246DCFA0AF16C16F534BB1BD0FE55F
          B0F0CF821C2791E061431947EB15ECD4AAB7521CDEF36BDD551A8D95969BDB53
          B3019B6332BACEBE0A7C926ADB27A69DD3EC8F55FF0085FB75FF0040787FEFF1
          FF000A3FE17EDD7FD01E1FFBFC7FC2BCAB637A1FCA8D8DFDD3F957D97FC431E1
          0FFA015FF8154FFE48F73FD72CFBFE825FFE031FFE44F55FF85FB75FF40787FE
          FF001FF0AF75FD95BE2CC1E27D5BC416D7E96BA63A411491EFB900B8DCC1B00E
          338CAF23D7DEBE35D8DFDD3F953A382495D51237776202AAA9249F415F33C49E
          0E70BE7594D7C061A92C3CE695AA272938D9A77E57349DED6D7B8FFD6ECE2AFB
          988ACE707BC6D157F9A57DCFD52FF84874BFFA0959FF00DFF4FF001AB169A85A
          DFEEFB35CC371B31BBCA903633D338AFCB1FF847B54FFA06DE7FDF87FF000AFA
          07F62AD32F74FF008A1AA4B75693DB44FA4491ABCD1B22973342C14123AE158E
          3D14FA1AFE46E2EFA3FE0386B21C5E714338F6B2A31E650F6715CD6B697551DB
          D6CCF4B0B9B622BD68D2950693EBAE9F81F6AD365FF56FF434EA64C4085C9380
          14F26BF8DA117292496A7D154BF24ADD8CDAE1BE36E9D77AB7C30D6AD2C6D66B
          CBA93C9D905BC65DDB13464E147270013F857719A5AFB3CA3309E519961B3284
          799D19C2693D9B8494ACFD6C7E5B86AEF0D5E9D74AEE2D3FB9DCF86BFE15DF8A
          FF00E859D67FF0025FFE26B1B50D3AEF49BB92D6FAD66B3BA8F1BE0B88CC6EB9
          008CA9E464107F1AFBFABE3BF8FA0FFC2DAD778FF9E1FF00A223AFEF1F0DFC53
          C671C66D572EC461A34E30A6E778B6DDD4A11B6BFE2FC0FD8322E21AB9B62654
          274D4528B7A5FBA5FA9E7B56F49FF9095BFF00BE2AAED3E86B47C3F65717DAC5
          B436D04B71296244712166200249C0F4009FC2BF7CCD2518E0311293B25097FE
          92CF6F8835C9F19FF5EAA7FE92CEB28A9AEACAE2C64097304B6EE46E0B2A1524
          7AE0D435FC7E9A92BA7747F96328B8BB49598514514C41451450015F6C695FF2
          0BB3FF00AE29FF00A08AF89EBDA2CBF69296D74FB681B40479628D11A417642B
          6000485D8719FA9C7BD7D9F0DE6386CBE555E2656BDADA37B5FB23DBCAF134B0
          EE7ED5DAF6EFE7D8F7AA2A0B7B93716F14BB76EF50D8F4C8A9379F6AF11F8D3C
          2A9D9BA9FF00807FC13F785C039CC926947FF02FF803EAADCEAD6365208EE2F2
          DE07237059655538F5C1353EF35F9D1FB4E7FC975F15FF00D7587FF44475F79C
          09C6596F8819DCB2BCB1C94614A55252946CEEA74E314BDEEBCD26FD15BA9A4F
          8271584A0EA6366A2EE92B6BA59DEFB795BE67DF1E20F16E8769A7E27D674F84
          CD22451892E9177B93C28C9E49C1E07A560FF6E69BFF00410B5FFBFCBFE35F9A
          B457EED5F81E15E4A5F586BFEDDFF827DE70CE60F873072C2463CFCD272BDEDB
          A4ADD7B1FA55FDB9A6FF00D042D7FEFF002FF8D1FDB9A6FF00D042D7FEFF002F
          F8D7E6AD15CBFEA0C3FE825FFE03FF00DB1F5DFEB7CBFE7C7FE4DFF00FD2C7D6
          74F8CE1EFAD94E01C34CA382320F5F4A6FF6E69BFF00410B5FFBFCBFE35F9AEF
          F787D07F2A6D0B8061FF00412FFF0001FF00ED83FD6F97FCF8FF00C9BFE01FA4
          37FE2FD0B4A844B7BAD69F691336D0F3DD22293C9C649EBC1FCA8AFCDEA2B58F
          01504BDEC43FB97F999BE2FAB7D28AFBDFF90515E89FF0CF3F117FE855BCFF00
          BEA3FF00E2A8FF008679F88BFF0042ADE7FDF51FFF00155F47FEB9F0CFFD0CE8
          7FE0EA7FFC91F0167D8F3BA2BB4D43E0AF8F74C99629BC23AC3B15DC0DBDA3CC
          B8C91F790100F1D339AADFF0A9BC6FFF004276BFFF0082C9BFF89AEF8711E4B5
          62A74F1B49A7D554835F98599CA57E86FECABFF2413C2DF4BAFF00D2A96BE1DF
          F854DE37FF00A13B5FFF00C164DFFC4D7DF3F017417F097C20F0C699731CB6B7
          31DAF9B2C173F2C91BC8ED23291C6305C8C1E4743CD7F257D25F37CBF1BC2B84
          C3616BC6A4FEB1195A3252D153AA9B766FAC91F4FC3ED43132949D972FEA8F41
          A299E747FDF5FCE982F6DDB38B888E09070E3A8E08AFF38A8E1311886D51A729
          35D937F91FA1C251A9F03BFA135150FDB20FF9EF1FFDF628FB641FF3DE3FFBEC
          575FF64E61FF0040F3FF00C065FE469CB2EC4D59DAEFFC7A27FBE3F91A76A37B
          18B4711CCBE61231B1B9EBED58724D24B8DEECF8E9B8E715FB8F86DC0F8DC462
          A8E795A5ECE34AA35CB28B5295A29DD5EDA36ED7F267650A2DB537D06D1547FB
          734DFF00A085AFFDFE5FF1AF49B6F09E9D1C08B24666703990BB0DC7E80D7F58
          63B1B4F2F517593F7B6B2EDEB636AF8BA541272D6FD8DA1D2B2756FF008F95FF
          00707F335AD593AB7FC7CAFF00B83F99AF9AE16FF918AF467E21C6BFF22997F8
          A252A28A2BF643F9F48AEA169E2DAA70739E7BD54FECE93FBC9F99AD0A2BF39C
          FF0080724E25C67D7B308C9CECA3A49A5657B69F3E87B584CDF1582A7ECA8B56
          BDF63C7F58F8DDA5E8DAD5E69D2D85E39B59DA09244D9C956DAC40CFA838FE95
          0FFC2FEF0FFF00CF9EA7FF007EA3FF00E2EBC7FC77FF0023C7887FEC2371FF00
          A31AB0EBF00AFC0F9342ACA1184AC9B5F133E6A7C6D9C42724A51DDFD947A27C
          52F88F61E37B3B082C21BB8441233C9F685450720018C127D7B8FC7B79DD1457
          D2E5F80A19661E386C3AB455F7D77773E3B30CC2BE6788962B10EF276DB4D958
          2BD9FF00669FF90A6B9FF5C62FFD09ABC62AFE91F19AF3E0E4925CD9E9D06A26
          F808D967765DBB790463EB5F5393E229E171D4EB55768ABFE4CF6F85326C6F10
          67587CB32F87356A8DA8ABA57B45B7AB692D133ED3A2BE40FF0086E2D6BFE858
          B0FF00C087FF000A3FE1B8B5AFFA162C3FF021FF00C2BF54FF005872EFE77F73
          FF0023FA63FE208F1BFF00D02C7FF0653FFE48FAF5FA532BC2FE057ED1BA87C5
          FF00165E68F77A35B69F1C164D7625865662489235DB823FDBCFE15EE95FC2FE
          2F62A96338A27568BBAE487E4CFD1F23E1CCC785B06B2ECD20A15536EC9A968F
          6D536828A28AFC54F7CF3FF887F02FC21F14356B7D4B5FB19A7BD82016EB2C57
          2F1FEEC316008071C166E719E7E95F9EDE3CD0EDFC31E38F10E8F68F2496BA7E
          A37169134A417291C8CA0B1000CE073802BF526BCA7E357833C38FA31D424F0E
          E9336A373748B2DE49651999BE56392F8C9FBA0739E2BFA9BC1FF17717C21899
          65F99BAB88C3CA2A34E1CFEED369B774A5A24D37B5BD19E4E272259B55853A2D
          426DEAEDBFA9F9E1457D4FFF00088E85FF00405D3BFF000123FF000A3FE111D0
          BFE80BA77FE0247FE15FD77FF11D72EFFA029FFE0513BBFE21A62FFE8223F733
          E58AE83C2DE06D57C60276D3E34F2A1C079257DAB93D00F53FE7B8AFA1FF00E1
          11D0BFE80BA77FE0247FE157AC74EB4D3213159DAC369116DC5208C2293C0CE0
          0EBC0FCABC9CD3C728D4C2CA396611C6ABB59CDA715AEBA2B37A6DAFF91DD82F
          0D9C6BA78CAEA54FAA8AB3F2D5DCE33E15783352F075BEA29A835BFF00A43214
          109DC780D9C9C0E391819F5E99E7BBCD1457F34E779CE2B88330AB99E32DED2A
          5AFCAACB44A2ACBD12F99FB065B97D1CAF0B0C1E1EFC91BDAEEEF56DFEA19A33
          4515E11E90668A28A002BAEF865FF21DB8FF00AF66FF00D096B91AEBBE191035
          E9C67ADB37FE84B5F41C3FFF00235A1FE23CFCC3FDD6A7A1E9B451457F469F9B
          8E87FD6A7FBC2B5AB261FF005A9FEF0AD6AFE5BF183FDFB09FE097E67E71C55F
          C6A5E8FF0030A28A2BF9F8F860A28A2803CA7F6828D4E89A54854175B8650D8E
          402BC8CFE03F2AF0DAF53FDADBC4D37867C1BA34B6F0452CD2DFEDDD2E4855F2
          DB23008EA71CFB7BD7CB1FF0B5B55FF9F6B2FF00BE1FFF008AAFECAF0D382738
          CF386E96370918B8394D2BC92DA4EFA7A9F8D71370CE3F32CCA789C3A5CAD2DD
          DB6563D528AF2BFF0085ADAAFF00CFAD97FDF0FF00FC554371F143599B6EC5B6
          831D7CB8C9CFE64D7EAD0F0C388252B3505E6E5FE49B3E5E3C139B3766A2BFED
          EFF807AD515C2F80BC5FA86BDA9DC5B5E346E8B0F98A5536904301DBEBFA5775
          5F059DE4B89C8318F038B69CD24F477567F25F91F2D9965B5B2AC43C357B7324
          9E9AAD7EE0A28A2BC13CB3ED5D3BFE41F6BFF5C97F90AB155F4EFF00907DAFFD
          725FE42AC57F0F55F8E5EACFF4968FF0A3E882BF3ABF69CFF92EBE2BFF00AEB0
          FF00E888EBF456BE39FDABFC39A5B7C508A7FB0C4B35C69F14933A654C8DBE45
          DCD823270AA327B01E95FD55F46DCCE9E5FC615A1522DFB4A138AB74B4A12FFD
          B6C7163B2BAD9B423428349A77D6F6D9F64FB9F30515DCFF00C23BA77FCFA8FF
          00BEDBFC68FF0084774EFF009F51FF007DB7F8D7FA6BFDAD47F95FE1FE678DFE
          A4663FF3F21F7CBFF91386A2BB9FF847B4EFF9F51FF7DB7F8D1FF08F69DFF3EC
          3FEFA6FF001A3FB5A8FF002BFC3FCC3FD48CC7FE7E43EF97FF002271127DE1F4
          1FCA9B5DCFFC23BA77FCFB0FFBEDBFC6AC587C0EF1A789E37BFD0BC357977A63
          3958A75DAAAF8EBB4B11900E46477047506B5A59961E6ED27CBEB65FA9E0E739
          162323A11C462E71E56EDA37BD9BEA976679F515E95FF0CDBF12FF00E852BCFF
          00BEE3FF00E2A8ADFEBF84FF009FB1FF00C097F99F21F5CC37FCFC8FDE8FD06A
          28A2BFC303D80A28A2800A28A8E693CA8CB6338ED5D385C355C657A786A0AF39
          B514B4576DD92BBD37EFA1A53A72AB38D382BB6ECBD5925665DFFC7C3FE1FCAA
          7FED0FFA67FF008F5569A412CACC0601AFE92F0EB85339C8736A988CC6872425
          4DC53E68BD79A0EDEEC9F44CFD0321CB31782C54A75E164E2D6E9EB75D9B1945
          79D78AFE3F782FC1BAEDC691A8EA328BEB7C09921B777084807190304E08E9EB
          8EB915F2CFC49F8D3AEEBBE38D5AF742F12EB369A4492816D0C577240A10285E
          1158019C13EBCE4F39AFEB7CAF86B1B99CB58BA71B5D4A49D9ED6B7E67B59867
          B85C0AD1A9CAF6693575EA7D7FE3EF8A3E1EF8691D936BD7725B9BC2E2058E16
          90B6DC6E3C0E31B97AFAFD6BCD3C77FB48F81B5BF01788EC6CEFEE25BDBAB09A
          D6080DA3A976910A0392368033939238E993C57C9BACF88354F11DCA5C6ADA95
          DEA77089E5ACB793B4AEAB927682C49C64938F73542BF45C1704E1284613AF39
          3A89DDD9A4B4775A59BF5D7EE3E2B15C5389AAE51A504A0D5B5D5EDDEFFA057E
          BE786FFE45DD2BFEBD62FF00D0057E4B68FE1BD475E595AC60F396220312EAB8
          CF4EA47A57E8178D3E3FE93A3FC2A90786B5653E2386D608E256B66C46728AE7
          E750AC40DDEBCE0E08CD7E7DE28CA966388C0E5F87A917579A49ABABC5CB92DC
          C96AAFE6B6D8F0F23C660E58B78275E0AAC9C528B924EEF6D2F7FB91EB3E3CF1
          9DA7C3EF09DFEBF7D0CD716B66137476E01762CEA8319207561DFA66BC19BF6C
          4D16F2595EE340BF842B958845223EE8FB33648C31E781903D4D78AF883E3EF8
          F3C53A35D695A96BED358DD2EC9A34B68622EB9CE372203838E46791907835E7
          D5CDC39C211CB232A98DB4AADDD9C5BB72D969AA5ADEE7EB75784F0798E15E1B
          325CDADFDD935B7DC7D57FF0D73E1CFF00A036A9FF0090FF00F8AA3FE1AE7C39
          FF00406D53FF0021FF00F155F2A515F6FF00D9B87EDF89E2FF00C432E1BFF9F5
          2FFC0E47D83A6FED39E1AD42D44DFD9DAAC672415F2E23FAF9956FFE1A3BC35F
          F3E5AAFF00DF98BFF8E57CBBE1CFF9068FF7CD6A57E0B9C67D8DC16615F0F45A
          E58C9A5A7447F15715D6794E7B8CC06155A9D39CA31BEBA27DCBDAF6A7FDB7AE
          6A3A8F97E4FDAEE64B8F2F76ED9B98B633C6719EB5468A2BF3D949CE4E52DD9F
          9EB6E4DB6145145408C9D67C4D65A1491C774CFBE4058045CF15C578D3C4D69A
          EC36B1DA893F76C598BAE3AD4BF12DC1D56D53B8873F9B1FF0AE3EBAA1056523
          FD32F057C2BC86865995F18BF69F5B7194B592E4BBE787C297F2BD350A28A2B6
          3FB189AD2F6E34FB859ED6796DA75CED961728C323070473D2B47FE12FD7BFE8
          37A8FF00E05C9FE359145653A54E6EF38A7EA8CA54E13779453F91AFFF00097E
          BDFF0041BD47FF0002E4FF001A3FE12FD7BFE837A8FF00E05C9FE35914547D5E
          8FF22FB913EC297F22FB91AFFF00097EBBFF0041AD47FF0002E4FF001AEE7E10
          EBFA9EA7E21BB86F351BBBB845AB388E79D9D7707400E09EB827F335E5F5E83F
          04FF00E468BBFF00AF26FF00D0D2B831F469430B52518A4EDD8E0C7D1A71C34D
          A8ADBB1ED5451457E727E7E14514500145145001451450015D4786BC123C43A7
          9BAFB7083121428222D8C01D4E47AD72F5E9BF0CBFE4033FFD7CB7FE82B5F53C
          3582C3E3F1EA86263CD1B3D2ED6DE8D1E56675EA61F0FCF49D9DD7F5A943FE15
          67FD44FF00F25FFF00B2AD5F0D7824787B506BAFB61B8CC6502F95B7A91CE727
          D2BA8A2BF61C3F0EE5785AB1AD4695A51D53E697EACF8EA998E2AAC1C273BA7E
          4BFC828A2BCEA7F8FBE0D852464BE9E72A090B1DB382F8EC3200E7DF15F59470
          F5B117F65072B76573823094BE1573849FF69DBC649041A0C11B1076192E4B05
          3DB2028CFE9F855A87F6ADBF58904BE1EB779428DEC972CAA4F7206D381ED93F
          5AF07A2BEBB37E05E1DCF9416658555392FCBEF4D5AF6BED25BD97DC7562B29C
          1637956229F35B6D5F5F467DC9F0FBC587C71E10D3F5B6B6166D741F3087DE14
          AC8C9D703AEDCF4EF5D157C77E0FF126AFA66850C169AADEDAC019888A1B8755
          193CE003815B5FF09A7883FE839A97FE05C9FE35FC419F78672A59B62A9E0EAC
          6149549F2C6D27CB1E676576DB765A5DBBBDCFCC315C312F6F3F6534A37765AE
          8AFA2F91F55515F2AFFC269E20FF00A0E6A5FF0081727F8D1FF099F883FE839A
          97FE05C9FE35E17FC437C57FD0447EE672FF00AB35BFE7E2FB99BBFB6CFF00C8
          95E1FF00FB081FFD16D5F1E57D29ACDFDD788E248B56B99B5489092A978E6655
          E9D03671D07E55EFDE0EF0DE936FE13D1D22D2ECA24FB244DB52DD00C95049E9
          D49249F735FD93E1867B1E12E1FA791D4A7ED274DCA5CC9D9352937D9BD2E0B8
          4EA4DEB592F97FC13F3B68AFD2AFEC3D37FE81F6BFF7E57FC28FEC3D37FE81F6
          BFF7E57FC2BF5CFF005FA1FF0040CFFF0002FF00ED4BFF005425FF003FFF00F2
          5FF827C13F0A47FC4FEEBFEBD5BFF434AF54AFA9E2D36CEDD1D22B582357C6E5
          48C00D8E99E39A5FECEB5FF9F687FEFD8AFC6B8A21FEB1E62F1F1F72E92B6FB7
          9E87E779E78495337C5FD6A38D51BA4ADC97DBCF9D1F2BD15F547F67DAFF00CF
          B43FF7EC54B1431C0A563458D49CE146066BE4D70FBEB57F0FF827851F042A37
          EF660ADFF5EFFF00B746F786679EEBC39A54D731F937125A44F2C7B4AED62809
          183C8C1EC6B4ABF3CBE267C65F1CD9FC44F12DADB78AF55B5B6B6D467B7860B7
          B968D238D1CA2A855C0E028FAF53924D735FF0BB7E207FD0E7ADFF00E0749FE3
          5FCBB89F0BF18EBCDC3110B5DDB47DCFEC7C2F0462961E9A75E2FDD5AD9EBA1F
          A655F23FED51730CFF0012E048A5491E1D3A28E454604A36F91B6B7A1C329C1E
          C47AD782FF00C2EDF881FF00439EB7FF0081D27F8D5E8FC4D3EB912DFEADA9B5
          EEA1281E6CF7536E9188E06E24E7A003F0AFDA3C1FE08A9C3FC452CC317888B5
          1A72492D2EDB8ADDF6573A1F0DE232C6AB4A6A57D2C932CD155FFB46D3FE7EA1
          FF00BF83FC6AC2B0650C082A46411D08AFED7A75E95576A734FD1A639539C3E2
          4D0514515B9015F79FC24FF9263E17FF00B07C3FFA08AF832BEF3F849FF24C7C
          2FFF0060F87FF4115E1E6DFC38FA9F8378BBFF0022DC37F8DFFE92CEB68A28AF
          983F960C5A2BCCFF00E171BFFD0257FF00023FFB1A747F18B3220934ADB1E46E
          2B3E481DF0368CD7F993FD85987FCFBFC57F99FD68F82F3D4AFEC3FF002687FF
          00247A5515C27FC2DED2FF00E7CEEFF25FFE2A8FF85BDA5FFCF9DDFE4BFF00C5
          561FD8F8FF00F9F4FF000393FD54CEBFE81A5F87F99D9CB78B1332ED2585537B
          89245C33647A5792F8A7F699F0B787354FB25D5AEA535C940EEB6B0A308F24E1
          49675C9DA037191F3019C82063FF00C35C783FFE81DADFFDF887FF008ED7F59F
          09F0F6459560E8625D38BAF28C25272B49C65CB77CADDF9756FE1F2D7447EA59
          570662E8518555856E6D26DBB3B3B74EDAF63D4FC61E30D33C0BA14DABEAF334
          365132A332217396381C0FAD7CB9F1E3E3F7FC24DA86923C19AEEA9636D04521
          B86B7792D43BB118070416C05EFC0CF1D4D697C6FF00DA0B41F881E029F45D2E
          C7518EE259E2767BB48D15554E491B5D893900638EA4E78C1F9CEBFAC782B2BC
          163682CC9BE69294925A38ECB756DF53E178BF118FCB711FD9D523C978A7D53D
          DECEFB684B77773DFDD4D737334971733399249A562CEEC4E4B313C924F73515
          15D8FC1FF01C5F137E2368FE1B9EEDEC61BD690BCF1A07655489E420027193B3
          19ED9CE0E315FAE54A90A14E5525A462AFF247E5752A2A719549BD16AC8FE167
          C36D43E2BF8C2DB40D3A686DA4911A596E273F2C51AFDE6C0E49E40007723A0C
          91F45787FF0061EBAD335117179E23B2BC8954E216B125589E39CB63D4F43DBE
          B5E9DF09FF00663D13E12F8A8EBB63ABDFDF5C7D9DEDC45701026188C9E067B5
          7B2D7E5B9D6793C5F350C34ED4A51B3D2CF5DF5DD7CAC7E799A6733AEDD2C34B
          DC6ACF4B3D77D775F23E2BD77C291F8275ABED1A34B75FB34A4136D1EC56240E
          718EB8C562EAD6F2DD5849142033B638271919CF15F616B3F0ABC2DE20D4A7D4
          2FF4A135DCC4192413CA9B8800745603A01DABC33C6DF08F59D3B5ED51B4AD1E
          E1F488D8C90BAB07C263381CE4E391EBC7735FCEF8BCB31F95E2E398412A969D
          D7C527A3BAE6EBD35D7E67E6B41E2F26CC296694529CA9CD4A29DDEB1775CDB3
          B69DFE67851D22F14906DDF8F4E6AB4B13C1214914A38EAA7AD77758F79E1D5B
          AB99251394DE73B4A67FAD7DD651C7B0AF5651CCD469C6DA34A4EEEEB4D2FD2F
          FE67F4DF0BF8D34B1B899C38854285351BA9463525795D6965CCD6977B7CFBF3
          3456AEA5A1FF0067DB79A26F33E6031B31FD6B2ABF4FC066385CCE8FD63093E6
          8DED7B35AAF5499FD0F92E7B97710E17EBB9655F694EED5ED25AADD5A493EBD8
          A5ADDCDF5A5A79F65A85C5AA469F3C590559B71E4600C7057839E4139C70399F
          F84BF5AFFA095C7FDF55D9F50476354B54D3C5ED84B146B1AC8C06D2477CD7B1
          87A580BDB1186849B7BB8C6FF3D2ECF87E20E07C263EB54C7D18479DA6DA71BB
          94B57BB7D745B1CCFF00C25FAD7FD04AE3FEFAA3FE12FD6BFE82571FF7D54779
          E1EBBB2B769A4F2CA2E33B5B9ACCAFA2A795653555E187A6D7F823FE47E4189C
          92960E7ECF11868C5EF6714B4FB8D94F196B68EAC3529C907232723F23D6AD7F
          C2C3F107FCFF000FFBF11FFF00135CE51535320C9EABBD4C1D27EB4E2FF43825
          9565F3F8B0F07FF6EC7FC8D7D43C51A86B4D00BE9926111386F2515B0719C950
          091C743D39C75351DAAB5EC863811E6902348551493B541663F400127D0026B3
          280483C715F2F9CF01E4F9AC7F77054649349C1462AEF672492E6B7AAD34BA3F
          5AE15E3ACCB8528C709864A74135EE3BD925BA86B685EEF64D5F5B334F045256
          7ACACAC1B71E0E7AD4FF006DFF0063F5AFC8B33F0C733C34A2B0135593BDEF68
          5BEF93BDCFDF328F17B29C5C66F32A6E8356B59BA97EFB455ADFA9668AADF6DF
          F63F5A3EDBFEC7EB5E2FFC43BE22FF009F2BFF00038FF99F41FF00114B85FF00
          E7FCBFF0097F91668AADF6DFF63F5A3EDBFEC7EB47FC43BE22FF009F2BFF0003
          8FF987FC452E17FF009FF2FF00C025FE459AF42F827FF233DE7FD79B7FE8695E
          69F6DFF63F5ADCF0878DE6F086A6F790DAC7705E231323B11C120F0477C81FAD
          71E33C36E24AD879D3851576BF9E3FE671633C4EE19AB4254E15A4DBFEE4BFC8
          FA628AE7FC0FE2E8FC69A12DFAC0D6D2A48D0CB1B105430C1F94F70432F5039C
          8E7193D057F39E6197E272AC5D4C0E323CB529BB495D3B3F5574FE46D85C551C
          6D0862684AF092BA7E5F30A2BD5FC3BE1DD326D0AC6492C609247895999D3249
          2327935A3FF08CE93FF40EB6FF00BF62BECE8F05E2AB528D55562B9927D7A9E3
          CF3AA50938F23D3D0F17A2BDA3FE119D27FE81D6DFF7EC579D78F2C2DF4ED744
          76D0AC11B44AC550606791D3F0AF3735E19AF9561FEB152A292BA5A5FA9D584C
          CE9E2EA7B38C5A39CA28A2BE38F602BD37E197FC8067FF00AF96FF00D056BCCA
          AD5AEAB7B63198EDAEE78109DC56290A827D700FB57BF926650CAB18B1338B92
          B3565E67063B0CF1747D945D8F71A2B9AF8377336AB79A99BD9A5BBF2E340827
          72E1724E783C7615EA3F62B7FF009E117FDF02BFA2B27A9FDB18286369FBAA57
          D1F936BF43F9C389B8D70DC359A54CAEAD194E50E5BB4D25EF454BAF93393AF8
          46BF46BEC36FFF003C22FF00BE057E731E09AFD2387F0EE87B5BBBDEDFA9F41C
          1DC534789BEB1EC69387B3E5BDDA77E6E6EDE82514515F5E7E92761E1DFF0090
          4C5F56FE75A7595E19937E960631B1CAFD7BFF005AD5AFE5FCF62E39A6253FE7
          97E2EE7CCD7D2ACBD428A2B27C55AB4DA1E81757D02A3CB16CDA2404AF2E0738
          23B1AF330986A98CC453C352F8A72515EADD97E271D5AB1A34E5567B4536FE46
          B57D2DE13FF915B46FFAF287FF004015F08FFC2D9D5FFE7DACBFEF87FF00E2EB
          B8D3BF6B6F18699A7DB59C5A6E88D15BC4B12978262C4280067F7BD78AFD772E
          E00CEF0D393A918EBFDE3E7A3C4B97ADDBFB8FB2E8AF8F3FE1B13C67FF0040CD
          0BFF0001E6FF00E3D40FDB13C679E74CD0BFEFC4DFFC76BDDFF53336FE58FF00
          E0469FEB3E5DDDFDC7D87457C7BFF0D89E31FF00A05E87FF007E26FF00E3B47F
          C36278CBFE817A17FDF89BFF008ED1FEA666DFCB1FFC083FD67CBBBBFB8FB0A8
          AF8F3FE1B13C65FF0040BD0BFEFC4DFF00C768FF0086C4F197FD02F42FFBF137
          FF001DA3FD4CCDBF963FF8107FACF97777F71E61F153FE4A778BBFEC2F77FF00
          A39AB96AD2F11EAF3F88B5ED4356B88D23B8BFB892EA458810819D8B305C9271
          927B9ACEC1F435F856370588C3626AD0AB06A51934FD53B1FD3997E370F89C1D
          1AD4E69C6518B5E8D2128A5C1F4348411D462B82509C3E2563D28D484FE16985
          77BE1FFF00903DAFFBA7F99AE0ABDD3E1C7832C356F0669D773B4DE6C81F215C
          0031230F4F6AFA4C8388307C39889E2B1D7E594795595DDEE9FE499E1E754655
          A84630EFFA3398A2BD33FE15DE95FDEB8FFBEC7F851FF0AEF4AFEF5C7FDF63FC
          2BEEFF00E22970F779FF00E03FF04F8EFA856F23CCEBEF3F849FF24C7C2FFF00
          60F87FF4115F2C7FC2BBD2BFBD71FF007D8FF0AF77F08FC55D2FC37E18D2F4A6
          B1BA26CADD20CA1560768C0392475C67F1AE7ADE21641982508D470B6BEF46CB
          F0B9F8DF899C339B66F80C3D3CBE8BA928CEED26B45CAFBB47AED15E73FF000B
          BF49FF009F1BDFC93FF8AA2B9BFD6CC93FE8263F8FF91FCEDFF10EF8ABFE8065
          FF0092FF0099E31451457F271FE88051451401E03F14E549BC6D7E6375700229
          2A738210023EA0D7255B7E35FF0091BB58FF00AFA93FF42AC4AFD530B1E5A14E
          3D92FC8FD370D1E5A108F92FC88AEBFD41FA8AA55A3220910A9CFAE4543F634F
          56AFE89E0AE2FCA325CA56131936A7CD27A45BDF6D51FCDFC7FC0F9E67F9D3C6
          E069A953E58AD6496D7BE8D952BD8FF647B19AEFE3BE852C49B92DA2B9965390
          36A981D33EFF0033A8E3D6BC9FEC69EAD5D77C2FF881A87C27F13FF6EE9505B5
          CDDF90F06CBC5668F6B1193856539E3D6BEB71FE216435B0B569D2A8DCA51697
          BB2EAAC7E5F8AF0A38AAB509D38518DE49AD671EABD4FD31A2BE53FF0086EAFF
          00A923FF002ADFFDA297FE1BA87FD0927FF06BFF00DA6BF32FEDFCB7FE7EFE12
          FF0023F28FF8831C77FF0042FF00FCAB47FF00961F55D6478C6E64B3F08EB93C
          2DB258AC67746C038611B1079AF9AFFE1BA47FD0927FF06BFF00DA6ABEA1FB62
          B78C2C2E3438FC2FFD9CDA821B6FB49BFF003B606183F2F96B9C82475E339E71
          8AC2BE7D97BA3350A9AD9DB4976F43831FE11F1B607095B175F0168538CA4DAA
          949D94536F4551B7A2D926DF4390A28A2BF163F9588E7B78EEA231CAA1D0F635
          57FB12C7FE7DC7FDF4DFE357A8AF470F98E37090F6787AF38477B464D2BFA267
          BB81CFF37CB297B0C0E32A5285EF684E5157EF64D2BE8B5391BED2A78EEE558A
          DE431E7E5DA0918FAD429A55EC8EA89693BBB1C0558C924FA0AED2B63C1B02DC
          F8BF4385890B25F40A48EB83228AFBFF00F888D8BC261AF3A319724757777765
          BFCCFE82CAFC6CCD3FD9F07530B09BF762E4E52BBD936F7D5EFD4F3FD73E16F8
          D2E747BA587C27AD48C0292A2C25CE37AF41B72C79E839C64F406B8CFF008545
          E3BFFA12FC43FF0082A9FF00F88AFD38A2BF1DC2FD27B38C2C1C165B49EB7F8A
          67EF19C60639C621622A4B95A56B2F56FF0053F2DBFE103F131FF997756FFC01
          97FF0089A5FF00840FC4DFF42EEADFF8032FFF00135FA91457AFFF001353987F
          D0A61FF8365FFC81E07FAB74FF00E7EBFBBFE09F96FF00F081F89BFE85DD5BFF
          000065FF00E268FF00840FC4DFF42EEADFF8032FFF00135FA91451FF00135398
          7FD0A61FF8365FFC807FAB74FF00E7EBFBBFE09F96FF00F081F89BFE85DD5BFF
          000065FF00E26B3752D22FF469D61D42CAE2C6665DEB1DCC4D1B15C9190180E3
          20F3ED5FAB55F1F7EDDB231D6FC228589416F70C173C02593271F80FC857E97E
          1CF8F78CE39E24A190D6CBE34A3514DF32A8DB5CB094B67157BDADBADEFE479F
          8FC96183C3CAB29DED6E9DDD8F96E8A28AFEC83E5028A28A0028A28A00F79F81
          7195F074E4E086BD723041FE041CFA74EFFD6BD1315B3FB18CAD27C29BE52140
          8F569946D40091E542792072793C9C9C607402BDEABFCABF12F885E178C732A3
          2A57E5A8D5F9BD2DD0FD8F29E3C596E06960D61B9B915AFCF6BFCB95FE6727E1
          721BC3DA76083FB851C7D2B52B628ABA1E2FFB1A50A5F50BF2A4BF89D97FD7B3
          CDA9C5DCF372F61BBFE6FF00ED4C7AF2EF8904378880072440A0E3B726BDA68A
          F2B39F143FB5B0BF56FA972EA9DFDA5F6F2E4475E0B8D7EA957DA7D5EFA7F3DB
          FF006D3E6CC53A389E691638D19DD88555519249E800AFA4688B10CDE6AA8121
          0016C7240CE01FCCFE75F1F85E26C3D4AD18E2A9B8C1B5769A934BD1F2DFEF3D
          B97894F924E384D6CEDEFF005E97F7363E6DC1F4AD0FF847356FFA05DEFF00E0
          3BFF00857D39457F52D3F0D69ABFB4C537E90B7FEDCCFCEEAF8E55A56F6397A5
          DEF51BFCA11FD4F2DF82DA6DE585CEAA6EAD67B60C91ED3346533CB74C8AF4DB
          BBB834FB49AEAEA68EDADA14324B34CE112350325998F0001C926A5AF0BFDA57
          E2FF0087743F0BEBFE0FB896E1B5BBCB11E5C51C24A0DE78CB1C0E833FFD7E2B
          F44C0E16970E658B0FCF750BD9BD2EDB6EC7E573FAEF893C50A7468352ACE0A4
          A09CB922B960E5E896AEFA153E3F7ED191784349D24F82B5DD1F54BDB89DFCF1
          0C8975B2355EFB5B0B92475E4E38E86BE38D4FC47A9EB3A95DEA1777924B7777
          33CF3480EDDCECC598E0600E49E00C566D15F9FE3337C562EAF3F338AEC9BB1F
          E89706F00E53C1982FAB61A0A751DF9AA4A31E796ADA4DAE8AF648B3FDA577FF
          003F32FF00DF668FED2BBFF9F99BFEFB355A8AE0FAE627FE7ECBEF67E83F56A1
          FC8BEE4749E1AF185E695730C32CCAD66F2832994162A0E0120F5E9FCABD3AC7
          52B5D4E367B59D27453B49439C1AF0DADBF09EBC9A06A9E7CDE6B5BB2157488F
          27D0E0900F35839CA6F9A6EED9F0DC43C31471D4E589C2C796A25B24AD2F5F33
          D82B9CF889FF002276A1FF006CFF00F462D6BE93AAC1AD5847776FB846F91B5C
          00C3048E704FA545E22D23FB7B45BAB112F92650B872BBB04306E991E95ECE4B
          5E9E1733C2E22B3B42152126FB2524DBD35D8FC0732C355546BE19C7DFB4A36F
          3B356FBCF03A2BD07FE150CFFF004128FF00EFD1FF001AE57C4FE1C97C31A8AD
          ACB324FBA3122BA0238248E47D41AFEC2CBB89F28CDABFD5B055D4E76BDAD25A
          2F548FC631195E33090F6B5A9DA3EABF4664514515F507961451450014514500
          145145001492751F4A5A24E89FEEFF00535F8EF8A5FF00225A5FF5F63FFA44CF
          DA3C2857CEEB7FD7A97FE974C657D23F097FE49EE93F497FF46BD7CDD5DD786B
          E2EEA7E18D12DF4C82CED26860DDB5E40DB8E58B1CE0FA935FC879AE16A62E82
          852DEF7FC19FD3F8AA52AB0518F73E86A2BC37FE17DEB1FF0040FB1FFC7FFF00
          8AA3FE17DEB1FF0040FB1FFC7FFF008AAF95FEC5C6765F79E5FD4EB763DCA8AF
          0DFF0085F7AC7FD03EC7FF001FFF00E2ABD5BC13AECDE26F0C596A77091C534F
          BCB2440ED1876518C93D80AE4C4E5F5F09053AAB4BDB732A9879D25CD23728A2
          8AF34E60A2BE5FBBD52F6F6E1A6B9BB9E799F1BA49256666E3B926A1FB54DFF3
          DA4FFBE8D7D6FF00603EB57F0FF827D4AC8A56D6A7E1FF0004FA9A8AF9A74CF1
          4EADA3ED169A84F0A07F33CB0E4A93C751D0F415B5FF000B5FC4BFF3FA9FF7E1
          3FC2B09E435D3F7269AF3BAFF3309E49593F7249AF9AFF00332FC6BFF2376B1F
          F5F527FE85589525C5C4B773C934D234B2C8C59DDCE4B13D49351D7D9D38F242
          317D11F614E3C908C5F441451456868145145002E33460FA1AFACFF64AD116CB
          C09A8EA4D6D2453DEDF14133EE0258A3450BB41E080CD28C8EF907A71EE55F43
          87CA5D6A51A8E76BF97FC13F39CC78C160715530D1A1CDCAED7E6B7AE9CAFF00
          33F36B07D2BD2BF673D33FB4BE2F6885AD7ED50DB89679331EF58F6C4DB1CF1C
          61CA60F662BDF15F6B5CDB437B6D2DBDC4493DBCA86392295432BA9182A41E08
          238C1AAD61A1E9DA55CDDDC5969F6B677176FE65C4B042A8D33649DCE40CB1CB
          31C9F53EB5D74B27F675233E7BA4EFB7FC13C6C5719AC5616AD0F61CAE49ABF3
          5F756BEC8B12595BCAE5DE089D8F5664049A6FF67DAFFCFB43FF007EC558A2BE
          8B95763F2A7429377705F722BFF675AFFCFB43FF007EC51FD9D6BFF3ED0FFDFB
          15628A3963D85F57A3FC8BEE457FECEB5FF9F687FEFD8ABDA2D8C11EA513C76F
          1AB2E4EE54008E0D434A8ED1B06562AC3A10706BC8CE300F32CB71382A6D4655
          612826D5D2E68B57FC44F0F49AD2293F43ACA2B97FB64FFF003DE4FF00BECD1F
          6C9FFE7BC9FF007D9AFE62FF00882B987FD0643FF0191CBF559773A8A2B9A86E
          2E269A38FED120DEC173B8F1935D3C712C71AA0C90A00059893F893C9ADE9F81
          B9A568C9D3C653BADAEA4AEFF1B7AD9FA33E1F88F88B0DC373A54EBC5CDCEEF4
          B6895B5D6DF25E5ADB41B4549B07A51B07A5737FC40AE24FFA08A1FF008154FF
          00E567CB7FC446CABFE7D54FBA3FFC991D7C41FB6EEA06E3E296976AB33BC76F
          A4C798893B51DA59492074C95D9923D07A57DC7B07A5731E24F85DE12F17EA02
          FB5AF0F586A7781047E7DC4219B68C9033F89AFD8FC27F0EF32E05E248E759A5
          4A73846138A507272E69595FDE8455AD7EB7FC4F1F34E3CCBF1987F63469CEF7
          5BA8AD3E5267E5ED15FA5BFF000A13E1DFFD09DA4FFE038A3FE1427C3BFF00A1
          3B49FF00C0715FDABFEB661BFE7DCBF0FF0033E3FF00D64C3FF23FC3FCCFCD2A
          2BF4B7FE1427C3BFFA13B49FFC07147FC284F877FF00427693FF0080E28FF5B3
          0DFF003EE5F87F987FAC987FE47F87F99F9A5457E96FFC284F877FF427693FF8
          0E2A0BDFD9E3E1BEA16AF6F2F8434E547C64C0AD13F073C3210C3A76342E2CC3
          5F5A72FC3FCC171261FAC25F87F99C17EC9104717C1AB3648D51A5BBB8776550
          0BB6EC64FA9C003E8057B3D33C2DE07D0FC15A241A468B60B63A7C258A42B23B
          60B31624B3124F24F53EDD00AD6FB143FDCFD4D7F0471778579DE7FC418ECDB0
          D5A92A75AA4E715294D492936D27683574B4D1B475C789F06959C25F72FF00E4
          8CCA2B4FEC50FF0073F5347D8A1FEE7EA6BE4BFE20A710FF00CFFA3FF814FF00
          F9595FEB3E0BF965F72FFE48CCA2B4FEC50FF73F534BF6287FB9FA9A3FE20A71
          0FFCFF00A3FF00814FFF00958BFD67C1FF0024BEE5FF00C91974C9B7792FB3EF
          ED3B7EBDAB5FEC50FF0073F534D7D3E091194A101860ED720FE041C8AA8F829C
          40A49BAF47FF00029FFF002B1AE28C15D5E12FB97FF247C8FF00F09DF897FE86
          0D53FF000324FF001A3FE13BF12FFD0C1AA7FE0649FE3586DF78FD692BF60FAC
          56FE77F7B3FA53FB3F07FF003E63FF0080AFF2377FE13BF12FFD0C1AA7FE0649
          FE3581E2041E2BBB8EEB5967D52E634F2D66BB732384C93B771E71924E3DCFAD
          3A8A8956A9356949B5EA7561A8D3C1D4F6B868A84BBC559FDEB5327FE113D1FF
          00E81F07FDF347FC227A3FFD03E1FCAB5A8AC4F5FF00B4B1BFF3FE7FF813FF00
          328FF60E99FF0040DB3FFC074FF0A3FB074CFF00A06D9FFDF84FF0ABD45063F5
          CC4FFCFC97DECA3FD83A67FD03AD3FEFC27F851FD85A6FFD03AD3FEFC2FF0085
          5EA280FAE627FE7E4BEF636289208D638D1638D4615546001EC29D4514CE56DB
          77615E4FF1671FF0915B7AFD957FF437AF58AF4AF81D61A16B3AE5F69DACE93A
          7EA52490892DDEFA18E52854FCCA8181E5830271DA3FCBD4CBF8AE1C1539E775
          283AD1A71778A693B3B26EEF4D377E478D9B60DE3B0AE8C5D9DD3FB8F8A28AFD
          41FF008569E10FFA15744FFC1743FF00C4D1FF000AD3C21FF42AE89FF82E87FF
          0089AE9FF89A8CAFFE85753FF0647FF913E17FD5BA9FF3F17DC7E5F515FA83FF
          000AD3C21FF42AE89FF82E87FF0089A3FE15A7843FE855D13FF05D0FFF001347
          FC4D4657FF0042BA9FF8323FFC887FAB753FE7E2FB8FCBEC13DA8C1F435FACB4
          578DFF00135BFF00524FFCB8FF00EE06DFEAD7FD3EFF00C97FFB63F26F69F434
          6C6FEE9FCABF5928A3FE26B7FEA49FF971FF00DC03FD5AFF00A7DFF92FFC13F2
          6F637F74FE5527D96598208E2791B69C85524F5FFEBD7EB0515F1BC53F48C7C4
          B82860FF00B27D9F2C94AFEDB9B65256B7B28F7EFD0FB5E135FEABE36A633F89
          CD070B7C36BCA32BDFDEFE5B5BCF73F283FB36EFFE7D67FF00BF67FC28FECDBB
          FF009F59FF00EFD9FF000AFD5FA2BF2BFF0088A92FFA03FF00C9FF00FB43F52F
          F5E1FF00D03FFE4DFF00DA9F941FD9B77FF3EB3FFDFB3FE147F66DDFFCFACFFF
          007ECFF857EAFD147FC45497FD01FF00E4FF00FDA07FAF0FFE81FF00F26FFED4
          FCA0FECDBBFF009F59FF00EFD9FF000AFA33E12DBCBFF0AFB4A1E5BE57CD046D
          3C1F35F8AFB4E8AF3B1FE244B1B4953FAA5ACEFF001DFBFF0077CCE7AFC64EB4
          797EAF6FFB7BFF00B53E5BFB3CBFF3C9FF00EF93457D4945783FEB9BFF00A07F
          FC9BFF00B5387FD687FF003E7FF26FF807CB89FB0E5BED1E678C6467EE574E00
          7E5E69A77FC30E5A7FD0DF37FE0BC7FF001CAFA84515C0F8E7886FFEF3FF0092
          C3FF009139BFD6FCF3FE823FF2587FF227CBDFF0C3969FF437CDFF0082F1FF00
          C729927EC37015FDDF8C6456CF56D341FF00DAA2BEA4A285C73C42BFE627FF00
          2587FF00221FEB8679FF00411FF92C3FF913E57FF86195FF00A1D4FF00E0ABFF
          00B751FF000C32BFF43A9FFC157FF6EAFAA28AAFF5EF88BFE827FF0024A7FF00
          C88FFD71CF3FE823FF002587FF00227CAFFF000C32BFF43A9FFC157FF6EA3FE1
          8647FD0EA7FF00055FFDBABEA8A29FFAF7C45FF413FF009243FF00910FF5C73C
          FF00A08FFC961FFC89F2B7FC30C8FF00A1D4FF00E0ABFF00B754577FB100B6B6
          924FF84D412A3E50DA5E013D867CE35F57521018104641EA0D7461F8F73C8568
          4B115DCA09AE64A34D36AFAA4F91D9B5D6DA14B8CB3C4F5AFF00F92C3FF913CF
          3C27E17B1F05F876C745D355D6CED10AA79ADB9989259989F52C49E3039E001C
          56BD7526DE23D6343FF01147D9A1FF009E49FF007C8AFDAE1E3560A314BEA325
          6FEF2FF23E7E78E7566EA4EEDBD5BEED9CB515D47D961FF9E49FF7C8A5FB343F
          F3C93FEF9155FF0011AF05FF004053FF00C097F911F5B5D8E5A8AEA3ECB0FF00
          CF18FF00EF914BF6687FE7927FDF228FF88D782FFA029FFE04BFC83EB6BB1CB5
          15D41B480F58633FF00149F6383FE7847FF7C0AB5E35E03AE0E7FF0081443EB5
          1EC7314574FF006383FE7847FF007C0A3EC707FCF08FFEF814FF00E23565FF00
          F4073FFC0A21F5A8F6398A2BA73656E411E447CFA28A60D32D8107C91C7A935D
          34FC69CA1C5FB5C2D44FA5B95FFEDCADF731FD6A3D8CFD0ED899FCF65F900214
          FBFF009CD6EEF1EB512A8550140007000ED4B5F113F1BB3EA556A7D568D254DB
          BC54A326D2ECDA946FDDBB6EFB591F9E679C2D81CFF17F5BC54A6A564AC9AB59
          5FBA7DC9378F5A378F5A8E8A5FF11CF89BFE7CD1FF00C067FF00CB0F9FFF0088
          77947F3D4FBE3FFC8926F1EB46F1EB51D147FC473E26FF009F347FF019FF00F2
          C0FF008877947F3D4FBE3FFC8926F1EB46F151D14D78E9C4AB7A341FFDBB3FFE
          5827E1DE52FF00E5E54FBE3FFC8926F146E1EB51D157FF0011D7897FE81E87FE
          0353FF00968BFE21D653FF003F2A7DF1FF00E409378F5A378F5A8E8A3FE23AF1
          27FD03D0FF00C06A7FF2D0FF00887594FF00CFCA9F7C7FF9024DE3D68DE3D6A3
          A28FF88EBC49FF0040F43FF01A9FFCB43FE21D653FF3F2A7DF1FFE409378F5A3
          78F5A8E8A3FE23AF127FD03D0FFC06A7FF002D17FC43ACA7FE7E54FBE3FF00C8
          126F1EB46F1EB51D147FC475E24FFA07A1FF0080D4FF00E5A3FF00887594FF00
          CFCA9F7C7FF9024DE3D68DE3D6A3A28FF88EBC49FF0040F43FF01A9FFCB43FE2
          1D653FF3F2A7DF1FFE40F9D7C5FF0008BC55A8F8AB58BBB5D3567B6B8BB9668E
          417112E559CB0E0B023AFA5640F82DE31240FEC803DCDD43FF00C5D7D43457CA
          4FC51CE6A49C9D2A5AFF00767FFC99FAAD193A34E34A3B4525F7687CC5FF000A
          47C5FF00F40E8FFF000263FF00E2A8FF008523E2FF00FA0747FF008131FF00F1
          55F4ED158FFC44DCE7FE7DD3FF00C065FF00C99AFB791F317FC291F17FFD03A3
          FF00C098FF00F8AA3FE148F8BFFE81D1FF00E04C7FFC557D3B451FF113739FF9
          F74FFF000197FF00261EDE47CC5FF0A47C5FFF0040E8FF00F0263FFE2A8FF852
          3E2FFF00A0747FF8131FFF00155F4ED147FC44DCE7FE7DD3FF00C065FF00C987
          B791F317FC291F17FF00D03A3FFC098FFF008AAB163F01FC5777294961B5B250
          B9F327B80549F4F9371CFE18E2BE95A2A65E2667524D28535E7CB2FD64C3DB48
          F9E3FE19DFC47FF3FBA5FF00DFD93FF8DD1FF0CEFE23FF009FDD2FFEFEC9FF00
          C6EBE87A2B97FE22367DFCD1FF00C045EDA67CF3FF000CEFE23FF9FED2FF00EF
          EC9FFC6EB57C2BF043C47E1EF12699A97F68582A5B5C23C9E4CB26E64CFCEA3E
          41D572319EF5EE345635BC40CEF114A546A38B8C934FDD5B3D183AB261451457
          E6C6014514500145145001451450014514500145145001451450014514500145
          145007FFD9}
        Stretch = True
        ExplicitWidth = 1071
        ExplicitHeight = 263
      end
    end
  end
end
