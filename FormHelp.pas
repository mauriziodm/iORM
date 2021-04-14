unit FormHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, ComCtrls, ImgList, IniFiles,
  MAURI_SB;

type
  THelpForm = class(TForm)
    TreeView1: TTreeView;
    ImageList1: TImageList;
    TopPanel: TImage;
    BottomPanel: TImage;
    ShapeBordo: TShape;
    SBChiudi: TSpeedButtonRollOver;
    procedure FormShow(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure Aiuto(Sezione:String);     // Personale
    function NodoProprietario(NName:String): TTreeNode;
    procedure CaricaFormLayout;
    procedure FormCreate(Sender: TObject);
    procedure SBChiudiClick(Sender: TObject);
  private
    { Private declarations }
    GruppoPreselezionato : String;
  public
    { Public declarations }
  end;

var
  HelpForm: THelpForm;

implementation

uses DataModule1;

{$R *.DFM}

procedure THelpForm.CaricaFormLayout;
const
   FORM_HEIGHT = 500;
begin
   TopPanel.AutoSize := True;
   TopPanel.Picture.LoadFromFile(DM1.TemaDir + 'help_top.bmp');

   BottomPanel.AutoSize := True;
   BottomPanel.Picture.LoadFromFile(DM1.TemaDir + 'help_bottom.bmp');

   Width := TopPanel.Width + 4;
   Height := FORM_HEIGHT;

   ShapeBordo.Align := alClient;

   TopPanel.Left := 2;
   TopPanel.Top  := 2;

   BottomPanel.Left := 2;
   BottomPanel.Top := Height - BottomPanel.Height - 2;

   SBChiudi.Glyph.LoadFromFile(DM1.TemaDir + 'btn_chiudi.bmp');
   SBChiudi.Top := BottomPanel.Top - SBChiudi.Height - 0;
   SBChiudi.Left := (width - SBChiudi.Width) div 2;

   TreeView1.Top := TopPanel.Top + TopPanel.Height + 20;
   TreeView1.Height := SBChiudi.Top - TreeView1.Top - 10;
   TreeView1.Left := 40;
   TreeView1.Width := Width - TreeView1.Left - 40;
   TreeView1.BorderStyle := bsNone;
end;

procedure THelpForm.Aiuto(Sezione:String);     // Personale
begin
   GruppoPreselezionato := Sezione;
   ShowModal;
end;



procedure THelpForm.FormShow(Sender: TObject);
var
   H : TMemIniFile;
   S1, S2:TStringList;
   Contatore1, Contatore2:Integer;
   Node1, Node2, ParentNode:TTreeNode;
   NodeName, ParentNodeName: String;
begin
   // Inizializza varie cose
   S1 := TStringList.Create;
   S2 := TStringList.Create;
   H := TMemIniFile.Create(DM1.CurrDir + 'Help\Help.ini');

   // Azzera la TreeView
   TreeView1.Items.Clear;

   // INserisce le voci accessibili direttamente dalla root
   H.ReadSection('ROOT', S1);
   for Contatore1 := 0 to S1.Count - 1 do begin
      Node1 := TreeView1.Items.Add(nil, S1[Contatore1]);
      Node1.ImageIndex := 2;
      Node1.SelectedIndex := 2;
   end;

   // Carica tutti i gruppi e poi li aggiunge alla TreeView
   H.ReadSections(S1);
   for Contatore1 := 1 to S1.Count - 1 do begin
      // NodeName contiene il nome del del nuovo nodo da aggiungere
      NodeName := S1[Contatore1];
      ParentNodeName := H.ReadString(NodeName, 'Parent', 'nil');
      // PNode contiene il nodo a cui il nuovo nodo và aggiunto
      if ParentNodeName = 'nil' then ParentNode := nil else ParentNode := NodoProprietario(ParentNodeName);
      // Aggiunge il nuovo nodo
      Node1 := TreeView1.Items.AddChild(ParentNode, S1[Contatore1]);
      Node1.ImageIndex := 0;
      Node1.SelectedIndex := 1;
      // Cicla e inserisce tutte le sotto-voci del gruppo attuale
      H.ReadSection(S1[Contatore1], S2);
      for Contatore2 := 1 to S2.Count - 1 do begin
         Node2 := TreeView1.Items.AddChild(Node1, S2[Contatore2]);
         Node2.ImageIndex := 2;
         Node2.SelectedIndex := 2;
      end;
   end;

   // Seleziona per default il nodo con la proprietà Text = al parametro ricevuto
   if NodoProprietario(GruppoPreselezionato) <> nil then TreeView1.Selected := NodoProprietario(GruppoPreselezionato);

   // Distrugge gli oggetti creati
   H.Free;
   S1.Free;
   S2.Free;
end;


function THelpForm.NodoProprietario(NName:String): TTreeNode;
var
   CurrItem: TTreeNode;
begin
   // Questa funzione cicla per tutti i nodi della TreeView e restituisce un puntatore
   //  al nodo che ha la proprietà 'Text' uguale al parametro ricevuto, se non viene trovato
   //  alcun nodo corrispondente ritorna 'nil'
   // Imposta il valore di default
   Result := nil;
   // CurrItem contiene il primo nodo
   CurrItem := TreeView1.Items.GetFirstNode;
   // Se il primo nodo è quello cercato pone result := al nodo ed esce
   if CurrItem.Text = NName then Result := CurrItem;
   // Cicla per tutti gli altri nodi finchè non trova il nodo cercato oppure sono finiti i nodi
   while (CurrItem <> nil)and(Result = nil) do begin
      // Se il primo nodo è quello cercato pone result := al nodo ed esce
      if CurrItem.Text = NName then Result := CurrItem;
      // Và al prossimo nodo
      CurrItem := CurrItem.GetNext;
   end;
end;


procedure THelpForm.TreeView1Click(Sender: TObject);
var
   H:TMemIniFile;
   ExecStr: String;
   lpszFileExe : array[0..250] of AnsiChar;
begin
   ExecStr := 'NONE';
   // Solo se la voce selezionata non possiede una sottovoce (cioè non è un gruppo)
   if not TreeView1.Selected.HasChildren then begin
      // Apre il file INI
      H := TMemIniFile.Create(DM1.CurrDir + 'Help\Help.ini');
      // Carica nella variabile il comando da eseguire
      if TreeView1.Selected.Parent <> nil then begin
         ExecStr := H.ReadString(TreeView1.Selected.Parent.Text, TreeView1.Selected.Text, 'NONE');
      end else begin
         ExecStr := H.ReadString('ROOT', TreeView1.Selected.Text, 'NONE');
      end;
      // Chiude il file INI
      H.Free;
      // Esegue il comando se diverso da 'NULL'
      if ExecStr <> 'NONE' then begin
         // Prima si sposta sulla directory dove sono contenuti i files dell'help
         //  altrimenti non funziona.
         ChDir(DM1.CurrDir + '\Help');
         // Poi converte ed esegue il comando
         StrPCopy( lpszFileExe, ExecStr);
         WinExec(lpszFileExe, SW_SHOW);
      end;
   end;
end;

procedure THelpForm.FormCreate(Sender: TObject);
begin
   CaricaFormLayout;
end;

procedure THelpForm.SBChiudiClick(Sender: TObject);
begin
   Close;
end;

end.
