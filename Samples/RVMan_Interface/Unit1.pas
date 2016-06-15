unit Unit1;

interface

uses
  System.SysUtils, System.Classes, IupOrm.MVVM.FMX.ViewModel, System.Actions,
  FMX.ActnList;

type
  TioViewModel1 = class(TioViewModel)
    Action1: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ioViewModel1: TioViewModel1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
