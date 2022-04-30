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





unit iORM.REST.DMVC.Controller;

interface

uses 
  MVCFramework,
  // M.M. 16/11/19 Aggiunta unit per nuova versione di DMVC Framework
  MVCFramework.Commons;

type

  [MVCPath('/')]
  TioDMVCController = class(TMVCController)
  public

    [MVCPath('/test')]
    [MVCHTTPMethod([httpGET])]
    procedure Index;

    [MVCPath('/LoadList')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Load an object or interfaces list')]
    procedure LoadList;

    [MVCPath('/LoadObject')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Load an object or interface')]
    procedure LoadObject;

    [MVCPath('/LoadDataSet')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Load a DataSet')]
    procedure LoadDataSet;

    [MVCPath('/PersistObject')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Persist an object or interface')]
    procedure PersistObject;

    [MVCPath('/PersistCollection')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Persist a collection of objects or interfaces')]
    procedure PersistCollection;

    [MVCPath('/DeleteObject')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Delete an object or interface')]
    procedure DeleteObject;

    [MVCPath('/Delete')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Delete objects or interfaces')]
    procedure Delete;

    [MVCPath('/SQLDestExecute')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Execute a SQL command')]
    procedure SQLDestExecute;

    [MVCPath('/SQLDestLoadDataSet')]
    [MVCProduce('application/json')]
    [MVCConsumes('application/json')]
    [MVCHTTPMethod([httpPUT])]
    [MVCDoc('Execute a SQL command to load a DataSet')]
    procedure SQLDestLoadDataSet;

    // M.M. 12/06/21
    [MVCPath('/count')]
    [MVCHTTPMethod([httpPUT])]
    procedure Count;

    // Other
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  end;

implementation

{ TioDMVCController }

uses iORM, iORM.REST.Factory, System.Generics.Collections, iORM.DB.Interfaces,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.StorageJSON, System.JSON;

// M.M. 12/06/21
procedure TioDMVCController.Count;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
  LCount: integer;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body);
  // Execute iORM call
  LCount := io.RefTo(LRequestBody.Where).Count;
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  LResponseBody.JSONDataValue := TJSONNumber.Create(LCount);
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.Delete;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body);
  // Execute iORM call
  io.RefTo(LRequestBody.Where).Delete;
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.DeleteObject;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body, True);  // NB: OwnDataObject := True
  // Execute iORM call
  io.Delete(LRequestBody.DataObject);  // ConnectionName
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.Index;
begin
  //use Context property to access to the HTTP request and response
  Render('TioDMVCController: Test passed.');
end;

procedure TioDMVCController.LoadDataSet;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
  LMemTable: TFDMemTable;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body);
  try
    // Execute iORM call
    LMemTable := io.Load(LRequestBody.Where).ToMemTable;
    // Create the IioRESTResponseBody and return it to the client
    LResponseBody := TioRESTFactory.NewResponseBody;
    LMemTable.SaveToStream(LResponseBody.Stream, TFDStorageFormat.sfJSON);
    Render(LResponseBody.ToJSONObject, False);
  finally
    // Clean up
    LMemTable.Free;
  end;
end;

procedure TioDMVCController.LoadList;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
  LObj: TList<TObject>;
begin
  // Create a dummy list
  LObj := TList<TObject>.Create;
  try
    // Get the IioRESTRequestBody
    LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body);
    // Execute iORM call
    io.Load(LRequestBody.Where).ToList(LObj);
    // Create the IioRESTResponseBody and return it to the client
    LResponseBody := TioRESTFactory.NewResponseBody;
    LResponseBody.JSONDataValue := io.Mapper.From(LObj).byFields.TypeAnnotationsON.ToJSON;
    Render(LResponseBody.ToJSONObject, False);
  finally
    // Clean up
    LObj.Free;
  end;
end;

procedure TioDMVCController.LoadObject;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
  LObj: TObject;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body);
  // Execute iORM call
  LObj := io.Load(LRequestBody.Where).ToObject;
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  LResponseBody.JSONDataValue := io.Mapper.From(LObj).byFields.TypeAnnotationsON.ToJSON;
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.OnAfterAction(Context: TWebContext;
  const AActionName: string);
begin
  { Executed after each action }
  inherited;
end;

procedure TioDMVCController.OnBeforeAction(Context: TWebContext;
  const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

procedure TioDMVCController.PersistCollection;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body, True);  // NB: OwnDataObject := True
  // Execute iORM call
  io.PersistCollection(LRequestBody.DataObject, LRequestBody.BlindInsert);
  // Return the updated/inserted DataObject back to the client for new IDs
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  if not LRequestBody.BlindInsert then
    LResponseBody.JSONDataValue := io.Mapper.From(LRequestBody.DataObject).byFields.TypeAnnotationsON.ToJSON;
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.PersistObject;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body, True);  // NB: OwnDataObject := True
  // Execute iORM call
  // NB: Gli ultimi 3 parametri (quelli aggiunti per lo Smart Update Detection S.U.D.) li passo vuoti
  //      perchè il sistema SUD serve per capire se l'oggetto deve effettivamente essere persistito o no
  //      ma se arriva qui è già stato controllato ed è già stato deciso che deve essere persistito;
  //      passandolo vuoto semplicemente, a destinazione, sarà persistito senza più ulteriori controlli.
  io._PersistInternal(LRequestBody.DataObject, LRequestBody.RelationPropertyName, LRequestBody.RelationOID, LRequestBody.BlindInsert, nil, '', '');
  // Return the updated/inserted DataObject back to the client for new IDs
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  if not LRequestBody.BlindInsert then
    LResponseBody.JSONDataValue := io.Mapper.From(LRequestBody.DataObject).byFields.TypeAnnotationsON.ToJSON;
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.SQLDestExecute;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
  LRecordsAffected: Integer;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body);
  // Execute iORM call
  io.SQL(LRequestBody.SQLDestination).Execute(LRequestBody.SQLDestination.GetIgnoreObjNotExists);
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  LResponseBody.JSONDataValue := TJSONNumber.Create(LRecordsAffected);
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.SQLDestLoadDataSet;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
  LMemTable: TFDMemTable;
begin
  // Get the IioRESTRequestBody
  LRequestBody := TioRESTFactory.NewRequestBody(Context.Request.Body);
  // Execute iORM call
  LMemTable := io.SQL(LRequestBody.SQLDestination).ToMemTable;
  try
    // Create the IioRESTResponseBody and return it to the client
    LResponseBody := TioRESTFactory.NewResponseBody;
    LMemTable.SaveToStream(LResponseBody.Stream, TFDStorageFormat.sfJSON);
    Render(LResponseBody.ToJSONObject, False);
  finally
    // Clean up
    LMemTable.Free;
  end;
end;

end.
