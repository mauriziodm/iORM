unit MicroView.OrderRow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.OrderRow, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB,
  iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type

  [diViewFor(TOrderRow)]
  TMicroViewOrderRow = class(TFrame)
    OrderRowMicroVMBridge: TioViewModelBridge;
    MDSorderRow: TioModelDataSet;
    SourceOrderRow: TDataSource;
    DBEdit1: TDBEdit;
    MDSorderRowDescription: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
