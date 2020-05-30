unit PenFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RxCombos, ColorComboEdit, ExtCtrls, FlexProps,
  FlexUtils, RXSpin;

type
  TPenPropForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbPenStyles: TComboBox;
    ccbPenColor: TColorComboEdit;
    cbPenModes: TComboBox;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    sedPenWidth: TRxSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPenStylesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FPenProp: TPenProp;
  public
    { Public declarations }
  end;

var
  PenPropForm: TPenPropForm;

implementation

{$R *.DFM}

procedure TPenPropForm.FormCreate(Sender: TObject);
var i: integer;
begin
 for i:=0 to integer(High(TPenStyle)) do
  case TPenStyle(i) of
   psSolid        : cbPenStyles.Items.Add('Solid');
   psDash         : cbPenStyles.Items.Add('Dash');
   psDot          : cbPenStyles.Items.Add('Dot');
   psDashDot      : cbPenStyles.Items.Add('DashDot');
   psDashDotDot   : cbPenStyles.Items.Add('DashDotDot');
   psClear        : cbPenStyles.Items.Add('Clear');
   psInsideFrame  : ; // Skiped // cbPenStyles.Items.Add('Inside-frame');
   else             cbPenStyles.Items.Add('???');
  end;
 for i:=0 to integer(High(TPenMode)) do
  case TPenMode(i) of
   pmBlack        : cbPenModes.Items.Add('Black');
   pmWhite        : cbPenModes.Items.Add('White');
   pmNop          : cbPenModes.Items.Add('Nop');
   pmNot          : cbPenModes.Items.Add('Not');
   pmCopy         : cbPenModes.Items.Add('Copy');
   pmNotCopy      : cbPenModes.Items.Add('NotCopy');
   pmMergePenNot  : cbPenModes.Items.Add('MergePenNot');
   pmMaskPenNot   : cbPenModes.Items.Add('MaskPenNot');
   pmMergeNotPen  : cbPenModes.Items.Add('MergeNotPen');
   pmMaskNotPen   : cbPenModes.Items.Add('MaskNotPen');
   pmMerge        : cbPenModes.Items.Add('Merge');
   pmNotMerge     : cbPenModes.Items.Add('NotMerge');
   pmMask         : cbPenModes.Items.Add('Mask');
   pmNotMask      : cbPenModes.Items.Add('NotMask');
   pmXor          : cbPenModes.Items.Add('Xor');
   pmNotXor       : cbPenModes.Items.Add('NotXor');
   else             cbPenModes.Items.Add('???');
  end;
end;

procedure TPenPropForm.FormShow(Sender: TObject);
begin
 if (Tag<>0) and (TObject(Tag) is TPenProp) then FPenProp := TPenProp(Tag);
 if Assigned(FPenProp) then with FPenProp do begin
  ccbPenColor.ColorValue := Color;
  cbPenStyles.ItemIndex := integer(Style);
  sedPenWidth.Value := Width / PixelScaleFactor;
  cbPenModes.ItemIndex := integer(Mode);
 end;
end;

procedure TPenPropForm.cbPenStylesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var R: TRect;
    Y: integer;
begin
 with Control as TComboBox do begin
  with Canvas do begin
   Brush.Style := bsSolid;
   FillRect(Rect);
   R := Classes.Rect(Rect.Left+3, Rect.Top+3, Rect.Left + 38, Rect.Bottom - 3);
   Pen.Style := TPenStyle(Index);
   if odSelected in State
    then Pen.Color := clWhite
    else Pen.Color := clBlack;
   Y := R.Top + (R.Bottom - R.Top) div 2;
   MoveTo(R.Left, Y);
   LineTo(R.Right, Y);
   Brush.Style := bsClear;
   OffsetRect(Rect, 47, 0);
   R.Top := Rect.Top + ((Rect.Bottom - Rect.Top) - TextHeight(Items[Index])) div 2;
   TextOut(Rect.Left, R.Top, Items[Index]);
  end;
 end;
end;

procedure TPenPropForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ModalResult = mrOk then begin
  if Assigned(FPenProp) then
  with FPenProp do begin
   Color := ccbPenColor.ColorValue;
   Style := TPenStyle(cbPenStyles.ItemIndex);
   Width := Round(sedPenWidth.Value * PixelScaleFactor);
   Mode := TPenMode(cbPenModes.ItemIndex);
  end;
  ModalResult := mrOk;
 end;
 Action := caFree;
end;

initialization
  RegisterDefaultPropEditForm(TPenProp, TPenPropForm);

end.
