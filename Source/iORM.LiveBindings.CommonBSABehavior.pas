unit iORM.LiveBindings.CommonBSABehavior;

interface

uses
  iORM.LiveBindings.Interfaces;

type

  // Methods and functionalities common to all ActiveBindSouceAdapters
  TioCommonBSABehavior = class
  public
    // NB: Generic type for this methods must be only TObject or IInterface
    class procedure InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter; const ADataObject:T); overload;
  end;

implementation

uses
  iORM.Context.Properties.Interfaces, System.Rtti, iORM.Context.Factory;


{ TioCommonBSABehavior }

class procedure TioCommonBSABehavior.InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  const ADataObject: T);
var
  LMasterObj: TObject;
  LMasterProperty: IioContextProperty;
  LValue: TValue;
begin
  LMasterObj := AActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current;
  LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName(LMasterObj.ClassType, AActiveBindSourceAdapter.GetMasterPropertyName);
  TValue.Make(@ADataObject, LMasterProperty.GetTypeInfo, LValue);
  LMasterProperty.SetValue(LMasterObj, LValue);
  AActiveBindSourceAdapter.GetMasterBindSourceAdapter.DetailAdaptersContainer.SetMasterObject(LMasterObj);
end;

end.
