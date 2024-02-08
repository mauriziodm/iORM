unit iORM.Resolver.ResolvedTypeList;

interface

uses
  iORM.Resolver.Interfaces, System.Generics.Collections;

type

  TioResolvedTypeList = class(TInterfacedObject, IioResolvedTypeList)
  private
    FInternalList: TList<String>;
    function GetEnumerator: TEnumerator<String>;
    function GetCount: Integer;
    function GetItem(Index: Integer): String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const ATypeName: String);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: String read GetItem; default;
  end;

implementation

{ TioResolvedTypeList }

procedure TioResolvedTypeList.Add(const ATypeName: String);
begin
  FInternalList.Add(ATypeName);
end;

constructor TioResolvedTypeList.Create;
begin
  FInternalList := TList<String>.Create;
end;

destructor TioResolvedTypeList.Destroy;
begin
  FInternalList.Free;
  inherited;
end;

function TioResolvedTypeList.GetCount: Integer;
begin
  Result := FInternalList.Count;
end;

function TioResolvedTypeList.GetEnumerator: TEnumerator<String>;
begin
  Result := FInternalList.GetEnumerator;
end;

function TioResolvedTypeList.GetItem(Index: Integer): String;
begin
  Result := FInternalList.Items[Index];
end;

end.
