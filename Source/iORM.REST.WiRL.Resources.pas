unit iORM.REST.WiRL.Resources;

interface

uses
  WiRL.Core.Request,
  WiRL.Core.Attributes, WiRL.http.Accept.MediaType, WiRL.Core.Response;


type

  [Path('/')]
  TioWiRLResource = class
  private
    [Context] Request: TWiRLRequest;
    [Context] Response: TWiRLResponse;
  public

    [PUT, Path('/LoadList'), Produces(TMediaType.APPLICATION_JSON), Consumes(TMediaType.APPLICATION_JSON)]
    procedure LoadList;

  end;

implementation

uses
  iORM.DB.Interfaces, System.Generics.Collections, iORM.REST.Factory, iORM;

{ TioWiRLResource }

procedure TioWiRLResource.LoadList;
var
  LRequestBody: IioRESTRequestBody;
  LResponseBody: IioRESTResponseBody;
  LObj: TList<TObject>;
begin
  // Create a dummy list
  LObj := TList<TObject>.Create;
  try
    // Get the IioRESTRequestBody
    LRequestBody := TioRESTFactory.NewRequestBody(Request.Content);
    // Execute iORM call
    io.Load(LRequestBody.Where).ToList(LObj);
    // Create the IioRESTResponseBody and return it to the client
    LResponseBody := TioRESTFactory.NewResponseBody;
    LResponseBody.JSONDataValue := io.Mapper.From(LObj).byFields.TypeAnnotationsON.ToJSON;
    Response.Content := LResponseBody.ToJSONObject;
  finally
    // Clean up
    LObj.Free;
  end;
end;

end.
