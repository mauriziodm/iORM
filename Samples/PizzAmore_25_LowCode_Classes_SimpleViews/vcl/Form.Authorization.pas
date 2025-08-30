unit Form.Authorization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXCtrls,
  iORM, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl;

type

  TAuthorizationForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    GroupBoxOrder: TGroupBox;
    SwitchOrderSelect: TToggleSwitch;
    LabelOrder: TLabel;
    LabelOrderRow: TLabel;
    SwitchOrderRowSelect: TToggleSwitch;
    LabelOrderCustomer: TLabel;
    SwitchOrderCustomerSelect: TToggleSwitch;
    GroupBoxCustomer: TGroupBox;
    LabelCustomer: TLabel;
    SwitchCustomerSelect: TToggleSwitch;
    GroupBoxPizza: TGroupBox;
    LabelPizza: TLabel;
    LabelPizzaIngredientRiw: TLabel;
    LabelIngredient: TLabel;
    SwitchPizzaSelect: TToggleSwitch;
    SwitchPizzaIngredientRowSelect: TToggleSwitch;
    SwitchIngredientSelect: TToggleSwitch;
    SwitchOrderInsert: TToggleSwitch;
    SwitchOrderUpdate: TToggleSwitch;
    SwitchOrderDelete: TToggleSwitch;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SwitchOrderRowInsert: TToggleSwitch;
    SwitchOrderRowUpdate: TToggleSwitch;
    SwitchOrderRowDelete: TToggleSwitch;
    SwitchOrderCustomerInsert: TToggleSwitch;
    SwitchOrderCustomerUpdate: TToggleSwitch;
    SwitchOrderCustomerDelete: TToggleSwitch;
    SwitchCustomerInsert: TToggleSwitch;
    SwitchCustomerUpdate: TToggleSwitch;
    SwitchCustomerDelete: TToggleSwitch;
    SwitchPizzaInsert: TToggleSwitch;
    SwitchPizzaUpdate: TToggleSwitch;
    SwitchPizzaDelete: TToggleSwitch;
    SwitchPizzaIngredientRowInsert: TToggleSwitch;
    SwitchPizzaIngredientRowUpdate: TToggleSwitch;
    SwitchPizzaIngredientRowDelete: TToggleSwitch;
    SwitchIngredientInsert: TToggleSwitch;
    SwitchIngredientUpdate: TToggleSwitch;
    SwitchIngredientDelete: TToggleSwitch;
    GroupBoxETM: TGroupBox;
    LabelEtnRepository: TLabel;
    SwitchEtmSelect: TToggleSwitch;
    SwitchEtmUpdate: TToggleSwitch;
    ActionList1: TActionList;
    acBack: TioBSCloseQuery;
    Label9: TLabel;
    procedure SwitchClick(Sender: TObject);
  public
  function Authorize(AAuthDecisionRequest: IioAuthDecisionRequest): TioAuthDecisionResult;
  end;

var
  AuthorizationForm: TAuthorizationForm;

implementation

uses
  iORM.Abstraction, System.StrUtils;

{$R *.dfm}

{ TAuthorizationForm }

procedure TAuthorizationForm.SwitchClick(Sender: TObject);
begin
  TioApplication.SessionDataStore.ClearAuthorizationCache;
end;

function TAuthorizationForm.Authorize(AAuthDecisionRequest: IioAuthDecisionRequest): TioAuthDecisionResult;
begin
  // All other classes always authorized
  Result.Authorized := True;
  // TOrder
  if AAuthDecisionRequest.TypeName = 'TOrder' then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchOrderSelect.IsOn;
      atInsert: Result.Authorized := SwitchOrderInsert.IsOn;
      atUpdate: Result.Authorized := SwitchOrderUpdate.IsOn;
      atDelete: Result.Authorized := SwitchOrderDelete.IsOn;
    end
  else
  // TOrderRow
  if AAuthDecisionRequest.TypeName = 'TOrderRow' then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchOrderRowSelect.IsOn;
      atInsert: Result.Authorized := SwitchOrderRowInsert.IsOn;
      atUpdate: Result.Authorized := SwitchOrderRowUpdate.IsOn;
      atDelete: Result.Authorized := SwitchOrderRowDelete.IsOn;
    end
  else
  // TCustomer + 'order' as authorization-context (TCustomer inside an order)
  if (AAuthDecisionRequest.TypeName = 'TCustomer') and (AAuthDecisionRequest.AuthorizationContext = 'order') then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchOrderCustomerSelect.IsOn;
      atInsert: Result.Authorized := SwitchOrderCustomerInsert.IsOn;
      atUpdate: Result.Authorized := SwitchOrderCustomerUpdate.IsOn;
      atDelete: Result.Authorized := SwitchOrderCustomerDelete.IsOn;
    end
  else
  // TCustomer
  if AAuthDecisionRequest.TypeName = 'TCustomer' then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchCustomerSelect.IsOn;
      atInsert: Result.Authorized := SwitchCustomerInsert.IsOn;
      atUpdate: Result.Authorized := SwitchCustomerUpdate.IsOn;
      atDelete: Result.Authorized := SwitchCustomerDelete.IsOn;
    end
  else
  // TPizza
  if AAuthDecisionRequest.TypeName = 'TPizza' then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchPizzaSelect.IsOn;
      atInsert: Result.Authorized := SwitchPizzaInsert.IsOn;
      atUpdate: Result.Authorized := SwitchPizzaUpdate.IsOn;
      atDelete: Result.Authorized := SwitchPizzaDelete.IsOn;
    end
  else
  // TPizzaIngredientRow
  if AAuthDecisionRequest.TypeName = 'TPizzaIngredientRow' then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchPizzaIngredientRowSelect.IsOn;
      atInsert: Result.Authorized := SwitchPizzaIngredientRowInsert.IsOn;
      atUpdate: Result.Authorized := SwitchPizzaIngredientRowUpdate.IsOn;
      atDelete: Result.Authorized := SwitchPizzaIngredientRowDelete.IsOn;
    end
  else
  // TIngredient
  if AAuthDecisionRequest.TypeName = 'TIngredient' then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchIngredientSelect.IsOn;
      atInsert: Result.Authorized := SwitchIngredientInsert.IsOn;
      atUpdate: Result.Authorized := SwitchIngredientUpdate.IsOn;
      atDelete: Result.Authorized := SwitchIngredientDelete.IsOn;
    end
  else
  // TEtmRepository
  if AAuthDecisionRequest.TypeName = 'TEtmRepository' then
    case AAuthDecisionRequest.ActionType of
      atSelect: Result.Authorized := SwitchEtmSelect.IsOn;
      atUpdate: Result.Authorized := SwitchEtmUpdate.IsOn;
    end;
  // -------------------------
  // If not authorized then set an exception message
  if not Result.Authorized then
    Result.ExceptionMsg := Format('%s action not authorized for class %s %s (%s intent, access-token = "%s")',
      [
        io.Enums.OrdinalToString<TioPersistenceActionType>(Ord(AAuthDecisionRequest.ActionType)),
        AAuthDecisionRequest.TypeName,
        IfThen(AAuthDecisionRequest.AuthorizationContext.IsEmpty, '', Format('on "%s" context', [AAuthDecisionRequest.AuthorizationContext])),
        io.Enums.OrdinalToString<TioPersistenceIntentType>(Ord(AAuthDecisionRequest.Intent)),
        AAuthDecisionRequest.Token
      ]);
end;

end.
