unit iORM.LiveBindings.BSAProxy;

interface

uses
  Data.Bind.ObjectScope, System.SysUtils, System.Bindings.EvalProtocol,
  Data.Bind.Components, System.Classes, System.Generics.Collections;

type

  TBSAProxy = class(TBindSourceAdapter)
  private
    FAdapter: TBindSourceAdapter;
    function GetScopes: TEnumerable<TBaseObjectBindSource>;
    function GetAfterApplyUpdates: TAdapterNotifyEvent;
    function GetAfterCancel: TAdapterNotifyEvent;
    function GetAfterCancelUpdates: TAdapterNotifyEvent;
    function GetAfterClose: TAdapterNotifyEvent;
    function GetAfterDelete: TAdapterNotifyEvent;
    function GetAfterEdit: TAdapterNotifyEvent;
    function GetAfterInsert: TAdapterNotifyEvent;
    function GetAfterOpen: TAdapterNotifyEvent;
    function GetAfterPost: TAdapterNotifyEvent;
    function GetAfterRefresh: TAdapterNotifyEvent;
    function GetAfterScroll: TAdapterNotifyEvent;
    function GetAutoEdit: Boolean;
    function GetAutoPost: Boolean;
    function GetBeforeApplyUpdates: TAdapterNotifyEvent;
    function GetBeforeCancel: TAdapterNotifyEvent;
    function GetBeforeCancelUpdates: TAdapterNotifyEvent;
    function GetBeforeClose: TAdapterNotifyEvent;
    function GetBeforeDelete: TAdapterNotifyEvent;
    function GetBeforeEdit: TAdapterNotifyEvent;
    function GetBeforeInsert: TAdapterNotifyEvent;
    function GetBeforeOpen: TAdapterNotifyEvent;
    function GetBeforePost: TAdapterNotifyEvent;
    function GetBeforeRefresh: TAdapterNotifyEvent;
    function GetBeforeScroll: TAdapterNotifyEvent;
    function GetCurrentIndex: Integer;
    function GetEmpty: Boolean;
    function GetFields: TList<TBindSourceAdapterField>;
    function GetItemIndex: Integer;
    function GetItemIndexOffset: Integer;
    function GetModified: Boolean;
    function GetOnApplyUpdates: TAdapterNotifyEvent;
    function GetOnApplyUpdatesError: TAdapterErrorEvent;
    function GetOnCancelUpdates: TAdapterNotifyEvent;
    function GetOnCancelUpdatesError: TAdapterErrorEvent;
    function GetOnDeleteError: TAdapterErrorEvent;
    function GetOnEditError: TAdapterErrorEvent;
    function GetOnHasUpdates: TAdapterHasUpdatesEvent;
    function GetOnInsertError: TAdapterErrorEvent;
    function GetOnPostError: TAdapterErrorEvent;
    function GetState: TBindSourceAdapterState;
    procedure SetAfterApplyUpdates(const Value: TAdapterNotifyEvent);
    procedure SetAfterCancel(const Value: TAdapterNotifyEvent);
    procedure SetAfterCancelUpdates(const Value: TAdapterNotifyEvent);
    procedure SetAfterClose(const Value: TAdapterNotifyEvent);
    procedure SetAfterDelete(const Value: TAdapterNotifyEvent);
    procedure SetAfterEdit(const Value: TAdapterNotifyEvent);
    procedure SetAfterInsert(const Value: TAdapterNotifyEvent);
    procedure SetAfterOpen(const Value: TAdapterNotifyEvent);
    procedure SetAfterPost(const Value: TAdapterNotifyEvent);
    procedure SetAfterRefresh(const Value: TAdapterNotifyEvent);
    procedure SetAfterScroll(const Value: TAdapterNotifyEvent);
    procedure SetAutoEdit(const Value: Boolean);
    procedure SetAutoPost(const Value: Boolean);
    procedure SetBeforeApplyUpdates(const Value: TAdapterNotifyEvent);
    procedure SetBeforeCancel(const Value: TAdapterNotifyEvent);
    procedure SetBeforeCancelUpdates(const Value: TAdapterNotifyEvent);
    procedure SetBeforeClose(const Value: TAdapterNotifyEvent);
    procedure SetBeforeDelete(const Value: TAdapterNotifyEvent);
    procedure SetBeforeEdit(const Value: TAdapterNotifyEvent);
    procedure SetBeforeInsert(const Value: TAdapterNotifyEvent);
    procedure SetBeforeOpen(const Value: TAdapterNotifyEvent);
    procedure SetBeforePost(const Value: TAdapterNotifyEvent);
    procedure SetBeforeRefresh(const Value: TAdapterNotifyEvent);
    procedure SetBeforeScroll(const Value: TAdapterNotifyEvent);
    procedure SetItemIndex(const Value: Integer);
    procedure SetItemIndexOffset(const Value: Integer);
    procedure SetOnApplyUpdates(const Value: TAdapterNotifyEvent);
    procedure SetOnApplyUpdatesError(const Value: TAdapterErrorEvent);
    procedure SetOnCancelUpdates(const Value: TAdapterNotifyEvent);
    procedure SetOnCancelUpdatesError(const Value: TAdapterErrorEvent);
    procedure SetOnDeleteError(const Value: TAdapterErrorEvent);
    procedure SetOnEditError(const Value: TAdapterErrorEvent);
    procedure SetOnHasUpdates(const Value: TAdapterHasUpdatesEvent);
    procedure SetOnINsertError(const Value: TAdapterErrorEvent);
    procedure SetOnPostError(const Value: TAdapterErrorEvent);
  protected
    function GetActive: Boolean; override;
    function GetBOF: Boolean; override;
    function GetEOF: Boolean; override;
    function GetCanActivate: Boolean; override;
    function GetCanApplyUpdates: Boolean; override;
    function GetCanCancelUpdates: Boolean; override;
    function GetCanDelete: Boolean; override;
    function GetCanInsert: Boolean; override;
    function GetCanModify: Boolean; override;
    function GetCanRefresh: Boolean; override;
    function GetCount: Integer; override;
    function GetCurrent: TObject; override;
    procedure SetActive(Value: Boolean); override;
  public
    constructor Create(const ABindSourceAdapter:TBindSourceAdapter); overload;
    destructor Destroy; override;
    function FindField(const AMemberName: string): TBindSourceAdapterField;
    function GetEnumerator(const AMemberName: string;
      AGetScope: TFunc<IScope>; AGetMemberScope: TFunc<string, IScope>): IScopeRecordEnumerator;
    function GetValue: TObject;
    function GetMember(const AMemberName: string): TObject;
    procedure Refresh; override;
    procedure Next; override;
    procedure Prior; override;
    procedure First; override;
    procedure Last; override;
    procedure Insert; override;
    procedure Append; override;
    procedure Delete; override;
    procedure Cancel; override;
    procedure Post; override;
    procedure PosChanging; override;
    procedure Edit(AForce: Boolean = False); override;
    procedure CancelUpdates; override;
    procedure ApplyUpdates; override;
    procedure GetMemberNames(AList: TStrings); override;
    // Cause linked grid controls to reset on next data change
    procedure ResetNeeded;
    function GetCurrentRecord(const AMemberName: string): IScope;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property CurrentIndex: Integer read GetCurrentIndex;
    property ItemIndexOffset: Integer read GetItemIndexOffset write SetItemIndexOffset;
    [Default(True)]
    property AutoEdit: Boolean read GetAutoEdit write SetAutoEdit default True;
    property AutoPost: Boolean read GetAutoPost write SetAutoPost;
    property Modified: Boolean read GetModified;
    property Empty: Boolean read GetEmpty;
    property State: TBindSourceAdapterState read GetState;
    property Fields: TList<TBindSourceAdapterField> read GetFields;
    property Scopes: TEnumerable<TBaseObjectBindSource> read GetScopes;
    property BeforeOpen: TAdapterNotifyEvent read GetBeforeOpen write SetBeforeOpen;
    property AfterOpen: TAdapterNotifyEvent read GetAfterOpen write SetAfterOpen;
    property BeforeClose: TAdapterNotifyEvent read GetBeforeClose write SetBeforeClose;
    property AfterClose: TAdapterNotifyEvent read GetAfterClose write SetAfterClose;
    property BeforeInsert: TAdapterNotifyEvent read GetBeforeInsert write SetBeforeInsert;
    property AfterInsert: TAdapterNotifyEvent read GetAfterInsert write SetAfterInsert;
    property BeforeEdit: TAdapterNotifyEvent read GetBeforeEdit write SetBeforeEdit;
    property AfterEdit: TAdapterNotifyEvent read GetAfterEdit write SetAfterEdit;
    property BeforePost: TAdapterNotifyEvent read GetBeforePost write SetBeforePost;
    property AfterPost: TAdapterNotifyEvent read GetAfterPost write SetAfterPost;
    property BeforeCancel: TAdapterNotifyEvent read GetBeforeCancel write SetBeforeCancel;
    property AfterCancel: TAdapterNotifyEvent read GetAfterCancel write SetAfterCancel;
    property BeforeDelete: TAdapterNotifyEvent read GetBeforeDelete write SetBeforeDelete;
    property AfterDelete: TAdapterNotifyEvent read GetAfterDelete write SetAfterDelete;
    property BeforeScroll: TAdapterNotifyEvent read GetBeforeScroll write SetBeforeScroll;
    property AfterScroll: TAdapterNotifyEvent read GetAfterScroll write SetAfterScroll;
    property BeforeRefresh: TAdapterNotifyEvent read GetBeforeRefresh write SetBeforeRefresh;
    property AfterRefresh: TAdapterNotifyEvent read GetAfterRefresh write SetAfterRefresh;
    property BeforeApplyUpdates: TAdapterNotifyEvent read GetBeforeApplyUpdates write SetBeforeApplyUpdates;
    property AfterApplyUpdates: TAdapterNotifyEvent read GetAfterApplyUpdates write SetAfterApplyUpdates;
    property BeforeCancelUpdates: TAdapterNotifyEvent read GetBeforeCancelUpdates write SetBeforeCancelUpdates;
    property AfterCancelUpdates: TAdapterNotifyEvent read GetAfterCancelUpdates write SetAfterCancelUpdates;
    property OnDeleteError: TAdapterErrorEvent read GetOnDeleteError write SetOnDeleteError;
    property OnInsertError: TAdapterErrorEvent read GetOnInsertError write SetOnINsertError;
    property OnEditError: TAdapterErrorEvent read GetOnEditError write SetOnEditError;
    property OnPostError: TAdapterErrorEvent read GetOnPostError write SetOnPostError;
    property OnApplyUpdatesError: TAdapterErrorEvent read GetOnApplyUpdatesError write SetOnApplyUpdatesError;
    property OnCancelUpdatesError: TAdapterErrorEvent read GetOnCancelUpdatesError write SetOnCancelUpdatesError;
    property OnApplyUpdates: TAdapterNotifyEvent read GetOnApplyUpdates write SetOnApplyUpdates;
    property OnCancelUpdates: TAdapterNotifyEvent read GetOnCancelUpdates write SetOnCancelUpdates;
    property OnHasUpdates: TAdapterHasUpdatesEvent read GetOnHasUpdates write SetOnHasUpdates;
  end;

implementation

{ TBSAProxy }

procedure TBSAProxy.Append;
begin
  FAdapter.Append;
end;

procedure TBSAProxy.ApplyUpdates;
begin
  FAdapter.ApplyUpdates;
end;

procedure TBSAProxy.Cancel;
begin
  FAdapter.Cancel;
end;

procedure TBSAProxy.CancelUpdates;
begin
  FAdapter.CancelUpdates;
end;

constructor TBSAProxy.Create(const ABindSourceAdapter: TBindSourceAdapter);
begin
  inherited Create(nil);
  FAdapter := ABindSourceAdapter;
end;

procedure TBSAProxy.Delete;
begin
  FAdapter.Delete;
end;

destructor TBSAProxy.Destroy;
begin

  inherited;
end;

procedure TBSAProxy.Edit(AForce: Boolean);
begin
  FAdapter.Edit(AForce);
end;

function TBSAProxy.FindField(
  const AMemberName: string): TBindSourceAdapterField;
begin
  FAdapter.FindField(AMemberName);
end;

procedure TBSAProxy.First;
begin
  FAdapter.First;
end;

function TBSAProxy.GetActive: Boolean;
begin
  Result := FAdapter.Active;
end;

function TBSAProxy.GetAfterApplyUpdates: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterApplyUpdates;
end;

function TBSAProxy.GetAfterCancel: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterCancel;
end;

function TBSAProxy.GetAfterCancelUpdates: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterCancelUpdates;
end;

function TBSAProxy.GetAfterClose: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterClose;
end;

function TBSAProxy.GetAfterDelete: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterDelete;
end;

function TBSAProxy.GetAfterEdit: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterEdit;
end;

function TBSAProxy.GetAfterInsert: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterInsert;
end;

function TBSAProxy.GetAfterOpen: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterOpen;
end;

function TBSAProxy.GetAfterPost: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterPost;
end;

function TBSAProxy.GetAfterRefresh: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterRefresh;
end;

function TBSAProxy.GetAfterScroll: TAdapterNotifyEvent;
begin
  Result := FAdapter.AfterScroll;
end;

function TBSAProxy.GetAutoEdit: Boolean;
begin
  Result := FAdapter.AutoEdit;
end;

function TBSAProxy.GetAutoPost: Boolean;
begin
  Result := FAdapter.AutoPost;
end;

function TBSAProxy.GetBeforeApplyUpdates: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeApplyUpdates;
end;

function TBSAProxy.GetBeforeCancel: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeCancel;
end;

function TBSAProxy.GetBeforeCancelUpdates: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeCancelUpdates;
end;

function TBSAProxy.GetBeforeClose: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeClose;
end;

function TBSAProxy.GetBeforeDelete: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeDelete;
end;

function TBSAProxy.GetBeforeEdit: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeEdit;
end;

function TBSAProxy.GetBeforeInsert: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeInsert;
end;

function TBSAProxy.GetBeforeOpen: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeOpen;
end;

function TBSAProxy.GetBeforePost: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforePost;
end;

function TBSAProxy.GetBeforeRefresh: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeRefresh;
end;

function TBSAProxy.GetBeforeScroll: TAdapterNotifyEvent;
begin
  Result := FAdapter.BeforeScroll;
end;

function TBSAProxy.GetBOF: Boolean;
begin
  Result := FAdapter.BOF;
end;

function TBSAProxy.GetCanActivate: Boolean;
begin
  Result := FAdapter.CanActivate;
end;

function TBSAProxy.GetCanApplyUpdates: Boolean;
begin
  Result := FAdapter.CanApplyUpdates;
end;

function TBSAProxy.GetCanCancelUpdates: Boolean;
begin
  Result := FAdapter.CanCancelUpdates;
end;

function TBSAProxy.GetCanDelete: Boolean;
begin
  Result := FAdapter.CanDelete;
end;

function TBSAProxy.GetCanInsert: Boolean;
begin
  Result := FAdapter.CanInsert;
end;

function TBSAProxy.GetCanModify: Boolean;
begin
  Result := FAdapter.CanModify;
end;

function TBSAProxy.GetCanRefresh: Boolean;
begin
  Result := FAdapter.CanRefresh;
end;

function TBSAProxy.GetCount: Integer;
begin
  Result := FAdapter.ItemCount;
end;

function TBSAProxy.GetCurrent: TObject;
begin
  Result := FAdapter.Current;
end;

function TBSAProxy.GetCurrentIndex: Integer;
begin
  Result := FAdapter.CurrentIndex;
end;

function TBSAProxy.GetCurrentRecord(const AMemberName: string): IScope;
begin
  Result := FAdapter.GetCurrentRecord(AMemberName);
end;

function TBSAProxy.GetEmpty: Boolean;
begin
  Result := FAdapter.Empty;
end;

function TBSAProxy.GetEnumerator(const AMemberName: string;
  AGetScope: TFunc<IScope>;
  AGetMemberScope: TFunc<string, IScope>): IScopeRecordEnumerator;
begin
  Result := FAdapter.GetEnumerator(AMemberName, AGetScope, AGetMemberScope);
end;

function TBSAProxy.GetEOF: Boolean;
begin
  Result := FAdapter.Eof;
end;

function TBSAProxy.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := FAdapter.Fields;
end;

function TBSAProxy.GetItemIndex: Integer;
begin
  Result := FAdapter.ItemIndex;
end;

function TBSAProxy.GetItemIndexOffset: Integer;
begin
  Result := FAdapter.ItemIndexOffset;
end;

function TBSAProxy.GetMember(const AMemberName: string): TObject;
begin
  Result := FAdapter.GetMember(AMemberName);
end;

procedure TBSAProxy.GetMemberNames(AList: TStrings);
begin
  FAdapter.GetMemberNames(AList);
end;

function TBSAProxy.GetModified: Boolean;
begin
  Result := FAdapter.Modified;
end;

function TBSAProxy.GetOnApplyUpdates: TAdapterNotifyEvent;
begin
  Result := FAdapter.OnApplyUpdates;
end;

function TBSAProxy.GetOnApplyUpdatesError: TAdapterErrorEvent;
begin
  Result := FAdapter.OnApplyUpdatesError;
end;

function TBSAProxy.GetOnCancelUpdates: TAdapterNotifyEvent;
begin
  Result := FAdapter.OnCancelUpdates;
end;

function TBSAProxy.GetOnCancelUpdatesError: TAdapterErrorEvent;
begin
  Result := FAdapter.OnCancelUpdatesError;
end;

function TBSAProxy.GetOnDeleteError: TAdapterErrorEvent;
begin
  Result := FAdapter.OnDeleteError;
end;

function TBSAProxy.GetOnEditError: TAdapterErrorEvent;
begin
  Result := FAdapter.OnEditError;
end;

function TBSAProxy.GetOnHasUpdates: TAdapterHasUpdatesEvent;
begin
  Result := FAdapter.OnHasUpdates;
end;

function TBSAProxy.GetOnInsertError: TAdapterErrorEvent;
begin
  Result := FAdapter.OnInsertError;
end;

function TBSAProxy.GetOnPostError: TAdapterErrorEvent;
begin
  Result := FAdapter.OnPostError;
end;

function TBSAProxy.GetScopes: TEnumerable<TBaseObjectBindSource>;
begin
  Result := FAdapter.Scopes;
end;

function TBSAProxy.GetState: TBindSourceAdapterState;
begin
  Result := FAdapter.State;
end;

function TBSAProxy.GetValue: TObject;
begin
  Result := FAdapter.GetValue;
end;

procedure TBSAProxy.Insert;
begin
  FAdapter.Insert;
end;

procedure TBSAProxy.Last;
begin
  FAdapter.Last;
end;

procedure TBSAProxy.Next;
begin
  FAdapter.Next;
end;

procedure TBSAProxy.PosChanging;
begin
  FAdapter.PosChanging;
end;

procedure TBSAProxy.Post;
begin
  FAdapter.Post;
end;

procedure TBSAProxy.Prior;
begin
  FAdapter.Prior;
end;

procedure TBSAProxy.Refresh;
begin
  FAdapter.Refresh;
end;

procedure TBSAProxy.ResetNeeded;
begin
  FAdapter.ResetNeeded;
end;

procedure TBSAProxy.SetActive(Value: Boolean);
begin
  FAdapter.Active := Value;
end;

procedure TBSAProxy.SetAfterApplyUpdates(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterApplyUpdates := Value;
end;

procedure TBSAProxy.SetAfterCancel(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterCancel := Value;
end;

procedure TBSAProxy.SetAfterCancelUpdates(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterCancelUpdates := Value;
end;

procedure TBSAProxy.SetAfterClose(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterClose := Value;
end;

procedure TBSAProxy.SetAfterDelete(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterDelete := Value;
end;

procedure TBSAProxy.SetAfterEdit(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterEdit := Value;
end;

procedure TBSAProxy.SetAfterInsert(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterInsert := Value;
end;

procedure TBSAProxy.SetAfterOpen(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterOpen := Value;
end;

procedure TBSAProxy.SetAfterPost(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterPost := Value;
end;

procedure TBSAProxy.SetAfterRefresh(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterRefresh := Value;
end;

procedure TBSAProxy.SetAfterScroll(const Value: TAdapterNotifyEvent);
begin
  FAdapter.AfterScroll := Value;
end;

procedure TBSAProxy.SetAutoEdit(const Value: Boolean);
begin
  FAdapter.AutoEdit := Value;
end;

procedure TBSAProxy.SetAutoPost(const Value: Boolean);
begin
  FAdapter.AutoPost := Value;
end;

procedure TBSAProxy.SetBeforeApplyUpdates(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeApplyUpdates := Value;
end;

procedure TBSAProxy.SetBeforeCancel(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeCancel := Value;
end;

procedure TBSAProxy.SetBeforeCancelUpdates(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeCancelUpdates := Value;
end;

procedure TBSAProxy.SetBeforeClose(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeClose := Value;
end;

procedure TBSAProxy.SetBeforeDelete(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeDelete := Value;
end;

procedure TBSAProxy.SetBeforeEdit(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeEdit := Value;
end;

procedure TBSAProxy.SetBeforeInsert(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeInsert := Value;
end;

procedure TBSAProxy.SetBeforeOpen(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeOpen := Value;
end;

procedure TBSAProxy.SetBeforePost(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforePost := Value;
end;

procedure TBSAProxy.SetBeforeRefresh(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeRefresh := Value;
end;

procedure TBSAProxy.SetBeforeScroll(const Value: TAdapterNotifyEvent);
begin
  FAdapter.BeforeScroll := Value;
end;

procedure TBSAProxy.SetItemIndex(const Value: Integer);
begin
  FAdapter.ItemIndex := Value;
end;

procedure TBSAProxy.SetItemIndexOffset(const Value: Integer);
begin
  FAdapter.ItemIndexOffset := Value;
end;

procedure TBSAProxy.SetOnApplyUpdates(const Value: TAdapterNotifyEvent);
begin
  FAdapter.OnApplyUpdates := Value;
end;

procedure TBSAProxy.SetOnApplyUpdatesError(const Value: TAdapterErrorEvent);
begin
  FAdapter.OnApplyUpdatesError := Value;
end;

procedure TBSAProxy.SetOnCancelUpdates(const Value: TAdapterNotifyEvent);
begin
  FAdapter.OnCancelUpdates := Value;
end;

procedure TBSAProxy.SetOnCancelUpdatesError(const Value: TAdapterErrorEvent);
begin
  FAdapter.OnCancelUpdatesError := Value;
end;

procedure TBSAProxy.SetOnDeleteError(const Value: TAdapterErrorEvent);
begin
  FAdapter.OnDeleteError := Value;
end;

procedure TBSAProxy.SetOnEditError(const Value: TAdapterErrorEvent);
begin
  FAdapter.OnEditError := Value;
end;

procedure TBSAProxy.SetOnHasUpdates(const Value: TAdapterHasUpdatesEvent);
begin
  FAdapter.OnHasUpdates := Value;
end;

procedure TBSAProxy.SetOnINsertError(const Value: TAdapterErrorEvent);
begin
  FAdapter.OnInsertError := Value;
end;

procedure TBSAProxy.SetOnPostError(const Value: TAdapterErrorEvent);
begin
  FAdapter.OnPostError := Value;
end;

end.
