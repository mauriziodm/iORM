unit iORM.MVVM.ViewContextProviderContainer;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.ViewContextProvider;

type

  TioViewContextProviderContainerInternal = TList<TioViewContextProvider>;

  TioViewContextProviderContainer = class
  private
    class var FInternalContainer: TioViewContextProviderContainerInternal;
    class procedure Build; static;
    class procedure CleanUp; static;
    class function ItemIndexByName(const AProviderName:String): Integer; static;
  public
    class procedure RegisterProvider(const AProvider:TioViewContextProvider); static;
    class procedure UnregisterProvider(const AProvider:TioViewContextProvider); static;
    class procedure SetActiveProvider(const AName:String); overload; static;
    class procedure SetActiveProvider(const AProvider:TioViewContextProvider); overload; static;
    class function GetProvider: TioViewContextProvider; overload; static;
    class function GetProvider(const AName:String): TioViewContextProvider; overload; static;
  end;

implementation

uses
  iORM, System.Classes, iORM.Exceptions, System.SysUtils;

{ TioViewContextProviderContainer }

class procedure TioViewContextProviderContainer.Build;
begin
  FInternalContainer := TioViewContextProviderContainerInternal.Create;
end;

class function TioViewContextProviderContainer.GetProvider: TioViewContextProvider;
begin
  Result := nil;
  // Get the active provider (the active provider is the first of the list (ItemIndex = 0)
  if FInternalContainer.Count > 0 then
    Result := FInternalContainer.Items[0];
end;

class procedure TioViewContextProviderContainer.CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioViewContextProviderContainer.GetProvider(
  const AName: String): TioViewContextProvider;
var
  LIndex: Integer;
begin
  Result := nil;
  // Get the Index
  LIndex := ItemIndexByName(AName);
  // Set the result value
  if LIndex > -1 then
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
  const AProvider: TioViewContextProvider);
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
  const AProvider: TioViewContextProvider);
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
  const AProvider: TioViewContextProvider);
begin
  FInternalContainer.Remove(AProvider);
end;

initialization

  TioViewContextProviderContainer.Build;

finalization

  TioViewContextProviderContainer.CleanUp;

end.
