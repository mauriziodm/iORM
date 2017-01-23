unit Service.DefaultData;

interface

type

  TDefaultData = class
  strict protected
    class procedure CreateDefaultCostTypes;
    class procedure CreateDefaultTravels;
    class procedure CreateDefaultCosts;
    class procedure CreateDefaultData;
  public
    class procedure CheckForDefaultData;
  end;

implementation

uses
  GlobalFactory, Model.BaseConst, iORM, System.SysUtils, Model.CostType,
  System.Generics.Collections, FMX.Dialogs, System.UITypes;

{ TDefaultData }

class procedure TDefaultData.CheckForDefaultData;
var
  AList: TObjectList<TCostType>;
begin
  AList := io.Load<TCostType>.ToGenericList.OfType<TObjectList<TCostType>>;
  try
    if (AList.Count > 0 )
      then Exit;
    Self.CreateDefaultData;
//    ShowMessage('Defult data was created.');
  finally
    AList.Free;
  end;
end;

class procedure TDefaultData.CreateDefaultCosts;
begin
  io.Persist(
    TGlobalFactory.Model.Cost(
      'AUTOSTRADA'
      ,1
      ,io.Load<TCostType>.ByOID(3).ToObject
      ,StrToDate('01/01/2012')
      ,20.25
      ,'PROVA'
      ,0
      ,0
      ));

  io.Persist(
    TGlobalFactory.Model.Cost(
      'GASOLIO'
      ,1
      ,io.Load<TCostType>.ByOID(2).ToObject
      ,StrToDate('03/01/2012')
      ,65.32
      ,'PROVA'
      ,45.4
      ,465
      ));
end;

class procedure TDefaultData.CreateDefaultCostTypes;
begin
  // 1
  io.Persist(TGlobalFactory.Model.CostType('TUTTO', COST_OBJECT_TYPE_TOTAL));
  // 2
  io.Persist(TGlobalFactory.Model.CostType('CARBURANTE', COST_OBJECT_TYPE_FUEL));
  // 3
  io.Persist(TGlobalFactory.Model.CostType('PEDAGGI', COST_OBJECT_TYPE_GENERIC));
  // 4
  io.Persist(TGlobalFactory.Model.CostType('TRAGHETTI', COST_OBJECT_TYPE_GENERIC));
  // 5
  io.Persist(TGlobalFactory.Model.CostType('SOSTA/CAMPEGGIO', COST_OBJECT_TYPE_GENERIC));
  // 6
  io.Persist(TGlobalFactory.Model.CostType('SVAGO/DIVERTIMENTI', COST_OBJECT_TYPE_GENERIC));
  // 7
  io.Persist(TGlobalFactory.Model.CostType('ALIMENTARI', COST_OBJECT_TYPE_GENERIC));
  // 8
  io.Persist(TGlobalFactory.Model.CostType('RISTORANTE', COST_OBJECT_TYPE_GENERIC));
  // 9
  io.Persist(TGlobalFactory.Model.CostType('VARIE', COST_OBJECT_TYPE_GENERIC));
end;

class procedure TDefaultData.CreateDefaultData;
begin
  io.StartTransaction;
  try
    Self.CreateDefaultCostTypes;
    Self.CreateDefaultTravels;
    Self.CreateDefaultCosts;
    io.CommitTransaction;
  except
    io.RollbackTransaction;
    raise;
  end;
end;

class procedure TDefaultData.CreateDefaultTravels;
begin
  // 1
  io.Persist(TGlobalFactory.Model.Travel('FUSSEN', StrToDate('01/01/2012'), StrToDate('06/01/1012'), 15000, 16250));
  // 2
  io.Persist(TGlobalFactory.Model.Travel('LAGO DI GARDA', StrToDate('03/10/2012'), StrToDate('10/10/2012'), 26500, 27500));
  // 3
  io.Persist(TGlobalFactory.Model.Travel('GARGANO', StrToDate('06/06/2012'), StrToDate('06/12/2012'), 22500, 23650));
end;

end.
