{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.Attributes;

interface

uses
  System.Rtti, iORM.CommonTypes;

type

  // Class mapping types
  TioMapModeType = (mmHybrid, mmProperties, mmFields);

  // Relation types
  TioRelationType = (rtNone, rtBelongsTo, rtHasMany, rtHasOne, rtEmbeddedHasMany, rtEmbeddedHasOne);

  // ForeignKey types
  TioFKAction = (fkUnspecified, fkNoAction, fkSetNull, fkSetDefault, fkCascade);
  TioFKCreate = (fkCreate, fkDoNotCreate);

  // Join types
  TioJoinType = (jtInner, jtCross, jtLeftOuter, jtRightOuter, jtFullOuter);

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

  // Standard AttributeLabel
  ioMarker = class(TioCustomStringAttribute)
  end;

  // ---------------------------------------------------------------------------
  // END BASE ATTRIBUTES
  // ===========================================================================





  // ===========================================================================
  // START PROPERTY ATTRIBUTES
  // ---------------------------------------------------------------------------

  // Skip attribute
  ioSkip = class(TioCustomAttribute)
  end;

  ioTransient = ioSkip;

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

  // Disable automatic detection for HasMany relation(s)
  ioDisableRelationAutodetect = class(TioCustomAttribute);

  // Relation BelongsTo attribute
  ioHasOne = class(ioHasMany)
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
  // ---------------------------------------------------------------------------
  // END PROPERTY ATTRIBUTES
  // ===========================================================================




  // ===========================================================================
  // START CLASS ATTRIBUTES
  // ---------------------------------------------------------------------------

  // Table & Entity attributes
  ioTable = class(TioCustomStringAttribute)
  strict private
    FMapMode: TioMapModeType;
  public
    constructor Create(const AValue: String = ''; const AMapMode: TioMapModeType = mmHybrid); overload;
    constructor Create(const AMapMode: TioMapModeType); overload;
    property MapMode: TioMapModeType read FMapMode;
  end;

  ioEntity = class(ioTable)
  end;

  // KeyGeneratorName attribute
  ioKeyGenerator = class(TioCustomStringAttribute)
  end;

  ioKeySequence = ioKeyGenerator;

  // ConnectionDefName attribute
  ioConnectionDefName = class(TioCustomStringAttribute)
  end;

  // TrueClass
  ioTrueClass = class(TioCustomAttribute)
  end;

  ioClassFromField = ioTrueClass; // DEPRECATED

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
    constructor Create(const AJoinType: TioJoinType; AJoinClassRef: TioClassRef; AJoinCondition: String = '');
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
    constructor Create(const AIndexName: String; ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation = ioAscending;
      const AUnique: Boolean = False); overload;
    constructor Create(ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    constructor Create(const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    property IndexName: String read FIndexName;
    property CommaSepFieldList: String read FCommaSepFieldList write FCommaSepFieldList;
    property IndexOrientation: TioIndexOrientation read FIndexOrientation;
    property Unique: Boolean read FUnique;
  end;

  // KeyGeneratorName attribute
  ioDisableAutoCreateOnDB = class(TioCustomAttribute)
  end;

  // DIC - diRegister attribute (register the class as is, without interfaces)
  diRegister = class(TioCustomAttribute)
  end;

  // DIC - diImplements attribute
  diImplements = class(TioCustomAttribute)
  strict private
    FIID: TGUID;
    FAlias: String;
  public
    constructor Create(AIID: TGUID; const AAlias: String = '');
    property IID: TGUID read FIID;
    property Alias: String read FAlias;
  end;

  // DIC - diAsSingleton attribute
  diDoNotRegisterAsInterfacedEntity = class(TioCustomAttribute)
  end;

  // DIC - diAsSingleton attribute
  diAsSingleton = class(TioCustomAttribute)
  end;

  // DIC - diViewFor(TargetModelClassName) (register the calss as View for the TargetModelClassName)
  diViewFor = class(TioCustomForTargetModel)
  end;

  // DIC - diViewModelFor(TargetModelClassName) (register the calls as Views for the TargetModelClassName)
  diViewModelFor = class(TioCustomForTargetModel)
  end;
  // ---------------------------------------------------------------------------
  // END CLASS ATTRIBUTES
  // ===========================================================================

  // ===========================================================================
  // START EMBEDDED ATTRIBUTES
  // ---------------------------------------------------------------------------
  // EmbeddedHasMany attribute
  ioEmbeddedHasMany = class(TioCustomRelationAttribute)
  end;

  // EmbeddedHasOne attribute
  ioEmbeddedHasOne = class(TioCustomRelationAttribute)
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
    constructor Create(const ATypeAlias: String = ''); overload;
    constructor Create(const ATypeName, ATypeAlias: String); overload;
    property TypeName: String read FTypeName;
    property TypeAlias: String read FTypeAlias;
  end;

  // ---------------------------------------------------------------------------
  // END DEPENDENCY INJECTION ATTRIBUTES
  // ===========================================================================

implementation

uses
  iORM.Utilities;

{ TioStringAttribute }

constructor TioCustomStringAttribute.Create(const AValue: String);
begin
  FValue := AValue;
end;

{ ioSkip }

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

constructor ioTable.Create(const AValue: String; const AMapMode: TioMapModeType);
begin
  inherited Create(AValue);
  FMapMode := AMapMode;
end;

constructor ioTable.Create(const AMapMode: TioMapModeType);
begin
  inherited Create('');
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

end.
