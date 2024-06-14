object fmReality: TfmReality
  Left = 18
  Top = 158
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Biosfera'
  ClientHeight = 72
  ClientWidth = 1897
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
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
  PixelsPerInch = 168
  TextHeight = 24
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1897
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvLowered
    BorderWidth = 2
    TabOrder = 0
    object Panel4: TPanel
      Left = 3
      Top = 3
      Width = 266
      Height = 66
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnGo: TBitBtn
        Left = 4
        Top = 4
        Width = 124
        Height = 54
        Hint = 'Start time.'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'GO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        Left = 140
        Top = 4
        Width = 121
        Height = 54
        Hint = 'Stop time.'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'STOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
      Left = 840
      Top = 3
      Width = 122
      Height = 66
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object radTicking: TRadioButton
        Left = 7
        Top = 4
        Width = 198
        Height = 29
        Hint = 
          'Set time to ticking mode if you want to pause between each round' +
          '.'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Ticking'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInactiveCaption
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = radTickingClick
      end
      object radFlowing: TRadioButton
        Left = 7
        Top = 32
        Width = 198
        Height = 29
        Hint = 'Flowing time mode sets the planet running until you press stop.'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Flowing'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInactiveCaption
        Font.Height = -19
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
      Left = 269
      Top = 3
      Width = 571
      Height = 66
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 82
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object laBspeed: TLabel
          Left = 25
          Top = 7
          Width = 27
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'fast'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 443
          Top = 7
          Width = 31
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'slow'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object labRoundTime: TLabel
          Left = 214
          Top = 33
          Width = 55
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '100ms'
        end
        object trackSpeed: TTrackBar
          Left = 61
          Top = 0
          Width = 382
          Height = 37
          Hint = 'Speed between each clock tick.'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          LineSize = 2
          Max = 200
          Min = 1
          ParentShowHint = False
          Frequency = 50
          Position = 50
          ShowHint = True
          TabOrder = 0
          ThumbLength = 26
          TickMarks = tmTopLeft
          TickStyle = tsNone
          OnChange = trackSpeedChange
        end
        object btn20: TBitBtn
          Left = 504
          Top = 11
          Width = 47
          Height = 40
          Hint = 'Set to default round time of 20ms.'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '40'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn20Click
        end
      end
    end
    object Panel3: TPanel
      Left = 962
      Top = 3
      Width = 688
      Height = 66
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object panRealityT: TPanel
        Left = 0
        Top = 0
        Width = 525
        Height = 66
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object panRealityTime: TPanel
          Left = 0
          Top = 0
          Width = 124
          Height = 66
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -23
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object panRealityTime1: TPanel
          Left = 124
          Top = 0
          Width = 175
          Height = 66
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 'panRealityTime1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbCollisions: TCheckBox
          Left = 273
          Top = 30
          Width = 260
          Height = 30
          Hint = 'Turn the collision system on or off.'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Collisions'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = cbCollisionsClick
        end
        object cbAI: TCheckBox
          Left = 273
          Top = 2
          Width = 246
          Height = 30
          Hint = 'Run ai code for objects.'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Artificial Intelligence'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnClick = cbAIClick
        end
      end
    end
    object Panel5: TPanel
      Left = 1756
      Top = 3
      Width = 138
      Height = 66
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
      object btnExit: TBitBtn
        Left = 0
        Top = 4
        Width = 141
        Height = 54
        Hint = 'Stop time.'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'EXIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
    Left = 574
    Top = 65522
    object File1: TMenuItem
      Caption = 'File'
      object menuNewReality: TMenuItem
        Caption = 'New world'
        OnClick = menuNewRealityClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Load1: TMenuItem
        Caption = 'Load world...'
        OnClick = Load1Click
      end
      object menuSave: TMenuItem
        Caption = 'Save world'
        OnClick = menuSaveClick
      end
      object SaveAs1: TMenuItem
        Caption = 'Save world as...'
        OnClick = SaveAs1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Quit1: TMenuItem
        Caption = 'Exit'
        OnClick = Quit1Click
      end
    end
    object Add1: TMenuItem
      Caption = 'Add'
      object Object1: TMenuItem
        Caption = 'Object'
        Enabled = False
        object Apple1: TMenuItem
          Caption = 'Apple'
          Enabled = False
        end
        object Orange1: TMenuItem
          Caption = 'Orange'
          Enabled = False
        end
      end
      object AI1: TMenuItem
        Caption = 'AI'
        Enabled = False
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object menuMonitor: TMenuItem
        Caption = '&Desktop'
        Visible = False
        object menuMonitorSingle: TMenuItem
          Caption = 'Single Monitor'
          RadioItem = True
          OnClick = menuMonitorSingleClick
        end
        object menuMonitorDouble: TMenuItem
          Caption = 'Multiple Monitors'
          RadioItem = True
          OnClick = menuMonitorDoubleClick
        end
      end
      object menuViewManager: TMenuItem
        Caption = '&Manager'
        OnClick = menuViewManagerClick
      end
      object menuViewSpace: TMenuItem
        Caption = '&Space'
        OnClick = menuViewSpaceClick
      end
      object menuViewEvents: TMenuItem
        Caption = '&Events'
        OnClick = menuViewEventsClick
      end
      object menuViewLists: TMenuItem
        Caption = '&Lists'
        OnClick = menuViewListsClick
      end
      object ime1: TMenuItem
        Caption = 'Time'
      end
      object Construction1: TMenuItem
        Caption = 'Construction'
      end
    end
    object Run1: TMenuItem
      Caption = 'Start'
      object menuGo: TMenuItem
        Caption = '&Go!'
        OnClick = menuGoClick
      end
      object menuStop: TMenuItem
        Caption = '&Stop!'
        OnClick = menuStopClick
      end
    end
    object Net1: TMenuItem
      Caption = 'Network'
      object AllowCommunication1: TMenuItem
        Caption = 'Allow communications'
        Enabled = False
      end
      object AllowInterNetTravel1: TMenuItem
        Caption = 'Allow travels'
        Enabled = False
      end
    end
    object Set1: TMenuItem
      Caption = 'Options'
      object TimeMode1: TMenuItem
        Caption = '&Time Mode'
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
        Caption = 'Name'
        object menuEnvironmentName: TMenuItem
          Caption = 'Planet name'
          OnClick = menuEnvironmentNameClick
        end
        object menuCreatorName: TMenuItem
          Caption = 'User name'
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
        Caption = '&Program Settings'
        OnClick = menuSettingsClick
      end
      object AAsteroids1: TMenuItem
        Caption = 'Asteroids'
        OnClick = AAsteroids1Click
      end
    end
    object About1: TMenuItem
      Caption = 'Help'
      object menuReadme: TMenuItem
        Caption = '&Readme'
        OnClick = menuReadmeClick
      end
      object menuTutorial: TMenuItem
        Caption = '&Tutorial'
        OnClick = menuTutorialClick
      end
      object ipoftheDay1: TMenuItem
        Caption = 'Tip of the &Day'
        OnClick = ipoftheDay1Click
      end
      object menuKeyboard: TMenuItem
        Caption = 'Management'
        OnClick = menuKeyboardClick
      end
      object Restore1: TMenuItem
        Caption = 'Restore Black Scene'
        Visible = False
        OnClick = Restore1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object About2: TMenuItem
        Caption = 'About...'
        OnClick = About2Click
      end
    end
  end
  object RealityClock: TTimer
    Interval = 100
    OnTimer = RealityClockTimer
    Left = 634
    Top = 8
  end
  object odLoadReality: TOpenDialog
    DefaultExt = 'air'
    FileName = '*.air'
    Filter = '*.air'
    Left = 562
    Top = 8
  end
  object sdSaveReality: TSaveDialog
    FileName = '*.air'
    Filter = '*.air'
    Left = 711
    Top = 65522
  end
end
