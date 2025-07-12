unit iORM.PersistenceStrategy.AuthCache;

interface

uses
  iORM.PersistenceStrategy.Interfaces, System.Generics.Collections;

type

  TioAuthCache = class (TInterfacedObject, IioAuthCache)
  strict private
    FInternalContainer: TDictionary<String, Boolean>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AKey: String; const AAuthorized: Boolean);
    function TryIsAuthorized(const AKey: String; var OResult: Boolean): Boolean; // var instead of out for performance optimization (Primoz book)
  end;

implementation

{ TioAuthCache }

procedure TioAuthCache.Add(const AKey: String; const AAuthorized: Boolean);
begin
  FInternalContainer.Add(AKey, AAuthorized);
end;

constructor TioAuthCache.Create;
begin
  FInternalContainer := TDictionary<String, Boolean>.Create;
end;

destructor TioAuthCache.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioAuthCache.TryIsAuthorized(const AKey: String; var OResult: Boolean): Boolean;
begin
  Result := FInternalContainer.TryGetValue(AKey, OResult);
end;

end.
