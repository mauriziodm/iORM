{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



unit iORM.Attributes;

interface

uses
  iORM.CommonTypes,
  System.UITypes,
  ObjMapper.Attributes;

type
  /// <summary>destination event for VM action</summary>
  TioActionEvent = (Null, OnExecute, OnUpdate, OnHint);

  /// <summary>Type of class mapping</summary>
  TioMapModeType = (ioProperties, ioFields);

  /// <summary>Relation types</summary>
  TioRelationType = (ioRTNone, ioRTBelongsTo, ioRTHasMany, ioRTHasOne, ioRTEmbeddedHasMany, ioRTEmbeddedHasOne);

  /// <summary>LazyLoad</summary>
  TioLoadType = (ioImmediateLoad = 0, ioLazyLoad);

  /// <summary>Join types</summary>
  TioJoinType = (ioInner, ioCross, ioLeftOuter, ioRightOuter, ioFullOuter);

 {$REGION 'BASE ATTRIBUTES'}
  /// <summary>Base simple attribute</summary>
  TioCustomAttribute = class(TCustomAttribute)
  end;

  /// <summary>Base String attribute</summary>
  TioCustomStringAttribute = class(TCustomAttribute)
  strict private
    FValue: string;
  public
    constructor Create(const AValue: string = '');
    property Value: string read FValue;
  end;

  /// <summary>Base integer attribute</summary>
  TioCustomIntegerAttribute = class(TCustomAttribute)
  strict private
    FValue: Integer;
  public
    constructor Create(const AValue: Integer);
    property Value: Integer read FValue;
  end;

  /// <summary>Base boolean attribute</summary>
  TioCustomBoolAttribute = class(TCustomAttribute)
  strict private
    FValue: Boolean;
  public
    constructor Create(const AValue: Boolean);
    property Value: Boolean read FValue;
  end;

  /// <summary>Base class for relation attribute</summary>
  TioCustomRelationAttribute = class(TioCustomAttribute)
  strict private
    FChildTypeName: string;
    FChildTypeAlias: string;
  public
    constructor Create(AChildClassRef: TioClassRef); overload;
    constructor Create(const AChildTypeName: string; const AChildTypeAlias: string = ''); overload;
    property ChildTypeName: string read FChildTypeName;
    property ChildTypeAlias: string read FChildTypeAlias;
  end;

  /// <summary>Standard AttributeLabel</summary>
  ioMarker = class(TioCustomStringAttribute)
  end;

  TioCustomForTargetModelClass = class(TioCustomAttribute)
  strict private
    FTargetClassName: string;
    FAlias: string;
  public
    constructor Create(const ATargetClassName: string; const AAlias: string = '');
    property TargetClassName: string read FTargetClassName;
    property Alias: string read FAlias;
  end;
{$ENDREGION}
{$REGION 'MVVM ATTRIBUTES'}

  ioBindAction = class(TioCustomStringAttribute)
  end;

  ioAction = class(TioCustomAttribute)
  private
    FName: string;
    FCaption: string;
    FEvent: TioActionEvent;
  public
    constructor Create(const AName, ACaption: string; const AEvent: TioActionEvent = TioActionEvent.Null); overload;
    constructor Create(const AName: string; const AEvent: TioActionEvent = TioActionEvent.Null); overload;
    property Name: string read FName;
    property Caption: string read FCaption;
    property Event: TioActionEvent read FEvent;
  end;

  ioCommand = class(TioCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const AName: string);
    property Name: string read FName;
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
{$ENDREGION}
{$REGION 'PROPERTY ATTRIBUTES'}
  /// <summary>Skip attribute</summary>

  ioSkip = class(TioCustomAttribute)
  end;

  /// <summary>ID attribute</summary>
  ioOID = class(TioCustomAttribute)
  strict private
    FSkipOnInsert: Boolean;
  public
    constructor Create(const ASkipOnInsert: Boolean = True);
    property SkipOnInsert: Boolean read FSkipOnInsert;
  end;

  /// <summary>FieldName attribute</summary>
  ioField = class(TioCustomStringAttribute)
  end;

  /// <summary>FieldName attribute</summary>
  ioLoadSQL = class(TioCustomStringAttribute)
  end;

  /// <summary>FieldType attribute</summary>
  ioFieldType = class(TioCustomStringAttribute)
  end;

  /// <summary>Relation BelongsTo attribute</summary>
  ioBelongsTo = class(TioCustomRelationAttribute)
  end;

  /// <summary>Relation HasMany attribute</summary>
  ioHasMany = class(TioCustomRelationAttribute)
  strict private
    FChildPropertyName: string;
    FLoadType: TioLoadType;
    FAutoIndex: Boolean;
  public
    constructor Create(const AChildClassRef: TioClassRef; const AChildPropertyName: string; const ALoadType: TioLoadType = ioImmediateLoad; const AAutoIndex: Boolean = True); overload;
    constructor Create(const AChildTypeName, AChildTypeAlias, AChildPropertyName: string; const ALoadType: TioLoadType = ioImmediateLoad; const AAutoIndex: Boolean = True); overload;
    constructor Create(const AChildTypeName, AChildPropertyName: string; const ALoadType: TioLoadType = ioImmediateLoad; const AAutoIndex: Boolean = True); overload;
    property ChildPropertyName: string read FChildPropertyName;
    property LoadType: TioLoadType read FLoadType;
    property AutoIndex: Boolean read FAutoIndex;
  end;

  /// <summary>Relation BelongsTo attribute</summary>
  ioHasOne = class(ioHasMany)
  end;

  /// <summary>ReadOnly attribute</summary>
  ioReadOnly = class(TioCustomAttribute)
  end;

  /// <summary>WriteOnly attribute</summary>
  ioWriteOnly = class(TioCustomAttribute)
  end;

  /// <summary>TypeAlias attribute</summary>
  ioTypeAlias = class(TioCustomStringAttribute)
  end;
{$ENDREGION}
{$REGION 'CLASS ATTRIBUTES'}
  /// <summary>Table & Entity attribute</summary>

  ioTable = class(TioCustomStringAttribute)
  strict private
    FMapMode: TioMapModeType;
  public
    constructor Create(const AValue: string = ''; const AMapMode: TioMapModeType = ioProperties); overload;
    constructor Create(const AMapMode: TioMapModeType); overload;
    property MapMode: TioMapModeType read FMapMode;
  end;

  ioEntity = class(ioTable)
  end;

  /// <summary>KeyGeneratorName attribute</summary>
  ioKeyGenerator = class(TioCustomStringAttribute)
  end;

  /// <summary>ConnectionDefName attribute</summary>
  ioConnectionDefName = class(TioCustomStringAttribute)
  end;

  /// <summary>ClassFromField</summary>
  ioClassFromField = class(TioCustomAttribute)
  end;

  ioTrueClass = ioClassFromField;

  /// <summary>GroupBy</summary>
  ioGroupBy = class(TioCustomStringAttribute)
  end;

  /// <summary>Join attribute</summary>
  ioJoin = class(TioCustomAttribute)
  strict private
    FJoinType: TioJoinType;
    FJoinClassRef: TioClassRef;
    FJoinCondition: string;
  public
    constructor Create(const AJoinType: TioJoinType; AJoinClassRef: TioClassRef; const AJoinCondition: string = '');
    property JoinType: TioJoinType read FJoinType;
    property JoinClassRef: TioClassRef read FJoinClassRef;
    property JoinCondition: string read FJoinCondition;
  end;

  /// <summary>Indexes attribute</summary>
  ioIndex = class(TioCustomAttribute)
  strict private
    FIndexName: string;
    FCommaSepFieldList: string;
    FIndexOrientation: TioIndexOrientation;
    FUnique: Boolean;
  public
    constructor Create(const AIndexName: string; const ACommaSepFieldList: string; const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    constructor Create(const ACommaSepFieldList: string; const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    constructor Create(const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    property IndexName: string read FIndexName;
    property CommaSepFieldList: string read FCommaSepFieldList write FCommaSepFieldList;
    property IndexOrientation: TioIndexOrientation read FIndexOrientation;
    property Unique: Boolean read FUnique;
  end;

  /// <summary>KeyGeneratorName attribute</summary>
  ioDisableAutoCreateDB = class(TioCustomAttribute)
  end;

  /// <summary>DIC - diRegister attribute (register the class as is, without interfaces)</summary>
  diRegister = class(TioCustomAttribute)
  end;

  /// <summary>DIC - diImplements attribute</summary>
  diImplements = class(TioCustomAttribute)
  strict private
    FIID: TGUID;
    FAlias: string;
  public
    constructor Create(AIID: TGUID; const AAlias: string = '');
    property IID: TGUID read FIID;
    property Alias: string read FAlias;
  end;

  /// <summary>DIC - diAsSingleton attribute</summary>
  diAsSingleton = class(TioCustomAttribute)
  end;

  /// <summary>DIC - diViewFor(TargetModelClassName) (register the calss as View for the TargetModelClassName)</summary>
  diViewFor = class(TioCustomForTargetModelClass)
  end;

  /// <summary>DIC - diViewModelFor(TargetModelClassName) (register the calss as View for the TargetModelClassName)</summary>
  diViewModelFor = class(TioCustomForTargetModelClass)
  end;
  {$ENDREGION}

{$REGION 'EMBEDDED ATTRIBUTES'}
  /// <summary>EmbeddedHasMany attribute</summary>

  ioEmbeddedHasMany = class(TioCustomRelationAttribute)
  end;

  /// <summary>EmbeddedHasOne attribute</summary>
  ioEmbeddedHasOne = class(TioCustomRelationAttribute)
  end;
  /// <summary>EmbeddedSkip attribute</summary>

  ioEmbeddedSkip = class(DoNotSerializeAttribute)  // from DMVC ObjectsMappers
  end;

  /// <summary>EmbeddedSkip attribute</summary>
  ioEmbeddedStreamable = class(StreamableAttribute)  // from DMVC ObjectsMappers
  end;
{$ENDREGION}
{$REGION 'DEPENDENCY INJECTION ATTRIBUTES'}
  /// <summary>ioInject attribute</summary>

  ioInject = class(TioCustomAttribute)
  strict private
    FTypeName: string;
    FTypeAlias: string;
  public
    constructor Create(const ATypeAlias: string = ''); overload;
    constructor Create(const ATypeName, ATypeAlias: string); overload;
    property TypeName: string read FTypeName;
    property TypeAlias: string read FTypeAlias;
  end;
{$ENDREGION}

implementation

uses
  System.SysUtils,
  iORM.Rtti.Utilities;

{ TioStringAttribute }

constructor TioCustomStringAttribute.Create(const AValue: string);
begin
  inherited Create;
  FValue := AValue;
end;

{ TCustomRelationAttribute }

constructor TioCustomRelationAttribute.Create(AChildClassRef: TioClassRef);
begin
  inherited Create;
  Create(AChildClassRef.ClassName, '');
end;

constructor TioCustomRelationAttribute.Create(const AChildTypeName, AChildTypeAlias: string);
begin
  inherited Create;
  FChildTypeName := AChildTypeName;
  FChildTypeAlias := AChildTypeAlias;
end;

{ ioHasMany }

constructor ioHasMany.Create(const AChildClassRef: TioClassRef; const AChildPropertyName: string; const ALoadType: TioLoadType = ioImmediateLoad; const AAutoIndex: Boolean = True);
begin
  inherited Create(AChildClassRef);
  FChildPropertyName := AChildPropertyName;
  FLoadType := ALoadType;
  FAutoIndex := AAutoIndex;
end;

constructor ioHasMany.Create(const AChildTypeName, AChildTypeAlias, AChildPropertyName: string; const ALoadType: TioLoadType; const AAutoIndex: Boolean);
begin
  inherited Create(AChildTypeName, AChildTypeAlias);
  FChildPropertyName := AChildPropertyName;
  FLoadType := ALoadType;
  FAutoIndex := AAutoIndex;
end;

constructor ioHasMany.Create(const AChildTypeName, AChildPropertyName: string; const ALoadType: TioLoadType; const AAutoIndex: Boolean);
begin
  inherited Create;
  Self.Create(AChildTypeName, '', AChildPropertyName, ALoadType);
  FAutoIndex := AAutoIndex;
end;

{ ioJoin }

constructor ioJoin.Create(const AJoinType: TioJoinType; AJoinClassRef: TioClassRef; const AJoinCondition: string);
begin
  inherited Create;
  FJoinType := AJoinType;
  FJoinClassRef := AJoinClassRef;
  FJoinCondition := AJoinCondition;
end;

{ ioTable }

constructor ioTable.Create(const AValue: string; const AMapMode: TioMapModeType);
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

constructor ioIndex.Create(const AIndexName: string; const ACommaSepFieldList: string; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  inherited Create;
  FIndexName := AIndexName;
  FCommaSepFieldList := ACommaSepFieldList;
  FIndexOrientation := AIndexOrientation;
  FUnique := AUnique;
end;

constructor ioIndex.Create(const ACommaSepFieldList: string; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  inherited Create;
  Self.Create('', ACommaSepFieldList, AIndexOrientation, AUnique);
end;

constructor ioIndex.Create(const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  inherited Create;
  Self.Create('', '', AIndexOrientation, AUnique);
end;

{ ioInject }

constructor ioInject.Create(const ATypeAlias: string);
begin
  inherited Create;
  FTypeName := '';
  FTypeAlias := ATypeAlias;
end;

constructor ioInject.Create(const ATypeName, ATypeAlias: string);
begin
  inherited Create;
  Self.Create(ATypeAlias);
  FTypeName := ATypeName;
end;


{ TioCustomIntegerAttribute }

constructor TioCustomIntegerAttribute.Create(const AValue: Integer);
begin
  inherited Create;
  FValue := AValue;
end;

{ TioCustomBoolAttribute }

constructor TioCustomBoolAttribute.Create(const AValue: Boolean);
begin
  inherited Create;
  FValue := AValue;
end;

{ ioAction }

constructor ioAction.Create(const AName, ACaption: string; const AEvent: TioActionEvent);
begin
  inherited Create;
  FName := AName;
  FCaption := ACaption;
  FEvent := AEvent;
end;

constructor ioAction.Create(const AName: string; const AEvent: TioActionEvent);
begin
  inherited Create;
  Self.Create(AName, '', AEvent);
end;

{ ioCommand }

constructor ioCommand.Create(const AName: string);
begin
  inherited Create;
  FName := AName;
end;

{ ioOID }

constructor ioOID.Create(const ASkipOnInsert: Boolean);
begin
  inherited Create;
  FSkipOnInsert := ASkipOnInsert;
end;

{ diImplements }

constructor diImplements.Create(AIID: TGUID; const AAlias: string);
begin
  inherited Create;
  FIID := AIID;
  FAlias := AAlias;
end;

{ diViewFor }

constructor TioCustomForTargetModelClass.Create(const ATargetClassName: string; const AAlias: string);
begin
  inherited Create;
  FTargetClassName := ATargetClassName;
  FAlias := AAlias;
end;

end.

