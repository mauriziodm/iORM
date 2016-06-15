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



unit iORM.DB.Components.MemTable;

interface

uses
  FireDAC.Comp.Client, System.Classes, iORM.Where.Interfaces;

type

  TioMemTable = class (TFDMemTable)
  private
    FioWhereStr: TStrings;
    FioWhere: IioWhere;
    FioAutoLoadDataWhenActivated: Boolean;
    FioOrderBy: String;
    FioTypeAlias: String;
    FioTypeName: String;
    FioLoadingData: Boolean;
    FioComponentLoaded: Boolean;
    procedure SetIoWhereStr(const Value: TStrings);
    procedure WhereOnChangeEventHandler(Sender: TObject);
  protected
    procedure DoBeforeOpen; override;
    procedure Loaded; override;
    property ioLoadingData: Boolean read FioLoadingData write FioLoadingData;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ioLoadData;
    property ioWhere:IioWhere read FioWhere write FioWhere;
  published
    property ioTypeName:String read FioTypeName write FioTypeName;
    property ioTypeAlias:String read FioTypeAlias write FioTypeAlias;
    property ioAutoLoadDataWhenActivated:Boolean read FioAutoLoadDataWhenActivated write FioAutoLoadDataWhenActivated;
    property ioWhereStr:TStrings read FioWhereStr write SetIoWhereStr;
    property ioOrderBy:String read FioOrderBy Write FioOrderBy;
  end;

implementation

uses
  iORM, iORM.Where.Factory;

{ TioMemTable }


constructor TioMemTable.Create(AOwner: TComponent);
begin
  inherited;
  FioComponentLoaded := False;
  FioLoadingData := False;
  FioAutoLoadDataWhenActivated := True;
  // Set even an onChange event handler
  FioWhereStr := TStringList.Create;
  SetIoWhereStr(FioWhereStr);  // set TStringList.onChange event handler
end;

destructor TioMemTable.Destroy;
begin
  FioWhereStr.Free;
  inherited;
end;

procedure TioMemTable.DoBeforeOpen;
begin
  inherited;
  ioLoadData;
end;

procedure TioMemTable.ioLoadData;
begin
  if FioComponentLoaded
  and (not ioLoadingData)
  and not (csDesigning in Self.ComponentState)
  and not (csReading in Self.ComponentState)
  and not (csLoading in Self.ComponentState)
  then
  begin
    ioLoadingData := True;
    try
      io.Load(FioTypeName, FioTypeAlias)
             ._Where(FioWhere)
             ._OrderBy(FioOrderBy)
             .ToMemTable(Self);
    finally
      ioLoadingData := False;
    end;
  end;
end;

procedure TioMemTable.Loaded;
begin
  inherited;
  FioComponentLoaded := True;
  if Active and FioAutoLoadDataWhenActivated then
    ioLoadData;
end;

procedure TioMemTable.SetIoWhereStr(const Value: TStrings);
begin
  FioWhereStr.Assign(Value);
  // Set the onChange event handler
  (FioWhereStr as TStringList).OnChange := WhereOnChangeEventHandler;
  // Update the adapter where property
  WhereOnChangeEventHandler(Self);
end;

procedure TioMemTable.WhereOnChangeEventHandler(Sender: TObject);
begin
  Self.ioWhere := TioWhereFactory.NewWhere.Add(Self.FioWhereStr.Text);
end;

end.
