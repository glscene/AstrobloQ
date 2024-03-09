object FormSettings: TFormSettings
  Left = 324
  Top = 109
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Settings'
  ClientHeight = 648
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 24
  object Label3: TLabel
    Left = 21
    Top = 21
    Width = 160
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Program Settings'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 21
    Top = 138
    Width = 147
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Splash Screens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 21
    Top = 301
    Width = 81
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Interface'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbLoadOnStartup: TCheckBox
    Left = 81
    Top = 56
    Width = 264
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Load Planet on Startup'
    TabOrder = 0
    OnClick = cbLoadOnStartupClick
  end
  object cbAutosave: TCheckBox
    Left = 81
    Top = 91
    Width = 264
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Autosave on Exit'
    Enabled = False
    TabOrder = 1
    OnClick = cbAutosaveClick
  end
  object panButtonBar: TPanel
    Left = 0
    Top = 576
    Width = 432
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object panOKButton: TPanel
      Left = 249
      Top = 1
      Width = 182
      Height = 70
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnOK: TBitBtn
        Left = 18
        Top = 14
        Width = 131
        Height = 44
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
    end
  end
  object cbSplashStart: TCheckBox
    Left = 81
    Top = 180
    Width = 323
    Height = 32
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Show Splash Screen on Startup'
    TabOrder = 3
    OnClick = cbSplashStartClick
  end
  object cbSplashExit: TCheckBox
    Left = 81
    Top = 215
    Width = 323
    Height = 32
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Show Splash Screen on Exit'
    TabOrder = 4
    OnClick = cbSplashExitClick
  end
  object cbInvertMouse: TCheckBox
    Left = 81
    Top = 336
    Width = 323
    Height = 32
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Invert First Person Mouse'
    TabOrder = 5
    OnClick = cbInvertMouseClick
  end
  object cbInvertPlanet: TCheckBox
    Left = 81
    Top = 369
    Width = 323
    Height = 32
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Invert Planet Mouse'
    TabOrder = 6
    OnClick = cbInvertPlanetClick
  end
  object cbAuto3DView: TCheckBox
    Left = 81
    Top = 404
    Width = 327
    Height = 32
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Auto 3D View In Object Windows'
    TabOrder = 7
    OnClick = cbAuto3DViewClick
  end
  object cbInvertMouseWheel: TCheckBox
    Left = 81
    Top = 439
    Width = 330
    Height = 32
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Invert Mousewheel Zoom'
    TabOrder = 8
    OnClick = cbInvertMouseWheelClick
  end
  object cbTipOfTheDay: TCheckBox
    Left = 81
    Top = 252
    Width = 323
    Height = 32
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Show Tip of the Day on Startup'
    TabOrder = 9
    OnClick = cbTipOfTheDayClick
  end
  object cbRememberView: TCheckBox
    Left = 81
    Top = 476
    Width = 334
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Remember 3D View Size'
    TabOrder = 10
    OnClick = cbRememberViewClick
  end
  object cbAdvancedMode: TCheckBox
    Left = 81
    Top = 511
    Width = 334
    Height = 30
    Hint = 'Show advanced controls in the menus.'
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Advanced Mode'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = cbAdvancedModeClick
  end
end
