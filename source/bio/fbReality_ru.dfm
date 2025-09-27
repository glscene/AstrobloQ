object FormReality: TFormReality
  Left = 18
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Biosneta'
  ClientHeight = 43
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000080000000000000000
    00F000000000000F800000000000000008800000444C40000000000000000000
    080000444444444400000F0000000000000044444C4C4C4C4C40008000000000
    00044444442444444444000000000000004C444C422C4C4C4C4C400000000800
    04444444C224C444C444C4000000F800044C4C4C422C4C4C4C4C4C0000008800
    444444C42224CCC4C4C4C44000000000444C4C42A22C4C4C4C4C4C200F000004
    4444C4422222CCCCC4CCC422080000044C4C4C4222A22C4C4C4C4C2208000004
    4444C4222A222CCCCCCCC42200000004444C4C222222CC4CCC4C4C2200000004
    4444C422222CCCCCCCC22222000000044C4C4C224C4C4CCCCCC2222200000004
    44444422CCCC2CCCECC22AA200000000444C4C422C422C6CCC6C222000000000
    4444242222222CCCCECCC6C000000000044C22222A222C6ECC622C0000000080
    044422A2222A2CCCCCC2260000000088004C222222222C6C2C6620000000000F
    800422A222C222CC262200000000000088004222224C222C6C20009900000000
    00000044422444C66000091190000000008F00004C4C4C60000091BB19000000
    0008800000000000000091BB1900000000000000088800000000091190000000
    000000000088000000000099000000000000000000000000000000000000FFFF
    FFFFFFFFEFFFFDFFE7FFF9F07FFFFBC00FBFFF0001DFFE0000FFFC00007FB800
    003F3800003F3000001FF000001BE000000BE000000BE000000FE000000FE000
    000FE000000FE000000FF000001FF000001FF800003FD800003FCC00007FE600
    00FFF30001CFFFC00787FCF01F03FE7FFF03FFF8FF87FFFCFFCFFFFFFFFF}
  Menu = MainMenu1
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1085
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    BorderWidth = 2
    TabOrder = 0
    ExplicitWidth = 1077
    object Panel4: TPanel
      Left = 3
      Top = 3
      Width = 152
      Height = 35
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnGo: TBitBtn
        Left = 2
        Top = 2
        Width = 71
        Height = 31
        Hint = 'Start time.'
        Caption = #1057#1090#1072#1088#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333700000733333333F777773FF3333333007F0F70
          0333333773373377FF3333300FFF7FFF003333773F3333377FF33300F0FFFFF0
          F00337737333F37377F33707FFFF0FFFF70737F33337F33337FF300FFFFF0FFF
          FF00773F3337F333377F30707FFF0FFF70707F733337F333737F300FFFF09FFF
          FF0077F33377F33337733707FF0F9FFFF70737FF3737F33F37F33300F0FF9FF0
          F003377F7337F373773333300FFF9FFF00333377FF37F3377FF33300007F9F70
          000337777FF7FF77773333703070007030733373777777737333333333330333
          333333333337FF33333333333330003333333333337773333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnGoClick
      end
      object btnStop: TBitBtn
        Left = 80
        Top = 2
        Width = 69
        Height = 31
        Hint = 'Stop time.'
        Caption = #1057#1090#1086#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnStopClick
      end
    end
    object Panel16: TPanel
      Left = 481
      Top = 3
      Width = 70
      Height = 35
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object radTicking: TRadioButton
        Left = 4
        Top = 2
        Width = 113
        Height = 17
        Hint = 
          'Set time to ticking mode if you want to pause between each round' +
          '.'
        Caption = 'Ticking'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInactiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = radTickingClick
      end
      object radFlowing: TRadioButton
        Left = 4
        Top = 18
        Width = 113
        Height = 17
        Hint = 'Flowing time mode sets the planet running until you press stop.'
        Caption = 'Flowing'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInactiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = radFlowingClick
      end
    end
    object Panel1: TPanel
      Left = 155
      Top = 3
      Width = 326
      Height = 35
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 326
        Height = 47
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object laBspeed: TLabel
          Left = 14
          Top = 4
          Width = 17
          Height = 13
          Caption = 'fast'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 253
          Top = 4
          Width = 21
          Height = 13
          Caption = 'slow'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object labRoundTime: TLabel
          Left = 122
          Top = 19
          Width = 31
          Height = 13
          Caption = '100ms'
        end
        object trackSpeed: TTrackBar
          Left = 35
          Top = 0
          Width = 218
          Height = 21
          Hint = 'Speed between each clock tick.'
          LineSize = 2
          Max = 200
          Min = 1
          ParentShowHint = False
          Frequency = 50
          Position = 50
          ShowHint = True
          TabOrder = 0
          ThumbLength = 15
          TickMarks = tmTopLeft
          TickStyle = tsNone
          OnChange = trackSpeedChange
        end
        object btn20: TBitBtn
          Left = 288
          Top = 6
          Width = 27
          Height = 23
          Hint = 'Set to default round time of 20ms.'
          Caption = '40'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn20Click
        end
      end
    end
    object Panel3: TPanel
      Left = 551
      Top = 3
      Width = 393
      Height = 35
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object panRealityT: TPanel
        Left = 0
        Top = 0
        Width = 300
        Height = 35
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object panRealityTime: TPanel
          Left = 0
          Top = 0
          Width = 71
          Height = 35
          Align = alLeft
          BevelOuter = bvNone
          Caption = #1042#1088#1077#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object panRealityTime1: TPanel
          Left = 71
          Top = 0
          Width = 100
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 'panRealityTime1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbCollisions: TCheckBox
          Left = 156
          Top = 17
          Width = 149
          Height = 17
          Hint = 'Turn the collision system on or off.'
          Caption = #1057#1090#1086#1083#1085#1086#1074#1077#1085#1080#1103
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = cbCollisionsClick
        end
        object cbAI: TCheckBox
          Left = 156
          Top = 1
          Width = 141
          Height = 17
          Hint = 'Run ai code for objects.'
          Caption = 'AI'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnClick = cbAIClick
        end
      end
    end
    object Panel5: TPanel
      Left = 1003
      Top = 3
      Width = 79
      Height = 35
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
      ExplicitLeft = 995
      object btnExit: TBitBtn
        Left = 1
        Top = 2
        Width = 81
        Height = 31
        Hint = 'Stop time.'
        Caption = #1042#1099#1093#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
          03333377777777777F33333003333330033333377FF333377F33333300333333
          0333333377FF33337F3333333003333303333333377FF3337333333333003333
          333333333377FF3333333333333003333333333333377FF33333333333330033
          3333333333337733333333333330033333333333333773333333333333003333
          33333333337733333F3333333003333303333333377333337F33333300333333
          03333333773333337F33333003333330033333377FFFFFF77F33330000000000
          0333337777777777733333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnExitClick
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 365
    Top = 65531
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object menuNewReality: TMenuItem
        Caption = #1053#1086#1074#1099#1081' '#1084#1080#1088
        OnClick = menuNewRealityClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Load1: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1084#1080#1088'...'
        OnClick = Load1Click
      end
      object menuSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1084#1080#1088
        OnClick = menuSaveClick
      end
      object SaveAs1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1084#1080#1088' '#1082#1072#1082'...'
        OnClick = SaveAs1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Quit1: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = Quit1Click
      end
    end
    object Add1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object Object1: TMenuItem
        Caption = #1054#1073#1098#1077#1082#1090
        Enabled = False
        object Apple1: TMenuItem
          Caption = #1071#1073#1083#1086#1085#1103
          Enabled = False
        end
        object Orange1: TMenuItem
          Caption = #1040#1087#1077#1083#1100#1089#1080#1085
          Enabled = False
        end
      end
      object AI1: TMenuItem
        Caption = 'AI'
        Enabled = False
      end
    end
    object View1: TMenuItem
      Caption = #1042#1080#1076
      object menuMonitor: TMenuItem
        Caption = '&Desktop'
        Visible = False
        object menuMonitorSingle: TMenuItem
          Caption = #1054#1076#1080#1085' '#1084#1086#1085#1080#1090#1086#1088
          RadioItem = True
          OnClick = menuMonitorSingleClick
        end
        object menuMonitorDouble: TMenuItem
          Caption = #1053#1077#1089#1082#1086#1083#1100#1082#1086' '#1084#1086#1085#1080#1090#1086#1088#1086#1074
          RadioItem = True
          OnClick = menuMonitorDoubleClick
        end
      end
      object menuViewManager: TMenuItem
        Caption = '&'#1052#1077#1085#1077#1076#1078#1077#1088
        OnClick = menuViewManagerClick
      end
      object menuViewSpace: TMenuItem
        Caption = '&Space'
        OnClick = menuViewSpaceClick
      end
      object menuViewEvents: TMenuItem
        Caption = '&'#1057#1086#1073#1099#1090#1080#1103
        OnClick = menuViewEventsClick
      end
      object menuViewLists: TMenuItem
        Caption = '&'#1057#1087#1080#1089#1082#1080
        OnClick = menuViewListsClick
      end
      object ime1: TMenuItem
        Caption = #1042#1088#1077#1084#1103
      end
      object Construction1: TMenuItem
        Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1094#1080#1103
      end
    end
    object Run1: TMenuItem
      Caption = #1055#1088#1086#1094#1077#1089#1089
      object menuGo: TMenuItem
        Caption = '&'#1057#1090#1072#1088#1090'!'
        OnClick = menuGoClick
      end
      object menuStop: TMenuItem
        Caption = '&'#1057#1090#1086#1087'!'
        OnClick = menuStopClick
      end
    end
    object Net1: TMenuItem
      Caption = #1057#1077#1090#1100
      object AllowCommunication1: TMenuItem
        Caption = #1050#1086#1084#1084#1091#1085#1080#1082#1072#1094#1080#1080
        Enabled = False
      end
      object AllowInterNetTravel1: TMenuItem
        Caption = #1047#1074#1077#1079#1076#1086#1087#1083#1072#1074#1072#1085#1080#1077
        Enabled = False
      end
    end
    object Set1: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      object TimeMode1: TMenuItem
        Caption = '&'#1056#1077#1078#1080#1084' '#1074#1088#1077#1084#1077#1085#1080
        object menuSetTimeTicking: TMenuItem
          Caption = '&Ticking'
          RadioItem = True
          OnClick = menuSetTimeTickingClick
        end
        object menuSetTimeFlowing: TMenuItem
          Caption = '&Flowing'
          RadioItem = True
          OnClick = menuSetTimeFlowingClick
        end
      end
      object Names1: TMenuItem
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        object menuEnvironmentName: TMenuItem
          Caption = #1048#1084#1103' '#1087#1083#1072#1085#1077#1090#1099
          OnClick = menuEnvironmentNameClick
        end
        object menuCreatorName: TMenuItem
          Caption = #1048#1084#1103' '#1102#1079#1077#1088#1072
          OnClick = menuCreatorNameClick
        end
      end
      object ReloadDNA1: TMenuItem
        Caption = '&Reload DNAs'
        OnClick = ReloadDNA1Click
      end
      object menuMax: TMenuItem
        Caption = 'Maxims'
        OnClick = menuMaxClick
      end
      object menuSettings: TMenuItem
        Caption = '&'#1059#1089#1090#1072#1085#1086#1074#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'...'
        OnClick = menuSettingsClick
      end
      object AAsteroids1: TMenuItem
        Caption = #1040#1089#1090#1077#1088#1086#1080#1076#1099
        OnClick = AAsteroids1Click
      end
    end
    object About1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object menuReadme: TMenuItem
        Caption = '&'#1056#1080#1076#1084#1080
        OnClick = menuReadmeClick
      end
      object menuTutorial: TMenuItem
        Caption = '&'#1058#1091#1090#1086#1088#1080#1072#1083
        OnClick = menuTutorialClick
      end
      object ipoftheDay1: TMenuItem
        Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072
        OnClick = ipoftheDay1Click
      end
      object menuKeyboard: TMenuItem
        Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
        OnClick = menuKeyboardClick
      end
      object Restore1: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1094#1077#1085#1091
        Visible = False
        OnClick = Restore1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object About2: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = About2Click
      end
    end
  end
  object RealityClock: TTimer
    Interval = 100
    OnTimer = RealityClockTimer
    Left = 786
  end
  object odLoadReality: TOpenDialog
    DefaultExt = 'air'
    FileName = '*.air'
    Filter = '*.air'
    Left = 546
  end
  object sdSaveReality: TSaveDialog
    FileName = '*.air'
    Filter = '*.air'
    Left = 871
    Top = 2
  end
end
