object FormHercrussel: TFormHercrussel
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Hercshprung-Russel Diagram'
  ClientHeight = 758
  ClientWidth = 1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 30
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 868
    Height = 758
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object PanelRight: TPanel
    Left = 868
    Top = 0
    Width = 235
    Height = 758
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alRight
    TabOrder = 1
  end
  object GLScene1: TGLScene
    Left = 56
    Top = 32
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 50
    Top = 134
  end
end
