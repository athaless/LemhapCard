unit fAboutPrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg;

type
  TformAbout = class(TForm)
    Label4: TLabel;
    lblVersion: TLabel;
    lblHyperlink: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    lbEMail: TLabel;
    Panel1: TPanel;
    Image2: TImage;
    procedure lblHyperlinkClick(Sender: TObject);
    procedure lbEMailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure ShowAbout;

implementation

uses
  ShellApi, FTools;

{$R *.DFM}

procedure ShowAbout;
begin
 with TformAbout.Create(Application) do begin
  ShowModal;
  Free;
 end;
end;

// TformAbout /////////////////////////////////////////////////////////////////

constructor TformAbout.Create(AOwner: TComponent);
begin
 inherited;
end;

destructor TformAbout.Destroy;
begin
 inherited;
end;

procedure TformAbout.lblHyperlinkClick(Sender: TObject);
begin
  ShellExecute(0, PChar('open'), PChar(lblHyperlink.Caption), nil, nil, SW_SHOW);
end;

procedure TformAbout.lbEMailClick(Sender: TObject);
begin
  ShellExecute(0, PChar('open'), PChar('mailto:' + lbEMail.Caption), nil, nil, SW_SHOW);
end;

procedure TformAbout.FormShow(Sender: TObject);
var StrVersion: String;
begin
 if (not FormTools.MyFileVerInfo(Application.ExeName, StrVersion))
   then StrVersion:= '';
 lblVersion.Caption:= StrVersion;
end;

procedure TformAbout.Image2Click(Sender: TObject);
begin
  ShellExecute(0, PChar('open'), PChar('www.athenas.com.br'), nil, nil, SW_SHOW);
end;

end.
