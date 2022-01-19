unit iORM.LiveBindings.BSPersistence.SmartDeleteSystem;

interface

uses
  System.SysUtils;

type

  TioSmartDeleteSystemItem = record
    TypeName: String;
    ID: Integer;
  end;

  TioSmartDeleteSystem = class
  private
    FContainer: TArray<TioSmartDeleteSystemItem>;
    FMonitor: TMonitor;
    procedure Lock;
    procedure Unlock;
  public
    procedure Clear;
    procedure Add(const ATypeName: String; const AID: Integer);
    procedure ForEach(const AProc: TProc<TioSmartDeleteSystemItem>);
  end;

implementation

{ TioSmartDeleteSystem }

procedure TioSmartDeleteSystem.Add(const ATypeName: String; const AID: Integer);
begin
  Lock;
  try
    SetLength(FContainer, High(FContainer)+1);
    with FContainer[High(FContainer)] do
    begin
      TypeName := ATypeName;
      ID := AID;
    end;
  finally
    Unlock;
  end;
end;

procedure TioSmartDeleteSystem.Clear;
begin
  Lock;
  try
    SetLength(FContainer, 0);
  finally
    Unlock;
  end;
end;

procedure TioSmartDeleteSystem.ForEach(const AProc: TProc<TioSmartDeleteSystemItem>);
var
  i: Integer;
begin
  Lock;
  try
    for i := Low(FContainer) to High(FContainer) do
      AProc(FContainer[i]);
  finally
    Unlock;
  end;
end;

procedure TioSmartDeleteSystem.Lock;
begin
  FMonitor.Enter(Self);
end;

procedure TioSmartDeleteSystem.Unlock;
begin
  FMonitor.Exit(Self);
end;

end.
