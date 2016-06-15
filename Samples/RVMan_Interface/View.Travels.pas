unit View.Travels;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.ListView,
  ViewModel.Travels.Interfaces;

type
  TViewTravels = class(TFrame)
    ListView1: TListView;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    btnNext: TSpeedButton;
    Button1: TButton;
    procedure PrototypeBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  strict private
    { Private declarations }
    FViewModel: IViewModelTravels;
  strict protected
    function ViewModel: IViewModelTravels;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AViewModel: IViewModelTravels); overload;
  end;

implementation

uses
  GlobalFactory;

{$R *.fmx}

{ TFrame1 }

constructor TViewTravels.Create(AOwner: TComponent; AViewModel: IViewModelTravels);
begin
  inherited Create(AOwner);
  FViewModel := AViewModel;
end;

procedure TViewTravels.PrototypeBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
//  ABindSourceAdapter := ViewModel.GetBindSourceAdapter;
end;

function TViewTravels.ViewModel: IViewModelTravels;
begin
  if not Assigned(FViewModel)
    then FViewModel := TGlobalFactory.GetTravelsViewModel;
  Result := FViewModel;
end;

end.
