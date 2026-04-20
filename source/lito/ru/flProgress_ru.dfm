object frmProgress: TfrmProgress
  Left = 698
  Top = 678
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1075#1088#1077#1089#1089
  ClientHeight = 63
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnHide = FormHide
  TextHeight = 13
  object ggTaskProgress: TGauge
    Left = 8
    Top = 32
    Width = 305
    Height = 20
    Progress = 0
  end
  object lblTask: TLabel
    Left = 8
    Top = 8
    Width = 305
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object timTask: TTimer
    Enabled = False
    OnTimer = timTaskTimer
    Left = 8
  end
end
