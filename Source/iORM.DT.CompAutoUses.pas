unit iORM.DT.CompAutoUses;

interface

uses
  DesignEditors, System.Classes;

type

  TioSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TioBindSourceSelectionEditor = class(TioSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TioConnectionDefSelectionEditor = class(TioSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TioMVVMSelectionEditor = class(TioSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

implementation

{ TioSelectionEditor }

procedure TioSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  inherited;
  Proc('iORM');
  Proc('iORM.Attributes');
  Proc('iORM.CommonTypes');
end;

{ TioBindSourceSelectionEditor }

procedure TioBindSourceSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  inherited;
  Proc('iORM.Where.Interfaces');
end;

{ TConnectionDefSelectionEditor }

procedure TioConnectionDefSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  inherited;
  Proc('iORM.DBBuilder.Interfaces');
end;

{ TioViewModelBridgeSelectionEditor }

procedure TioMVVMSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  inherited;
  Proc('iORM.MVVM.Interfaces');
end;

end.
