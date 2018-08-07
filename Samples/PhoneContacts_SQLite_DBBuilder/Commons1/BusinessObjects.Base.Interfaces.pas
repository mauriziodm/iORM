unit BusinessObjects.Base.Interfaces;

interface

uses
  System.Generics.Collections,
  System.Classes,
{$IFDEF DESKTOP}
  iORM.Attributes,
{$ENDIF}
{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  VCL.Graphics,
{$ENDIF}
  iORM.Containers.Interfaces,
  iORM.CommonTypes;

type

  IBaseBO = interface
    ['{82F3A949-B54C-4647-B5AB-87CE43798DA8}']
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    property ID: Integer read GetID write SetID;
  end;

implementation

end.

