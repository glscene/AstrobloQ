object FormBiosfera: TFormBiosfera
  Left = 4
  Top = 83
  Align = alClient
  BorderIcons = [biSystemMenu]
  Caption = 'Biosfera'
  ClientHeight = 758
  ClientWidth = 1551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheel = FormMouseWheel
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object Splitter3D: TSplitter
    Left = 0
    Top = 553
    Width = 1551
    Height = 2
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitWidth = 1008
  end
  object panMenus: TPanel
    Left = 0
    Top = 0
    Width = 1551
    Height = 553
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1000
    object panTools: TPanel
      Left = 0
      Top = 231
      Width = 1551
      Height = 322
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 1000
      object tbWater: TToolBar
        Left = 0
        Top = 56
        Width = 1551
        Height = 29
        ButtonHeight = 19
        ButtonWidth = 54
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        List = True
        ShowCaptions = True
        TabOrder = 0
        Visible = False
        ExplicitWidth = 1000
        object Label9: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 19
          AutoSize = False
          Caption = #1042#1086#1076#1072
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbWateringCan: TToolButton
          Left = 73
          Top = 0
          Hint = 'Watering Can (Adds Water)'
          Caption = 'Can'
          Down = True
          Grouped = True
          ImageIndex = 51
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbWateringCanClick
        end
        object tbSponge: TToolButton
          Left = 127
          Top = 0
          Hint = 'Sponge (Removes Water)'
          Caption = #1043#1091#1073#1082#1072
          Grouped = True
          ImageIndex = 52
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbSpongeClick
        end
        object tbSplash: TToolButton
          Left = 181
          Top = 0
          Hint = 'Splash'
          Caption = #1041#1088#1099#1079#1075#1080
          Grouped = True
          ImageIndex = 91
          Style = tbsCheck
          OnClick = tbSplashClick
        end
        object tbIceberg: TToolButton
          Left = 235
          Top = 0
          Caption = #1040#1081#1089#1073#1077#1088#1075
          Grouped = True
          ImageIndex = 74
          Style = tbsCheck
          OnClick = tbIcebergClick
        end
        object ToolButton2: TToolButton
          Left = 289
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object Panel4: TPanel
          Left = 297
          Top = 0
          Width = 139
          Height = 19
          BevelOuter = bvNone
          Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1080#1089#1087#1072#1088#1077#1085#1080#1103':'
          Color = clActiveBorder
          TabOrder = 2
        end
        object edWater: TEdit
          Left = 436
          Top = 0
          Width = 38
          Height = 19
          Hint = 'Amount of water that the watering can pours when you use it.'
          Enabled = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Text = '1'
        end
        object WaterUpDown: TUpDown
          Left = 474
          Top = 0
          Width = 17
          Height = 19
          Min = 1
          Position = 5
          TabOrder = 1
          OnClick = WaterUpDownClick
        end
        object WaterFastUpDown: TUpDown
          Left = 491
          Top = 0
          Width = 17
          Height = 19
          Min = 1
          Increment = 10
          Position = 5
          TabOrder = 3
          OnClick = WaterFastUpDownClick
        end
        object ToolButton3: TToolButton
          Left = 508
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 10
          Style = tbsSeparator
        end
      end
      object tbAtmosphere: TToolBar
        Left = 0
        Top = 85
        Width = 1551
        Height = 29
        ButtonWidth = 121
        Caption = 'tbAtmosphere'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 1
        Visible = False
        ExplicitWidth = 1000
        object Label4: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = #1040#1090#1084#1086#1089#1092#1077#1088#1072
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbHeat: TToolButton
          Left = 73
          Top = 0
          Hint = 'Heat'
          Caption = #1046#1072#1088#1072
          Down = True
          Grouped = True
          ImageIndex = 77
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbHeatClick
        end
        object tbCold: TToolButton
          Left = 194
          Top = 0
          Hint = 'Cool'
          Caption = #1061#1086#1083#1086#1076
          Grouped = True
          ImageIndex = 73
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbColdClick
        end
        object tbHumidifier: TToolButton
          Left = 315
          Top = 0
          Hint = 'Humidify'
          Caption = #1042#1083#1072#1078#1085#1086#1089#1090#1100
          Grouped = True
          ImageIndex = 83
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbHumidifierClick
        end
        object tbDehumidifier: TToolButton
          Left = 436
          Top = 0
          Hint = 'Dehumidify'
          Caption = #1042#1099#1089#1099#1093#1072#1085#1080#1077
          Grouped = True
          ImageIndex = 82
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbDehumidifierClick
        end
        object tbCloud: TToolButton
          Left = 557
          Top = 0
          Hint = 'Cloud'
          Caption = #1054#1073#1083#1072#1082#1072
          Grouped = True
          ImageIndex = 57
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCloudClick
        end
        object tbRainCloud: TToolButton
          Left = 678
          Top = 0
          Hint = 'Cloud that is raining.'
          Caption = #1044#1086#1078#1076#1077#1074#1099#1077' '#1086#1073#1083#1072#1082#1072
          Grouped = True
          ImageIndex = 57
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbRainCloudClick
        end
        object tbStormCloud: TToolButton
          Left = 799
          Top = 0
          Hint = 'Cloud that shoots lightning.'
          Caption = #1058#1091#1095#1080
          Grouped = True
          ImageIndex = 153
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbStormCloudClick
        end
      end
      object tbGalaxy: TToolBar
        Left = 0
        Top = 27
        Width = 1551
        Height = 29
        ButtonWidth = 110
        Caption = 'tbGalaxy'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = False
        TabOrder = 2
        Visible = False
        ExplicitWidth = 1000
        object Label12: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = #1057#1072#1090#1077#1083#1083#1080#1090#1099
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbBuildSun: TToolButton
          Left = 73
          Top = 0
          Hint = 'Sun'
          Caption = #1057#1086#1083#1085#1094#1077
          Grouped = True
          ImageIndex = 61
          ParentShowHint = False
          ShowHint = True
          OnClick = tbBuildSunClick
        end
        object tbBuildMoon: TToolButton
          Left = 183
          Top = 0
          Hint = 'Moon'
          Caption = #1051#1091#1085#1072
          ImageIndex = 62
          ParentShowHint = False
          ShowHint = True
          OnClick = tbBuildMoonClick
        end
        object ToolButton11: TToolButton
          Left = 293
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 60
          Style = tbsSeparator
        end
        object tbFakeSun: TToolButton
          Left = 301
          Top = 0
          Hint = 'Create a sun with only light, no heat.'
          Caption = #1051#1077#1076#1103#1085#1086#1077' '#1089#1086#1083#1085#1094#1077
          ImageIndex = 58
          ParentShowHint = False
          ShowHint = True
          OnClick = tbFakeSunClick
        end
        object ToolButton10: TToolButton
          Left = 411
          Top = 0
          Width = 8
          Caption = 'ToolButton10'
          ImageIndex = 61
          Style = tbsSeparator
        end
        object tbAsteroid: TToolButton
          Left = 419
          Top = 0
          Hint = 'Asteroid'
          Caption = #1040#1089#1090#1077#1088#1086#1080#1076#1099
          Grouped = True
          ImageIndex = 93
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAsteroidClick
        end
        object tbMissileDefence: TToolButton
          Left = 529
          Top = 0
          Hint = 'Add a missile defence satellite.'
          Caption = #1047#1072#1097#1080#1090#1072
          Grouped = True
          ImageIndex = 150
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbMissileDefenceClick
        end
        object ToolButton4: TToolButton
          Left = 639
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 60
          Style = tbsSeparator
        end
      end
      object tbSettings: TToolBar
        Left = 0
        Top = 188
        Width = 1551
        Height = 25
        ButtonWidth = 94
        Caption = 'tbSettings'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 3
        Visible = False
        ExplicitWidth = 1000
        object Label18: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = #1059#1090#1080#1083#1080#1090#1099': '
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbCameraLight: TToolButton
          Left = 73
          Top = 0
          Hint = 'Shine a Light From the Camera'
          Caption = #1057#1074#1077#1090' '#1082#1072#1084#1077#1088#1099
          Down = True
          ImageIndex = 39
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraLightClick
        end
        object tbShowCursor: TToolButton
          Left = 167
          Top = 0
          Hint = 'Shows a cursor on the planet when you move the mouse.'
          Caption = #1050#1091#1088#1089#1086#1088
          Down = True
          ImageIndex = 74
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShowCursorClick
        end
        object tbFlashlight: TToolButton
          Left = 261
          Top = 0
          Hint = 'Shines a light on the planet that you are looking at.'
          Caption = 'Flash Light'
          ImageIndex = 88
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbFlashlightClick
        end
        object tbStickyFit: TToolButton
          Left = 355
          Top = 0
          Hint = 
            'Sticky fit causes the Space window to stick in its designated de' +
            'sktop position.'
          Caption = 'Sticky Fit'
          Down = True
          ImageIndex = 90
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbStickyFitClick
        end
        object tbFullscreen: TToolButton
          Left = 449
          Top = 0
          Hint = 'Press ESC to exit fullscreen mode.'
          Caption = 'Fullscreen'
          ImageIndex = 89
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbFullscreenClick
        end
        object ToolButton6: TToolButton
          Left = 543
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 91
          Style = tbsSeparator
        end
        object tbSnapshot: TToolButton
          Left = 551
          Top = 0
          Hint = 'Take a photograph of your world.'
          Caption = 'Snapshot'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          OnClick = tbSnapshotClick
        end
        object cbAutoSnap: TCheckBox
          Left = 645
          Top = 0
          Width = 69
          Height = 22
          Caption = 'AutoSnap'
          TabOrder = 0
          OnClick = cbAutoSnapClick
        end
        object ToolButton9: TToolButton
          Left = 714
          Top = 0
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object tbAVIMovie: TToolButton
          Left = 722
          Top = 0
          Hint = 
            'Start recording an AVI movie. When you close AIPlanet, the movie' +
            ' stops recording.'
          Caption = 'AVI Start'
          ImageIndex = 39
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAVIMovieClick
        end
        object tbAVIDirect: TToolButton
          Left = 816
          Top = 0
          Hint = 'While this button is down, capture a frame.'
          Caption = 'AVI Direct'
          ImageIndex = 39
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          Visible = False
        end
        object tbAVIFrame: TToolButton
          Left = 910
          Top = 0
          Hint = 'Capture an extra AVI frame (for when time is stopped).'
          Caption = 'AVI Frame'
          ImageIndex = 34
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = tbAVIFrameClick
        end
      end
      object tbTools: TToolBar
        Left = 0
        Top = 213
        Width = 1551
        Height = 28
        ButtonWidth = 81
        Caption = 'tbTools'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 4
        Visible = False
        ExplicitWidth = 1000
        object Label8: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099':'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbBall: TToolButton
          Left = 73
          Top = 0
          Caption = #1052#1103#1095
          Down = True
          Grouped = True
          ImageIndex = 95
          Style = tbsCheck
          OnClick = tbBallClick
        end
        object tbBeaconBubble: TToolButton
          Left = 154
          Top = 0
          Hint = 'Bubble Beacon'
          Caption = 'Bubble'
          Grouped = True
          ImageIndex = 24
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbBeaconBubbleClick
        end
        object tbBeaconDrain: TToolButton
          Left = 235
          Top = 0
          Hint = 'Drain Beacon'
          Caption = 'Drain'
          Grouped = True
          ImageIndex = 23
          Style = tbsCheck
          OnClick = tbBeaconDrainClick
        end
        object tbBeaconApple: TToolButton
          Left = 316
          Top = 0
          Hint = 'Apple Beacon'
          Caption = 'ApplePop'
          Grouped = True
          ImageIndex = 9
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbBeaconAppleClick
        end
        object tbBeaconOrange: TToolButton
          Left = 397
          Top = 0
          Hint = 'Pop oranges'
          Caption = 'OrangePop'
          Grouped = True
          ImageIndex = 11
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbBeaconOrangeClick
        end
        object tbPopBeacon: TToolButton
          Left = 478
          Top = 0
          Hint = 'Pop any thing (use edit boxes for kind and rate)'
          Caption = 'AnyPop'
          Grouped = True
          ImageIndex = 147
          Style = tbsCheck
          OnClick = tbPopBeaconClick
        end
        object Label31: TLabel
          Left = 559
          Top = 0
          Width = 27
          Height = 22
          Caption = 'Kind='
        end
        object cboxThings: TComboBox
          Left = 586
          Top = 0
          Width = 120
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = cboxThingsChange
        end
        object Label33: TLabel
          Left = 706
          Top = 0
          Width = 29
          Height = 22
          Caption = 'Rate='
        end
        object imgDefaultTexture: TImage
          Left = 735
          Top = 0
          Width = 24
          Height = 22
          Picture.Data = {
            07544269746D617036050000424D360500000000000036040000280000001000
            0000100000000100080000000000000100000000000000000000000100000000
            000000000000000080000080000000808000800000008000800080800000C0C0
            C00099A8AC00D8E9EC000020400000206000002080000020A0000020C0000020
            E00000400000004020000040400000406000004080000040A0000040C0000040
            E00000600000006020000060400000606000006080000060A0000060C0000060
            E00000800000008020000080400000806000008080000080A0000080C0000080
            E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
            E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
            E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
            E00040000000400020004000400040006000400080004000A0004000C0004000
            E00040200000402020004020400040206000402080004020A0004020C0004020
            E00040400000404020004040400040406000404080004040A0004040C0004040
            E00040600000406020004060400040606000406080004060A0004060C0004060
            E00040800000408020004080400040806000408080004080A0004080C0004080
            E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
            E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
            E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
            E00080000000800020008000400080006000800080008000A0008000C0008000
            E00080200000802020008020400080206000802080008020A0008020C0008020
            E00080400000804020008040400080406000804080008040A0008040C0008040
            E00080600000806020008060400080606000806080008060A0008060C0008060
            E00080800000808020008080400080806000808080008080A0008080C0008080
            E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
            E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
            E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
            E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
            E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
            E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
            E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
            E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
            E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
            E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00984E
            0000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D8D8D8D8D8D8E1E1D8D8D8E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1D8D8D8E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1D8D8D8E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1D8D8E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D8D8D8E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D8D8D8D8E1E1E1E1E1E1D8D8D8
            D8E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1}
          Visible = False
        end
      end
      object tbVisuals: TToolBar
        Left = 0
        Top = 141
        Width = 1551
        Height = 47
        ButtonWidth = 95
        Caption = 'tbSettings'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 5
        Visible = False
        ExplicitWidth = 1000
        object Label17: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = 'Visuals: '
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbShowSatellites: TToolButton
          Left = 73
          Top = 0
          Hint = 'Show Suns, Moons, and Asteroids'
          Caption = #1057#1072#1090#1077#1083#1083#1080#1090#1099'    '
          Down = True
          ImageIndex = 76
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShowSatellitesClick
        end
        object tbShowClouds: TToolButton
          Left = 168
          Top = 0
          Hint = 'Shows clouds in the atmosphere.'
          Caption = #1054#1073#1083#1072#1082#1072
          Down = True
          ImageIndex = 72
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShowCloudsClick
        end
        object tbShowWater: TToolButton
          Left = 263
          Top = 0
          Hint = 'Show lakes, seas, and oceans.'
          Caption = #1042#1086#1076#1072
          Down = True
          ImageIndex = 84
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShowWaterClick
        end
        object tbShowStars: TToolButton
          Left = 358
          Top = 0
          Hint = 'Shows the starfield in the background.'
          Caption = #1047#1074#1105#1079#1076#1099
          Down = True
          ImageIndex = 91
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShowStarsClick
        end
        object tbShowAtmosphere: TToolButton
          Left = 453
          Top = 0
          Hint = 'Show the atmosphere around your planet.'
          Caption = #1040#1090#1084#1086#1089#1092#1077#1088#1072
          Down = True
          ImageIndex = 85
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShowAtmosphereClick
        end
        object tbHighDetail: TToolButton
          Left = 548
          Top = 0
          Hint = 'Use high detail models if available.'
          Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
          ImageIndex = 91
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbHighDetailClick
        end
        object Label25: TLabel
          Left = 643
          Top = 0
          Width = 72
          Height = 22
          AutoSize = False
          Caption = #1043#1088#1072#1092#1080#1082#1080
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbShadows: TToolButton
          Left = 715
          Top = 0
          Hint = 'Turn shadows on or off.'
          Caption = #1058#1077#1085#1080
          ImageIndex = 97
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShadowsClick
        end
        object tbComplexify: TToolButton
          Left = 810
          Top = 0
          Hint = 'Object shadows cast onto other objects.'
          Caption = 'Multicast'
          ImageIndex = 154
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbComplexifyClick
        end
        object tbVolumes: TToolButton
          Left = 905
          Top = 0
          Hint = 'Shows shadow volumes.'
          Caption = #1054#1073#1098#1105#1084#1099
          ImageIndex = 88
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbVolumesClick
        end
        object tbSpeeches: TToolButton
          Left = 1000
          Top = 0
          Hint = 'Show text speeches.'
          Caption = 'Speeches'
          Down = True
          ImageIndex = 56
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbSpeechesClick
        end
        object tbShowFire: TToolButton
          Left = 1095
          Top = 0
          Hint = 
            'Prevents fire effects from being created by sun and explosions (' +
            'not undoable).'
          Caption = 'Fire Effects'
          Down = True
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbShowFireClick
        end
        object tbSpherical: TToolButton
          Left = 1190
          Top = 0
          Hint = 'Shape Land as Flat or Spherical'
          Caption = #1057#1092#1077#1088#1080#1095#1085#1086#1089#1090#1100
          Down = True
          ImageIndex = 86
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          Visible = False
          OnClick = tbSphericalClick
        end
      end
      object tbSpirits: TToolBar
        Left = 0
        Top = 241
        Width = 1551
        Height = 48
        ButtonWidth = 66
        Caption = 'tbFauna'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 6
        Visible = False
        ExplicitWidth = 1000
        object Label15: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = #1053#1086#1074#1099#1081' '#1073#1086#1090': '
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbSpiritGuy: TToolButton
          Left = 73
          Top = 0
          Hint = 'Bot'
          Caption = #1041#1086#1090
          Down = True
          Grouped = True
          ImageIndex = 45
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbSpiritGuyClick
        end
        object tbBotSelect: TToolButton
          Left = 139
          Top = 0
          Caption = #1042#1099#1073#1086#1088
          Grouped = True
          ImageIndex = 122
          Style = tbsCheck
          OnClick = tbBotSelectClick
        end
        object Label5: TLabel
          Left = 205
          Top = 0
          Width = 36
          Height = 22
          Caption = 'Control:'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbControlBot: TToolButton
          Left = 241
          Top = 0
          Hint = 'Control Bot'
          Caption = 'Control'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          OnClick = tbControlBotClick
        end
        object Label2: TLabel
          Left = 307
          Top = 0
          Width = 38
          Height = 22
          Caption = 'Actions:'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbGrab: TToolButton
          Left = 345
          Top = 0
          Caption = 'Grab'
          ImageIndex = 12
          OnClick = tbGrabClick
        end
        object tbDrop: TToolButton
          Left = 411
          Top = 0
          Caption = 'Drop'
          ImageIndex = 13
          OnClick = tbDropClick
        end
        object tbKick: TToolButton
          Left = 477
          Top = 0
          Caption = 'Kick'
          ImageIndex = 11
          OnClick = tbKickClick
        end
        object tbEat: TToolButton
          Left = 543
          Top = 0
          Caption = #1045#1076#1072
          ImageIndex = 15
          OnClick = tbEatClick
        end
        object Label6: TLabel
          Left = 609
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = 'Actions:'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbBonk: TToolButton
          Left = 682
          Top = 0
          Caption = 'Bonk'
          ImageIndex = 16
          OnClick = tbBonkClick
        end
        object tbGive: TToolButton
          Left = 748
          Top = 0
          Caption = 'Give'
          ImageIndex = 17
          OnClick = tbGiveClick
        end
        object tbThrow: TToolButton
          Left = 814
          Top = 0
          Caption = 'Throw'
          ImageIndex = 14
          OnClick = tbThrowClick
        end
        object Label3: TLabel
          Left = 880
          Top = 0
          Width = 22
          Height = 22
          Caption = 'Use:'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbUse1: TToolButton
          Left = 902
          Top = 0
          Caption = 'Use1 (/)'
          ImageIndex = 127
          OnClick = tbUse1Click
        end
        object tbUse2: TToolButton
          Left = 968
          Top = 0
          Caption = 'Use2'
          ImageIndex = 128
          OnClick = tbUse2Click
        end
        object tbUse3: TToolButton
          Left = 1034
          Top = 0
          Caption = 'Use3'
          ImageIndex = 129
          OnClick = tbUse3Click
        end
        object tbUse4: TToolButton
          Left = 1100
          Top = 0
          Caption = 'Use4'
          ImageIndex = 130
          OnClick = tbUse4Click
        end
        object tbUse5: TToolButton
          Left = 1166
          Top = 0
          Caption = 'Use5'
          ImageIndex = 131
          OnClick = tbUse5Click
        end
      end
      object tbCameras: TToolBar
        Left = 0
        Top = 0
        Width = 1551
        Height = 27
        ButtonHeight = 7510
        ButtonWidth = 7794
        Caption = 'tbFauna'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        TabOrder = 7
        Visible = False
        ExplicitWidth = 1000
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 7510
          AutoSize = False
          Caption = #1053#1072#1081#1090#1080
          Color = clInactiveBorder
          ParentColor = False
        end
        object ToolButton14: TToolButton
          Left = 73
          Top = 0
          Hint = 'Planet (P)'
          Caption = 'ToolButton14'
          ImageIndex = 63
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbCameraPlanetClick
        end
        object tbTrackSpirit: TToolButton
          Left = 0
          Top = 7510
          Hint = 'Spirit (0)'
          Caption = 'tbTrackSpirit'
          ImageIndex = 45
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackSpiritClick
        end
        object tbTrackBird: TToolButton
          Left = 0
          Top = 15020
          Hint = 'Bird (3)'
          Caption = 'tbBird'
          ImageIndex = 53
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackBirdClick
        end
        object tbTrackFish: TToolButton
          Left = 0
          Top = 22530
          Hint = 'Fish (4)'
          Caption = 'tbTrackFish'
          ImageIndex = 94
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackFishClick
        end
        object tbTrackDuck: TToolButton
          Left = 0
          Top = 30040
          Caption = 'tbTrackDuck'
          ImageIndex = 116
          Wrap = True
          OnClick = tbTrackDuckClick
        end
        object tbTrackTurtle: TToolButton
          Left = 0
          Top = 37550
          Hint = 'Turtle'
          Caption = 'tbTrackTurtle'
          Grouped = True
          ImageIndex = 108
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackTurtleClick
        end
        object tbTrackLadybug: TToolButton
          Left = 0
          Top = 45060
          Hint = 'Ladybug'
          Caption = 'tbTrackLadybug'
          ImageIndex = 136
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackLadybugClick
        end
        object tbTrackShark: TToolButton
          Left = 0
          Top = 52570
          Hint = 'Shark'
          Caption = 'tbTrackShark'
          ImageIndex = 107
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackSharkClick
        end
        object tbTrackDolphin: TToolButton
          Left = 0
          Top = 60080
          Caption = 'tbTrackDolphin'
          ImageIndex = 119
          Wrap = True
          OnClick = tbTrackDolphinClick
        end
        object tbTrackHawk: TToolButton
          Left = 0
          Top = 67590
          Caption = 'tbTrackHawk'
          ImageIndex = 98
          Wrap = True
          OnClick = tbTrackHawkClick
        end
        object tbTrackCrab: TToolButton
          Left = 0
          Top = 75100
          Caption = 'tbTrackCrab'
          ImageIndex = 96
          Wrap = True
          OnClick = tbTrackCrabClick
        end
        object tbTrackAnt: TToolButton
          Left = 0
          Top = 82610
          Hint = 'Ant'
          Caption = 'tbTrackAnt'
          ImageIndex = 137
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackAntClick
        end
        object tbTrackBall: TToolButton
          Left = 0
          Top = 90120
          Caption = 'tbTrackBall'
          ImageIndex = 95
          Wrap = True
          OnClick = tbTrackBallClick
        end
        object tbTrackSun: TToolButton
          Left = 0
          Top = 97630
          Hint = 'Sun (1)'
          Caption = 'tbAppleTree'
          ImageIndex = 58
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackSunClick
        end
        object tbTrackMoon: TToolButton
          Left = 0
          Top = 105140
          Hint = 'Moon (2)'
          Caption = 'tbCrawlie'
          ImageIndex = 59
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackMoonClick
        end
        object tbTrackApple: TToolButton
          Left = 0
          Top = 112650
          Hint = 'Apple Tree (5)'
          Caption = 'tbTrackApple'
          ImageIndex = 47
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackAppleClick
        end
        object tbTrackOrange: TToolButton
          Left = 0
          Top = 120160
          Hint = 'Orange Tree (6)'
          Caption = 'tbTrackOrange'
          ImageIndex = 49
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackOrangeClick
        end
        object tbTrackAsteroid: TToolButton
          Left = 0
          Top = 127670
          Hint = 'Asteroid (8)'
          Caption = 'tbTrackAsteroid'
          ImageIndex = 93
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackAsteroidClick
        end
        object tbTrackCloud: TToolButton
          Left = 0
          Top = 135180
          Hint = 'Cloud (7)'
          Caption = 'tbTrackCloud'
          ImageIndex = 57
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackCloudClick
        end
        object tbTrackRabbit: TToolButton
          Left = 0
          Top = 142690
          Hint = 'Rabbit'
          Caption = 'tbTrackRabbit'
          ImageIndex = 111
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackRabbitClick
        end
        object tbTrackTrex: TToolButton
          Left = 0
          Top = 150200
          Caption = 'tbTrackTrex'
          ImageIndex = 100
          Wrap = True
          OnClick = tbTrackTrexClick
        end
        object tbTrackGrazer: TToolButton
          Left = 0
          Top = 157710
          Caption = 'tbTrackGrazer'
          ImageIndex = 101
          Wrap = True
          OnClick = tbTrackGrazerClick
        end
        object tbTrackTiger: TToolButton
          Left = 0
          Top = 165220
          Caption = 'tbTrackTiger'
          ImageIndex = 115
          Wrap = True
          OnClick = tbTrackTigerClick
        end
        object tbTrackTerrier: TToolButton
          Left = 0
          Top = 172730
          Hint = 'Terrier'
          Caption = 'tbTrackTerrier'
          ImageIndex = 110
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = tbTrackTerrierClick
        end
        object tbTrackFox: TToolButton
          Left = 0
          Top = 180240
          Hint = 'Fox'
          Caption = 'tbTrackFox'
          ImageIndex = 113
          ParentShowHint = False
          ShowHint = True
          OnClick = tbTrackFoxClick
        end
      end
      object tbAudio: TToolBar
        Left = 0
        Top = 114
        Width = 1551
        Height = 27
        ButtonWidth = 98
        Caption = 'tbSettings'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 8
        Visible = False
        ExplicitWidth = 1000
        object Label32: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = 'Volume'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbVolume: TTrackBar
          Left = 73
          Top = 0
          Width = 100
          Height = 22
          Position = 10
          TabOrder = 1
          OnChange = tbVolumeChange
        end
        object Label26: TLabel
          Left = 173
          Top = 0
          Width = 28
          Height = 22
          Caption = 'Trails:'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbTrackLines: TToolButton
          Left = 201
          Top = 0
          Caption = 'Tracking Trail'
          ImageIndex = 8
          Style = tbsCheck
          OnClick = tbTrackLinesClick
        end
        object tbPredictions: TToolButton
          Left = 299
          Top = 0
          Caption = 'Prediction Trail'
          ImageIndex = 27
          Style = tbsCheck
          OnClick = tbPredictionsClick
        end
        object cbTrackNewThings: TCheckBox
          Left = 397
          Top = 0
          Width = 112
          Height = 22
          Caption = 'Track New Things'
          TabOrder = 0
          OnClick = cbTrackNewThingsClick
        end
        object tbRestoreParent: TToolButton
          Left = 509
          Top = 0
          Hint = 'Restore the Time and Manager windows.'
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
          ImageIndex = 90
          ParentShowHint = False
          ShowHint = True
          OnClick = tbRestoreParentClick
        end
      end
      object tbDisasters: TToolBar
        Left = 0
        Top = 289
        Width = 1551
        Height = 29
        ButtonWidth = 107
        Caption = 'tbDisasters'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 9
        Visible = False
        ExplicitWidth = 1000
        object Label34: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 22
          AutoSize = False
          Caption = 'Disasters:'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbEarthquake: TToolButton
          Left = 73
          Top = 0
          Hint = 'Earthquake'
          Caption = #1047#1077#1084#1083#1077#1090#1088#1103#1089#1077#1085#1080#1077
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = tbEarthquakeClick
        end
        object ToolButton5: TToolButton
          Left = 180
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 42
          Style = tbsSeparator
        end
        object tbLightning: TToolButton
          Left = 188
          Top = 0
          Caption = #1052#1086#1083#1085#1080#1103
          Grouped = True
          ImageIndex = 155
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLightningClick
        end
        object tbPlantRemover: TToolButton
          Left = 295
          Top = 0
          Caption = 'Plant Remover'
          Grouped = True
          ImageIndex = 48
          Style = tbsCheck
          OnClick = tbPlantRemoverClick
        end
        object tbLifeKiller: TToolButton
          Left = 402
          Top = 0
          Caption = 'Life Killer'
          Grouped = True
          ImageIndex = 16
          Style = tbsCheck
          OnClick = tbLifeKillerClick
        end
        object tbThingCeaser: TToolButton
          Left = 509
          Top = 0
          Hint = 'Remove Things from Land'
          Caption = #1050#1086#1088#1079#1080#1085#1072
          Grouped = True
          ImageIndex = 41
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbThingCeaserClick
        end
      end
    end
    object panMainMenu: TPanel
      Left = 0
      Top = 0
      Width = 1551
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 1000
      object tbPlanet: TToolBar
        Left = 0
        Top = 0
        Width = 1551
        Height = 39
        Align = alClient
        ButtonHeight = 36
        ButtonWidth = 70
        Color = clActiveBorder
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        ParentColor = False
        ShowCaptions = True
        TabOrder = 0
        ExplicitWidth = 1000
        object tbObjectMenu: TToolButton
          Left = 0
          Top = 0
          Hint = 'Object Menu'
          Caption = #1054#1073#1098#1077#1082#1090
          Grouped = True
          ImageIndex = 138
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbObjectMenuClick
        end
        object tbGalaxyMenu: TToolButton
          Left = 70
          Top = 0
          Hint = 'Satellites'
          Caption = #1050#1086#1089#1084#1086#1089
          Grouped = True
          ImageIndex = 76
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbGalaxyMenuClick
        end
        object tbWaterMenu: TToolButton
          Left = 140
          Top = 0
          Hint = 'Water'
          Caption = #1042#1086#1076#1072
          Grouped = True
          ImageIndex = 84
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbWaterMenuClick
        end
        object tbLandMenu: TToolButton
          Left = 210
          Top = 0
          Hint = 'Land'
          Caption = #1057#1091#1096#1072
          Grouped = True
          ImageIndex = 78
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLandMenuClick
        end
        object tbAtmosphereMenu: TToolButton
          Left = 280
          Top = 0
          Hint = 'Atmosphere'
          Caption = #1042#1086#1079#1076#1091#1093
          Grouped = True
          ImageIndex = 85
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAtmosphereMenuClick
        end
        object tbFaunaMenu: TToolButton
          Left = 350
          Top = 0
          Hint = 'Fauna'
          Caption = #1056#1072#1089#1090#1077#1085#1080#1103
          Grouped = True
          ImageIndex = 75
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbFaunaMenuClick
        end
        object tbCreaturesMenu: TToolButton
          Left = 420
          Top = 0
          Hint = 'Creatures'
          Caption = #1046#1080#1074#1086#1090#1085#1099#1077
          Grouped = True
          ImageIndex = 109
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCreaturesMenuClick
        end
        object tbSpiritsMenu: TToolButton
          Left = 490
          Top = 0
          Hint = 'Spirits'
          Caption = #1041#1086#1090#1099
          Grouped = True
          ImageIndex = 45
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbSpiritsMenuClick
        end
        object tbToolsMenu: TToolButton
          Left = 560
          Top = 0
          Hint = 'Tools'
          Caption = #1048#1085#1090#1088#1091#1084#1077#1085#1090#1099
          Grouped = True
          ImageIndex = 40
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbToolsMenuClick
        end
        object tbDisastersMenu: TToolButton
          Left = 630
          Top = 0
          Hint = 'Disasters'
          Caption = #1041#1077#1076#1089#1090#1074#1080#1077
          Grouped = True
          ImageIndex = 153
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbDisastersMenuClick
        end
        object tbCameraMenu: TToolButton
          Left = 700
          Top = 0
          Hint = 'Find'
          Caption = #1055#1086#1080#1089#1082
          Grouped = True
          ImageIndex = 140
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraMenuClick
        end
        object tbVisualsMenu: TToolButton
          Left = 770
          Top = 0
          Hint = 'Visuals'
          Caption = 'Visuals'
          Grouped = True
          ImageIndex = 20
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbVisualsMenuClick
        end
        object tbAudioMenu: TToolButton
          Left = 840
          Top = 0
          Hint = 'Audio and Details'
          Caption = #1040#1091#1076#1080#1086
          Grouped = True
          ImageIndex = 43
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAudioMenuClick
        end
        object tbSettingsMenu: TToolButton
          Left = 910
          Top = 0
          Hint = 'Settings'
          Caption = #1054#1087#1094#1080#1080
          Grouped = True
          ImageIndex = 31
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbSettingsMenuClick
        end
        object ToolButton7: TToolButton
          Left = 980
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 40
          Style = tbsSeparator
        end
        object tbRepeat: TToolButton
          Left = 988
          Top = 0
          Hint = 'Tool Repeat'
          Caption = #1055#1086#1074#1090#1086#1088
          Down = True
          ImageIndex = 142
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
        end
      end
    end
    object panSelect: TPanel
      Left = 0
      Top = 39
      Width = 1551
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      ExplicitWidth = 1000
      object tbObjects: TToolBar
        Left = 176
        Top = 0
        Width = 1375
        Height = 48
        Align = alClient
        ButtonWidth = 86
        EdgeBorders = [ebTop, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 0
        ExplicitWidth = 824
        object Label22: TLabel
          Left = 0
          Top = 0
          Width = 48
          Height = 22
          AutoSize = False
          Caption = #1042#1080#1076':'
          Color = clActiveBorder
          ParentColor = False
        end
        object tbMouseView: TToolButton
          Left = 48
          Top = 0
          Hint = 'Mouse View (Info appears under cursor)'
          Caption = #1048#1085#1092#1086
          ImageIndex = 125
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbMouseViewClick
        end
        object tbTrackWindow: TToolButton
          Left = 134
          Top = 0
          Hint = 'View Selected Object (Double Click)'
          Caption = #1044#1077#1090#1072#1083#1080
          ImageIndex = 123
          ParentShowHint = False
          ShowHint = True
          OnClick = tbTrackWindowClick
        end
        object Label23: TLabel
          Left = 220
          Top = 0
          Width = 49
          Height = 22
          AutoSize = False
          Caption = 'Change:'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbHeal: TToolButton
          Left = 269
          Top = 0
          Hint = 'Heal this object (256).'
          Caption = 'Heal'
          ImageIndex = 24
          ParentShowHint = False
          ShowHint = True
          OnClick = tbHealClick
        end
        object tbHarm: TToolButton
          Left = 355
          Top = 0
          Hint = 'Harm this object (-256).'
          Caption = 'Harm'
          ImageIndex = 23
          ParentShowHint = False
          ShowHint = True
          OnClick = tbHarmClick
        end
        object tbDie: TToolButton
          Left = 441
          Top = 0
          Hint = 'Kill this object, if it is living.'
          Caption = #1043#1080#1073#1077#1083#1100
          ImageIndex = 41
          ParentShowHint = False
          ShowHint = True
          OnClick = tbDieClick
        end
        object tbCease: TToolButton
          Left = 527
          Top = 0
          Hint = 'Cease this objects existence.'
          Caption = 'Cease'
          ImageIndex = 16
          ParentShowHint = False
          ShowHint = True
          OnClick = tbCeaseClick
        end
        object tbExtinction: TToolButton
          Left = 613
          Top = 0
          Hint = 'Kill every kind of this object.'
          Caption = #1042#1099#1084#1080#1088#1072#1085#1080#1077
          ImageIndex = 42
          ParentShowHint = False
          ShowHint = True
          OnClick = tbExtinctionClick
        end
        object tbJump: TToolButton
          Left = 699
          Top = 0
          Caption = #1055#1088#1099#1078#1086#1082
          ImageIndex = 152
          Wrap = True
          OnClick = tbJumpClick
        end
        object Label30: TLabel
          Left = 0
          Top = 22
          Width = 48
          Height = 22
          AutoSize = False
          Caption = #1054#1090#1095#1105#1090':'
          Color = clActiveBorder
          ParentColor = False
        end
        object tbReport: TToolButton
          Left = 48
          Top = 22
          Hint = 'Ask for report from current object.'
          Caption = #1054#1090#1095#1105#1090
          ImageIndex = 117
          ParentShowHint = False
          ShowHint = True
          OnClick = tbReportClick
        end
        object tbReportAll: TToolButton
          Left = 134
          Top = 22
          Hint = 'Ask for reports from all creatures.'
          Caption = 'Report All'
          ImageIndex = 118
          ParentShowHint = False
          ShowHint = True
          OnClick = tbReportAllClick
        end
        object Label20: TLabel
          Left = 220
          Top = 22
          Width = 49
          Height = 22
          AutoSize = False
          Caption = #1044#1077#1081#1089#1090#1074#1080#1103':'
          Color = clInactiveBorder
          ParentColor = False
        end
        object tbPerform0: TToolButton
          Left = 269
          Top = 22
          Caption = 'Perform'
          ImageIndex = 126
          OnClick = tbPerform0Click
        end
        object tbPerform1: TToolButton
          Left = 355
          Top = 22
          Caption = 'Perform'
          ImageIndex = 127
          OnClick = tbPerform1Click
        end
        object tbPerform2: TToolButton
          Left = 441
          Top = 22
          Caption = 'Perform'
          ImageIndex = 128
          OnClick = tbPerform2Click
        end
        object tbPerform3: TToolButton
          Left = 527
          Top = 22
          Caption = 'Perform'
          ImageIndex = 129
          OnClick = tbPerform3Click
        end
        object tbPerform4: TToolButton
          Left = 613
          Top = 22
          Caption = 'Perform'
          ImageIndex = 130
          OnClick = tbPerform4Click
        end
        object tbPerform5: TToolButton
          Left = 699
          Top = 22
          Caption = 'Perform'
          ImageIndex = 131
          OnClick = tbPerform5Click
        end
      end
      object ToolBar1: TToolBar
        Left = 58
        Top = 0
        Width = 118
        Height = 48
        Align = alLeft
        ButtonHeight = 36
        ButtonWidth = 40
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebBottom]
        Images = FormImages.ImageListIcons
        ShowCaptions = True
        TabOrder = 1
        Wrapable = False
        object tbSelect: TToolButton
          Left = 0
          Top = 0
          Hint = 'Use the mouse button to target an object.'
          Caption = #1042#1099#1073#1086#1088
          Down = True
          Grouped = True
          ImageIndex = 122
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbSelectClick
        end
        object tbMove: TToolButton
          Left = 40
          Top = 0
          Hint = 'Use the mouse but to drag objects around.'
          Caption = 'Move'
          Grouped = True
          ImageIndex = 150
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbMoveClick
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 58
        Height = 48
        Align = alLeft
        BevelOuter = bvNone
        Color = clInactiveBorder
        TabOrder = 2
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 58
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          Caption = #1050#1091#1088#1089#1086#1088#1099
          Color = clInactiveBorder
          TabOrder = 0
        end
      end
    end
    object panCreatures: TPanel
      Left = 0
      Top = 183
      Width = 1551
      Height = 48
      Align = alTop
      TabOrder = 3
      Visible = False
      ExplicitWidth = 1000
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 57
        Height = 46
        Align = alLeft
        BevelOuter = bvNone
        Color = clInactiveBorder
        TabOrder = 0
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 57
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          Caption = #1046#1080#1074#1086#1090#1085#1099#1077':'
          Color = clInactiveBorder
          TabOrder = 0
        end
      end
      object tbCreatures: TToolBar
        Left = 58
        Top = 1
        Width = 1492
        Height = 46
        Align = alClient
        ButtonWidth = 90
        Caption = 'tbFauna'
        EdgeBorders = [ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 1
        ExplicitWidth = 941
        object tbBird: TToolButton
          Left = 0
          Top = 0
          Hint = 'Bird'
          Caption = #1055#1090#1080#1094#1072
          Down = True
          Grouped = True
          ImageIndex = 53
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbBirdClick
        end
        object tbFish: TToolButton
          Left = 90
          Top = 0
          Hint = 'Fish'
          Caption = #1056#1099#1073#1072
          Grouped = True
          ImageIndex = 94
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbFishClick
        end
        object tbDuck: TToolButton
          Left = 180
          Top = 0
          Hint = 'Duck'
          Caption = #1059#1090#1082#1072
          Grouped = True
          ImageIndex = 116
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbDuckClick
        end
        object tbLadybug: TToolButton
          Left = 270
          Top = 0
          Hint = 'Ladybug'
          Caption = #1046#1091#1095#1086#1082
          Grouped = True
          ImageIndex = 136
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLadybugClick
        end
        object tbHawk: TToolButton
          Left = 360
          Top = 0
          Hint = 'Hawk'
          Caption = #1071#1089#1090#1088#1077#1073
          Grouped = True
          ImageIndex = 98
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbHawkClick
        end
        object tbTurtle: TToolButton
          Left = 450
          Top = 0
          Hint = 'Turtle'
          Caption = #1063#1077#1088#1077#1087#1072#1093#1072
          Grouped = True
          ImageIndex = 108
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbTurtleClick
        end
        object tbCrab: TToolButton
          Left = 540
          Top = 0
          Hint = 'Crab'
          Caption = #1050#1088#1072#1073
          Grouped = True
          ImageIndex = 96
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCrabClick
        end
        object tbShark: TToolButton
          Left = 630
          Top = 0
          Hint = 'Shark'
          Caption = #1040#1082#1091#1083#1072
          Grouped = True
          ImageIndex = 107
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbSharkClick
        end
        object tbAnt: TToolButton
          Left = 720
          Top = 0
          Hint = 'Ant'
          Caption = #1052#1091#1088#1072#1074#1077#1081
          Grouped = True
          ImageIndex = 137
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAntClick
        end
        object tbGrazer: TToolButton
          Left = 810
          Top = 0
          Hint = 'Grazer'
          Caption = #1058#1088#1072#1074#1086#1103#1076#1085#1099#1081
          Grouped = True
          ImageIndex = 101
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbGrazerClick
        end
        object tbTrex: TToolButton
          Left = 900
          Top = 0
          Hint = 'Trex'
          Caption = #1056#1101#1082#1089
          Grouped = True
          ImageIndex = 100
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbTrexClick
        end
        object tbRabbit: TToolButton
          Left = 990
          Top = 0
          Hint = 'Rabbit'
          Caption = #1050#1088#1086#1083#1080#1082
          Grouped = True
          ImageIndex = 111
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbRabbitClick
        end
        object tbTiger: TToolButton
          Left = 1080
          Top = 0
          Hint = 'Tiger'
          Caption = #1058#1080#1075#1088
          Grouped = True
          ImageIndex = 115
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbTigerClick
        end
        object tbMouse: TToolButton
          Left = 1170
          Top = 0
          Hint = 'Mouse'
          Caption = #1052#1099#1096#1100
          Grouped = True
          ImageIndex = 114
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbMouseClick
        end
        object tbTerrier: TToolButton
          Left = 1260
          Top = 0
          Hint = 'Terrier'
          Caption = #1058#1077#1088#1100#1077#1088
          Grouped = True
          ImageIndex = 110
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          Visible = False
          OnClick = tbTerrierClick
        end
        object tbDolphin: TToolButton
          Left = 1350
          Top = 0
          Hint = 'Dolphin'
          Caption = #1044#1077#1083#1100#1092#1080#1085
          Grouped = True
          ImageIndex = 119
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbDolphinClick
        end
        object tbFox: TToolButton
          Left = 1440
          Top = 0
          Hint = 'Fox'
          Caption = #1051#1080#1089#1072
          Grouped = True
          ImageIndex = 113
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbFoxClick
        end
        object tbCreatureDeath: TToolButton
          Left = 1530
          Top = 0
          Hint = 'Creature Killer'
          Caption = #1043#1080#1073#1077#1083#1100
          Grouped = True
          ImageIndex = 41
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCreatureDeathClick
        end
      end
    end
    object panLand: TPanel
      Left = 0
      Top = 135
      Width = 1551
      Height = 48
      Align = alTop
      TabOrder = 4
      Visible = False
      ExplicitWidth = 1434
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 57
        Height = 46
        Align = alLeft
        BevelOuter = bvNone
        Color = clInactiveBorder
        TabOrder = 0
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 57
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          Caption = #1057#1091#1096#1072
          Color = clInactiveBorder
          TabOrder = 0
        end
      end
      object tbLand: TToolBar
        Left = 58
        Top = 1
        Width = 448
        Height = 46
        Align = alLeft
        ButtonWidth = 78
        Caption = 'tbLand'
        EdgeBorders = [ebLeft, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 1
        Transparent = False
        object tbRaiseLand: TToolButton
          Left = 0
          Top = 0
          Hint = 'Raise Land'
          Caption = #1055#1083#1072#1090#1086
          Grouped = True
          ImageIndex = 65
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbRaiseLandClick
        end
        object tbLowerLand: TToolButton
          Left = 78
          Top = 0
          Hint = 'Lower Land'
          Caption = #1053#1080#1079#1080#1085#1072
          Grouped = True
          ImageIndex = 64
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLowerLandClick
        end
        object tbMountain: TToolButton
          Left = 156
          Top = 0
          Hint = 'Mountain'
          Caption = #1043#1086#1088#1099
          Grouped = True
          ImageIndex = 86
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbMountainClick
        end
        object tbValley: TToolButton
          Left = 234
          Top = 0
          Hint = 'Valley'
          Caption = #1044#1086#1083#1080#1085#1072
          Grouped = True
          ImageIndex = 81
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          Style = tbsCheck
          OnClick = tbValleyClick
        end
        object tbFlattenLand: TToolButton
          Left = 0
          Top = 22
          Hint = 'Flatten'
          Caption = #1056#1072#1074#1085#1080#1085#1072
          Grouped = True
          ImageIndex = 70
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbFlattenLandClick
        end
        object tbLandDesert: TToolButton
          Left = 78
          Top = 22
          Hint = 'Land (1.0)'
          Caption = #1055#1091#1089#1090#1099#1085#1103
          Grouped = True
          ImageIndex = 102
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLandDesertClick
        end
        object tbLandDirt: TToolButton
          Left = 156
          Top = 22
          Hint = 'Land (2.5)'
          Caption = #1043#1088#1091#1085#1090
          Grouped = True
          ImageIndex = 103
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLandDirtClick
        end
        object tbLandField: TToolButton
          Left = 234
          Top = 22
          Hint = 'Land (5.0)'
          Caption = #1051#1091#1075#1072
          Down = True
          Grouped = True
          ImageIndex = 104
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLandFieldClick
        end
        object tbLandGrass: TToolButton
          Left = 0
          Top = 44
          Hint = 'Land (7.5)'
          Caption = 'LandGrass'
          Grouped = True
          ImageIndex = 105
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbLandGrassClick
        end
        object tbWaterSea: TToolButton
          Left = 78
          Top = 44
          Hint = 'Land (15.0)'
          Caption = 'Hills'
          Grouped = True
          ImageIndex = 106
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbWaterSeaClick
        end
      end
    end
    object panFauna: TPanel
      Left = 0
      Top = 87
      Width = 1551
      Height = 48
      Align = alTop
      TabOrder = 5
      Visible = False
      ExplicitWidth = 1000
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 57
        Height = 46
        Align = alLeft
        BevelOuter = bvNone
        Color = clInactiveBorder
        TabOrder = 0
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 57
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          Caption = #1056#1072#1089#1090#1077#1085#1080#1103
          Color = clInactiveBorder
          TabOrder = 0
        end
      end
      object tbFauna: TToolBar
        Left = 58
        Top = 1
        Width = 1492
        Height = 46
        Align = alClient
        ButtonWidth = 115
        Caption = 'tbFauna'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        Images = FormImages.ImageListIcons
        List = True
        ShowCaptions = True
        TabOrder = 1
        ExplicitHeight = 42
        object tbPlantForest: TToolButton
          Left = 0
          Top = 0
          Hint = 'Plant Forest'
          Caption = #1051#1077#1089
          Down = True
          Grouped = True
          ImageIndex = 75
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbPlantForestClick
        end
        object tbEvolvingTree: TToolButton
          Left = 115
          Top = 0
          Hint = 'Evolving Tree'
          Caption = #1069#1074#1086#1076#1077#1088#1077#1074#1086
          Grouped = True
          ImageIndex = 148
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbEvolvingTreeClick
        end
        object tbAppleTree: TToolButton
          Left = 230
          Top = 0
          Hint = 'Apple Tree'
          Caption = #1071#1073#1083#1086#1085#1103
          Grouped = True
          ImageIndex = 47
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAppleTreeClick
        end
        object tbOrangeTree: TToolButton
          Left = 345
          Top = 0
          Hint = 'Orange Tree'
          Caption = #1040#1087#1077#1083#1100#1089#1080#1085#1086#1089
          Grouped = True
          ImageIndex = 49
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbOrangeTreeClick
        end
        object tbAquaPlant: TToolButton
          Left = 460
          Top = 0
          Hint = 'Aquatic Plant'
          Caption = #1050#1072#1084#1099#1096
          Grouped = True
          ImageIndex = 120
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAquaPlantClick
        end
        object tbGrass: TToolButton
          Left = 575
          Top = 0
          Hint = 'Grass'
          Caption = #1058#1088#1072#1074#1072
          Grouped = True
          ImageIndex = 112
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbGrassClick
        end
        object tbFireTree: TToolButton
          Left = 690
          Top = 0
          Hint = 'Fire Tree'
          Caption = #1045#1083#1100
          Grouped = True
          ImageIndex = 48
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbFireTreeClick
        end
        object tbApple: TToolButton
          Left = 805
          Top = 0
          Hint = 'Apple'
          Caption = #1071#1073#1083#1086#1082#1080
          Grouped = True
          ImageIndex = 9
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAppleClick
        end
        object tbEvolvingFruit: TToolButton
          Left = 920
          Top = 0
          Hint = 'Evolving Fruit'
          Caption = #1069#1074#1086#1092#1088#1091#1082#1090
          Grouped = True
          ImageIndex = 149
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbEvolvingFruitClick
        end
        object tbOrange: TToolButton
          Left = 1035
          Top = 0
          Hint = 'Orange'
          Caption = #1040#1087#1077#1083#1100#1089#1080#1085
          Grouped = True
          ImageIndex = 11
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbOrangeClick
        end
        object tbAppleSeed: TToolButton
          Left = 1150
          Top = 0
          Hint = 'Apple Seed'
          Caption = #1047#1105#1088#1085#1072' '#1103#1073#1083#1086#1082#1072
          Grouped = True
          ImageIndex = 54
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbAppleSeedClick
        end
        object tbOrangeSeed: TToolButton
          Left = 1265
          Top = 0
          Hint = 'Orange Seed'
          Caption = #1047#1105#1088#1085#1072' '#1072#1087#1077#1083#1100#1089#1080#1085#1072
          Grouped = True
          ImageIndex = 54
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbOrangeSeedClick
        end
        object tbEvolvingSeed: TToolButton
          Left = 1380
          Top = 0
          Hint = 'Evolving Seed'
          Caption = #1069#1074#1086#1079#1077#1088#1085#1086
          Grouped = True
          ImageIndex = 54
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbEvolvingSeedClick
        end
        object tbPlantClearer: TToolButton
          Left = 1495
          Top = 0
          Hint = 'Plant Clearer'
          Caption = 'Plant Clearer'
          Grouped = True
          ImageIndex = 42
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbPlantClearerClick
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 739
    Width = 1551
    Height = 19
    Panels = <
      item
        Width = 75
      end
      item
        Width = 300
      end
      item
        Width = 350
      end>
    OnClick = StatusBarClick
    ExplicitTop = 632
    ExplicitWidth = 1000
  end
  object Panel2: TPanel
    Left = 0
    Top = 555
    Width = 1551
    Height = 184
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 1000
    ExplicitHeight = 77
    object Image1: TImage
      Left = 144
      Top = 32
      Width = 105
      Height = 105
    end
    object GLSceneViewer: TGLSceneViewer
      Left = 0
      Top = 0
      Width = 1551
      Height = 153
      Camera = GLCamera
      Buffer.FogEnvironment.FogColor.Color = {00000000F8FEFE3E0000803F0000803F}
      Buffer.FogEnvironment.FogStart = 1.000000000000000000
      Buffer.FogEnvironment.FogEnd = 100.000000000000000000
      Buffer.FogEnvironment.FogMode = fmExp
      Buffer.FogEnvironment.FogDistance = fdEyePlane
      Buffer.BackgroundColor = clBlack
      Buffer.ContextOptions = [roDoubleBuffer, roStencilBuffer, roRenderToWindow]
      FieldOfView = 74.831977844238280000
      PenAsTouch = False
      OnMouseLeave = GLSceneViewerMouseLeave
      OnMouseEnter = GLSceneViewerMouseEnter
      Align = alClient
      OnDblClick = GLSceneViewerDblClick
      OnMouseDown = GLSceneViewerMouseDown
      OnMouseMove = GLSceneViewerMouseMove
      OnMouseUp = GLSceneViewerMouseUp
      TabOrder = 0
    end
    object panCamera: TPanel
      Left = 0
      Top = 153
      Width = 1551
      Height = 31
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 46
      ExplicitWidth = 1000
      object tbViews: TToolBar
        Left = 1
        Top = 1
        Width = 1549
        Height = 29
        Align = alClient
        ButtonWidth = 75
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Images = FormImages.ImageListIcons
        List = True
        ParentFont = False
        ShowCaptions = True
        TabOrder = 0
        object Label19: TLabel
          Left = 0
          Top = 0
          Width = 42
          Height = 22
          Caption = #1050#1072#1084#1077#1088#1072':'
        end
        object tbCameraPlanet: TToolButton
          Left = 42
          Top = 0
          Hint = 'Focus on your planet (P).'
          Caption = #1055#1083#1072#1085#1077#1090#1072
          Grouped = True
          ImageIndex = 63
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraPlanetClick
        end
        object tbFloatCamera: TToolButton
          Left = 117
          Top = 0
          Hint = 'Free floating camera.'
          Caption = 'Free'
          Grouped = True
          ImageIndex = 39
          Style = tbsCheck
          OnClick = tbFloatCameraClick
        end
        object tbCameraTarget: TToolButton
          Left = 192
          Top = 0
          Hint = 'The camera follows a target (\).'
          Caption = 'Target'
          Grouped = True
          ImageIndex = 35
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraTargetClick
        end
        object tbCameraEyes: TToolButton
          Left = 267
          Top = 0
          Hint = 'Eyes view.'
          Caption = 'Eyes'
          Grouped = True
          ImageIndex = 151
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraEyesClick
        end
        object tbCameraGalaxy: TToolButton
          Left = 342
          Top = 0
          Hint = 'View the planet from afar.'
          Caption = #1050#1086#1089#1084#1086#1089
          Grouped = True
          ImageIndex = 76
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraGalaxyClick
        end
        object tbCameraSatellite: TToolButton
          Left = 417
          Top = 0
          Hint = 'Rotate around the planet from space.'
          Caption = #1057#1072#1090#1077#1083#1083#1080#1090
          Grouped = True
          ImageIndex = 80
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraSatelliteClick
        end
        object tbCameraAvatar: TToolButton
          Left = 492
          Top = 0
          Hint = 'Walk around on your planet in first person mode (Tab).'
          Caption = #1055#1088#1086#1075#1091#1083#1082#1072
          Grouped = True
          ImageIndex = 34
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          OnClick = tbCameraAvatarClick
        end
        object tbZoomIn: TToolButton
          Left = 567
          Top = 0
          Hint = 'Zoom In (+ key or mouse wheel)'
          Caption = 'In'
          ImageIndex = 37
          ParentShowHint = False
          ShowHint = True
          OnClick = tbZoomInClick
        end
        object tbZoomOut: TToolButton
          Left = 642
          Top = 0
          Hint = 'Zoom Out (- key or mouse wheel)'
          Caption = 'Out'
          ImageIndex = 139
          ParentShowHint = False
          ShowHint = True
          OnClick = tbZoomOutClick
        end
        object tbPriorTarget: TToolButton
          Left = 717
          Top = 0
          Hint = 'Target the previous target to view ([).'
          Caption = 'Prev'
          ImageIndex = 68
          ParentShowHint = False
          ShowHint = True
          OnClick = tbPriorTargetClick
        end
        object tbNextTarget: TToolButton
          Left = 792
          Top = 0
          Hint = 'Find the next target to view (]).'
          Caption = 'Next'
          ImageIndex = 69
          ParentShowHint = False
          ShowHint = True
          OnClick = tbNextTargetClick
        end
        object tbNextKind: TToolButton
          Left = 867
          Top = 0
          Caption = 'Kind'
          ImageIndex = 157
          OnClick = tbNextKindClick
        end
      end
    end
  end
  object GLScene: TGLScene
    Left = 661
    Top = 234
    object GalaxyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      object SkyDome: TGLSkyDome
        Bands = <
          item
            StartColor.Color = {0000000000000000000000000000803F}
            StopAngle = 90.000000000000000000
            StopColor.Color = {0000000000000000000000000000803F}
            Slices = 3
          end>
        Stars = <>
      end
      object GLShadowVolume: TGLShadowVolume
        Lights = <>
        Occluders = <>
        Mode = svmOff
        object PlanetModel: TGLFreeForm
          Material.BackProperties.Ambient.Color = {0000000000000000000000000000803F}
          Material.BackProperties.Diffuse.Color = {0000000000000000000000000000803F}
          Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
          Material.FrontProperties.Diffuse.Color = {0000000000000000000000000000803F}
          Material.Texture.MinFilter = miLinear
          Material.Texture.Disabled = False
          Up.Coordinates = {00000000000080BF0000000000000000}
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
          MaterialLibrary = GLMaterialLibrary
        end
      end
      object SeedCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
      object FruitCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
      object ForestCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
      object SpiritCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
      object CloudCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
      object ProxyCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
      object WaterBubble: TGLActor
        Material.FrontProperties.Ambient.Color = {00000000F8FEFE3E0000803F0000803F}
        Material.FrontProperties.Diffuse.Color = {000000000000003F0000803F0000003F}
        Material.FrontProperties.Emission.Color = {00000000F8FEFE3E0000803F0000803F}
        Material.BlendingMode = bmTransparency
        Material.MaterialOptions = [moNoLighting]
        Up.Coordinates = {00000000000080BF0000000000000000}
        Interval = 100
        UseMeshMaterials = False
      end
      object Atmosphere: TGLFreeForm
        Material.FrontProperties.Ambient.Color = {C6BF3F3FDCD8583FDCD8583F0000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803E}
        Material.FrontProperties.Emission.Color = {C6BF3F3FDCD8583FDCD8583F0000803F}
        Material.BlendingMode = bmTransparency
        Material.MaterialOptions = [moNoLighting]
        Up.Coordinates = {00000000000080BF0000000000000000}
        AutoCentering = [macCenterX, macCenterY, macCenterZ]
        UseMeshMaterials = False
      end
      object SatellitesCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
      object EffectsCube: TGLDummyCube
        CubeSize = 1.000000000000000000
        object PlanetCursor: TGLSphere
          Material.FrontProperties.Ambient.Color = {3333733F3333733F3333733F0000803F}
          Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000003F}
          Material.FrontProperties.Emission.Color = {0000803E0000803E0000803E0000803F}
          Material.BlendingMode = bmTransparency
          Visible = False
          Radius = 1.000000000000000000
        end
        object FlashLight: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          Diffuse.Color = {EBE0E03E9A93133FE4DB5B3F0000803F}
          SpotCutOff = 15.000000000000000000
          SpotExponent = 2.000000000000000000
        end
        object CameraLight: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          Diffuse.Color = {EAEA6A3FEAEA6A3FA7AD2D3F0000803F}
          SpotCutOff = 180.000000000000000000
        end
        object PredictLines: TGLLines
          Visible = False
          LineColor.Color = {9A99993E9A99993E0000803F0000803F}
          Nodes = <>
          NodesAspect = lnaCube
          NodeSize = 0.019999999552965160
          SplineMode = lsmCubicSpline
          Options = [loUseNodeColorForLines]
        end
        object TrackLines: TGLLines
          Visible = False
          LineColor.Color = {0000803F0000803F0000803F3333733F}
          NodeColor.Color = {0000803F0000803F0000803F0000803F}
          Nodes = <>
          NodesAspect = lnaCube
          NodeSize = 0.019999999552965160
          SplineMode = lsmCubicSpline
          Options = [loUseNodeColorForLines]
        end
      end
    end
    object ModelCube: TGLDummyCube
      Visible = False
      CubeSize = 1.000000000000000000
      object Animals: TGLDummyCube
        CubeSize = 1.000000000000000000
        object DuckModel: TGLFreeForm
          Material.BackProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
          Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
          Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
          Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
          Material.FrontProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
          Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
          Material.FrontProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
          Material.FrontProperties.Shininess = 1
          Material.FrontProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
          Material.Texture.ImageAlpha = tiaAlphaFromIntensity
          Material.Texture.TextureWrap = twNone
          Material.Texture.TextureFormat = tfLuminanceAlpha
          Material.Texture.Compression = tcHighQuality
          Material.Texture.FilteringQuality = tfAnisotropic
          AutoCentering = [macCenterX, macCenterY]
          MaterialLibrary = GLMaterialLibrary
        end
        object SharkModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {C6BF3F3FDCD8583FDCD8583F0000803F}
          Material.FrontProperties.Diffuse.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          Material.FrontProperties.Emission.Color = {0000803E0000803E0000803E0000803F}
          Material.FaceCulling = fcNoCull
        end
        object HawkModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {EC51B83ECDCC4C3EEC51B83D0000803F}
          Material.FrontProperties.Emission.Color = {A19E9E3ECFBC3C3ECFBC3C3E0000803F}
          Material.FaceCulling = fcNoCull
          NormalsOrientation = mnoInvert
        end
        object TerrierModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {9A99193F9A99193F9A99193F0000803F}
          Material.FrontProperties.Diffuse.Color = {6666663F6666663F6666663F0000803F}
          Material.FrontProperties.Emission.Color = {CDCCCC3ECDCCCC3ECDCCCC3E0000803F}
          Material.FaceCulling = fcNoCull
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
        end
        object CrabModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {EC51383F6666E63ECDCC4C3E0000803F}
          Material.FrontProperties.Emission.Color = {938E0E3F938C0C3E938C0C3E0000803F}
          Material.FaceCulling = fcNoCull
        end
        object TurtleModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {938C0C3E938E0E3FDCD6D63E0000803F}
          Material.FrontProperties.Diffuse.Color = {9484843EDBDEDE3E9484843E0000803F}
          Material.FrontProperties.Emission.Color = {CDCC4C3ECDCC4C3ECDCC4C3E0000803F}
          Material.FaceCulling = fcCull
        end
        object TrexModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {0000000000000000F6281C3F0000803F}
          Material.FrontProperties.Emission.Color = {9484843E9484843EDBDEDE3E0000803F}
          Material.FaceCulling = fcNoCull
        end
        object GrazerModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {9484843EDBDEDE3E9484843E0000803F}
          Material.FrontProperties.Emission.Color = {DCD6D63E938E0E3F938C0C3E0000803F}
          Material.FaceCulling = fcNoCull
        end
        object MouseModel: TGLFreeForm
          Material.FaceCulling = fcNoCull
        end
        object TigerModel: TGLFreeForm
          Material.FrontProperties.Emission.Color = {9392123FF3F2F23E000000000000803F}
          Material.FrontProperties.Specular.Color = {9F9E1E3FFBFAFA3E000000000000803F}
          Material.FaceCulling = fcNoCull
        end
        object RabbitModel: TGLFreeForm
          Material.FrontProperties.Emission.Color = {3333333F3333333F3333333F0000803F}
          Material.FaceCulling = fcNoCull
        end
        object FoxModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {EC51B83ECDCC4C3EEC51B83D0000803F}
          Material.FrontProperties.Emission.Color = {A9A5253FB1A8283EB1A8283E0000803F}
          Material.FaceCulling = fcNoCull
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
        end
        object LadyBugModel: TGLFreeForm
          Material.Texture.Disabled = False
          Scale.Coordinates = {CDCCCC3DCDCCCC3DCDCCCC3D00000000}
          AutoCentering = [macUseBarycenter]
          MaterialLibrary = GLMaterialLibrary
        end
      end
      object Plants: TGLDummyCube
        CubeSize = 1.000000000000000000
        object OrangeTreeModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {938C0C3E938E0E3F938C0C3E0000803F}
          Material.FrontProperties.Diffuse.Color = {91ED7C3EA69BC43EC520303D0000803F}
          Material.FrontProperties.Emission.Color = {2B87963E52B8DE3E6F12033C0000803F}
          Material.FaceCulling = fcNoCull
          AutoCentering = [macUseBarycenter]
          NormalsOrientation = mnoInvert
        end
        object GrassModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {ACC8483ECDCC4C3FACC8483E0000803F}
          Material.FrontProperties.Emission.Color = {938C0C3E938E0E3F938C0C3E0000803F}
          Material.FaceCulling = fcNoCull
        end
        object SeedModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {B81E053FA470BD3EB81E853E0000803F}
          Material.FrontProperties.Diffuse.Color = {A19E9E3ECFBC3C3ECFBC3C3E0000803F}
          Material.FrontProperties.Emission.Color = {3D0AD73EB81E853E9A99193E0000803F}
          Visible = False
          AutoCentering = [macUseBarycenter]
          UseMeshMaterials = False
        end
        object OrangeModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {0000803FF8FEFE3E000000000000803F}
          Material.FrontProperties.Diffuse.Color = {0000803F0000003F000000000000803F}
          Material.FrontProperties.Emission.Color = {0AD7633FD7A3F03ECDCC4C3E0000803F}
          Visible = False
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
          UseMeshMaterials = False
        end
        object AppleModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {0000803F00000000000000000000803F}
          Material.FrontProperties.Diffuse.Color = {0000803F0000803E000000000000803F}
          Material.FrontProperties.Emission.Color = {938E0E3F938C0C3E938C0C3E0000803F}
          Visible = False
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
          UseMeshMaterials = False
        end
        object AppleTreeModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {938E0E3F938C0C3E938C0C3E0000803F}
          Material.FrontProperties.Diffuse.Color = {CFBC3C3EA19E9E3ECFBC3C3E0000803F}
          Material.FrontProperties.Emission.Color = {938C0C3E938E0E3F938C0C3E0000803F}
          Material.FaceCulling = fcNoCull
          Visible = False
          AutoCentering = [macUseBarycenter]
          UseMeshMaterials = False
          NormalsOrientation = mnoInvert
        end
        object AquaPlant: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {CFBC3C3EA19E9E3ECFBC3C3E0000803F}
          Material.FrontProperties.Diffuse.Color = {938C0C3E938E0E3F938C0C3E0000803F}
          Material.FrontProperties.Emission.Color = {ACC8483ECDCC4C3FACC8483E0000803F}
          Material.FaceCulling = fcNoCull
          Scale.Coordinates = {CDCCCC3DCDCCCC3DCDCCCC3D00000000}
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
        end
        object EvolvingTree: TGLFreeForm
          Material.FrontProperties.Emission.Color = {CDCCCC3ECDCCCC3ECDCCCC3E0000803F}
          Material.FaceCulling = fcNoCull
          AutoCentering = [macUseBarycenter]
          NormalsOrientation = mnoInvert
        end
        object EvolvingFruit: TGLFreeForm
          Material.FrontProperties.Emission.Color = {CDCC4C3ECDCC4C3ECDCC4C3E0000803F}
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
        end
        object EvolvingSeed: TGLFreeForm
          Material.FrontProperties.Emission.Color = {CDCC4C3ECDCC4C3ECDCC4C3E0000803F}
          AutoCentering = [macUseBarycenter]
        end
        object FireTree: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {938E0E3F938C0C3E938C0C3E0000803F}
          Material.FrontProperties.Diffuse.Color = {CFBC3C3EA19E9E3ECFBC3C3E0000803F}
          Material.FrontProperties.Emission.Color = {938C0C3E938E0E3F938C0C3E0000803F}
          NormalsOrientation = mnoInvert
        end
      end
      object FishModels: TGLDummyCube
        CubeSize = 1.000000000000000000
        object FishModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {CDCC0C3FD7A3F03E295C0F3E0000803F}
          Material.FrontProperties.Diffuse.Color = {2DB23D3F986E923E5839343E0000803F}
          Material.FrontProperties.Emission.Color = {6ABC343F9CC4E03EE926313E0000803F}
        end
        object FishGirlModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {A8C62B3F21B0123FE926313E0000803F}
          Material.FrontProperties.Diffuse.Color = {D9CE573F39B4C83EFED4783E0000803F}
          Material.FrontProperties.Emission.Color = {60E5503F3D0AD73E7F6A3C3E0000803F}
        end
      end
      object BirdModels: TGLDummyCube
        CubeSize = 1.000000000000000000
        object BirdFlap1: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {AE47613ED7A3303F52B85E3F0000803F}
          Material.FrontProperties.Emission.Color = {CDCC4C3FCDCC4C3FCDCC4C3F0000803F}
          Material.FaceCulling = fcNoCull
        end
        object BirdFlap2: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {AE47613ED7A3303F52B85E3F0000803F}
          Material.FrontProperties.Emission.Color = {CDCC4C3FCDCC4C3FCDCC4C3F0000803F}
          Material.FaceCulling = fcNoCull
        end
        object BirdFlap3: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {AE47613ED7A3303F52B85E3F0000803F}
          Material.FrontProperties.Emission.Color = {CDCC4C3FCDCC4C3FCDCC4C3F0000803F}
          Material.FaceCulling = fcNoCull
        end
        object BirdFlap4: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {AE47613ED7A3303F52B85E3F0000803F}
          Material.FrontProperties.Emission.Color = {CDCC4C3FCDCC4C3FCDCC4C3F0000803F}
          Material.FaceCulling = fcNoCull
        end
        object BirdSit: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {AE47613ED7A3303F52B85E3F0000803F}
          Material.FrontProperties.Emission.Color = {CDCC4C3FCDCC4C3FCDCC4C3F0000803F}
          Material.FaceCulling = fcNoCull
        end
        object BirdDead: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {AE47613ED7A3303F52B85E3F0000803F}
          Material.FrontProperties.Emission.Color = {3333333F3333333F3333333F0000803F}
          Material.FaceCulling = fcNoCull
        end
      end
      object Tools: TGLDummyCube
        CubeSize = 1.000000000000000000
        object SpiritModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {ACC8483EACC8483ECDCC4C3F0000803F}
          Material.FrontProperties.Diffuse.Color = {8A8F0F3F8A8F0F3FBEBC3C3F0000803F}
          Material.FrontProperties.Emission.Color = {9484843E9484843EDBDEDE3E0000803F}
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
        end
        object BeaconModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {6666663FC3F5683F48E17A3F0000803F}
          Material.FrontProperties.Emission.Color = {999F1F3F999F1F3FBEBEBE3E0000803F}
        end
        object BombModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {EC51B83E0000803ECDCC4C3E0000803F}
          Material.FrontProperties.Emission.Color = {A19E9E3ECFBC3C3ECFBC3C3E0000803F}
        end
        object ExplosionModel: TGLFreeForm
        end
        object ShellModel: TGLFreeForm
        end
        object WeaponModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {A19E9E3ECFBC3C3ECFBC3C3E0000803F}
          Material.FrontProperties.Emission.Color = {B1A8A83EB1A8A83EB1A8A83E0000803F}
        end
        object MissileDefence: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {9A99993E9A99993E9A99993E0000803F}
          Material.FrontProperties.Diffuse.Color = {B1A8A83EB1A8A83EB1A8A83E0000803F}
          Material.FrontProperties.Emission.Color = {9A99193E9A99193E9A99193E0000803F}
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
          UseMeshMaterials = False
        end
        object Missile: TGLFreeForm
        end
      end
      object WeatherCube: TGLDummyCube
        CubeSize = 1.000000000000000000
        object CloudModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {B1A8283FB1A8283FB1A8283F0000803F}
          Material.FrontProperties.Diffuse.Color = {D9D8583FE5E4643FF9F8783F0000803F}
          Material.FrontProperties.Emission.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          Material.Texture.ImageAlpha = tiaTopLeftPointColorTransparent
          ObjectsSorting = osRenderFarthestFirst
          Visible = False
          AutoCentering = [macUseBarycenter]
          UseMeshMaterials = False
        end
        object SnowModel: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
          Material.FrontProperties.Emission.Color = {6666663F6666663F6666663F0000803F}
        end
        object IcebergModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {9A99993E9A99993E0000803F0000403F}
          Material.FrontProperties.Diffuse.Color = {BEBEBE3E999F1F3F999F1F3F0000403F}
          Material.FrontProperties.Emission.Color = {CDCC4C3ECDCC4C3ECDCC4C3E0000403F}
          Material.BlendingMode = bmAdditive
        end
        object MoonModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {ACC8483EACC8483ECDCC4C3F0000803F}
          Material.FrontProperties.Diffuse.Color = {9A99993E9A99993E0000803F0000803F}
          Material.FrontProperties.Emission.Color = {938C0C3EDCD6D63E938E0E3F0000803F}
          Visible = False
        end
        object SunModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {0000803F00000000000000000000803F}
          Material.FrontProperties.Diffuse.Color = {0000803F00000000000000000000803F}
          Material.FrontProperties.Emission.Color = {0000803F0000803F000000000000803F}
          Visible = False
        end
        object MoonAsteroidModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {EBE0E03E9A93133FE4DB5B3F0000803F}
          Material.FrontProperties.Diffuse.Color = {C6BF3F3FDCD8583FDCD8583F0000803F}
          Material.FrontProperties.Emission.Color = {ACC8483EACC8483ECDCC4C3F0000803F}
        end
        object AsteroidModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
          Material.FrontProperties.Diffuse.Color = {CDCC4C3ECDCC4C3ECDCC4C3E0000803F}
          Material.FrontProperties.Emission.Color = {9A99193E9A99193E9A99193E0000803F}
          AutoCentering = [macCenterX, macCenterY, macCenterZ]
        end
        object SunAsteroidModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {0000803F0000003F000000000000803F}
          Material.FrontProperties.Diffuse.Color = {0000803F0000803F000000000000803F}
          Material.FrontProperties.Emission.Color = {0000803F00000000000000000000803F}
        end
        object RainModel: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          Material.FrontProperties.Diffuse.Color = {00000000000000000000803F0000803F}
          Material.FrontProperties.Emission.Color = {00000000F8FEFE3E0000803F0000803F}
          Scale.Coordinates = {00004040000040400000404000000000}
        end
        object CloudModelOld: TGLFreeForm
          Material.FrontProperties.Ambient.Color = {39B4283F39B4283F39B4283F0000803F}
          Material.FrontProperties.Diffuse.Color = {FED4583F2FDD643F8716793F0000803F}
          Material.FrontProperties.Emission.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          UseMeshMaterials = False
        end
      end
      object Dolphins: TGLDummyCube
        CubeSize = 1.000000000000000000
        object Dolphin1: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          Material.FrontProperties.Emission.Color = {E17A943E1F85EB3EF628DC3E0000803F}
          AutoCentering = [macUseBarycenter]
        end
        object Dolphin2: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          Material.FrontProperties.Emission.Color = {E17A943E1F85EB3EF628DC3E0000803F}
          AutoCentering = [macUseBarycenter]
        end
        object Dolphin3: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          Material.FrontProperties.Emission.Color = {E17A943E1F85EB3EF628DC3E0000803F}
          AutoCentering = [macUseBarycenter]
        end
        object Dolphin4: TGLFreeForm
          Material.FrontProperties.Diffuse.Color = {BEBEBE3E999F1F3F999F1F3F0000803F}
          Material.FrontProperties.Emission.Color = {E17A943E1F85EB3EF628DC3E0000803F}
          AutoCentering = [macUseBarycenter]
        end
      end
      object Ants: TGLDummyCube
        CubeSize = 1.000000000000000000
        object AntModel1: TGLFreeForm
          MaterialLibrary = GLMaterialLibrary
        end
        object AntModel2: TGLFreeForm
          MaterialLibrary = GLMaterialLibrary
        end
        object AntModel3: TGLFreeForm
          MaterialLibrary = GLMaterialLibrary
        end
      end
    end
    object FloatCube: TGLDummyCube
      Visible = False
      CubeSize = 1.000000000000000000
    end
    object LightsCube: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object SoundSystem: TGLDummyCube
      Visible = False
      CubeSize = 1.000000000000000000
    end
    object HUDCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLObjectText: TGLHUDText
        Visible = False
        BitmapFont = GLWindowsBitmapFont1
        Rotation = 0.000000000000000000
      end
    end
    object GLCamera: TGLCamera
      DepthOfView = 500.000000000000000000
      FocalLength = 100.000000000000000000
      Position.Coordinates = {000048420000803F0000A0C10000803F}
      Direction.Coordinates = {00000000000000000000803F00000000}
    end
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    Enabled = False
    MaxDeltaTime = 1.000000000000000000
    SleepLength = 5
    OnProgress = GLCadencerProgress
    Left = 753
    Top = 306
  end
  object GLMaterialLibrary: TGLMaterialLibrary
    Left = 1140
    Top = 216
  end
  object FPSTimer: TTimer
    Interval = 1024
    OnTimer = FPSTimerTimer
    Left = 1250
    Top = 398
  end
  object GLSoundLibrary: TGLSoundLibrary
    Samples = <>
    Left = 1057
    Top = 364
  end
  object GLPolygonPFXManager1: TGLPolygonPFXManager
    Cadencer = GLCadencer
    Friction = 1.000000000000000000
    ParticleSize = 1.000000000000000000
    LifeColors = <
      item
        LifeTime = 3.000000000000000000
        SizeScale = 1.000000000000000000
      end>
    Left = 1300
    Top = 216
  end
  object GLWindowsBitmapFont1: TGLWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 848
    Top = 237
  end
  object AVIRecorder: TGLAVIRecorder
    FPS = 24
    GLSceneViewer = GLSceneViewer
    Width = 320
    Height = 200
    Filename = 'photos\aimovie.avi'
    Left = 1250
    Top = 511
  end
  object GLBass: TGLSMBASS
    MaxChannels = 32
    MasterVolume = 1.000000000000000000
    Sources = <>
    Left = 754
    Top = 237
  end
end
