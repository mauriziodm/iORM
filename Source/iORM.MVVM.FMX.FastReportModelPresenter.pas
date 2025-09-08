unit iORM.MVVM.FMX.FastReportModelPresenter;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  FMX.Controls,

  FMX.frxClass,

  iORM.MVVM.ModelPresenter.Custom

  ;


type
  TioFastReportModelPresenterDataSet = class(TfrxUserDataSet)
  private
    FRecordCount: integer;
    FModelPresenter: TioModelPresenterCustom;
    function IsDesignMode: boolean;
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
    ///   Returns records count if DataSet supports it.
    /// </summary>
    function RecordCount: Integer; override;
  published
    property ModelPresenter: TioModelPresenterCustom read FModelPresenter write SetModelPresenter;
  end;



implementation

uses
  iORM.Utilities,
  iORM.CommonTypes

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
  if not IsDesignMode and CheckModelPresenter then
    TioModelPresenterAccess(FModelPresenter).Close;
end;

function TioFastReportModelPresenterDataSet.Eof: Boolean;
begin
  if not IsDesignMode and CheckModelPresenter then
    Result := (FRecNo = Succ(RecordCount)) and TioModelPresenterAccess(FModelPresenter).EOF;
end;

procedure TioFastReportModelPresenterDataSet.First;
begin
  FRecNo := 0;

  if not IsDesignMode and CheckModelPresenter then
  begin
    FModelPresenter.First;
    FRecNo := 1;
  end;
end;

function TioFastReportModelPresenterDataSet.GetValue(AFieldName: String): Variant;
var
  LCurrentObject: TObject;
begin
  Result := varEmpty;

  if not IsDesignMode and CheckModelPresenter then
  begin
    LCurrentObject := TioModelPresenterAccess(FModelPresenter).Current;

    if Assigned(LCurrentObject) then
      Result := TioUtilities.GetRttiProperty(
        TioUtilities.ClassNameToClassRef(LCurrentObject.ClassName), AFieldName).GetValue(LCurrentObject).AsVariant;
  end;
end;

function TioFastReportModelPresenterDataSet.IsDesignMode: boolean;
begin
  Result := csDesigning in ComponentState;
end;

procedure TioFastReportModelPresenterDataSet.Next;
begin
  if not IsDesignMode and CheckModelPresenter then
  begin
    FModelPresenter.Next;
    Inc(FRecNo);
  end;
end;

procedure TioFastReportModelPresenterDataSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if (AComponent = FModelPresenter) and (Operation = opRemove) then
    FModelPresenter := nil;
end;

procedure TioFastReportModelPresenterDataSet.Open;
begin
  FRecNo := 0;

  if not IsDesignMode and CheckModelPresenter then
    TioModelPresenterAccess(FModelPresenter).Open;
end;

procedure TioFastReportModelPresenterDataSet.Prior;
begin
  if not IsDesignMode and CheckModelPresenter then
  begin
    FModelPresenter.Prior;
    Dec(FRecNo);
  end;
end;

function TioFastReportModelPresenterDataSet.RecordCount: Integer;
begin
  if not IsDesignMode and CheckModelPresenter then
    Result := FModelPresenter.ItemCount
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
