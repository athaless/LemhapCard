unit Inicio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, jpeg, ComCtrls;

const
  NUM_PROCESSOS  = 1; //[0..1] => 2 processos
  NUM_APPSSYS    = 0; //[0..0] => 1 arq, dlls etc requerido

type
  TFlagTasks  = record
                  flag:boolean;
                  str :string;
                end;
type
  TAppsSys  = record
                auxpath :string;
                auxstr  :string;
              end;

type
  TFormInicio = class(TForm)
    Image  : TImage;
    LbVersion: TLabel;
    TimerExec: TTimer;
    LbInfo: TLabel;
    ProgressBar: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure TimerExecTimer(Sender: TObject);
  private
    VetFlagTasks : array[0..NUM_PROCESSOS] of TFlagTasks;
    //VetAppsSys   : array[0..NUM_APPSSYS] of TAppsSys;

    function task_VerificaArqs :boolean;
    function task_ExibirVersao :boolean;
  public
  end;

var
  FormInicio: TFormInicio;

implementation

uses FTools, Main;

{$R *.DFM}

procedure TFormInicio.FormShow(Sender: TObject);
begin
  //Tarefas a serem executadas na inicialização
  VetFlagTasks[0].str := 'Verificando Dlls requeridas...';
  VetFlagTasks[1].str := 'Exibindo versão...';

  //Apps e DLLs requeridas...
  //VetAppsSys[0].auxpath:= '';  VetAppsSys[0].auxstr:= 'athShowMessages.dll';

  ProgressBar.Max      := NUM_PROCESSOS+1;
  ProgressBar.Position := 0;
  TimerExec.Enabled    := True;
  LbVersion.Caption    := '';
end;

procedure TFormInicio.TimerExecTimer(Sender: TObject);
var i : integer;
    auxbool  : boolean;

     procedure GoToNextStep(auxbool:boolean);
     begin
       LbInfo.Caption       := VetFlagTasks[TimerExec.Tag].str;
       VetFlagTasks[TimerExec.Tag].flag := auxbool;
       TimerExec.Tag                    := TimerExec.Tag +1;
       TimerExec.Enabled                := True;
     end;

begin
 TimerExec.Enabled    := False;
 ProgressBar.Position := TimerExec.Tag+1;
 case TimerExec.Tag of
   0 :  GoToNextStep(task_VerificaArqs);
   1 :  GoToNextStep(task_ExibirVersao);
 else
   auxbool:=True;
   for i:=0 to TimerExec.Tag-1 do
    begin
      auxbool := auxbool and VetFlagTasks[i].flag;
      if (not VetFlagTasks[i].flag)
        then MessageDlg('Erro na Inicialização', mtWarning, [mbOk], 0);
    end;
   Close;
 end;
end;

function TFormInicio.task_VerificaArqs:boolean;
//var Cont: Integer;
begin
  Result:= True;

  {
  for Cont:= 0 to NUM_APPSSYS do
    Result:= Result and FileExists(FormTools.MyGetLocalDir + VetAppsSys[Cont].auxpath +
                                                             VetAppsSys[Cont].auxstr);
                                                             }
end;

function TFormInicio.task_ExibirVersao:boolean;
var StrVersao: String;
begin
  Result:= True;

  FormTools.MyFileVerInfo(Application.ExeName, StrVersao);
  if (StrVersao <> '')
    then LbVersion.Caption:='Versão ' + StrVersao
    else LbVersion.Caption:='';
end;

end.
