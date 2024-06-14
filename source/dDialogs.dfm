object DataModuleDialogs: TDataModuleDialogs
  Height = 457
  Width = 958
  PixelsPerInch = 168
  object SaveTextFileDialog: TSaveTextFileDialog
    Left = 378
    Top = 58
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
    Left = 123
    Top = 60
  end
end
