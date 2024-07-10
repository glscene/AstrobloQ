object dmDialogs: TdmDialogs
  OnCreate = DataModuleCreate
  Height = 657
  Width = 968
  PixelsPerInch = 168
  object SaveTextFileDialog: TSaveTextFileDialog
    Left = 354
    Top = 218
  end
  object OpenTextFileDialog: TOpenTextFileDialog
    Filter = 
      'Data with coma (*.csv)|*.csv|Data with space (*.dat)|*.dat|All (' +
      '*.*)|*.*'
    Encodings.Strings = (
      'ASCII'
      'ANSI'
      'Unicode'
      'Big Endian Unicode'
      'UTF-8'
      'UTF-7')
    Left = 107
    Top = 212
  end
  object OpenDialog: TOpenDialog
    Left = 112
    Top = 64
  end
  object SaveDialog: TSaveDialog
    Left = 352
    Top = 72
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 112
    Top = 336
  end
  object SavePictureDialog: TSavePictureDialog
    Left = 352
    Top = 336
  end
end
