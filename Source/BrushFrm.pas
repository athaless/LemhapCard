unit BrushFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxCombos, FlexProps, ExtCtrls, Buttons, ColorComboEdit, ExtDlgs;

type
  TBrushPropForm = class(TForm)
    GroupBox1: TGroupBox;
    cbGradStyle: TComboBox;
    ccbGradBegin: TColorComboEdit;
    ccbGradEnd: TColorComboEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    rbStandard: TRadioButton;
    rbGradient: TRadioButton;
    rbBitmap: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cbBrushStyles: TComboBox;
    Label2: TLabel;
    ccbBrushColor: TColorComboEdit;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    imgBitmap: TImage;
    bbLoad: TBitBtn;
    bbSave: TBitBtn;
    bbClear: TBitBtn;
    opd_Bitmap: TOpenPictureDialog;
    spd_Bitmap: TSavePictureDialog;
    chMasked: TCheckBox;
    ccbMaskColor: TColorComboEdit;
    procedure cbBrushStylesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbLoadClick(Sender: TObject);
    procedure bbSaveClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure cbBrushStylesChange(Sender: TObject);
    procedure cbGradStyleChange(Sender: TObject);
    procedure ccbMaskColorChange(Sender: TObject);
    procedure chMaskedClick(Sender: TObject);
  private
    { Private declarations }
    FBrushProp: TBrushProp;
    FBrushBmp: TBitmap;
    FChanging: boolean;
    procedure BitmapChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  BrushPropForm: TBrushPropForm;

implementation

{$R *.DFM}

uses
  FlexUtils, FTools;

procedure TBrushPropForm.FormCreate(Sender: TObject);
var i: integer;
begin
 FBrushBmp := TBitmap.Create;
 FBrushBmp.OnChange := BitmapChange;
 for i:=0 to integer(High(TBrushStyle)) do
  case TBrushStyle(i) of
   bsSolid        : cbBrushStyles.Items.Add('Solid');
   bsClear        : cbBrushStyles.Items.Add('Clear');
   bsHorizontal   : cbBrushStyles.Items.Add('Horizontal');
   bsVertical     : cbBrushStyles.Items.Add('Vertical');
   bsFDiagonal    : cbBrushStyles.Items.Add('FDiagonal');
   bsBDiagonal    : cbBrushStyles.Items.Add('BDiagonal');
   bsCross        : cbBrushStyles.Items.Add('Cross');
   bsDiagCross    : cbBrushStyles.Items.Add('DiagCross');
   else             cbBrushStyles.Items.Add('???');
  end;
end;

procedure TBrushPropForm.FormShow(Sender: TObject);
begin
 if (Tag<>0) and (TObject(Tag) is TBrushProp) then
  FBrushProp := TBrushProp(Tag);
 if Assigned(FBrushProp) then with FBrushProp do begin
  // Method
  case Method of
   bmHatch    : rbStandard.Checked := true;
   bmGradient : rbGradient.Checked := true;
   bmBitmap   : rbBitmap.Checked := true;
  end;
  // Hatch
  ccbBrushColor.ColorValue := Color;
  cbBrushStyles.ItemIndex := integer(Style);
  // Grad
  cbGradStyle.ItemIndex := integer(GradStyle);
  ccbGradBegin.ColorValue := GradBeginColor;
  ccbGradEnd.ColorValue := GradEndColor;
  // Bitmap
  if Assigned(Bitmap) then FBrushBmp.Assign(Bitmap);
  chMasked.Checked := BitmapMasked;
  ccbMaskColor.ColorValue := BitmapMaskColor;
 end;
end;

procedure TBrushPropForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ModalResult = mrOk then begin
  if Assigned(FBrushProp) then
  with FBrushProp do begin
   // Method
   if rbStandard.Checked then
    Method := bmHatch
   else
   if rbGradient.Checked then
    Method := bmGradient
   else
   if rbBitmap.Checked then
    Method := bmBitmap;
   // Hatch
   Color := ccbBrushColor.ColorValue;
   Style := TBrushStyle(cbBrushStyles.ItemIndex);
   // Graident
   GradStyle := TGradientStyle(cbGradStyle.ItemIndex);
   GradBeginColor := ccbGradBegin.ColorValue;
   GradEndColor := ccbGradEnd.ColorValue;
   // Bitmap
   if not FBrushBmp.Empty then begin
    Bitmap := FBrushBmp;
    //FBrushBmp := Nil; 
   end else
    Bitmap := Nil;
   BitmapMasked := chMasked.Checked;
   BitmapMaskColor := ccbMaskColor.ColorValue;
  end;
  ModalResult := mrOk;
 end;
 //FBrushBmp.Free;
 Action := caFree;
end;

procedure TBrushPropForm.cbBrushStylesDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var R: TRect;
begin
 with Control as TComboBox do begin
  with Canvas do begin
   Brush.Style := bsSolid;
   FillRect(Rect);
   R := Classes.Rect(Rect.Left+3, Rect.Top+3, Rect.Left + 43, Rect.Bottom - 3);
   Brush.Style := TBrushStyle(Index);
   if odSelected in State then begin
    case Brush.Style of
     bsSolid: Brush.Color := clBlack;
     bsClear: Brush.Color := clHighlight;
     else Brush.Color := clWhite;
    end;
    Pen.Color := clWhite;
   end else begin
    if Brush.Style = bsClear
     then Brush.Color := clWhite
     else Brush.Color := clBlack;
    Pen.Color := clBlack;
   end;
   InflateRect(R, 1, 1);
   Rectangle(R.Left, R.Top, R.Right, R.Bottom);
   Brush.Style := bsClear;
   OffsetRect(Rect, 52, 0);
   R.Top := Rect.Top + ((Rect.Bottom - Rect.Top) - TextHeight(Items[Index])) div 2;
   TextOut(Rect.Left, R.Top, Items[Index]);
  end;
 end;
end;

procedure TBrushPropForm.bbLoadClick(Sender: TObject);
begin
 opd_Bitmap.InitialDir:= FormTools.MyGetLocalDir + DIR_IMAGENS;
 opd_Bitmap.FileName  := '';
 rbBitmap.Checked:= True;
 if opd_Bitmap.Execute then
  FBrushBmp.LoadFromFile(opd_Bitmap.FileName);
end;

procedure TBrushPropForm.bbSaveClick(Sender: TObject);
begin
 spd_Bitmap.InitialDir:= FormTools.MyGetLocalDir + DIR_IMAGENS;
 rbBitmap.Checked:= True;
 if spd_Bitmap.Execute then
  FBrushBmp.SaveToFile(spd_Bitmap.FileName);
end;

procedure TBrushPropForm.bbClearClick(Sender: TObject);
begin
 rbBitmap.Checked:= True;
 DeleteObject(FBrushBmp.ReleaseHandle);
 BitmapChange(FBrushBmp);
end;

procedure TBrushPropForm.BitmapChange(Sender: TObject);
var Dest: TRect;
    CX, CY: Double;
    Ofs: TPoint;
begin
 if FChanging then exit;
 FChanging := true;
 try
  if not FBrushBmp.Empty then begin
   if (FBrushBmp.Width <= imgBitmap.Width) and
      (FBrushBmp.Height <= imgBitmap.Height) then begin
    imgBitmap.Center := true;
    imgBitmap.Picture.Graphic := FBrushBmp;
   end else begin
    imgBitmap.Picture.Graphic := Nil;
    Dest := Rect(0, 0, FBrushBmp.Width, FBrushBmp.Height);
    if Dest.Right > imgBitmap.Width
     then CX := imgBitmap.Width / Dest.Right
     else CX := 1;
    if Dest.Bottom > imgBitmap.Height
     then CY := imgBitmap.Height / Dest.Bottom
     else CY := 1;
    if CY < CX then CX := CY;
    Dest.Right  := Round(Dest.Right  * CX);
    Dest.Bottom := Round(Dest.Bottom * CX);
    Ofs.X := (imgBitmap.Width - Dest.Right) div 2;
    Ofs.Y := (imgBitmap.Height - Dest.Bottom) div 2;
    OffsetRect(Dest, Ofs.X, Ofs.Y);
    imgBitmap.Canvas.StretchDraw(Dest, FBrushBmp);
   end;
  end else
   imgBitmap.Picture.Graphic := Nil;
 finally
  FChanging := False;
 end;
end;

procedure TBrushPropForm.cbBrushStylesChange(Sender: TObject);
begin
  rbStandard.Checked:= True;
end;

procedure TBrushPropForm.cbGradStyleChange(Sender: TObject);
begin
  rbGradient.Checked:= True;
end;

procedure TBrushPropForm.ccbMaskColorChange(Sender: TObject);
begin
  rbBitmap.Checked:= True;
end;

procedure TBrushPropForm.chMaskedClick(Sender: TObject);
begin
  rbBitmap.Checked:= True;
end;

initialization
  RegisterDefaultPropEditForm(TBrushProp, TBrushPropForm);

end.
