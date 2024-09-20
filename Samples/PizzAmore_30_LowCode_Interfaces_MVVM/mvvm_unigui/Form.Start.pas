unit Form.Start;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniLabel, uniImage, uniButton, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, iORM.MVVM.ViewContextProvider;

type
  TStartForm = class(TUniForm)
    VMBridge: TioViewModelBridge;
    ActionList1: TActionList;
    acQuit: TioViewAction;
    acShowOrders: TioViewAction;
    acShowCustomers: TioViewAction;
    acShowPizzas: TioViewAction;
    VCProviderForm: TioViewContextProvider;
    procedure VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
  private
  public
  end;

function StartForm: TStartForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Form.ViewContext, uniGUIFrame,
  RegisterClasses;

function StartForm: TStartForm;
begin
  Result := TStartForm(UniMainModule.GetFormInstance(TStartForm));
end;

procedure TStartForm.VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TUniFrame).Align := alClient;
end;

procedure TStartForm.VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AViewContext as TUniForm).Close;
end;

procedure TStartForm.VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(UniApplication);
end;

initialization
  RegisterAppFormClass(TStartForm);
  TRegisterClasses.RegisterClasses;

end.
