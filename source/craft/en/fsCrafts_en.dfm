object FormCrafts: TFormCrafts
  Left = 0
  Top = 0
  Caption = 'SpaceCrafts'
  ClientHeight = 514
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 105
    Height = 514
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 489
    object tvCraft: TTreeView
      Left = 1
      Top = 1
      Width = 103
      Height = 512
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnClick = tvCraftClick
      Items.NodeData = {
        070500000009540054007200650065004E006F00640065003100000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001095300750062
        006D006100720069006E00650000002D0000000000000000000000FFFFFFFFFF
        FFFFFF000000000000000000000000000107530068007500740074006C006500
        0000310000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
        000000010941007300740072006F00640072006F006E0000002F000000000000
        0000000000FFFFFFFFFFFFFFFF00000000000000000000000000010847007200
        6100760069006A00650074000000310000000000000000000000FFFFFFFFFFFF
        FFFF000000000000000000000000000109500068006F0074006F006E006A0065
        007400}
      ExplicitHeight = 487
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 64
  end
end
