object FormKeyboard: TFormKeyboard
  Left = 435
  Top = 67
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Controls'
  ClientHeight = 800
  ClientWidth = 747
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
    Width = 747
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Keyboard and Mouse'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -28
    Font.Name = 'Lucida Sans'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 728
    Width = 747
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 1
    object Panel4: TPanel
      Left = 557
      Top = 1
      Width = 189
      Height = 70
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnRun: TBitBtn
        Left = 32
        Top = 11
        Width = 131
        Height = 43
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
  object Panel2: TPanel
    Left = 0
    Top = 72
    Width = 747
    Height = 656
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BorderWidth = 10
    TabOrder = 2
    object redIntro: TRichEdit
      Left = 11
      Top = 11
      Width = 725
      Height = 634
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'HOW TO USE THE MOUSE INTERFACE'
        ''
        'Planet Mode'
        '--------------------'
        'Use the left mouse button by itself to use a tool.'
        'Use the right mouse button to move the view.'
        'Use the mouse wheel to zoom in and out of the planet.'
        ''
        'Avatar Mode (First Person)'
        '---------------------'
        'From the planet camera, you can use the mouse wheel'
        'to zoom in very close.  This will take you to first person mode.'
        'Use the mouse wheel to jump back off the planet.'
        ''
        'Use the left mouse button by itself to use a tool.'
        'Use the right mouse button to look around.'
        'Hold down both mouse buttons to move forwards.'
        'Hold down the middle button to move backwards.'
        ''
        ''
        'KEYBOARD'
        '-------------------------------'
        'Up - Move Forward'
        'Down - Move Backward'
        'Left - Turn Left'
        'Right - Turn Right'
        'Shift - Run'
        ''
        'W - Move Forward'
        'S - Move Backward'
        'A - Move Left'
        'D - Move Right'
        ''
        ''
        'CAMERA'
        '------------'
        'P - Planet'
        '\ - Follow Target'
        '[ - Previous Target'
        '] - Next Target'
        'TAB - First person'
        ''
        'Home - Look Up'
        'End - Look Down'
        'R - Raise Camera Height'
        'F - Lower Camera Height'
        ''
        'ESC - Leave Fullscreen Mode'
        ''
        'Targetting'
        '----------------'
        '1 - Sun'
        '2 - Moon'
        '3 - Bird'
        '4 - Fish'
        '5 - Apple Tree'
        '6 - Orange Tree'
        '7 - Cloud'
        '8 - Asteroid'
        '0 - Bot')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
