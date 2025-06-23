unit iORM.MVVM.FMX.FastReportModelPresenter;

interface

uses
  FMX.Controls,
  System.SysUtils,
  System.Classes,
  Data.DB,

  FMX.frxClass,

  iORM.MVVM.ModelPresenter.Custom

  ;


type
  TioFastReportModelPresenterDataSet = class(TfrxUserDataSet)
  private
    FModelPresenter: TioModelPresenterCustom;
    function CheckModelPresenter: Boolean;
    procedure SetModelPresenter(const Value: TioModelPresenterCustom);
  protected
    function GetValue(AFieldName: String): Variant; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    /// <summary>
    ///   Opens the dataset.
    /// </summary>
    procedure Open; override;
    /// <summary>
    ///   Closes the dataset.
    /// </summary>
    procedure Close; override;
    /// <summary>
    ///   Sets the cursor to the first record.
    /// </summary>
    procedure First; override;
    /// <summary>
    ///   Moves the cursor to the next record.
    /// </summary>
    procedure Next; override;
    /// <summary>
    ///   Moves the cursor to the previous record. This method is used only
    ///   when printing groups.
    /// </summary>
    procedure Prior; override;
    /// <summary>
    ///   Function returns True if end of the dataset is reached.
    /// </summary>
    function Eof: Boolean; override;
    /// <summary>
    ///   Returns True if dataset has field with specified name.
    /// </summary>
    function HasField(const AFieldName: String): Boolean;
    /// <summary>
    ///   Returns records count if DataSet supports it.
    /// </summary>
    function RecordCount: Integer; override;
  published
    property ModelPresenter: TioModelPresenterCustom read FModelPresenter write SetModelPresenter;
  end;



implementation

uses
  iORM.Utilities

  ;



type
  TioModelPresenterAccess = class(TioModelPresenterCustom);







{ TioFastReportModelPresenterDataSet }

function TioFastReportModelPresenterDataSet.CheckModelPresenter: Boolean;
begin
  Result := Assigned(FModelPresenter);
end;

procedure TioFastReportModelPresenterDataSet.Close;
begin
  if CheckModelPresenter then
    TioModelPresenterAccess(FModelPresenter).Close;

  inherited;
end;

function TioFastReportModelPresenterDataSet.Eof: Boolean;
begin
  if CheckModelPresenter then
    Result := TioModelPresenterAccess(FModelPresenter).EOF;

  inherited;
end;

procedure TioFastReportModelPresenterDataSet.First;
begin
  if CheckModelPresenter then
    FModelPresenter.First;

  inherited;
end;

function TioFastReportModelPresenterDataSet.GetValue(AFieldName: String): Variant;
var
  LCurrentObject: TObject;
begin
  if CheckModelPresenter then
  begin
    LCurrentObject := TioModelPresenterAccess(FModelPresenter).Current;

    if Assigned(LCurrentObject) then
      Result := TioUtilities.GetRttiProperty(
        TioUtilities.ClassNameToClassRef(LCurrentObject.ClassName), AFieldName).GetValue(LCurrentObject).AsVariant;
  end;
end;

function TioFastReportModelPresenterDataSet.HasField(const AFieldName: String): Boolean;
var
  LCurrentObject: TObject;
begin
  if CheckModelPresenter then
  begin
    LCurrentObject := TioModelPresenterAccess(FModelPresenter).Current;

    if Assigned(LCurrentObject) then
      Result := Assigned(TioUtilities.GetRttiProperty(TioUtilities.ClassNameToClassRef(LCurrentObject.ClassName),
        AFieldName));
  end
  else
    Result := False;
end;

procedure TioFastReportModelPresenterDataSet.Next;
begin
  if CheckModelPresenter then
    FModelPresenter.Next;

  inherited;
end;

procedure TioFastReportModelPresenterDataSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if (AComponent = FModelPresenter) and (Operation = opRemove) then
    FModelPresenter := nil;
end;

procedure TioFastReportModelPresenterDataSet.Open;
begin
  if CheckModelPresenter then
    TioModelPresenterAccess(FModelPresenter).Open;

  inherited;
end;

procedure TioFastReportModelPresenterDataSet.Prior;
begin
  if CheckModelPresenter then
    FModelPresenter.Prior;

  inherited;
end;

function TioFastReportModelPresenterDataSet.RecordCount: Integer;
begin
  if CheckModelPresenter then
    FModelPresenter.ItemCount
  else
    Result := 0;
end;

procedure TioFastReportModelPresenterDataSet.SetModelPresenter(const Value: TioModelPresenterCustom);
begin
  FModelPresenter := Value;

  if Assigned(FModelPresenter) then
    FModelPresenter.FreeNotification(Self);
end;

end.
