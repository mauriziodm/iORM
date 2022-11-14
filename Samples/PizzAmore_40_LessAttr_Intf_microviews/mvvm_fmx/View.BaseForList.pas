unit View.BaseForList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.Objects, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge,
  System.Actions, FMX.ActnList, iORM.StdActions.Fmx, Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource;

type

  TViewBaseForList = class(TFrame)
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonBack: TSpeedButton;
    ListView: TListView;
    Rectangle1: TRectangle;
    ButtonDelete: TSpeedButton;
    ButtonSelect: TSpeedButton;
    ButtonAdd: TSpeedButton;
    ActionList1: TActionList;
    acBack: TioViewAction;
    acDelete: TioViewAction;
    acAdd: TioViewAction;
    acShowOrSelect: TioViewAction;
    VMBridge: TioViewModelBridge;
    MBSMaster: TioModelBindSource;
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewDeleteItem(Sender: TObject; AIndex: Integer);
    procedure ListViewTap(Sender: TObject; const Point: TPointF);
    procedure VMBridgeNeedViewModel(Sender: TioViewModelBridge; var AViewModel: IioViewModel);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

constructor TViewBaseForList.Create(AOwner: TComponent);
begin
  inherited;
  Sleep(1);
end;

procedure TViewBaseForList.ListViewDblClick(Sender: TObject);
begin
  VMBridge.VMAction['acShowOrSelect'].Execute;
end;

procedure TViewBaseForList.ListViewDeleteItem(Sender: TObject; AIndex: Integer);
begin
  // Do something
end;

procedure TViewBaseForList.ListViewTap(Sender: TObject; const Point: TPointF);
begin
  // Do something
end;

procedure TViewBaseForList.VMBridgeNeedViewModel(Sender: TioViewModelBridge; var AViewModel: IioViewModel);
begin
  Sleep(1);
end;

end.
