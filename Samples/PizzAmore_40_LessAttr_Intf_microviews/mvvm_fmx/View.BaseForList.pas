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
    BSMaster: TioModelBindSource;
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewDeleteItem(Sender: TObject; AIndex: Integer);
    procedure ListViewTap(Sender: TObject; const Point: TPointF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

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

end.
