unit iORM.DB.Components.BindSourceObjState.StdActions.VCL;

interface

uses
  Vcl.ActnList;

type

  TioTestActionVCL = class(Vcl.ActnList.TAction)
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  end;

implementation

uses
  iORM.AbstractionLayer.Framework;

{ TioTestAction }

procedure TioTestActionVCL.ExecuteTarget(Target: TObject);
begin
  inherited;
  TioApplication.ShowMessage('Eureka VCL!!!');
end;

function TioTestActionVCL.HandlesTarget(Target: TObject): Boolean;
begin
  Result := True;
end;

end.
