program UploaderLemhap;

uses
  Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'UploaderLemhap';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
