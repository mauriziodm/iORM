unit Model.BaseClasses.Interfaces;

interface

type

  IBaseClass = interface
    ['{24493B63-2486-48D4-9561-12C4CFD3FCB2}']
    function GetID: Integer;
    procedure SetID(Value: Integer);
    property ID: Integer read GetID write SetID;

    function GetDescrizione: String;
    procedure SetDescrizione(Value: String);
    property Descrizione: String read GetDescrizione write SetDescrizione;

    function GetListViewItem_Caption: String;
    property ListViewItem_Caption: String read GetListViewItem_Caption;

    function GetListViewItem_DetailText: String;
    property ListViewItem_DetailText: String read GetListViewItem_DetailText;

    function GetListViewItem_GroupHeader: String;
    property ListViewItem_GroupHeader: String read GetListViewItem_GroupHeader;
  end;

implementation

end.
