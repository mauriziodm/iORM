object DataSetView: TDataSetView
  Left = 0
  Top = 0
  Caption = 'DataSetView'
  ClientHeight = 407
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 216
    Top = 40
    Width = 320
    Height = 120
    DataSource = MasterDataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ioViewModelBridge1: TioViewModelBridge
    Left = 136
    Top = 96
  end
  object ModelMasterDataSet: TioModelDataSet
    ViewModelBridge = ioViewModelBridge1
    ModelPresenter = 'ModelMasterPresenter'
    Left = 136
    Top = 184
  end
  object MasterDataSource: TDataSource
    DataSet = ModelMasterDataSet
    Left = 136
    Top = 232
  end
end
