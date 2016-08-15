unit iORM.REST.Factory;

interface

uses
  iORM.REST.Interfaces;

type

  TioRESTFactory = class
  public
    class function NewRequestBody: IioRESTRequestBody; overload;
    class function NewRequestBody(const AJSONString:String): IioRESTRequestBody; overload;
    class function NewResponseBody: IioRESTResponseBody; overload;
    class function NewResponseBody(const AJSONString:String): IioRESTResponseBody; overload;
  end;

implementation

uses
  iORM.REST.Body.Request, iORM.REST.Body.Response;

{ TioRESTFactory }

class function TioRESTFactory.NewRequestBody: IioRESTREquestBody;
begin
  Result := TioRESTRequestBody.Create;
end;

class function TioRESTFactory.NewRequestBody(
  const AJSONString: String): IioRESTREquestBody;
begin
  Result := TioRESTRequestBody.Create(AJSONString);
end;

class function TioRESTFactory.NewResponseBody: IioRESTResponseBody;
begin
  Result := TioRESTResponseBody.Create;
end;

class function TioRESTFactory.NewResponseBody(
  const AJSONString: String): IioRESTResponseBody;
begin
  Result := TioRESTResponseBody.Create(AJSONString);
end;

end.
