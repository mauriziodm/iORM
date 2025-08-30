unit Form.Start;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniLabel, uniImage, uniButton, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, iORM.MVVM.ViewContextProvider, uniPageControl;

type
  TStartForm = class(TUniForm)
    VMBridge: TioViewModelBridge;
    ActionList1: TActionList;
    acQuit: TioViewAction;
    acShowOrders: TioViewAction;
    acShowCustomers: TioViewAction;
    acShowPizzas: TioViewAction;
    VCProviderForm: TioViewContextProvider;
    MainPageControl: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    PanelLogo: TUniPanel;
    UniPanel1: TUniPanel;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    Panelmenu: TUniPanel;
    ButtonOrders: TUniButton;
    ButtonCustomers: TUniButton;
    ButtonPizzas: TUniButton;
    ButtonQuit: TUniButton;
    ButtonVersion: TUniButton;
    acIOrmVersion: TioViewAction;
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
  StartForm.MainPageControl.ActivePage.Close;
end;

procedure TStartForm.VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
var
  LNewTabSheet: TUniTabSheet;
  LSelf: TStartForm;
begin
  LSelf := StartForm;
  LNewTabSheet := TUniTabSheet.Create(LSelf);
  LNewTabSheet.PageControl := LSelf.MainPageControl;
  LSelf.MainPageControl.ActivePage := LNewTabSheet;
  ResultViewContext := LNewTabSheet;
end;

initialization
  RegisterAppFormClass(TStartForm);
//  TRegisterClasses.RegisterClasses; // Moved to ServerModule

end.
