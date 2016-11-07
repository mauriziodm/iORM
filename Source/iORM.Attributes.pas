{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.Attributes;

interface

uses
  iORM.CommonTypes, ObjMapper.Attributes, System.UITypes;

type

  // destination event for VM action
  TioActionEvent = (Null, OnExecute, OnUpdate, OnHint);

  // Type of class mapping
  TioMapModeType = (ioProperties, ioFields);

  // Relation types
  TioRelationType = (ioRTNone, ioRTBelongsTo, ioRTHasMany, ioRTHasOne, ioRTEmbeddedHasMany, ioRTEmbeddedHasOne);

  // LazyLoad
  TioLoadType = (ioImmediateLoad = 0, ioLazyLoad);

  // Join types
  TioJoinType = (ioInner, ioCross, ioLeftOuter, ioRightOuter, ioFullOuter);

  // ===========================================================================
  // START BASE ATTRIBUTES
  // ---------------------------------------------------------------------------

  // Base simple attribute
  TioCustomAttribute = class(TCustomAttribute)
  end;

  // Base String attribute
  TioCustomStringAttribute = class(TCustomAttribute)
  strict private
    FValue: String;
  public
    constructor Create(const AValue:String='');
    property Value:String read FValue;
  end;

  // Base integer attribute
  TioCustomIntegerAttribute = class(TCustomAttribute)
  strict private
    FValue: Integer;
  public
    constructor Create(const AValue:Integer);
    property Value:Integer read FValue;
  end;

  // Base boolean attribute
  TioCustomBoolAttribute = class(TCustomAttribute)
  strict private
    FValue: Boolean;
  public
    constructor Create(const AValue:Boolean);
    property Value:Boolean read FValue;
  end;

  // Base class for relation attribute
  TCustomRelationAttribute = class(TioCustomAttribute)
  strict private
    FChildTypeName: String;
    FChildTypeAlias: String;
  public
    constructor Create(AChildClassRef:TioClassRef); overload;
    constructor Create(const AChildTypeName:String; const AChildTypeAlias:String=''); overload;
    property ChildTypeName: String read FChildTypeName;
    property ChildTypeAlias: String read FChildTypeAlias;
  end;

  // Standard AttributeLabel
  ioMarker = class(TioCustomStringAttribute)
  end;

  // ---------------------------------------------------------------------------
  // END BASE ATTRIBUTES
  // ===========================================================================





  // ===========================================================================
  // START MVVM ATTRIBUTES
  // ---------------------------------------------------------------------------

   ioBindAction = class(TioCustomStringAttribute)
   end;

   ioAction = class(TioCustomAttribute)
   private
     FName: String;
     FCaption: String;
     FEvent: TioActionEvent;
   public
     constructor Create(const AName, ACaption:String; const AEvent:TioActionEvent=TioActionEvent.Null); overload;
     constructor Create(const AName:String; const AEvent:TioActionEvent=TioActionEvent.Null); overload;
     property Name:String read FName;
     property Caption:String read FCaption;
     property Event:TioActionEvent read FEvent;
   end;

   ioCommand = class(TioCustomAttribute)
   private
     FName: String;
   public
     constructor Create(const AName: String);
     property Name:String read FName;
   end;

   ioDisabled = class(TioCustomAttribute)
   end;

   ioChecked = class(TioCustomAttribute)
   end;

   ioGroupIndex = class(TioCustomIntegerAttribute)
   end;

   ioHint = class(TioCustomStringAttribute)
   end;

   ioImageIndex = class(TioCustomIntegerAttribute)
   end;

   ioInvisible = class(TioCustomAttribute)
   end;

   ioNotificationTarget = class(TioCustomAttribute)
   end;

  // ---------------------------------------------------------------------------
  // END MVVM ATTRIBUTES
  // ===========================================================================





  // ===========================================================================
  // START PROPERTY ATTRIBUTES
  // ---------------------------------------------------------------------------

  // Skip attribute
  ioSkip = class(TioCustomAttribute)
  end;

  // ID attribute
  ioOID = class(TioCustomAttribute)
  strict private
    FSkipOnInsert: Boolean;
  public
    constructor Create(const ASkipOnInsert:Boolean=True);
    property SkipOnInsert:Boolean read FSkipOnInsert;
  end;

  // FieldName attribute
  ioField = class(TioCustomStringAttribute)
  end;

  // FieldName attribute
  ioLoadSQL = class(TioCustomStringAttribute)
  end;

  // FieldType attribute
  ioFieldType = class(TioCustomStringAttribute)
  end;

  // Relation BelongsTo attribute
  ioBelongsTo = class(TCustomRelationAttribute)
  end;

  // Relation HasMany attribute
  ioHasMany = class(TCustomRelationAttribute)
  strict private
    FChildPropertyName: String;
    FLoadType: TioLoadType;
    FAutoIndex: Boolean;
  public
    constructor Create(const AChildClassRef:TioClassRef; const AChildPropertyName:String; const ALoadType:TioLoadType=ioImmediateLoad; const AAutoIndex:Boolean=True); overload;
    constructor Create(const AChildTypeName, AChildTypeAlias, AChildPropertyName:String; const ALoadType:TioLoadType=ioImmediateLoad; const AAutoIndex:Boolean=True); overload;
    constructor Create(const AChildTypeName, AChildPropertyName:String; const ALoadType:TioLoadType=ioImmediateLoad; const AAutoIndex:Boolean=True); overload;
    property ChildPropertyName: String read FChildPropertyName;
    property LoadType: TioLoadType read FLoadType;
    property AutoIndex: Boolean read FAutoIndex;
  end;

  // Relation BelongsTo attribute
  ioHasOne = class(ioHasMany)
  end;

  // ReadOnly attribute
  ioReadOnly = class(TioCustomAttribute)
  end;

  // WriteOnly attribute
  ioWriteOnly = class(TioCustomAttribute)
  end;

  // TypeAlias attribute
  ioTypeAlias = class(TioCustomStringAttribute)
  end;

  // ---------------------------------------------------------------------------
  // END PROPERTY ATTRIBUTES
  // ===========================================================================




  // ===========================================================================
  // START CLASS ATTRIBUTES
  // ---------------------------------------------------------------------------

  // Table & Entity attribute
  ioTable = class(TioCustomStringAttribute)
  strict private
    FMapMode: TioMapModeType;
  public
    constructor Create(const AValue:String=''; const AMapMode:TioMapModeType=ioProperties); overload;
    property MapMode: TioMapModeType read FMapMode;
  end;
  ioEntity = class(ioTable)
  end;

  // KeyGeneratorName attribute
  ioKeyGenerator = class(TioCustomStringAttribute)
  end;

  // ConnectionDefName attribute
  ioConnectionDefName = class(TioCustomStringAttribute)
  end;

  // ClassFromField
  ioClassFromField = class(TioCustomAttribute)
  end;
  ioTrueClass = ioClassFromField;

  // GroupBy
  ioGroupBy = class(TioCustomStringAttribute)
  end;

  // Join attribute
  ioJoin = class(TioCustomAttribute)
  strict private
    FJoinType: TioJoinType;
    FJoinClassRef: TioClassRef;
    FJoinCondition: String;
  public
    constructor Create(const AJoinType:TioJoinType; AJoinClassRef:TioClassRef; AJoinCondition:String='');
    property JoinType: TioJoinType read FJoinType;
    property JoinClassRef: TioClassRef read FJoinClassRef;
    property JoinCondition: String read FJoinCondition;
  end;

  // Indexes attribute
  ioIndex = class(TioCustomAttribute)
  strict private
    FIndexName: String;
    FCommaSepFieldList: String;
    FIndexOrientation: TioIndexOrientation;
    FUnique: Boolean;
  public
    constructor Create(const AIndexName:String; ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation=ioAscending; const AUnique:Boolean=False); overload;
    constructor Create(ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation=ioAscending; const AUnique:Boolean=False); overload;
    constructor Create(const AIndexOrientation:TioIndexOrientation=ioAscending; const AUnique:Boolean=False); overload;
    property IndexName:String read FIndexName;
    property CommaSepFieldList:String read FCommaSepFieldList write FCommaSepFieldList;
    property IndexOrientation:TioIndexOrientation read FIndexOrientation;
    property Unique:Boolean read FUnique;
  end;

  // KeyGeneratorName attribute
  ioDisableAutoCreateDB = class(TioCustomAttribute)
  end;
  // ---------------------------------------------------------------------------
  // SEND CLASS ATTRIBUTES
  // ===========================================================================




  // ===========================================================================
  // START EMBEDDED ATTRIBUTES
  // ---------------------------------------------------------------------------

  // EmbeddedHasMany attribute
  ioEmbeddedHasMany = class(TCustomRelationAttribute)

  end;

  // EmbeddedHasOne attribute
  ioEmbeddedHasOne = class(TCustomRelationAttribute)

  end;

  // EmbeddedSkip attribute
  ioEmbeddedSkip = class(DoNotSerializeAttribute)  // from DMVC ObjectsMappers

  end;

  // EmbeddedSkip attribute
  ioEmbeddedStreamable = class(StreamableAttribute)  // from DMVC ObjectsMappers

  end;

  // ---------------------------------------------------------------------------
  // end EMBEDDED ATTRIBUTES
  // ===========================================================================




  // ===========================================================================
  // START DEPENDENCY INJECTION ATTRIBUTES
  // ---------------------------------------------------------------------------

  // ioInject attribute
  ioInject = class(TioCustomAttribute)
  strict private
    FTypeName: String;
    FTypeAlias: String;
  public
    constructor Create(const ATypeAlias:String=''); overload;
    constructor Create(const ATypeName, ATypeAlias:String); overload;
    property TypeName:String read FTypeName;
    property TypeAlias:String read FTypeAlias;
  end;

  // ---------------------------------------------------------------------------
  // END DEPENDENCY INJECTION ATTRIBUTES
  // ===========================================================================


implementation

uses
  System.SysUtils;

{ TioStringAttribute }

constructor TioCustomStringAttribute.Create(const AValue: String);
begin
  FValue := AValue;
end;

{ ioSkip }

{ TCustomRelationAttribute }

constructor TCustomRelationAttribute.Create(AChildClassRef: TioClassRef);
begin
  Create(AChildClassRef.ClassName, '');
end;

constructor TCustomRelationAttribute.Create(const AChildTypeName, AChildTypeAlias: String);
begin
  FChildTypeName := AChildTypeName;
  FChildTypeAlias := AChildTypeAlias;
end;

{ ioHasMany }

constructor ioHasMany.Create(const AChildClassRef: TioClassRef;
  const AChildPropertyName: String; const ALoadType:TioLoadType=ioImmediateLoad; const AAutoIndex:Boolean=True);
begin
  inherited Create(AChildClassRef);
  FChildPropertyName := AChildPropertyName;
  FLoadType := ALoadType;
  FAutoIndex := AAutoIndex;
end;


constructor ioHasMany.Create(const AChildTypeName, AChildTypeAlias, AChildPropertyName: String; const ALoadType: TioLoadType; const AAutoIndex:Boolean);
begin
  inherited Create(AChildTypeName, AChildTypeAlias);
  FChildPropertyName := AChildPropertyName;
  FLoadType := ALoadType;
  FAutoIndex := AAutoIndex;
end;

constructor ioHasMany.Create(const AChildTypeName, AChildPropertyName: String; const ALoadType: TioLoadType; const AAutoIndex:Boolean);
begin
  Self.Create(AChildTypeName, '', AChildPropertyName, ALoadType);
  FAutoIndex := AAutoIndex;
end;

{ ioJoin }

constructor ioJoin.Create(const AJoinType: TioJoinType;
  AJoinClassRef: TioClassRef; AJoinCondition: String);
begin
  inherited Create;
  FJoinType := AJoinType;
  FJoinClassRef := AJoinClassRef;
  FJoinCondition := AJoinCondition;
end;

{ ioTable }

constructor ioTable.Create(const AValue:String; const AMapMode: TioMapModeType);
begin
  inherited Create(AValue);
  FMapMode := AMapMode;
end;

{ ioIndex }

constructor ioIndex.Create(const AIndexName: String; ACommaSepFieldList: String;
  const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  inherited Create;
  FIndexName := AIndexName;
  FCommaSepFieldList := ACommaSepFieldList;
  FIndexOrientation := AIndexOrientation;
  FUnique := AUnique;
end;

constructor ioIndex.Create(ACommaSepFieldList: String;
  const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  Self.Create('', ACommaSepFieldList, AIndexOrientation, AUnique);
end;

constructor ioIndex.Create(const AIndexOrientation: TioIndexOrientation;
  const AUnique: Boolean);
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

{ ioAction }

constructor ioAction.Create(const AName, ACaption: String;
  const AEvent: TioActionEvent);
begin
  inherited Create;
  FName := AName;
  FCaption := ACaption;
  FEvent := AEvent;
end;

constructor ioAction.Create(const AName: String; const AEvent: TioActionEvent);
begin
  Self.Create(AName, '', AEvent);
end;

{ ioCommand }

constructor ioCommand.Create(const AName: String);
begin
  FName := AName;
end;

{ ioSkip }

{ ioOID }

constructor ioOID.Create(const ASkipOnInsert: Boolean);
begin
  inherited Create;
  FSkipOnInsert := ASkipOnInsert;
end;

end.
