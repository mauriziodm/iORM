unit iORM.MVVM.Components.ViewModelBridge.DesignTime;

interface

  procedure Register;

implementation

uses
  System.Classes, iORM.MVVM.Components.ViewModelBridge;

  procedure Register;
  begin
    RegisterComponents('iORM', [TioViewModelBridge]);
  end;

end.
