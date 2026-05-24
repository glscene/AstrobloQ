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
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 412
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 387
    object tvCraft: TTreeView
      Left = 1
      Top = 1
      Width = 127
      Height = 410
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnClick = tvCraftClick
      Items.NodeData = {
        080400000009540054007200650065004E006F00640065003500000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000010921
        04430431043C043004400438043D04300400002D0000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000000000000000105280430044204
        42043B040000330000000000000000000000FFFFFFFFFFFFFFFF000000000000
        00000000000000000000000108130440043004320438043B0451044204000039
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000000
        00000000010B10043D043D043804330438043B044F0442043E044004}
      ExplicitHeight = 385
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 64
  end
end
