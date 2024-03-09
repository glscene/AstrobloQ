object fmTutorial: TfmTutorial
  Left = 325
  Top = 87
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  Caption = 'Tutorial'
  ClientHeight = 952
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  PixelsPerInch = 168
  TextHeight = 24
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 71
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Tutorial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -28
    Font.Name = 'Lucida Sans'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 71
    Width = 750
    Height = 810
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    BorderWidth = 10
    TabOrder = 1
    object redIntro: TRichEdit
      Left = 11
      Top = 11
      Width = 728
      Height = 788
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        
          'Your planet is a habitat for artificial intelligence to live on.' +
          '  '
        
          'To create a planet, you will need water, land, a sun, and food. ' +
          ' When you start'
        
          'a new reality, your planet is covered in water.  You will have t' +
          'o clear some'
        
          'water away, to make land.   After this is done, you should add s' +
          'ome trees.'
        ''
        ''
        'First Steps:'
        '---------------------------'
        ''
        '1) Click on the Galaxy Menu'
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
        
          'Now that you have a basic galaxy made, you can let it run and wa' +
          'tch it grow.'
        '')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 881
    Width = 750
    Height = 71
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alBottom
    TabOrder = 2
    object Panel4: TPanel
      Left = 558
      Top = 1
      Width = 191
      Height = 69
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnRun: TBitBtn
        Left = 32
        Top = 11
        Width = 130
        Height = 44
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
    end
  end
end
