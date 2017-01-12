unit iORM.MVVM.Components.ModelPresenter.DEsignTime;

interface

  procedure Register;

implementation

uses
  System.Classes, iORM.MVVM.Components.ModelPresenter;

  procedure Register;
  begin
    RegisterComponents('iORM', [TioModelPresenter]);
  end;

end.
