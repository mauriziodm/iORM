unit iORM.MVVM.ViewContextProviderContainer;

interface

uses
  iORM.MVVM.Interfaces, iORM.CommonTypes, System.Generics.Collections;

type

  TioViewContextProviderContainerInternal = TList<IioContainedViewContextProvider>;

  TioViewContextProviderContainer = class
  private
    class var FInternalContainer: IioThreadSafe<TioViewContextProviderContainerInternal>;
    class procedure Build; static;
    class function ItemIndexByName(const AProviderName:String): Integer; static;
  public
    class procedure RegisterProvider(const AProvider:IioContainedViewContextProvider); static;
    class procedure UnregisterProvider(const AProvider:IioContainedViewContextProvider); static;
    class procedure SetActiveProvider(const AName:String); overload; static;
    class procedure SetActiveProvider(const AProvider:IioContainedViewContextProvider); overload; static;
    class function GetProvider: IioContainedViewContextProvider; overload; static;
    class function GetProvider(const AName:String): IioContainedViewContextProvider; overload; static;
  end;

implementation

uses
  iORM, System.Classes, iORM.Exceptions, System.SysUtils;

{ TioViewContextProviderContainer }

class procedure TioViewContextProviderContainer.Build;
begin
  FInternalContainer := io.NewThreadSafe(TioViewContextProviderContainerInternal.Create);
end;

class function TioViewContextProviderContainer.GetProvider: IioContainedViewContextProvider;
begin
  if FInternalContainer.Count = 0 then
    raise EioException.Create('TioViewContextProviderContainer.GetProvider: No providers registered.');
  // Get the active provider (the active provider is the first of the list (ItemIndex = 0)
  Result := FInternalContainer.Items[0];
end;

class function TioViewContextProviderContainer.GetProvider(
  const AName: String): IioContainedViewContextProvider;
var
  LIndex: Integer;
begin
  // Get the Index
  LIndex := ItemIndexByName(AName);
  if LIndex = -1 then
    raise EioException.Create(Format('TioViewContextProviderContainer.SetActiveProvider: Provider not registered (%s).', [AName]));
  // Set the result value
  Result := FInternalContainer.Items[LIndex];
end;

class function TioViewContextProviderContainer.ItemIndexByName(
  const AProviderName: String): Integer;
var
  I : Integer;
begin
  Result := -1;
  for I := 0 to FInternalContainer.Count-1 do
    if (FInternalContainer.Items[I] as TComponent).Name = AProviderName then
      Exit(I);
end;

class procedure TioViewContextProviderContainer.RegisterProvider(
  const AProvider: IioContainedViewContextProvider);
var
  LProviderName: String;
begin
  // Get the provider name
  LProviderName := (AProvider as TComponent).Name;
  // Check if a provider with the same name already exist
  if ItemIndexByName(LProviderName) <> -1 then
    raise EioException.Create(Format('TioViewContextProviderContainer.RegisterProvider: A provider with the same name is already registered (%s).', [LProviderName]));
  // Register the provider
  if AProvider.RegisterAsActive then
    FInternalContainer.Insert(0, AProvider)
  else
    FInternalContainer.Add(AProvider);
end;

class procedure TioViewContextProviderContainer.SetActiveProvider(
  const AProvider: IioContainedViewContextProvider);
var
  LOldIndex: Integer;
begin
  // Get the current/old ItemIndex
  LOldIndex := FInternalContainer.IndexOf(AProvider);
  if LOldIndex = -1 then
    raise EioException.Create('TioViewContextProviderContainer.SetActiveProvider: Provider not registered (%s).');
  // Move the provider at the top position of the list (Index = 0)
  FInternalContainer.Move(LOldIndex, 0);
end;

class procedure TioViewContextProviderContainer.SetActiveProvider(
  const AName: String);
var
  LOldIndex: Integer;
begin
  // Get the current/old ItemIndex
  LOldIndex := ItemIndexByName(AName);
  if LOldIndex = -1 then
    raise EioException.Create(Format('TioViewContextProviderContainer.SetActiveProvider: Provider not registered (%s).', [AName]));
  // Move the provider at the top position of the list (Index = 0)
  FInternalContainer.Move(LOldIndex, 0);
end;

class procedure TioViewContextProviderContainer.UnregisterProvider(
  const AProvider: IioContainedViewContextProvider);
begin
  FInternalContainer.Remove(AProvider);
end;

initialization

  TioViewContextProviderContainer.Build;

end.
