unit Model.CostType.Interfaces;

interface

uses Model.BaseClasses.Interfaces, iORM.Containers.Interfaces;

type

  ICostType = interface(IBaseClass)
   ['{D8152BB3-08B6-4E17-8ACF-826E8396E24B}']

   function GetObjectType: Byte;
   procedure SetObjectType(Value: Byte);
   property ObjectType: Byte read GetObjectType write SetObjectType;

  end;



implementation

end.
