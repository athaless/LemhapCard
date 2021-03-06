unit FNovo2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, AthFindFile, jpeg, ExtCtrls, FileCtrl;

const
  EXT_ARQUIVO = '.fxd';
  EXT_IMAGEM  = '.bmp';

type
  TFormNovo2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ScrollBoxCARTAO: TScrollBox;
    ButFechar: TBitBtn;
    AthFindFile1: TAthFindFile;
    ScrollBoxENVELOPE: TScrollBox;
    ScrollBoxTIMBRADO: TScrollBox;
    ScrollBoxOUTROS: TScrollBox;
    procedure FormShow(Sender: TObject);
    procedure ButFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CarregarModelos(StrDiretorio: String; AuxScrollBox: TSCrollBox);

    procedure AlocarThumbnail   (ScrollBoxPai: TSCrollBox; StrArquivo, StrImagem: String);
    procedure DesalocarThumbnail(ScrollBoxPai: TSCrollBox);

    procedure Evento_OnClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FormNovo2: TFormNovo2;

implementation

uses FTools, Main;

{$R *.DFM}

procedure TFormNovo2.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 0;

  CarregarModelos(FormTools.MyGetLocalDir + DIR_MODELOS_CARTAO  , ScrollBoxCARTAO  );
  CarregarModelos(FormTools.MyGetLocalDir + DIR_MODELOS_ENVELOPE, ScrollBoxENVELOPE);
  CarregarModelos(FormTools.MyGetLocalDir + DIR_MODELOS_TIMBRADO, ScrollBoxTIMBRADO);
  CarregarModelos(FormTools.MyGetLocalDir + DIR_MODELOS_OUTROS  , ScrollBoxOUTROS  );
end;

procedure TFormNovo2.CarregarModelos(StrDiretorio: String; AuxScrollBox: TSCrollBox);
var Cont: Integer;
    StrNome1, StrNome2: String;
begin
  if (DirectoryExists(StrDiretorio)) then
    begin
      AthFindFile1.Diretorio:= StrDiretorio;
      AthFindFile1.Filtros  := '*' + EXT_ARQUIVO;
      AthFindFile1.Execute;

      for Cont:= 0 to AthFindFile1.InfoName_Files.Count-1 do
        begin
          StrNome1:= AthFindFile1.InfoName_Files[Cont];
          StrNome2:= StringReplace(StrNome1, EXT_ARQUIVO, EXT_IMAGEM, [rfIgnoreCase, rfReplaceAll]);

          if (FileExists(StrNome2))
            then AlocarThumbnail(AuxScrollBox, StrNome1, StrNome2);
        end;
    end;
end;

procedure TFormNovo2.AlocarThumbnail(ScrollBoxPai: TSCrollBox; StrArquivo, StrImagem: String);
const BUTTON_WIDTH  = 155;
      BUTTON_HEIGHT = 94;

      DESLOC_X = 158;
      DESLOC_Y = 104;

      NUM_ELEM_LINHA = 2;
var AuxSpeedButton: TSpeedButton;
    AuxTop, AuxLeft, Quant: Integer;
    ValMod, ValDiv: Integer;
begin
  AuxTop := 3;
  AuxLeft:= 3;
  Quant  := ScrollBoxPai.ComponentCount;
  ValMod := (Quant mod NUM_ELEM_LINHA);
  ValDiv := (Quant div NUM_ELEM_LINHA);

  AuxTop := AuxTop  + (DESLOC_Y * ValDiv);
  AuxLeft:= AuxLeft + (DESLOC_X * ValMod);

  AuxSpeedButton:= TSpeedButton.Create(ScrollBoxPai);
  AuxSpeedButton.Parent  := ScrollBoxPai;
  AuxSpeedButton.Top     := AuxTop;
  AuxSpeedButton.Left    := AuxLeft;
  AuxSpeedButton.Width   := BUTTON_WIDTH;
  AuxSpeedButton.Height  := BUTTON_HEIGHT;
  AuxSpeedButton.Flat    := True;
  AuxSpeedButton.ShowHint:= False;
  AuxSpeedButton.Hint    := StrArquivo;
  AuxSpeedButton.OnClick := Evento_OnClick;
  AuxSpeedButton.Glyph.LoadFromFile(StrImagem);
end;

procedure TFormNovo2.DesalocarThumbnail(ScrollBoxPai: TSCrollBox);
var AuxComponent: TComponent;
begin
  while (ScrollBoxPai.ComponentCount > 0) do
    begin
      AuxComponent:= ScrollBoxPai.Components[0];

      if (AuxComponent is TSpeedButton)
        then (AuxComponent as TSpeedButton).Free
        else (AuxComponent as TObject     ).Free;
    end;
end;

procedure TFormNovo2.ButFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormNovo2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DesalocarThumbnail(ScrollBoxCARTAO  );
  DesalocarThumbnail(ScrollBoxENVELOPE);
  DesalocarThumbnail(ScrollBoxTIMBRADO);
  DesalocarThumbnail(ScrollBoxOUTROS  );
end;

procedure TFormNovo2.Evento_OnClick(Sender: TObject);
begin
  if (Sender is TSpeedButton) then
    begin
      EditMainForm.FileOpenFromTemplate((Sender as TSpeedButton).Hint);
      Close;
    end;
end;

end.

