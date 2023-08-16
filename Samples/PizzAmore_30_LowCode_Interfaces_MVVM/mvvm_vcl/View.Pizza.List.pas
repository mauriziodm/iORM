unit View.Pizza.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.DBCGrids, Model.Interfaces, Vcl.Mask;

type

  [diViewFor(IPizza), diViewFor(IPizza, 'embedded')]
  TViewPizzaList = class(TViewBaseForList)
    CtrlGridPizzas: TDBCtrlGrid;
    DBTextName: TDBText;
    DBTextPrice: TDBText;
    DBImage: TDBImage;
    BSMasterName: TStringField;
    BSMasterPrice: TCurrencyField;
    BSMasterImage: TGraphicField;
    Label1: TLabel;
    DBEditWhereID: TDBEdit;
    Label2: TLabel;
    DBEditWhereName: TDBEdit;
    Label3: TLabel;
    DBEditWhereFromPrice: TDBEdit;
    Label4: TLabel;
    DBEditWhereToPrice: TDBEdit;
    BSWhereID: TIntegerField;
    BSWhereName: TStringField;
    BSWhereFromPrice: TCurrencyField;
    BSWhereToPrice: TCurrencyField;
    procedure CtrlGridPizzasDblClick(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TViewPizzas }

constructor TViewPizzaList.Create(AOwner: TComponent);
begin
  inherited;
  PanelWhere.Visible := acBack.Visible;
end;

procedure TViewPizzaList.CtrlGridPizzasDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
