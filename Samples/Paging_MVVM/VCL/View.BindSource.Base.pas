unit View.BindSource.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, iORM.MVVM.Components.ViewModelBridge,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, Data.Bind.GenData, iORM.Attributes;

type

  TViewBindSourceBase = class(TFrame)
    ViewPanelTop: TPanel;
    LabelTitle: TLabel;
    VMBridge: TioViewModelBridge;
    MBSArticles: TioModelBindSource;
    [ioBindAction('acPrevPage')]
    ButtonPreviousPage: TSpeedButton;
    [ioBindAction('acNextPage')]
    ButtonNextPage: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
