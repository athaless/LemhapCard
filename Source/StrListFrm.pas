unit StrListFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FlexProps;

type
  TStrListPropForm = class(TForm)
    mmText: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FStrListProp: TStrListProp;
  public
    { Public declarations }
  end;

var
  StrListPropForm: TStrListPropForm;

implementation

{$R *.DFM}

procedure TStrListPropForm.FormShow(Sender: TObject);
begin
 if (Tag <> 0) and (TObject(Tag) is TStrListProp) then
  FStrListProp := TStrListProp(Tag);
 if Assigned(FStrListProp) then
  mmText.Text := FStrListProp.Text;
end;

procedure TStrListPropForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ModalResult = mrOk then begin
  if Assigned(FStrListProp) then FStrListProp.Text := mmText.Text;
  ModalResult := mrOk;
 end;
 Action := caFree;
end;

initialization
  RegisterDefaultPropEditForm(TStrListProp, TStrListPropForm);

end.
