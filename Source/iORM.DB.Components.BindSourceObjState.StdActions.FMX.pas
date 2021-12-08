unit iORM.DB.Components.BindSourceObjState.StdActions.FMX;

interface

uses
  FMX.ActnList;

type

  TioTestActionFMX = class(FMX.ActnList.TAction)
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    function Update: Boolean; override;
  end;

implementation

uses
  iORM.AbstractionLayer.Framework;

{ TioTestAction }

procedure TioTestActionFMX.ExecuteTarget(Target: TObject);
begin
  inherited;
  TioApplication.ShowMessage('Eureka FMX!!!');
end;

function TioTestActionFMX.HandlesTarget(Target: TObject): Boolean;
begin
  Result := True;
end;

function TioTestActionFMX.Update: Boolean;
begin
  inherited;
  Enabled := True;
end;

end.
