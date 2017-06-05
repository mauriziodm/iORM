unit V.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, iORM.MVVM.Components.ViewModelBridge, iORM.Attributes;

type
  TBaseView = class(TFrame)
    ToolBar1: TToolBar;
    LabelTitle: TLabel;

    [ioBindAction('acBack')]
    ButtonBack: TSpeedButton;
    VMBridge: TioViewModelBridge;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
