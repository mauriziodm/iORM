unit iORM.ETM.Interfaces;

interface

uses
  iORM.Attributes, System.Classes;

type

  [ioEnumerated('Insert, Update, Delete, Synchronization')]
  TioEtmTimeSlotType = (tsInsert, tsUpdate, tsDelete, tsSynchronization);

  [ioEnumerated('No conflict detected, Master version win, Slave version win, Last updated win, Manual conflict resolution')]
  TioEtmConflictType = (ctNoConflict, ctMasterWin, ctSlaveWin, ctLastUpdatedWin, ctManual);

  IioEtmTimeSlot = interface
    ['{09B35E52-AF12-4F66-A8CF-D58A1CF41C7D}']
    // ID
    function GetID: Integer;
    property ID: Integer read GetID;
    // DateAndTime
    function GetDateAndTime: TDateTime;
    property DateAndTime: TDateTime read GetDateAndTime;
    // TimeSlotType
    function GetTimeSlotType: TioEtmTimeSlotType;
    property TimeSlotType: TioEtmTimeSlotType read GetTimeSlotType;
    // EntityClassName
    function GetEntityClassName: String;
    property EntityClassName: String read GetEntityClassName;
    // EntityID
    function GetEntityID: Integer;
    property EntityID: Integer read GetEntityID;
    // EntityRevision
    // EntityMasterState
    function GetEntityMasterState: TStrings;
    property EntityMasterState: TStrings read GetEntityMasterState;
    // EntitySlaveState
    function GetEntitySlaveState: TStrings;
    property EntitySlaveState: TStrings read GetEntitySlaveState;
    // ConflictResolutionType
    function GetConflictType: TioEtmConflictType;
    property ConflictType: TioEtmConflictType read GetConflictType;
  end;

implementation

end.
