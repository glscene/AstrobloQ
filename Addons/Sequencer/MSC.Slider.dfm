object Component_Slider: TComponent_Slider
  Left = 0
  Top = 0
  Width = 163
  Height = 261
  TabOrder = 0
  TabStop = True
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 163
    Height = 261
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 135
    ExplicitHeight = 237
    DesignSize = (
      163
      261)
    object Label1: TLabel
      Left = 57
      Top = 54
      Width = 33
      Height = 15
      Caption = '&'#1050#1072#1085#1072#1083
      FocusControl = Combo_Channel
    end
    object Label2: TLabel
      Left = 57
      Top = 104
      Width = 28
      Height = 15
      Caption = '&Value'
    end
    object Button_CTl_Names: TSpeedButton
      Left = 1
      Top = 1
      Width = 161
      Height = 33
      Align = alTop
      Caption = 'Controller'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label_CaptionClick
      ExplicitLeft = 0
      ExplicitTop = -3
      ExplicitWidth = 129
    end
    object Label_Min: TLabel
      Left = 33
      Top = 34
      Width = 54
      Height = 15
      Caption = 'Label_Min'
    end
    object Label_Max: TLabel
      Left = 33
      Top = 239
      Width = 55
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Label_Max'
      ExplicitTop = 215
    end
    object Combo_Channel: TComboBox
      Left = 56
      Top = 75
      Width = 49
      Height = 23
      ItemIndex = 0
      TabOrder = 0
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16')
    end
    object Edit_Value: TEdit
      Left = 56
      Top = 123
      Width = 49
      Height = 23
      TabOrder = 1
      Text = '0'
    end
    object Tracker: TTrackBar
      Left = 2
      Top = 32
      Width = 25
      Height = 220
      Anchors = [akLeft, akTop, akBottom]
      Orientation = trVertical
      TabOrder = 2
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = TrackerChange
      ExplicitHeight = 196
    end
    object Combo_Ctl: TComboBox
      Left = 2
      Top = 5
      Width = 161
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      DropDownCount = 16
      TabOrder = 3
      Text = 'Combo_Ctl'
      Visible = False
      OnClick = Combo_CtlClick
      ExplicitWidth = 133
    end
  end
  object Popup: TPopupMenu
    Left = 64
    Top = 176
  end
end
