object FormCrafts: TFormCrafts
  Left = 0
  Top = 0
  Caption = 'SpaceCrafts'
  ClientHeight = 412
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 105
    Height = 412
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 387
    object tvCraft: TTreeView
      Left = 1
      Top = 1
      Width = 103
      Height = 410
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnClick = tvCraftClick
      Items.NodeData = {
        070400000009540054007200650065004E006F00640065002D00000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001075300680075
        00740074006C0065000000310000000000000000000000FFFFFFFFFFFFFFFF00
        00000000000000000000000001095300750062006D006100720069006E006500
        00002F0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
        0000000108470072006100760069006A00650074000000310000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000000109500068006F00
        74006F006E006A0065007400}
      ExplicitHeight = 385
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 64
  end
end
