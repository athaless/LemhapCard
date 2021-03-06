unit FTools;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms;

const
  //ARQ_CORES    = 'Cores.ini';
  //DIR_SIMBOLOS = 'Simbolos';

  ARQ_CONFIG   = 'LemhapCards.ini';
  ARQ_UPLOADER = 'Uploader.ini';
  ARQ_TIPOS    = 'Tipos.ini';

  DIR_IMAGENS  = 'Imagens';
  DIR_DADOS    = 'Dados';
  DIR_HELP     = 'Help';
  DIR_EXEMPLOS = 'Exemplos';

  DIR_MODELOS  = 'Modelos';
  DIR_MODELOS_CARTAO   = 'Modelos\Cartao';
  DIR_MODELOS_ENVELOPE = 'Modelos\Envelope';
  DIR_MODELOS_TIMBRADO = 'Modelos\Timbrado';
  DIR_MODELOS_OUTROS   = 'Modelos\Outros';

type
  TFormTools = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    LocalDir: String;
  public
    { Public declarations }
     function CutSubString(var str:string; c1,c2:char):string;
     function MyGetLocalDir:string;
     //function ApplyDark(Color:TColor; HowMuch:byte):TColor;
     function MyFileVerInfo(const FileName: string; var versao: string): Boolean;
  end;

var
  FormTools: TFormTools;

implementation

{$R *.DFM}

function TFormTools.CutSubString(var str:string; c1,c2:char):string;
var auxstr:string; aux1,aux2:integer;
begin
 auxstr:=str;
 aux1:=pos(c1,AuxStr);
 Delete(AuxStr,1,aux1);
 aux2:=pos(c2,AuxStr);
 Delete(AuxStr, aux2, length(AuxStr)-(aux2-1));
 CutSubString:=AuxStr;
 //Delete(str,1,aux2+1);

 //Deixa o ultimo caracter C2 na string principal e se recebe uma string que
 //so tenha um elemente e este for igual ao c2 entao limpa a string
 //OBS. ACHEI MELHOR FUNCIONAR ASSIM !!!
   Delete(str,1,aux2);
   if str=c2 then str:='';
end;

function TFormTools.MyGetLocalDir:string;
begin
  MyGetLocalDir := LocalDir;
end;

procedure TFormTools.FormCreate(Sender: TObject);
begin
 // Se for o diretorio raiz a funcao GETDIR retorna 'C:\'
 // se nao ela retorna "c:\diretorio"
 // Resolvi padronizar : retornando SEMPRE uma barra no final da string

 //GetDir(0,LocalDir);
 LocalDir:=ExtractFileDir(Application.ExeName);
 LocalDir:=LocalDir+'\';
 if (pos(':\\',LocalDir)>0) then delete(LocalDir,pos(':\\',LocalDir)+1,1);
end;

{
function TFormTools.ApplyDark(Color:TColor; HowMuch:byte):TColor;
var r,g,b:Byte;
begin
 Color:=ColorToRGB(Color);
 r:=GetRValue(Color);
 g:=GetGValue(Color);
 b:=GetBValue(Color);
 if r>HowMuch then r:=r-HowMuch else r:=0;
 if g>HowMuch then g:=g-HowMuch else g:=0;
 if b>HowMuch then b:=b-HowMuch else b:=0;
 result:=RGB(r,g,b);
end;
}

function TFormTools.MyFileVerInfo(const FileName: string; var versao: string): Boolean;
var
  Dummy           : THandle;
  BufferSize, Len : Integer;
  Buffer          : PChar;
  LoCharSet, HiCharSet : Word;
  Translate, Return    : Pointer;
  StrFileInfo          : string;
begin
  Result := False;
  { Obtemos o tamanho em bytes do "version  information" }
  BufferSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  if BufferSize <> 0 then
  begin
    GetMem(Buffer, Succ(BufferSize));
    try
      if GetFileVersionInfo(PChar(FileName), 0, BufferSize,Buffer) then
      { Executamos a funcao "VerQueryValue" e conseguimos informacoes sobre o idioma/character-set }
      if VerQueryValue(Buffer, '\VarFileInfo\Translation',Translate, UINT(Len)) then
      begin
        LoCharSet := LoWord(Longint(Translate^));
        HiCharSet := HiWord(Longint(Translate^));
        { Montamos a string de pesquisa }
        StrFileInfo := Format('\StringFileInfo\0%x0%x\%s',[LoCharSet, HiCharSet, 'FileVersion']);
        { Adicionamos cada key pr�-definido }
        if VerQueryValue(Buffer,PChar(StrFileInfo), Return,UINT(Len)) then versao:=PChar(Return);
      end;
    finally
      FreeMem(Buffer, Succ(BufferSize));
      Result := versao <> '';
    end;
  end
  else
   begin
     versao := inttostr(FileAge(FileName));
   end;
end;

end.
