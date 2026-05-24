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
    ExplicitHeight = 387
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
        080400000009540054007200650065004E006F00640065003500000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000010953
        00750062006D006100720069006E0065000000310000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000000000000000107530068007500
        740074006C0065000000330000000000000000000000FFFFFFFFFFFFFFFF0000
        0000000000000000000000000000000108470072006100760069006A00650074
        000000350000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        00000000000000000109500068006F0074006F006E006A0065007400}
      ExplicitHeight = 385
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 64
  end
end
