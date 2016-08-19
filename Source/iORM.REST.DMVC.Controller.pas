unit iORM.REST.DMVC.Controller;

interface

uses MVCFramework;

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

    // Other
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  end;

implementation

{ TioDMVCController }

uses iORM, iORM.REST.Factory, System.Generics.Collections,
  iORM.REST.Interfaces;

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
  io.Delete(LRequestBody.DataObject, '');  // ConnectionName
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  Render(LResponseBody.ToJSONObject, False);
end;

procedure TioDMVCController.Index;
begin
  //use Context property to access to the HTTP request and response
  Render('TioDMVCController: Test passed.');
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
  io.PersistCollection(LRequestBody.DataObject,
                       '', // ConnectionName
                       LRequestBody.BlindInsert);
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
  io.Persist(LRequestBody.DataObject,
             LRequestBody.RelationPropertyName,
             LRequestBody.RelationOID,
             LRequestBody.BlindInsert,
             '');  // ConnectionName
  // Return the updated/inserted DataObject back to the client for new IDs
  // Create the IioRESTResponseBody and return it to the client
  LResponseBody := TioRESTFactory.NewResponseBody;
  if not LRequestBody.BlindInsert then
    LResponseBody.JSONDataValue := io.Mapper.From(LRequestBody.DataObject).byFields.TypeAnnotationsON.ToJSON;
  Render(LResponseBody.ToJSONObject, False);
end;

end.
