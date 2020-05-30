unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ComCtrls, OleCtrls, ToolWin, ActnList, shdocvw,
  Buttons, jpeg, IniFiles;

const
  ARQ_UPLOADER = 'Uploader.ini';
  CM_HOMEPAGEREQUEST = WM_USER + $1000;

type
  TFormPrincipal = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    WebBrowser: TWebBrowser;
    Panel1: TPanel;
    Panel4: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure MenuFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    StrUrl: String;

    procedure FindAddress;
    procedure HomePageRequest(var message: tmessage); message CM_HOMEPAGEREQUEST;
  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.DFM}

procedure TFormPrincipal.FindAddress;
var
  Flags: OLEVariant;
begin
  Flags := 0;
  WebBrowser.Navigate(WideString(StrUrl), Flags, Flags, Flags, Flags);
end;

procedure TFormPrincipal.HomePageRequest(var Message: TMessage);
begin
  //URLs.Text := StrUrl;
  //FindAddress;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  { Find the home page - needs to be posted because HTML control hasn't been
    registered yet. }
  //PostMessage(Handle, CM_HOMEPAGEREQUEST, 0, 0);
end;

procedure TFormPrincipal.MenuFecharClick(Sender: TObject);
begin
  WebBrowser.Stop;
  Close;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
var AuxIni: TIniFile;
    LocalDir: String;
begin
  LocalDir:=ExtractFileDir(Application.ExeName);
  LocalDir:=LocalDir+'\';
  if (pos(':\\',LocalDir)>0) then delete(LocalDir,pos(':\\',LocalDir)+1,1);

  AuxIni:= TIniFile.Create(LocalDir + ARQ_UPLOADER);
  StrUrl:= AuxIni.ReadString('WEB', 'SITE', 'www.athenas.com.br');
  AuxIni.Free;

  FormPrincipal.Caption:= FormPrincipal.Caption + ' - ' + StrUrl;
  StrUrl:= StrUrl + 'UploadLogin.asp';

  FindAddress;
end;

end.
