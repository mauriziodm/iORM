unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm,
  iORM.MVVM.Components.ViewContextProvider;

type
  TMainForm = class(TUniForm)
    FormsVCProvider: TioViewContextProvider;
    procedure FormsVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure UniFormCreate(Sender: TObject);
    procedure FormsVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uniFormViewContext, iORM,
  V.Interfaces, VM.Interfaces, iORM.MVVM.ViewContextContainer;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.FormsVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TMainForm.FormsVCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TuniViewContextForm.Create(uniGUIApplication.UniApplication);
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  // Get the main view
  io.di.LocateViewVM<IMainView, IPersonsViewModel>.SetViewContext(Self).Get;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
