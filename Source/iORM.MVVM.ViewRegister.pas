unit iORM.MVVM.ViewRegister;

interface

uses
  System.Generics.Collections, iORM.MVVM.ViewRegisterItem,
  System.Classes, iORM.MVVM.Components.ViewContextProvider,
  iORM.MVVM.Interfaces, System.SysUtils, iORM.AbstractionLayer.Framework;

type

  TioViewRegister = class(TInterfacedObject, IioViewRegister)
  private
    FInternalContainer: TList<TioViewContextRegisterItem>;
    FFreeViewsTimer: TioTimer;
    procedure _FreeViewTimerEventHandler(Sender: TObject);
    procedure _PostponedReleaseAllViewContexts;
    function FindItemByView(const AView: TComponent): TioViewContextRegisterItem;
    function FindItemByViewContext(const AViewContext: TComponent): TioViewContextRegisterItem;
    function ContainsView(const AView:TComponent): Boolean;
    function ContainsViewContext(const AViewContext:TComponent): Boolean;
    function GetItemByView(const AView: TComponent): TioViewContextRegisterItem;
    function GetItemByViewContext(const AViewContext: TComponent): TioViewContextRegisterItem;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AView, AViewContext: TComponent; const AViewContextProvider:TioViewContextProvider; const AViewContextFreeMethod:TProc);
    procedure ReleaseAllViewContexts;
    procedure HideAllViewContexts;
    procedure ShowAllViewContexts;
    property ItemByView[const AView:TComponent]:TioViewContextRegisterItem read GetItemByView;
    property ItemByViewContext[const AViewContext:TComponent]:TioViewContextRegisterItem read GetItemByViewContext;
  end;

implementation

uses
  iORM.Exceptions;

{ TioViewContextRegister }

procedure TioViewRegister.Add(const AView, AViewContext: TComponent;
  const AViewContextProvider:TioViewContextProvider;
  const AViewContextFreeMethod:TProc);
var
  LItem: TioViewContextRegisterItem;
begin
  // Check parameters validity
  if not Assigned(AView) then
    raise EioException.Create('TioViewContextRegister', 'Add', 'The View must be assigned.');
  if not Assigned(AViewContext) then
    raise EioException.Create('TioViewContextRegister', 'Add', 'The ViewContext must be assigned.');
  // Avoid duplicated Views or ViewContexts
  // NB: Il codice commentato qui sotto è stato sistutuito con l'if sottostante per risolvere
  //      l'errore che si creva nel caso in cui una View (e relativo ViewModel) fosse registrata (nel D.I.C.) come
  //      AsSingleton e quindi rimanendo vivi quando non servivano più, ma poi riutilizzati in seguito, ne causava
  //      una ulteriore registrazione della vista stessa nel ViewRegister del ViewModel (sempre quello) con conseguente
  //      errore di "Vista registrata due volte". Così sembra funzionare bene, vedere nel tempo se da problemi in altri casi.
//  if ContainsView(Aview) then
//    raise EioException.Create('TioViewContextRegister', 'Add', 'Duplicated View.');
//  if ContainsViewContext(AViewContext) then
//    raise EioException.Create('TioViewContextRegister', 'Add', 'Duplicated ViewContext.');
  if ContainsView(Aview) or ContainsViewContext(AViewContext) then
    Exit;
  // Register
  LItem := TioViewContextRegisterItem.Create(AView, AViewContext, AViewContextProvider, AViewContextFreeMethod);
  FInternalContainer.Add(LItem);
end;

function TioViewRegister.ContainsView(const AView: TComponent): Boolean;
begin
  Result := Assigned(FindItemByView(AView));
end;

function TioViewRegister.ContainsViewContext(
  const AViewContext: TComponent): Boolean;
begin
  Result := Assigned(FindItemByViewContext(AViewContext));
end;

constructor TioViewRegister.Create;
begin
  inherited;
  FInternalContainer := TList<TioViewContextRegisterItem>.Create;
  FFreeViewsTimer := TioTimer.CreateNewTimer;
  FFreeViewsTimer.Enabled := False;
  FFreeViewsTimer.OnTimer := _FreeViewTimerEventHandler;
  FFreeViewsTimer.Interval := 100;
end;

destructor TioViewRegister.Destroy;
begin
  FInternalContainer.Free;
  FFreeViewsTimer.Free;
  inherited;
end;

function TioViewRegister.FindItemByView(
  const AView: TComponent): TioViewContextRegisterItem;
var
  LItem: TioViewContextRegisterItem;
begin
  Result := nil;
  for LItem in FInternalContainer do
    if LItem.View = AView then
      Exit(LItem);
end;

function TioViewRegister.FindItemByViewContext(
  const AViewContext: TComponent): TioViewContextRegisterItem;
var
  LItem: TioViewContextRegisterItem;
begin
  Result := nil;
  for LItem in FInternalContainer do
    if LItem.ViewContext = AViewContext then
      Exit(LItem);
end;

function TioViewRegister.GetItemByView(
  const AView: TComponent): TioViewContextRegisterItem;
begin
  Result := FindItemByView(AView);
  if not Assigned(Result) then
    raise EioException.Create('TioViewContextRegister', 'GetItemByView', 'View not found.');
end;

function TioViewRegister.GetItemByViewContext(
  const AViewContext: TComponent): TioViewContextRegisterItem;
begin
  Result := FindItemByViewContext(AViewContext);
  if not Assigned(Result) then
    raise EioException.Create('TioViewContextRegister', 'GetItemByViewContext', 'ViewContext not found.');
end;

procedure TioViewRegister.HideAllViewContexts;
var
  I: Integer;
begin
  for I := FInternalContainer.Count-1 downto 0 do
    FInternalContainer.Items[I].HideViewContext;
end;

procedure TioViewRegister.ReleaseAllViewContexts;
begin
  // Avvia il timer per il release posticipato di tutti i ViewContexts
  //  e, di conseguenza, di tutte le viste.
  //  NB: Ho dovuto posticiparlo con un timer perchè altrimenti con i TcxButton
  //       della DevExpress c'erano dei problemi in alcuni casi
  FFreeViewsTimer.Enabled := True;
end;

procedure TioViewRegister.ShowAllViewContexts;
var
  I: Integer;
begin
  for I := FInternalContainer.Count-1 downto 0 do
    FInternalContainer.Items[I].ShowViewContext;
end;

procedure TioViewRegister._FreeViewTimerEventHandler(Sender: TObject);
begin
  FFreeViewsTimer.Enabled := False;
  _PostponedReleaseAllViewContexts;
end;

procedure TioViewRegister._PostponedReleaseAllViewContexts;
var
//  LItem: TioViewContextRegisterItem;
  I: Integer;
begin
//  for LItem in FInternalContainer do
//    LItem.ReleaseViewContext;
  // NB: Il codice sopra dava dei problemi perchè, con Marco Mottadelli, abbiamo notato
  //      che quando viene chiamato il metoto "FreeViews" poi gli viene distrutto il
  //      register stesso e questo causava un errore se usavamo il for-in. Con un
  //      norlame ciclo for invece sembra andare bene.
  for I := FInternalContainer.Count-1 downto 0 do
    FInternalContainer.Items[I].ReleaseViewContext;
end;

end.

