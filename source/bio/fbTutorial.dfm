object FormTutorial: TFormTutorial
  Left = 325
  Top = 87
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  Caption = 'Tutorial'
  ClientHeight = 603
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 41
    Align = alTop
    Caption = 'Tutorial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Lucida Sans'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 432
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 440
    Height = 521
    Align = alClient
    BorderWidth = 10
    TabOrder = 1
    ExplicitWidth = 432
    ExplicitHeight = 496
    object redIntro: TRichEdit
      Left = 11
      Top = 11
      Width = 418
      Height = 499
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -6
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'Your planet is a habitat biosphere with leaving creatures.  '
        
          'To create a planet, you will need water, land, a sun, and food. ' +
          ' When you start'
        
          'a new reality, your planet is covered in water.  You will have t' +
          'o clear some'
        'water away, to make land.  '
        'After this is done, you may add some trees.'
        ''
        'First Steps:'
        '---------------------------'
        ''
        '1) Click on the Cosmic Menu'
        '- add a Sun'
        '- add a moon'
        ''
        '2) Click on the Land Menu'
        '- add some Dirt squares'
        '- add some Field/Grass/etc squares'
        ''
        '3) Click on the Fauna Menu'
        '- add some Apple seeds'
        '- add some Orange seeds'
        ''
        '4) Click on the Creatures Menu'
        '- add some Birds'
        '- add some Fish'
        ''
        '5) Experiment'
        '- add other Creatures'
        '- add Beacons to make rivers'
        '- Load other worlds'
        '- Save your world'
        ''
        'Now that you have a basic scene made, '
        ''
        ''
        'you can let it run and watch as the world grow.'
        '')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 562
    Width = 440
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 537
    ExplicitWidth = 432
    object Panel4: TPanel
      Left = 330
      Top = 1
      Width = 109
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 322
      object btnRun: TBitBtn
        Left = 18
        Top = 6
        Width = 75
        Height = 25
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
    end
  end
end
