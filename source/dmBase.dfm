object DataModuleBase: TDataModuleBase
  Height = 519
  Width = 805
  PixelsPerInch = 168
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 128
    Top = 200
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\dgoni\Documents\Embarcadero\Studio\STARS_DB\DA' +
        'TA\A_Delaunay.sqlite'
      'DriverID=SQLite')
    Left = 320
    Top = 56
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 128
    Top = 56
  end
  object FDBatchMove: TFDBatchMove
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 330
    Top = 198
  end
end
