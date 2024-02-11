{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.Attributes;

interface

uses
  System.Rtti, iORM.CommonTypes, System.Classes, DJSON.Attributes,
  System.Generics.Collections, System.SysUtils, iORM.ETM.Interfaces,
  System.JSON;

{$REGION '===== TYPES & CONSTANTS ====='}

type
  // Class mapping types
  TioMapModeType = (mmHybrid, mmProperties, mmFields);

  // TrueClassMode
  TioTrueClassMode = (tcDisabled, tcSmart, tcmStrictly);

const
  DEFAULT_MAP_MODE = mmHybrid;
  DEFAULT_TRUE_CLASS_MODE = tcSmart;

  NOT_PERSISTED_ENTITY_TABLE_NAME = '___NOT_PERSISTED___';

type
  // Relation types
  TioRelationType = (rtNone, rtBelongsTo, rtHasMany, rtHasOne, rtEmbeddedHasMany, rtEmbeddedHasOne);

  // ForeignKey types
  TioFKAction = (fkUnspecified, fkNoAction, fkSetNull, fkSetDefault, fkCascade);
  TioFKCreate = (fkCreate, fkDoNotCreate);

  // Join types
  TioJoinType = (jtInner, jtCross, jtLeftOuter, jtRightOuter, jtFullOuter);

{$ENDREGION} // END OF TYPES & CONSTANTS

{$REGION '===== BASE ATTRIBUTESS ====='}

  // Base simple attribute
  TioCustomAttribute = class(TCustomAttribute)
  end;

  // Base String attribute
  TioCustomStringAttribute = class(TCustomAttribute)
  strict private
    FValue: String;
  public
    constructor Create(const AValue: String = '');
    property Value: String read FValue;
  end;

  // Base integer attribute
  TioCustomIntegerAttribute = class(TCustomAttribute)
  strict private
    FValue: Integer;
  public
    constructor Create(const AValue: Integer);
    property Value: Integer read FValue;
  end;

  // Base boolean attribute
  TioCustomBoolAttribute = class(TCustomAttribute)
  strict private
    FValue: Boolean;
  public
    constructor Create(const AValue: Boolean);
    property Value: Boolean read FValue;
  end;

  // Base TValue attribute
  TioCustomTValueAttribute = class(TCustomAttribute)
  strict private
    FValue: TValue;
  public
    constructor Create(const AValue: String); overload;
    constructor Create(const AValue: Integer); overload;
    constructor Create(const AValue: TDateTime); overload;
    property Value: TValue read FValue;
  end;

  // Relation attributes base class
  TioCustomRelationAttribute = class(TioCustomAttribute)
  strict private
    FChildTypeName: String;
    FChildTypeAlias: String;
  public
    constructor Create(AChildClassRef: TioClassRef); overload;
    constructor Create(const AChildTypeName: String; const AChildTypeAlias: String = ''); overload;
    constructor Create(AIID: TGUID; const AChildTypeAlias: String = ''); overload;
    property ChildTypeName: String read FChildTypeName;
    property ChildTypeAlias: String read FChildTypeAlias;
  end;

  TioCustomForTargetModel = class(TioCustomAttribute)
  strict private
    FTargetTypeName: String;
    FTargetTypeAlias: String;
  public
    constructor Create(ATargetTypeName: String; const AAlias: String = ''); overload;
    constructor Create(ATargetClass: TioClassRef; const AAlias: String = ''); overload;
    constructor Create(ATargetIID: TGUID; const AAlias: String = ''); overload;
    property TargetTypeName: String read FTargetTypeName;
    property TargetTypeAlias: String read FTargetTypeAlias;
  end;

{$ENDREGION} // END OF BASE ATTRIBUTES

{$REGION '===== PROPERTY ATTRIBUTES ====='}

  // Skip the property when mapping the class
  ioSkip = class(DJSON.Attributes.djSkipAttribute)
  end;

  // ID attribute
  ioID = class(TioCustomAttribute)
  end;

  ioOID = ioID; // Deprecated

  // FieldName attribute
  ioField = class(TioCustomStringAttribute)
  end;

  ioNotNull = class(TioCustomAttribute)
  end;

  ioLoadSQL = class(TioCustomStringAttribute)
  end;

  ioFieldType = class(TioCustomStringAttribute)
  end;

  // Define Varchar Type
  ioVarchar = class(TioCustomAttribute)
  strict private
    FIsUnicode: Boolean;
    FLength: Integer;
  public
    constructor Create(const ALength: Integer = 255; const AIsUnicode: Boolean = True); overload;
    property IsUnicode: Boolean read FIsUnicode;
    property Length: Integer read FLength;
  end;

  // Define Char Type
  ioChar = class(ioVarchar)
  end;

  // Define Integer Types (SmallInt, Integer, BigInt)
  ioInteger = class(TioCustomAttribute)
  strict private
    FPrecision: Integer;
  public
    constructor Create(const APrecision: Integer = 10);
    property Precision: Integer read FPrecision;
  end;

  // Define Float Type (Float)
  ioFloat = class(TioCustomAttribute)
  end;

  // Define Date Type (Date)
  ioDate = class(TioCustomAttribute)
  end;

  // Define Date Type (Time)
  ioTime = class(TioCustomAttribute)
  end;

  // Define DateTime Type (DateTime)
  ioDateTime = class(TioCustomAttribute)
  end;

  // Define Boolean Type (Boolean)
  ioBoolean = class(TioCustomAttribute)
  end;

  // Define Decimal Or Numeric Type
  // DECIMAL(p,s) --> DECIMAL(13,2) 11 Digits Before the decimal and 2 Digits after decimal
  // NUMERIC(p,s) --> NUMERIC(13,2) Treated the same as Decimal
  ioDecimal = class(TioCustomAttribute)
  strict private
    FPrecision: Integer;
    FScale: Integer;
  public
    constructor Create(const APrecision: Integer = 13; const AScale: Integer = 2);
    property Precision: Integer read FPrecision;
    property Scale: Integer read FScale;
  end;

  ioNumeric = class(ioDecimal)
  end;

  // Define Binary Type (Binary Data)
  ioBinary = class(TioCustomAttribute)
  strict private
    FBinarySubType: string;
  public
    constructor Create(const ABinarySubType: string = '');
    property BinarySubType: string read FBinarySubType;
  end;

  // Default value for the DB field (SQL DEFAULT)
  ioDefault = class(TioCustomTValueAttribute)
  end;

  // Custom FieldType attribute
  ioFTCustom = class(TioCustomStringAttribute)
  end;

  // ForeignKey enable/disable and actions
  ioForeignKey = class(TioCustomAttribute)
  strict private
    FAutoCreate: TioFKCreate;
    FOnDeleteAction: TioFKAction;
    FOnUpdateAction: TioFKAction;
  public
    constructor Create(const AOnDeleteAction: TioFKAction = fkUnspecified; const AOnUpdateAction: TioFKAction = fkUnspecified); overload;
    constructor Create(const AAutoCreate: TioFKCreate; const AOnDeleteAction: TioFKAction = fkUnspecified;
      const AOnUpdateAction: TioFKAction = fkUnspecified); overload;
    property AutoCreate: TioFKCreate read FAutoCreate;
    property OnDeleteAction: TioFKAction read FOnDeleteAction;
    property OnUpdateAction: TioFKAction read FOnUpdateAction;
  end;

  // LazyLoad attribute
  ioLazyLoad = class(TioCustomAttribute)
  end;

  ioLazy = ioLazyLoad;

  // ReadOnly attribute
  ioLoadOnly = class(TioCustomAttribute)
  end;

  // WriteOnly attribute
  ioPersistOnly = class(TioCustomAttribute)
  end;

  // TypeAlias attribute
  ioTypeAlias = class(TioCustomStringAttribute)
  end;

{$ENDREGION} // END OF PROPERTY ATTRIBUTES

{$REGION '===== CLASS ATTRIBUTES ====='}

  // Map the class as an entity to be persisted
  ioEntity = class(TioCustomAttribute)
  strict private
    FTableName: String;
    FMapMode: TioMapModeType;
  public
    constructor Create(const ATableName: String; const AMapMode: TioMapModeType = DEFAULT_MAP_MODE);
    property TableName: String read FTableName;
    property MapMode: TioMapModeType read FMapMode;
  end;

  // Map the class as an entity NOT to be persisted
  ioNotPersistedEntity = class(TioCustomAttribute)
  strict private
    FMapMode: TioMapModeType;
  private
    function GetTableName: String;
  public
    constructor Create(const AMapMode: TioMapModeType = DEFAULT_MAP_MODE);
    property TableName: String read GetTableName;
    property MapMode: TioMapModeType read FMapMode;
  end;

  // Set the name of the generator/sequence for the table (on the DB) related to this class
  ioKeyGenerator = class(TioCustomStringAttribute)
  end;

  ioKeySequence = ioKeyGenerator;

  // Link the class/entity to a specific connection
  ioConnection = class(TCustomAttribute)
  strict private
    FConnectionName: String;
  public
    constructor Create(const AConnectionName: String = '');
    property ConnectionName: String read FConnectionName;
  end;

  // Set the TrueClass mode for the class
  ioTrueClass = class(TioCustomAttribute)
  strict private
    FTrueClassMode: TioTrueClassMode;
  public
    constructor Create(const ATrueClassMode: TioTrueClassMode = DEFAULT_TRUE_CLASS_MODE);
    property TrueClassMode: TioTrueClassMode read FTrueClassMode;
  end;

  // Set the GroupBy info for the class
  ioGroupBy = class(TioCustomStringAttribute)
  end;

  // Set the join info for the class
  ioJoin = class(TioCustomAttribute)
  strict private
    FJoinType: TioJoinType;
    FJoinClassRef: TioClassRef;
    FJoinCondition: String;
  public
    constructor Create(const AJoinType: TioJoinType; AJoinClassRef: TioClassRef; AJoinCondition: String = '');
    property JoinType: TioJoinType read FJoinType;
    property JoinClassRef: TioClassRef read FJoinClassRef;
    property JoinCondition: String read FJoinCondition;
  end;

  // Add an index definition to the class map
  ioIndex = class(TioCustomAttribute)
  strict private
    FIndexName: String;
    FCommaSepFieldList: String;
    FIndexOrientation: TioIndexOrientation;
    FUnique: Boolean;
  public
    constructor Create(const AIndexName: String; ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation = ioAscending;
      const AUnique: Boolean = False); overload;
    constructor Create(ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    constructor Create(const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    property IndexName: String read FIndexName;
    property CommaSepFieldList: String read FCommaSepFieldList write FCommaSepFieldList;
    property IndexOrientation: TioIndexOrientation read FIndexOrientation;
    property Unique: Boolean read FUnique;
  end;

{$ENDREGION} // END OF CLASS ATTRIBUTES

{$REGION '===== RELATION ATTRIBUTES ====='}

  // Disable automatic detection for HasMany relation(s)
  ioDisableRelationAutodetect = class(TioCustomAttribute);

  // Relation BelongsTo attribute
  ioBelongsTo = class(TioCustomRelationAttribute)
  end;

  // Relation HasMany attribute
  ioHasMany = class(TioCustomRelationAttribute)
  strict private
    FChildPropertyName: String;
  public
    constructor Create(const AChildClassRef: TioClassRef; const AChildPropertyName: String); overload;
    constructor Create(const AChildTypeName, AChildTypeAlias, AChildPropertyName: String); overload;
    constructor Create(const AChildTypeName, AChildPropertyName: String); overload;
    constructor Create(AIID: TGUID; const AChildTypeAlias, AChildPropertyName: String); overload;
    constructor Create(AIID: TGUID; const AChildPropertyName: String); overload;
    property ChildPropertyName: String read FChildPropertyName;
  end;

  // Relation BelongsTo attribute
  ioHasOne = class(ioHasMany)
  end;

  // EmbeddedHasMany attribute
  ioEmbeddedHasMany = class(TioCustomRelationAttribute)
  end;

  // EmbeddedHasOne attribute
  ioEmbeddedHasOne = class(TioCustomRelationAttribute)
  end;

{$ENDREGION} // END OF EMBEDDED ATTRIBUTES

{$REGION '===== SMART WHERE ATTRIBUTES ====='}

  // Set some where generation params for the property
  ioWhereAttribute = class(TioCustomAttribute)
  private
    FCompareOp: TioCompareOp;
    FLogicOp: TioLogicOp;
    FTargetPropName: String;
  public
    constructor Create; overload;
    constructor Create(ATargetPropName: String; const ACompareOp: TioCompareOp = coEquals); overload;
    constructor Create(const ALogicRelation: TioLogicOp; const ACompareOp: TioCompareOp = coEquals); overload;
    constructor Create(const ACompareOp: TioCompareOp); overload;
    constructor Create(const ALogicRelation: TioLogicOp; ATargetPropName: String; const ACompareOp: TioCompareOp); overload;
    property CompareOp: TioCompareOp read FCompareOp;
    property LogicOp: TioLogicOp read FLogicOp;
    property TargetPropName: String read FTargetPropName;
  end;

  // Set shere group for the property
  ioWhereGroupAttribute = class(TioCustomAttribute)
  private
    FGroupName: String;
    FGroupLogicOp: TioLogicOp;
    FMasterGroupName: String;
  public
    constructor Create(const AGroupLogicRelation: TioLogicOp; AGroupName: String; AMasterGroupName: String = ''); overload;
    constructor Create(AGroupName: String; AMasterGroupName: String = ''); overload;
    property GroupName: String read FGroupName;
    property GroupLogicOp: TioLogicOp read FGroupLogicOp;
    property MasterGroupName: String read FMasterGroupName;
  end;

  // Set the value to be treated as null for the proprerty (for where generation purpose)
  ioWhereNullValueAttribute = class(TioCustomTValueAttribute)
  end;

  // Skip the property for where filter purposes
  ioWhereSkipAttribute = class(TioCustomAttribute)
  end;

{$ENDREGION} // END OF SMART WHERE ATTRIBUTES

{$REGION '===== DEPENDENCY INJECTION ATTRIBUTES ====='}

  // Register the class as is, without interfaces
  diRegister = class(TioCustomAttribute)
  end;

  // Register the class as implementer of the AIID interface
  diImplements = class(TioCustomAttribute)
  strict private
    FIID: TGUID;
    FAlias: String;
  public
    constructor Create(AIID: TGUID; const AAlias: String = '');
    property IID: TGUID read FIID;
    property Alias: String read FAlias;
  end;

  // Disable the autoregistration as interfaced entity of the class
  diDoNotRegisterAsInterfacedEntity = class(TioCustomAttribute)
  end;

  // Register the class as singleton life management
  diAsSingleton = class(TioCustomAttribute)
  end;

  // Register the class as SimpleView that implements the interface
  diSimpleViewImplements = class(diImplements)
  end;

  // Register the class as SimpleView for the target model class name
  diSimpleViewFor = class(TioCustomForTargetModel)
  end;

  // Register the class as View (MVVM) that implements the interface
  diViewImplements = class(diImplements)
  end;

  // Register the class as View (MVVM) for the target model class name
  diViewFor = class(TioCustomForTargetModel)
  end;

  // Register the class as ViewModel (MVVM) that implements the interface
  diViewModelImplements = class(diImplements)
  end;

  diVMImplements = diViewModelImplements;

  // Register the class as ViewModel (MVVM) for the target model class name
  diViewModelFor = class(TioCustomForTargetModel)
  end;

  // ioInject attribute
  ioInject = class(TioCustomAttribute)
  strict private
    FTypeName: String;
    FTypeAlias: String;
  public
    constructor Create(const ATypeAlias: String = ''); overload;
    constructor Create(const ATypeName, ATypeAlias: String); overload;
    property TypeName: String read FTypeName;
    property TypeAlias: String read FTypeAlias;
  end;

{$ENDREGION} // END OF DEPENDENCY INJECTION ATTRIBUTES

{$REGION '===== CONFLICT STRATEGY ATTRIBUTES ====='}

  // Base String attribute
  // NOTE: THIS ATTRIBUTE IS DECLARED INTO iORM.ConflictStrategy.Interfaces (not here) TO AVOID CIRCULAR REFERENCE
  // NOTE: THIS ATTRIBUTE IS DECLARED INTO iORM.ConflictStrategy.Interfaces (not here) TO AVOID CIRCULAR REFERENCE
  // NOTE: THIS ATTRIBUTE IS DECLARED INTO iORM.ConflictStrategy.Interfaces (not here) TO AVOID CIRCULAR REFERENCE
  // ioDeleteConflictStrategyAttribute = class(TCustomAttribute)
  // ioUpdateConflictStrategyAttribute = type ioDeleteConflictStrategyAttribute;

{$ENDREGION} // END ETM ATTRIBUTES

{$REGION '===== ETM ATTRIBUTES & TIMESLOT ====='}

  // Base class for ell ETM repositories
  TioEtmTimeSlotRef = class of TioEtmCustomTimeSlot;

  // NB: Per la nuova gestione dei conflitti servirà la possibilità di memorizzare due data e ora, una che sarà il momento
  //      quando è stata fatto l'update sul DB remoto (es: mobile) e l'altra la data e ora di quanto è stato fatto l'update
  //      sul database centrale durante la fase di sincronizzazione.
  TioEtmCustomTimeSlot = class
  private
    FID: Integer;
    FDateAndTime: TioObjCreated;
    // Entity related props
    [ioVarchar(60)]
    FEntityClassName: String;
    FEntityID: Integer;
    FEntityVersion: Integer;
    FEntityFromVersion: Integer;
    FEntityUpdated: TDateTime;
    [ioBinary('1')]
    FEntityState: String;
    // User related props
    FUserID: TioObjCreatedUserID;
    FUserName: TioObjCreatedUserName;
    // Persistence related props
    FActionType: TioPersistenceActionType;
    FIntentType: TioPersistenceIntentType;
    FBlindLevel: Byte;
    FConflictDetected: Boolean;
    FConflictState: TioPersistenceConflictState;
    FConflictStrategyName: String;
    // Conflict check by human related props
    FConflictCheckedByHuman: Boolean;
    FConflictCheckedByHuman_ID: Integer;
    FConflictCheckedByHuman_Name: String;
    FConflictCheckedByHuman_DateTime: TDateTime;
    // NB: Questo è un anonymous method che viene passato dal BindSource che sta esponendo il TimeSlot stesso e che permette
    // di risalire alla versione corrente della entità attraverso la catena "ETMBindSource.etmFor.Current"
    [ioSkip]
    FExtractCurrentEntityFunc: TFunc<TObject>;
    // BlindLevel props
    function GetBlindLevel_AutoUpdateProps: Boolean;
    function GetBlindLevel_DetectObjExists: Boolean;
    function GetBlindLevel_DetectConflicts: Boolean;
    // Smart properties
    function GetSmartEntityInfo: String;
    function GetSmartEntityVersion: String;
    function GetSmartUser: String;
    function GetSmartActionType: String;
    function GetSmartConflictDetected: String;
    function GetSmartConflictCheckedByHuman: String;
    function GetSmartDescription: String;
    function GetSmartFullDescription: String;
    // Diff
    function GetDiffOneWay: String;
    function GetDiffOneWayMoreInfo: String;
    function GetDiffTwoWay: String;
    function GetDiffTwoWayMoreInfo: String;
  public
    constructor Create(const AContextAsIInterface: IInterface); // IInterface to avoid circular reference
    property ID: Integer read FID;
    property DateAndTime: TioObjCreated read FDateAndTime;
    // Entity related props
    property EntityClassName: String read FEntityClassName;
    property EntityID: Integer read FEntityID;
    property EntityVersion: Integer read FEntityVersion;
    property EntityFromVersion: Integer read FEntityFromVersion;
    property EntityUpdated: TDateTime read FEntityUpdated;
    property EntityState: String read FEntityState;
    // User related props
    property UserID: TioObjCreatedUserID read FUserID;
    property UserName: TioObjCreatedUserName read FUserName;
    // Persistence related props
    property ActionType: TioPersistenceActionType read FActionType;
    property IntentType: TioPersistenceIntentType read FIntentType;
    property ConflictDetected: Boolean read FConflictDetected;
    property ConflictState: TioPersistenceConflictState read FConflictState;
    property ConflictStrategyName: String read FConflictStrategyName;
    // BlindLevel props
    property BlindLevel: Byte read FBlindLevel;
    property BlindLevel_AutoUpdateProps: Boolean read GetBlindLevel_AutoUpdateProps;
    property BlindLevel_DetectObjExists: Boolean read GetBlindLevel_DetectObjExists;
    property BlindLevel_DetectConflicts: Boolean read GetBlindLevel_DetectConflicts;
    // Conflict check by human related props
    property ConflictCheckedByHuman: Boolean read FConflictCheckedByHuman;
    property ConflictCheckedByHuman_ID: Integer read FConflictCheckedByHuman_ID;
    property ConflictCheckedByHuman_Name: String read FConflictCheckedByHuman_Name;
    property ConflictCheckedByHuman_DateTime: TDateTime read FConflictCheckedByHuman_DateTime;
    // Smart properties
    property SmartEntityInfo: String read GetSmartEntityInfo;
    property SmartEntityVersion: String read GetSmartEntityVersion;
    property SmartUser: String read GetSmartUser;
    property SmartActionType: String read GetSmartActionType;
    property SmartConflictDetected: String read GetSmartConflictDetected;
    property SmartConflictCheckedByHuman: String read GetSmartConflictCheckedByHuman;
    property SmartDescription: String read GetSmartDescription;
    property SmartFullDescription: String read GetSmartFullDescription;
    // Diff methods
    function Diff(const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): String;
    procedure DiffToStream(const ATargetStream: TStream; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
    procedure DiffToFile(const AFileName: String; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
    function DiffAsJsonObject(const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): TJSONObject;
    // Diff properties
    property DiffOneWay: String read GetDiffOneWay;
    property DiffOneWayMoreInfo: String read GetDiffOneWayMoreInfo;
    property DiffTwoWay: String read GetDiffTwoWay;
    property DiffTwoWayMoreInfo: String read GetDiffTwoWayMoreInfo;
    // ExtractCurrentEntityFunc anonymous method
    // NB: Questo è un anonymous method che viene passato dal BindSource che sta esponendo il TimeSlot stesso e che permette
    //      di risalire alla versione corrente della entità attraverso la catena "ETMBindSource.etmFor.Current"
    property _ExtractCurrentEntityFunc: TFunc<TObject> read FExtractCurrentEntityFunc write FExtractCurrentEntityFunc;
  end;

  // A TimeLine is a list of time slots
  TioEtmTimeline = TObjectList<TioEtmCustomTimeSlot>;

  etmRepository = ioEntity;

  etmTrace = class(TCustomAttribute)
  strict private
    FTimeSlotClass: TioEtmTimeSlotRef;
    FTraceOnlyOnConnectionName: String;
  public
    constructor Create(const ATimeSlotClass: TioEtmTimeSlotRef; const AConnectionName: String = '');
    property TimeSlotClass: TioEtmTimeSlotRef read FTimeSlotClass;
    property TraceOnlyOnConnectionName: String read FTraceOnlyOnConnectionName;
  end;

  etmProperty = class(TCustomAttribute)
  strict private
    FEntityPropName: String;
    FEtmPropName: String;
  public
    constructor Create(const AEntityPropName, AEtmPropName: String); overload;
    constructor Create(const AEtmPropName: String); overload;
    constructor Create; overload;
    procedure SetEntityPropNameIfEmpty(const AValue: String);
    procedure SetEtmPropNameIfEmpty(const AValue: String);
    property EntityPropName: String read FEntityPropName;
    property EtmPropName: String read FEtmPropName;
  end;

{$ENDREGION} // END ETM ATTRIBUTES

{$REGION '===== OTHER ATTRIBUTES ====='}

  // Mark something (ex: a constructor) with a label
  ioMarker = class(TioCustomStringAttribute)
  end;

  // Add to an enumerated type a list of string constants related to values
  ioEnumerated = class(TioCustomStringAttribute)
  end;

{$ENDREGION} // END OTHER ATTRIBUTES

implementation

uses
  iORM, iORM.Utilities, iORM.Exceptions, iORM.Abstraction, iORM.ETM.Engine,
  iORM.Context.Interfaces, DJSON, iORM.ETM.Factory;

{ TioStringAttribute }

constructor TioCustomStringAttribute.Create(const AValue: String);
begin
  FValue := AValue;
end;

{ TCustomRelationAttribute }

constructor TioCustomRelationAttribute.Create(AChildClassRef: TioClassRef);
begin
  Create(AChildClassRef.ClassName, '');
end;

constructor TioCustomRelationAttribute.Create(const AChildTypeName, AChildTypeAlias: String);
begin
  FChildTypeName := AChildTypeName;
  FChildTypeAlias := AChildTypeAlias;
end;

constructor TioCustomRelationAttribute.Create(AIID: TGUID; const AChildTypeAlias: String);
begin
  FChildTypeName := TioUtilities.GUIDtoInterfaceName(AIID);
  FChildTypeAlias := AChildTypeAlias;
end;

{ ioHasMany }

constructor ioHasMany.Create(const AChildClassRef: TioClassRef; const AChildPropertyName: String);
begin
  inherited Create(AChildClassRef);
  FChildPropertyName := AChildPropertyName;
end;

constructor ioHasMany.Create(const AChildTypeName, AChildTypeAlias, AChildPropertyName: String);
begin
  inherited Create(AChildTypeName, AChildTypeAlias);
  FChildPropertyName := AChildPropertyName;
end;

constructor ioHasMany.Create(const AChildTypeName, AChildPropertyName: String);
begin
  Self.Create(AChildTypeName, '', AChildPropertyName);
end;

constructor ioHasMany.Create(AIID: TGUID; const AChildTypeAlias, AChildPropertyName: String);
begin
  Self.Create(TioUtilities.GUIDtoInterfaceName(AIID), AChildTypeAlias, AChildPropertyName);
end;

constructor ioHasMany.Create(AIID: TGUID; const AChildPropertyName: String);
begin
  Self.Create(TioUtilities.GUIDtoInterfaceName(AIID), '', AChildPropertyName);
end;

{ ioJoin }

constructor ioJoin.Create(const AJoinType: TioJoinType; AJoinClassRef: TioClassRef; AJoinCondition: String);
begin
  inherited Create;
  FJoinType := AJoinType;
  FJoinClassRef := AJoinClassRef;
  FJoinCondition := AJoinCondition;
end;

{ ioTable }

constructor ioEntity.Create(const ATableName: String; const AMapMode: TioMapModeType);
begin
  FTableName := ATableName.Trim;
  FMapMode := AMapMode;
end;

{ ioIndex }

constructor ioIndex.Create(const AIndexName: String; ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  inherited Create;
  FIndexName := AIndexName;
  FCommaSepFieldList := ACommaSepFieldList;
  FIndexOrientation := AIndexOrientation;
  FUnique := AUnique;
end;

constructor ioIndex.Create(ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  Self.Create('', ACommaSepFieldList, AIndexOrientation, AUnique);
end;

constructor ioIndex.Create(const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  Self.Create('', '', AIndexOrientation, AUnique);
end;

{ ioInject }

constructor ioInject.Create(const ATypeAlias: String);
begin
  inherited Create;
  FTypeName := '';
  FTypeAlias := ATypeAlias;
end;

constructor ioInject.Create(const ATypeName, ATypeAlias: String);
begin
  Self.Create(ATypeAlias);
  FTypeName := ATypeName;
end;

{ TioCustomIntegerAttribute }

constructor TioCustomIntegerAttribute.Create(const AValue: Integer);
begin
  FValue := AValue;
end;

{ TioCustomBoolAttribute }

constructor TioCustomBoolAttribute.Create(const AValue: Boolean);
begin
  FValue := AValue;
end;

{ diImplements }

constructor diImplements.Create(AIID: TGUID; const AAlias: String);
begin
  inherited Create;
  FIID := AIID;
  FAlias := AAlias;
end;

{ diViewFor }

constructor TioCustomForTargetModel.Create(ATargetTypeName: String; const AAlias: String);
begin
  inherited Create;
  FTargetTypeName := ATargetTypeName;
  FTargetTypeAlias := AAlias;
end;

constructor TioCustomForTargetModel.Create(ATargetClass: TioClassRef; const AAlias: String);
begin
  inherited Create;
  FTargetTypeName := ATargetClass.ClassName;
  FTargetTypeAlias := AAlias;
end;

{ ioVarchar }

constructor ioVarchar.Create(const ALength: Integer; const AIsUnicode: Boolean);
begin
  FLength := ALength;
  FIsUnicode := AIsUnicode;
end;

{ ioInteger }

constructor ioInteger.Create(const APrecision: Integer = 10);
begin
  FPrecision := APrecision;
end;

{ ioDecimalOrNumeric }

constructor ioDecimal.Create(const APrecision: Integer = 13; const AScale: Integer = 2);
begin
  FPrecision := APrecision;
  FScale := AScale;
end;

{ ioBinary }

constructor ioBinary.Create(const ABinarySubType: string);
begin
  FBinarySubType := ABinarySubType;
end;

constructor TioCustomForTargetModel.Create(ATargetIID: TGUID; const AAlias: String);
begin
  FTargetTypeName := TioUtilities.GUIDtoInterfaceName(ATargetIID);
  FTargetTypeAlias := AAlias;
end;

{ TioCustomTValueAttribute }

constructor TioCustomTValueAttribute.Create(const AValue: String);
begin
  FValue := AValue;
end;

constructor TioCustomTValueAttribute.Create(const AValue: TDateTime);
begin
  FValue := TValue.From<TDateTime>(AValue);
end;

constructor TioCustomTValueAttribute.Create(const AValue: Integer);
begin
  FValue := AValue;
end;

{ ioForeignKey }

constructor ioForeignKey.Create(const AAutoCreate: TioFKCreate; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  FAutoCreate := AAutoCreate;
  FOnDeleteAction := AOnDeleteAction;
  FOnUpdateAction := AOnUpdateAction;
end;

constructor ioForeignKey.Create(const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  Self.Create(fkCreate, AOnDeleteAction, AOnUpdateAction);
end;

{ ioTrueClass }

constructor ioTrueClass.Create(const ATrueClassMode: TioTrueClassMode);
begin
  FTrueClassMode := ATrueClassMode;
end;

{ ioNotPersistedEntity }

constructor ioNotPersistedEntity.Create(const AMapMode: TioMapModeType);
begin
  FMapMode := AMapMode;
end;

function ioNotPersistedEntity.GetTableName: String;
begin
  Result := NOT_PERSISTED_ENTITY_TABLE_NAME;
end;

{ ioWhere }

constructor ioWhereAttribute.Create;
begin
  FCompareOp := TioCompareOp.coEquals;
  FLogicOp := TioLogicOp.loAnd;
  FTargetPropName := String.Empty;
end;

constructor ioWhereAttribute.Create(const ALogicRelation: TioLogicOp; const ACompareOp: TioCompareOp);
begin
  Create;
  FCompareOp := ACompareOp;
  FLogicOp := ALogicRelation;
end;

constructor ioWhereAttribute.Create(ATargetPropName: String; const ACompareOp: TioCompareOp);
begin
  Create;
  FCompareOp := ACompareOp;
  FTargetPropName := ATargetPropName;
end;

constructor ioWhereAttribute.Create(const ACompareOp: TioCompareOp);
begin
  Create;
  FCompareOp := ACompareOp;
end;

constructor ioWhereAttribute.Create(const ALogicRelation: TioLogicOp; ATargetPropName: String; const ACompareOp: TioCompareOp);
begin
  Create;
  FCompareOp := ACompareOp;
  FLogicOp := ALogicRelation;
  FTargetPropName := ATargetPropName;
end;

{ ioWhereGroup }

constructor ioWhereGroupAttribute.Create(AGroupName, AMasterGroupName: String);
begin
  FGroupName := AGroupName;
  FMasterGroupName := AMasterGroupName;
  FGroupLogicOp := TioLogicOp.loAnd;
end;

constructor ioWhereGroupAttribute.Create(const AGroupLogicRelation: TioLogicOp; AGroupName, AMasterGroupName: String);
begin
  Create(AGroupName, AMasterGroupName);
  FGroupLogicOp := AGroupLogicRelation;
end;

{ etmTraceAttribute }

constructor etmTrace.Create(const ATimeSlotClass: TioEtmTimeSlotRef; const AConnectionName: String = '');
begin
  FTimeSlotClass := ATimeSlotClass;
  FTraceOnlyOnConnectionName := AConnectionName;
end;

{ ioConnectionName }

constructor ioConnection.Create(const AConnectionName: String);
begin
  FConnectionName := AConnectionName;
end;

{ TioEtmCustomTimeSlot }

constructor TioEtmCustomTimeSlot.Create(const AContextAsIInterface: IInterface);
var
  LContext: IioContext;
begin
  if not Supports(AContextAsIInterface, IioContext, LContext) then
    raise EioException.Create(ClassName, 'Create', 'The object received by the "AContextAsIInterface" parameter does not implements "IioContext" interface.');
  // Se l'entità non ha un ID valido non è possibile che l'ETM funzioni
  if LContext.IDIsNull then
    raise EioETMException.Create(ClassName, 'Create', Format('Hi, I''m iORM, we have a problem.' +
      #13#13'You asked me to persist an entity of type "%s" but this doesn''t have a valid ID.' +
      #13#13'You probably set the "BlindLevel" so as not to set the object ID immediately after the insert operation but this is incompatible with using the ETM.' +
      #13#13'Please try to set the BlindLevel to a correct value and try again, it will work.', [LContext.DataObject.ClassName]));
  // Entity related props
  FEntityClassName := LContext.DataObject.ClassName;
  FEntityID := LContext.GetID;
  FEntityVersion := LContext.ObjVersion;
  FEntityFromVersion := LContext.EntityFromVersion;
  FEntityUpdated := LContext.ObjUpdated;
  FEntityState := dj.From(LContext.DataObject, TioEtmFactory.djParamsEngine).ToJson;
  // User related props
  FUserID := IO_INTEGER_NULL_VALUE;
  FUserName := IO_STRING_NULL_VALUE;
  // Persistence related props
  FActionType := LContext.ActionType;
  FIntentType := LContext.IntentType;
  FBlindLevel := LContext.BlindLevel;
  FConflictDetected := LContext.ConflictDetected;
  FConflictState := LContext.ConflictState;
  FConflictStrategyName := LContext.GetCurrentStrategyName;
  // Conflict check by human related props
  FConflictCheckedByHuman := False;
  FConflictCheckedByHuman_ID := IO_INTEGER_NULL_VALUE;
  FConflictCheckedByHuman_Name := IO_STRING_NULL_VALUE;
  FConflictCheckedByHuman_DateTime := IO_DATETIME_NULL_VALUE;
  // NB: Questo è un anonymous method che viene passato dal BindSource che sta esponendo il TimeSlot stesso e che permette
  // di risalire alla versione corrente della entità attraverso la catena "ETMBindSource.etmFor.Current"
  FExtractCurrentEntityFunc := nil;
end;

function TioEtmCustomTimeSlot.GetSmartEntityInfo: String;
begin
  Result := Format('%s-%d', [FEntityClassName, FEntityID]);
end;

function TioEtmCustomTimeSlot.GetSmartEntityVersion: String;
begin
  case FIntentType of
    itRegular:
      if FActionType = atUpdate then
        Result := Format('%d (updated from %d)', [FEntityVersion, FEntityFromVersion])
      else
        FEntityVersion.ToString;
    itRevert:
      Result := Format('%d (reverted from %d)', [FEntityVersion, FEntityFromVersion]);
    itSynchronization:
      Result := Format('%d (synchronized from %d)', [FEntityVersion, FEntityFromVersion]);
  else
    raise EioException.Create(ClassName,  'GetSmartEntityVersion', 'IntentType not valid.');
  end;
end;

function TioEtmCustomTimeSlot.GetSmartActionType: String;
begin
  // Action type
  Result := io.Enums.OrdinalToString<TioPersistenceActionType>(Ord(FActionType));
  // Intent type
  case FIntentType of
    itRevert:
      Result := Result + ' (revert)';
    itSynchronization:
      Result := Result + ' (synchronization)';
  end;
end;

function TioEtmCustomTimeSlot.GetSmartConflictDetected: String;
begin
  if FConflictDetected then
    Result := Format('Conflict (%s)', [io.Enums.OrdinalToString<TioPersistenceConflictState>(Ord(FConflictState))])
  else
    Result := String.Empty;
end;

function TioEtmCustomTimeSlot.GetSmartConflictCheckedByHuman: String;
begin
  // If not checked by human then return an empty string
  if FConflictCheckedByHuman  then
    Exit(String.Empty);
  // If human checked build the result string
  Result := 'Checked';
  // human name & human ID
  if not FConflictCheckedByHuman_Name.IsEmpty then
  begin
    Result := Result + ' by ' + FConflictCheckedByHuman_Name;
    if FConflictCheckedByHuman_ID <> IO_INTEGER_NULL_VALUE then
      Result := Result + ' (id ' + FConflictCheckedByHuman_ID.ToString + ')';
  end
  else
  // human id only
  if FConflictCheckedByHuman_ID <> IO_INTEGER_NULL_VALUE then
    Result := Result + ' by id ' + FConflictCheckedByHuman_ID.ToString;
  // date time
  if FConflictCheckedByHuman_DateTime <> IO_DATETIME_NULL_VALUE then
    Result := Result + ' on ' + DateTimeToStr(FConflictCheckedByHuman_DateTime, TFormatSettings.Create);
end;

function TioEtmCustomTimeSlot.Diff(const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): String;
begin
  if Assigned(FExtractCurrentEntityFunc) then
    Result := TioEtmEngine.Diff(FExtractCurrentEntityFunc, Self, ADiffMode, AMoreInfo);
end;

function TioEtmCustomTimeSlot.DiffAsJsonObject(const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): TJSONObject;
begin
  Result := nil;
  if Assigned(FExtractCurrentEntityFunc) then
    Result := TioEtmEngine.DiffAsJsonObject(FExtractCurrentEntityFunc, Self, ADiffMode, AMoreInfo);
end;

procedure TioEtmCustomTimeSlot.DiffToFile(const AFileName: String; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
begin
  if Assigned(FExtractCurrentEntityFunc) then
    TioEtmEngine.DiffToFile(AFileName, FExtractCurrentEntityFunc, Self, ADiffMode, AMoreInfo);
end;

procedure TioEtmCustomTimeSlot.DiffToStream(const ATargetStream: TStream; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
begin
  if Assigned(FExtractCurrentEntityFunc) then
    TioEtmEngine.DiffToStream(ATargetStream, FExtractCurrentEntityFunc, Self, ADiffMode, AMoreInfo);
end;

function TioEtmCustomTimeSlot.GetBlindLevel_AutoUpdateProps: Boolean;
begin
  Result := (FBlindLevel AND BL_BIT_AUTO_UPDATE_PROPS) <> 0;
end;

function TioEtmCustomTimeSlot.GetBlindLevel_DetectConflicts: Boolean;
begin
  Result := (FBlindLevel AND BL_BIT_DETECT_CONFLICTS) <> 0;
end;

function TioEtmCustomTimeSlot.GetBlindLevel_DetectObjExists: Boolean;
begin
  Result := (FBlindLevel AND BL_BIT_DETECT_OBJ_EXISTS) <> 0;
end;

function TioEtmCustomTimeSlot.GetDiffOneWay: String;
begin
  Result := Diff(TioEtmDiffMode.dmOneway, False);
end;

function TioEtmCustomTimeSlot.GetDiffOneWayMoreInfo: String;
begin
  Result := Diff(TioEtmDiffMode.dmOneway, True);
end;

function TioEtmCustomTimeSlot.GetDiffTwoWay: String;
begin
  Result := Diff(TioEtmDiffMode.dmTwoway, False);
end;

function TioEtmCustomTimeSlot.GetDiffTwoWayMoreInfo: String;
begin
  Result := Diff(TioEtmDiffMode.dmTwoway, True);
end;

function TioEtmCustomTimeSlot.GetSmartDescription: String;
var
  LFormatSettings: TFormatSettings;
  LDateAndTime: String;
  LSmartUser: String;
begin
  // Es: '31/12/2023 10:15:35 Update (revert) user Maurizio'
  LFormatSettings := TFormatSettings.Create;
  LDateAndTime := DateTimeToStr(FDateAndTime, LFormatSettings);
  Result := Format('%s %s', [LDateAndTime, GetSmartActionType]);
  // User
  LSmartUser := GetSmartUser;
  if not LSmartUser.IsEmpty then
    Result := Format('%s user %s', [Result, GetSmartUser]);
end;

function TioEtmCustomTimeSlot.GetSmartFullDescription: String;
begin
  // Es: '31/12/2023 10:15:35 Update (revert) user Maurizio ver. 5 (updated from 4)'
  Result := Format('%s ver. %s', [GetSmartDescription, GetSmartEntityVersion]);
end;

function TioEtmCustomTimeSlot.GetSmartUser: String;
var
  LUserID: Integer;
  LUserName: String;
begin
  Result := String.Empty;
  // Extract user info as native type
  LUserID := Integer(FUserID);
  LUserName := String(FUserName);
  // UserID
  if LUserID <> 0 then
    Result := LUserID.ToString;
  // UserName
  if not LUserName.IsEmpty then
  begin
    if not Result.IsEmpty then
      Result := Result + '-';
    Result := LUserName + Result;
  end;
end;

{ ioConflictStrategy }

{ etmProperty }

constructor etmProperty.Create(const AEntityPropName, AEtmPropName: String);
begin
  FEntityPropName := AEntityPropName.Trim;
  FEtmPropName := AEtmPropName.Trim;
end;

constructor etmProperty.Create(const AEtmPropName: String);
begin
  FEntityPropName := AEtmPropName.Trim;
  FEtmPropName := IO_STRING_NULL_VALUE;
end;

constructor etmProperty.Create;
begin
  FEntityPropName := IO_STRING_NULL_VALUE;
  FEtmPropName := IO_STRING_NULL_VALUE;
end;

procedure etmProperty.SetEtmPropNameIfEmpty(const AValue: String);
begin
  if FEtmPropName = IO_STRING_NULL_VALUE then
    FEtmPropName := AValue.Trim;
end;

procedure etmProperty.SetEntityPropNameIfEmpty(const AValue: String);
begin
  if FEntityPropName = IO_STRING_NULL_VALUE then
    FEntityPropName := AValue.Trim;
end;

end.
