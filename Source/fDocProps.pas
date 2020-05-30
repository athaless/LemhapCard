unit fDocProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, FlexBase, FlexProps, FlexUtils, RXSpin, IniFiles;

type
  TfmDocProps = class(TForm)
    panProps: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    edTitle: TEdit;
    Label2: TLabel;
    mmComment: TMemo;
    bbUserData: TBitBtn;
    Label3: TLabel;
    sedWidth: TRxSpinEdit;
    sedHeight: TRxSpinEdit;
    RdBut1: TRadioButton;
    RdBut2: TRadioButton;
    ComboTipos: TComboBox;
    Label5: TLabel;
    LbDim: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbUserDataClick(Sender: TObject);
    procedure ComboTiposKeyPress(Sender: TObject; var Key: Char);
    procedure ComboTiposClick(Sender: TObject);
    procedure sedWidthChange(Sender: TObject);
  private
    { Private declarations }
    FFlex: TFlexPanel;
    UserProps: TPropList;
    UserData: TUserDataProp;
    AuxWidth, AuxHeight: Double;

    procedure CarregarTipo(StrCategoria: String);
    procedure CarregarTodosTipos;
    function  Converter(Val: Double): Double;
  public
    { Public declarations }
  end;

var
  fmDocProps: TfmDocProps;

implementation

uses FTools;

{$R *.DFM}

procedure TfmDocProps.FormCreate(Sender: TObject);
begin
 UserProps := TPropList.Create(Nil);
 UserData := TUserDataProp.Create(UserProps, 'User data');
end;

procedure TfmDocProps.FormDestroy(Sender: TObject);
begin
 UserProps.Free;
end;

procedure TfmDocProps.FormShow(Sender: TObject);
begin
 CarregarTodosTipos;

 if (Tag <> 0) and (TObject(Tag) is TFlexPanel) then
  FFlex := TFlexPanel(Tag);
 if Assigned(FFlex)
 then begin
  edTitle.Text := FFlex.Schemes.Name;
  mmComment.Lines.Text := FFlex.Schemes.Hint;
  UserData.Text := FFlex.Schemes.UserData.Text;

  AuxWidth := FFlex.DocWidth / PixelScaleFactor;
  AuxHeight:= FFlex.DocHeight / PixelScaleFactor;
 end
 else begin
  panProps.Enabled := false;
  bbUserData.Enabled := false;
  bbOk.Enabled := false;

  AuxWidth := 640;
  AuxHeight:= 480;
 end;
 sedWidth .Value := AuxWidth;
 sedHeight.Value := AuxHeight;

 RdBut1.Checked:= True;
end;

procedure TfmDocProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (ModalResult = mrOk) and Assigned(FFlex) then begin
  FFlex.Schemes.Name := edTitle.Text;
  FFlex.Schemes.Hint := mmComment.Lines.Text;
  FFlex.Schemes.UserData.Text := UserData.Text;

  //FFlex.DocWidth  := Round(sedWidth.Value  * PixelScaleFactor);
  //FFlex.DocHeight := Round(sedHeight.Value * PixelScaleFactor);
  FFlex.DocWidth  := Round(AuxWidth  * PixelScaleFactor);
  FFlex.DocHeight := Round(AuxHeight * PixelScaleFactor);

  ModalResult := mrOk;
 end;
 Action := caHide;
end;

procedure TfmDocProps.bbUserDataClick(Sender: TObject);
begin
 UserData.Edit;
end;

procedure TfmDocProps.ComboTiposKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= #0;
end;

procedure TfmDocProps.CarregarTipo(StrCategoria: String);
var AuxIni : TIniFile;
    Cont   : Integer;
    StrTipo: String;
begin
  AuxIni:= TIniFile.Create(FormTools.MyGetLocalDir + ARQ_TIPOS);

  Cont:= 0;
  repeat
    StrTipo:= AuxIni.ReadString(StrCategoria, IntToStr(Cont), '');
    if (StrTipo <> '')
      then ComboTipos.Items.Add(StrTipo);
    Inc(Cont);
  until (StrTipo = '');

  AuxIni.Free;
end;

procedure TfmDocProps.CarregarTodosTipos;
begin
  ComboTipos.Items.Clear;

  CarregarTipo('CARTAO'  );
  CarregarTipo('ENVELOPE');
  CarregarTipo('TIMBRADO');
  CarregarTipo('OUTROS'  );
end;

procedure TfmDocProps.ComboTiposClick(Sender: TObject);
var StrAux1, StrAux2, StrAux3: String;
begin
  RdBut1.Checked:= True;

  if (ComboTipos.Text <> '') then
    begin
      StrAux1:= ComboTipos.Text;

      StrAux1:= FormTools.CutSubString(StrAux1, '(', ')');
      StrAux1:= '(' + StrAux1 + ')';
      StrAux2:= FormTools.CutSubString(StrAux1, '(', ',');
      StrAux3:= FormTools.CutSubString(StrAux1, ',', ')');
      try
        AuxWidth := StrToInt(StrAux2);
        AuxHeight:= StrToInt(StrAux3);

        LbDim.Caption:= Format('%n', [Converter(AuxWidth )]) + ' x ' +
                        Format('%n', [Converter(AuxHeight)]) + '.';
      except
        AuxWidth := 640;
        AuxHeight:= 480;
      end;
    end;
end;

procedure TfmDocProps.sedWidthChange(Sender: TObject);
begin
  RdBut2.Checked:= True;

  LbDim.Caption:= Format('%n', [Converter(sedWidth .Value)]) + ' x ' +
                  Format('%n', [Converter(sedHeight.Value)]) + '.';
end;

function TfmDocProps.Converter(Val: Double): Double;
begin
  Result:= (Val*21)/640;
end;

end.
