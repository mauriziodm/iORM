unit View.BaseForList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.Objects, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge,
  System.Actions, FMX.ActnList, iORM.StdActions.Fmx, Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource,
  iORM.Where.Interfaces, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Master;

type

  TViewBaseForList = class(TFrame)
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonBack: TSpeedButton;
    ListView: TListView;
    RectangleBottom: TRectangle;
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
    RectangleWhere: TRectangle;
    RectangleWhereButtons: TRectangle;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    BSWhere: TioModelBindSource;
    acWhereBuild: TioViewAction;
    acWhereClear: TioViewAction;
  private
  public
  end;

implementation

{$R *.fmx}
end.
