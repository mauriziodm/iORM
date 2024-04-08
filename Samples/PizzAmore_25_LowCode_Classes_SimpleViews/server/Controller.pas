unit Controller;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/api')]
  TMyController = class(TMVCController) 
  public
  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;





end.
