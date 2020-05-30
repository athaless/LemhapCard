unit Creditos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Tabs, ComCtrls, jpeg, ShellAPI;

type
  TFormCredito = class(TForm)
    Label2 : TLabel;
    Label8 : TLabel;
    LbTitiShadow: TLabel;
    LbTitiOver: TLabel;
    LbVer: TLabel;
    TabSet1: TTabSet;
    Notebook: TNotebook;
    Memo: TMemo;
    MemoTXT: TMemo;
    Shape1: TShape;
    Panel1: TPanel;
    Image1: TImage;
    procedure TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    //Funçoes para pegar os dados de versão do arquivo definidos no projeto (Delphi)
     function MyFileVersionAtributes(const FileName: string;var FileInfo: TStringList): Boolean;
     function MyFileVerInfo(const FileName: string; var versao: string): Boolean;
    procedure SendVars(strfn,strmemo:string);
    procedure Label2Click(Sender: TObject);
  private
  public
     arquivo : string;
     procedure ExibeCreditos(auxtitpchar, auxpchar, auxmemopchar: String);
  end;

var
  FormCredito: TFormCredito;

implementation

{$R *.DFM}

procedure TFormCredito.SendVars(strfn,strmemo:string);
begin
  arquivo:=strfn;
  MemoTXT.Lines.Add(strmemo);
end;

procedure TFormCredito.TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
 Notebook.PageIndex:=NewTab;
end;

procedure TFormCredito.FormShow(Sender: TObject);
var StrAthVersao:string; auxstrlst:TStringList; i:integer;
begin
  memo.clear;
  LbVer.Caption:='';
  if (MyFileVerInfo(arquivo, StrAthVersao))then
   begin
     LbVer.Caption:=StrAthVersao;
     auxstrlst:=TStringList.create;
     MyFileVersionAtributes(arquivo,auxstrlst);
     for i:=0 to auxstrlst.count-1 do memo.lines.add(auxstrlst[i]);
     auxstrlst.free;
   end
end;

//PEGA TODOS OS DADOS RELATIVOS A VERSÃO DO ARQUIVO EXECUTAVEL
function TFormCredito.MyFileVersionAtributes(const FileName: string;var FileInfo: TStringList): Boolean;
const
     Key: array[1..9] of string =('CompanyName' , 'FileDescription', 'FileVersion',
                                  'InternalName', 'LegalCopyright' , 'OriginalFilename',
                                  'ProductName' , 'ProductVersion' , 'Comments');

     KeyBr: array [1..9] of string = ('Empresa', 'Descrição', 'Versão do Arquivo',
                                      'Nome Interno', 'Copyright',
                                      'Nome Original do Arquivo', 'Produto',
                                      'Versão do Produto', 'Comentários');
var
  Dummy           : THandle;
  BufferSize, Len : Integer;
  Buffer          : PChar;
  LoCharSet, HiCharSet : Word;
  Translate, Return    : Pointer;
  StrFileInfo, Flags   : string;
  TargetOS, TypeArq    : string;
  FixedFileInfo        : Pointer;
  i                    : Byte;
begin
  Result := False;
  { Obtemos o tamanho em bytes do "version  information" }
  BufferSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  if BufferSize <> 0 then
  begin
    GetMem(Buffer, Succ(BufferSize));
    try
      if GetFileVersionInfo(PChar(FileName), 0, BufferSize,
        Buffer) then
      { Executamos a funcao "VerQueryValue" e conseguimos
        informacoes sobre o idioma/character-set }
      if VerQueryValue(Buffer, '\VarFileInfo\Translation',
          Translate, UINT(Len)) then
      begin
        LoCharSet := LoWord(Longint(Translate^));
        HiCharSet := HiWord(Longint(Translate^));
        for i := 1 to 9 do
        begin
          { Montamos a string de pesquisa }
          StrFileInfo := Format('\StringFileInfo\0%x0%x\%s',
                         [LoCharSet, HiCharSet, Key[i]]);
          { Adicionamos cada key pré-definido }
          if VerQueryValue(Buffer,PChar(StrFileInfo), Return,
             UINT(Len)) then
          FileInfo.Add(KeyBr[i] + ': ' + PChar(Return));
        end;
        if VerQueryValue(Buffer,'\',FixedFileInfo, UINT(Len))
          then
          with TVSFixedFileInfo(FixedFileInfo^) do
        begin
          Flags := '';
        { Efetuamos um bitmask e obtemos os "flags" do arquivo }
        if (dwFileFlags and VS_FF_DEBUG)        = VS_FF_DEBUG        then Flags := Concat(Flags,'*Debug* ');
        if (dwFileFlags and VS_FF_SPECIALBUILD) = VS_FF_SPECIALBUILD then Flags := Concat(Flags,'*Special Build* ');
        if (dwFileFlags and VS_FF_PRIVATEBUILD) = VS_FF_PRIVATEBUILD then Flags := Concat(Flags,'*Private Build* ');
        if (dwFileFlags and VS_FF_PRERELEASE)   = VS_FF_PRERELEASE   then Flags := Concat(Flags,'*Pre-Release Build* ');
        if (dwFileFlags and VS_FF_PATCHED)      = VS_FF_PATCHED      then Flags := Concat(Flags,'*Patched* ');
        if Flags <> '' then FileInfo.Add('Atributos: ' + Flags);
        TargetOS := 'Plataforma (OS): ';
        { Plataforma }
        case dwFileOS of
          VOS_UNKNOWN: TargetOS := Concat(TargetOS, 'Desconhecido');
          VOS_DOS    : TargetOS := Concat(TargetOS, 'MS-DOS');
          VOS_OS216  : TargetOS := Concat(TargetOS, '16-bit OS/2');
          VOS_OS232  : TargetOS := Concat(TargetOS, '32-bit OS/2');
          VOS_NT     : TargetOS := Concat(TargetOS, 'Windows NT');
          VOS_NT_WINDOWS32, 4: TargetOS := Concat(TargetOS, 'Win32 API');
          VOS_DOS_WINDOWS16  : TargetOS := Concat(TargetOS, '16-bit Windows ', 'sob MS-DOS');
          else
           TargetOS := Concat(TargetOS, 'Fora do Padrão. Código: ', IntToStr(dwFileOS));
       end;

        FileInfo.Add(TargetOS);
        TypeArq := 'Tipo de Arquivo: ';
        { Tipo de Arquivo }
        case dwFileType of
          VFT_UNKNOWN :  TypeArq := Concat(TypeArq,'Desconhecido');
          VFT_APP : TypeArq := Concat(TypeArq,'Aplicacao');
          VFT_DLL : TypeArq := Concat(TypeArq,'Dynamic-Link Lib.');
          VFT_DRV : begin
                      TypeArq := Concat(TypeArq,'Device driver - Driver ');
                      case dwFileSubtype of
                       VFT2_UNKNOWN        : TypeArq := Concat(TypeArq,'Desconhecido');
                       VFT2_DRV_PRINTER    : TypeArq := Concat(TypeArq,'de Impressão');
                       VFT2_DRV_KEYBOARD   : TypeArq := Concat(TypeArq,'de Teclado');
                       VFT2_DRV_LANGUAGE   : TypeArq := Concat(TypeArq,'de Idioma');
                       VFT2_DRV_DISPLAY    : TypeArq := Concat(TypeArq,'de Vídeo');
                       VFT2_DRV_MOUSE      : TypeArq := Concat(TypeArq,'de Mouse');
                       VFT2_DRV_NETWORK    : TypeArq := Concat(TypeArq,'de Rede');
                       VFT2_DRV_SYSTEM     : TypeArq := Concat(TypeArq,'de Sistema');
                       VFT2_DRV_INSTALLABLE: TypeArq := Concat(TypeArq,'Instalavel');
                       VFT2_DRV_SOUND      : TypeArq := Concat(TypeArq,'Multimida');
                      end;
                    end;
          VFT_FONT : begin
                      TypeArq := Concat(TypeArq,'Fonte - Fonte ');
                      case dwFileSubtype of
                        VFT2_UNKNOWN : TypeArq := Concat(TypeArq, 'Desconhecida');
                        VFT2_FONT_RASTER : TypeArq := Concat(TypeArq,'Raster');
                        VFT2_FONT_VECTOR : TypeArq := Concat(TypeArq,'Vetorial');
                        VFT2_FONT_TRUETYPE : TypeArq := Concat(TypeArq,'TrueType');
                     end;
                    end;
          VFT_VXD : TypeArq := Concat(TypeArq,'Virtual Device');
          VFT_STATIC_LIB : TypeArq := Concat(TypeArq,'Static-Link Lib.');
        end;
        FileInfo.Add(TypeArq);
      end;
    end;
    finally
      FreeMem(Buffer, Succ(BufferSize));
      Result := FileInfo.Text <> '';
    end;
  end;
end;

//PEGA APENAS A VERSÃO DO PROGRAMA
function TFormCredito.MyFileVerInfo(const FileName: string; var versao: string): Boolean;
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
        { Adicionamos cada key pré-definido }
        if VerQueryValue(Buffer,PChar(StrFileInfo), Return,UINT(Len)) then versao:=PChar(Return);
      end;
    finally
      FreeMem(Buffer, Succ(BufferSize));
      Result := versao <> '';
    end;
  end;
end;

procedure TFormCredito.Label2Click(Sender: TObject);
begin
  ShellExecute(0,nil,'http://www.athenas.com.br',nil,nil,0);
end;

procedure TFormCredito.ExibeCreditos(auxtitpchar, auxpchar, auxmemopchar: String);
begin
  FormCredito.LbTitiOver.Caption  :=auxtitpchar;
  FormCredito.LbTitiShadow.Caption:=auxtitpchar;
  FormCredito.SendVars(auxpchar,auxmemopchar);

  FormCredito.ShowModal;
end;

end.
