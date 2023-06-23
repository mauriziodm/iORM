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
unit iORM.DB.MemTable;

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
    function Get_Version: String;
    procedure SetIoWhereStr(const Value: TStrings);
    procedure WhereOnChangeEventHandler(Sender: TObject);
  protected
    procedure DoBeforeOpen; override;
    procedure DoAfterOpen; override;
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
    property _Version: String read Get_Version;
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

procedure TioMemTable.DoAfterOpen;
begin
  inherited;
  Self.First;
end;

procedure TioMemTable.DoBeforeOpen;
begin
  inherited;
  ioLoadData;
end;

function TioMemTable.Get_Version: String;
begin
  Result := io.Version;
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
