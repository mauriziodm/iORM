unit iORM.MVVM.ViewContextContainer;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, system.Classes, iORM.MVVM.Interfaces,
  iORM;

type

  TioViewContextContainerInternal = TDictionary<TComponent,IioContainedViewContextProvider>;

  TioViewContextContainer = class
  private
    class var FInternalContainer: IioThreadSafe<TioViewContextContainerInternal>;
    class procedure Build; static;
  public
    class function NewViewContext(const AView:TComponent; const AViewContextProvider:IioContainedViewContextProvider): TComponent; static;
    class procedure ReleaseViewContext(const AView:TComponent); static;
  end;

implementation

uses
  iORM.MVVM.ViewContextProvider, iORM.Exceptions,
  iORM.MVVM.ViewContextProviderContainer;

{ TioViewContextContainer }

class procedure TioViewContextContainer.Build;
begin
  FInternalContainer := io.NewThreadSafe(TioViewContextContainerInternal.Create);
end;

class function TioViewContextContainer.NewViewContext(const AView: TComponent;
  const AViewContextProvider: IioContainedViewContextProvider): TComponent;
begin
  Result := nil;
  if not Assigned(AViewContextProvider) then
    EioException.Create('TioViewContextContainer.GetViewContext: Invalid provider.');
  // Get the ViewContext for the form and register it into the ViewContextContainer
  Result := AViewContextProvider.NewViewContext(AView);
  FInternalContainer.Add(Result, AViewContextProvider);
end;

class procedure TioViewContextContainer.ReleaseViewContext(const AView: TComponent);
var
  LViewContext: TComponent;
  LViewContextProvider: IioContainedViewContextProvider;
begin
  // Get the ViewContext
  LViewContext := TioViewContextProvider.ExtractViewContext(AView, False);
  // Get the ViewContextProvider that generated the ViewContext and
  //  remove it from the container
  LViewContextProvider := FInternalContainer.Items[LViewContext];
  FInternalContainer.Remove(LViewContext);
  // Call the Releas method of the ViewContextProvider
  LViewContextProvider.ReleaseViewContext(AView);
end;

initialization

  TioViewContextContainer.Build;

end.
