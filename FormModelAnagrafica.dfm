inherited ModelAnagraficaForm: TModelAnagraficaForm
  Left = 0
  Caption = 'ModelAnagraficaForm'
  ClientHeight = 693
  ClientWidth = 721
  OldCreateOrder = True
  ExplicitWidth = 721
  ExplicitHeight = 693
  PixelsPerInch = 96
  TextHeight = 13
  object TA: TIBOTable
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    FieldOptions = []
    Left = 563
    Top = 2
  end
  object SourceTA: TDataSource
    AutoEdit = False
    DataSet = TA
    Left = 593
    Top = 2
  end
end
