// If conditional expressions are enabled in this version
//  else use only the global ioVCL or ioFMX defined in the project
//  source (Project.ViewSource).
{$IFDEF conditionalexpressions}
  // If the ioFMX or ioVCL is already defined in the global definitions
  //  of the project (Project.ViewSource) then use it, else define it
  //  here.
  //  NB: The global project definitions are most secure
  {$IF Defined(ioFMX) or Defined(ioVCL)}
  {$ELSEIF }
    {$IFDEF MSWINDOWS}
      {$IF Declared(FireMonkeyVersion) or Defined(FireMonkeyVersion)}
        {$DEFINE ioFMX}
      {$ELSE}
        {$DEFINE ioVCL}
      {$IFEND}
    {$ELSE}
      {$DEFINE ioFMX}
    {$ENDIF}
  {$IFEND}
{$ENDIF}

