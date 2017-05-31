unit VM.Order;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase, iORM.Attributes,
  iORM.MVVM.Components.ModelPresenter;

type

  [diRegister]
  TOrderVM = class(TioViewModel)
    MPOrder: TioModelPresenter;
  private
    { Private declarations }
  public
    { Public declarations }
    [ioAction('acPost', 'Post', TioActionEvent.OnExecute)]
    procedure acPostExecute(Sender: TObject);
    [ioAction('acPost', TioActionEvent.OnUpdate)]
    procedure acPostUpdate(Sender: TObject);
    [ioAction('acBack', 'Back', TioActionEvent.OnExecute)]
    procedure acBackExecute(Sender: TObject);
  end;

var
  OrderVM: TOrderVM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TOrderVM }

procedure TOrderVM.acBackExecute(Sender: TObject);
begin
  FreeViews;
end;

procedure TOrderVM.acPostExecute(Sender: TObject);
begin
  MPOrder.Post;
end;

procedure TOrderVM.acPostUpdate(Sender: TObject);
begin
  Command['acPost'].Enabled := MPOrder.Editing;
end;

end.
