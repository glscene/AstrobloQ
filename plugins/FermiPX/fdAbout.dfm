object FormAbout: TFormAbout
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'About'
  ClientHeight = 448
  ClientWidth = 877
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 168
  TextHeight = 30
  object Memo1: TMemo
    Left = 266
    Top = 126
    Width = 338
    Height = 170
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Alignment = taCenter
    Lines.Strings = (
      'Developers and contributors'
      ''
      'Pavel Vassiliev'
      'Lev Koptyaev'
      'Danil Wasilyev ')
    TabOrder = 0
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 877
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Fermi Paradox Simulator'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 746
    Top = 394
    Width = 131
    Height = 44
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
end
