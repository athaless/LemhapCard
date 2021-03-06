unit PictureFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, StdCtrls, ExtCtrls, Buttons, RxCombos, ExtDlgs,
  VCLUtils, FlexProps, ColorComboEdit, RXSpin;

type
  TPicturePropForm = class(TForm)
    Panel1: TPanel;
    bbLoad: TBitBtn;
    bbSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    chMask: TCheckBox;
    opd_Load: TOpenPictureDialog;
    spd_Save: TSavePictureDialog;
    cceMaskColor: TColorComboEdit;
    Panel3: TPanel;
    imgPreview: TImage;
    bbClear: TBitBtn;
    Panel4: TPanel;
    chLinked: TCheckBox;
    fedLinked: TFilenameEdit;
    sedCols: TRxSpinEdit;
    sedRows: TRxSpinEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure bbLoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure chMaskClick(Sender: TObject);
    procedure chLinkedClick(Sender: TObject);
    procedure fedLinkedAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure fedLinkedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fedLinkedExit(Sender: TObject);
    procedure fedLinkedChange(Sender: TObject);
  private
    { Private declarations }
    FPictureProp: TPictureProp;
    FPicture: TPicture;
    FChanging: boolean;
    FIsDialogChange: boolean;
    FLastLinkName: string;
    procedure CheckTools;
    procedure PictureChange(Sender: TObject);
    procedure UpdateLink;
    function  IsLinked: boolean;
  public
    { Public declarations }
  end;

var
  PicturePropForm: TPicturePropForm;

implementation

uses FTools;

{$R *.DFM}

procedure TPicturePropForm.FormCreate(Sender: TObject);
begin
 FPicture := TPicture.Create;
 FPicture.OnChange := PictureChange;
 fedLinked.Filter := opd_Load.Filter;
end;

procedure TPicturePropForm.FormDestroy(Sender: TObject);
begin
 FPicture.Free;
end;

procedure TPicturePropForm.FormShow(Sender: TObject);
begin
 if (Tag <> 0) and (TObject(Tag) is TPictureProp) then
  FPictureProp := TPictureProp(Tag);
 CheckTools;
 if Assigned(FPictureProp) then begin
  sedCols.Value := FPictureProp.Columns;
  sedRows.Value := FPictureProp.Rows;
  chMask.Checked := FPictureProp.Masked;
  cceMaskColor.ColorValue := FPictureProp.MaskColor;
  fedLinked.Text := FPictureProp.LinkName;
  chLinked.Checked := FPictureProp.LinkName <> '';
  if IsLinked
   then UpdateLink
   else FPicture.Graphic := FPictureProp.Graphic;
 end;
end;

procedure TPicturePropForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ModalResult = mrOk then begin
  if Assigned(FPictureProp) then begin
   if IsLinked
    then FPictureProp.LinkName := fedLinked.Text
    else FPictureProp.Graphic := FPicture.Graphic;
   FPictureProp.Columns := Trunc(sedCols.Value);
   FPictureProp.Rows := Trunc(sedRows.Value);
   FPictureProp.Masked := chMask.Checked;
   FPictureProp.MaskColor := cceMaskColor.ColorValue;
  end;
  ModalResult := mrOk;
 end;
 Action := caFree;
end;

procedure TPicturePropForm.CheckTools;
begin
 fedLinked.Enabled := IsLinked;
 bbLoad.Enabled := not IsLinked;
 bbSave.Enabled := not IsLinked;
end;

function TPicturePropForm.IsLinked: boolean;
begin
 Result := chLinked.Checked;
end;

procedure TPicturePropForm.bbLoadClick(Sender: TObject);
begin
 opd_Load.InitialDir:= FormTools.MyGetLocalDir + DIR_IMAGENS;
 opd_Load.FileName  := '';
 if not opd_Load.Execute then exit;
 FPicture.LoadFromFile(opd_Load.FileName);
 if Assigned(FPicture.Graphic) and (FPicture.Graphic is TBitmap) then
  cceMaskColor.ColorValue :=
   FPicture.Bitmap.Canvas.Pixels[0, FPicture.Bitmap.Height-1];
end;

procedure TPicturePropForm.UpdateLink;
var LastDir: string;
begin
 if fedLinked.Text = FLastLinkName then exit;
 FLastLinkName := fedLinked.Text;
 if Assigned(ResolvePictureLink) then
  ResolvePictureLink(FPictureProp, FLastLinkName, FPicture)
 else begin
  LastDir := GetCurrentDir;
  try
   SetCurrentDir(ExtractFilePath(ParamStr(0)));
   FPicture.LoadFromFile(ExpandFilename(FLastLinkName));
  finally
   SetCurrentDir(LastDir);
  end;
 end;
 if Assigned(FPicture.Graphic) and (FPicture.Graphic is TBitmap) then
   cceMaskColor.ColorValue :=
    FPicture.Bitmap.Canvas.Pixels[0, FPicture.Bitmap.Height-1];
end;

procedure TPicturePropForm.PictureChange(Sender: TObject);
var IsRaster: boolean;
    Dest: TRect;
    CX, CY: Double;
    Ofs: TPoint;
begin
 if FChanging then exit;
 FChanging := true;
 try
  IsRaster := Assigned(FPicture.Graphic) and (FPicture.Graphic is TBitmap);
  sedCols.Enabled := IsRaster;
  sedRows.Enabled := IsRaster;
  if not IsRaster then begin
   //chMask.Checked := False;
   sedCols.Value := 1;
   sedRows.Value := 1;
  end;
  chMask.Enabled := Assigned(FPicture.Graphic); //IsRaster;
  if IsRaster
   then chMask.Caption := 'Mascarar Cor' //'Mask color'
   else chMask.Caption := 'Transparent'; //'Transparent';
  cceMaskColor.Enabled := IsRaster; //chMask.Checked;
  if Assigned(FPicture.Graphic) then begin
   if (FPicture.Graphic.Width <= imgPreview.Width) and
      (FPicture.Graphic.Height <= imgPreview.Height) then begin
    imgPreview.Center := true;
    imgPreview.Picture.Graphic := FPicture.Graphic;
   end else begin
    imgPreview.Picture.Graphic := Nil;
    Dest := Rect(0, 0, FPicture.Graphic.Width, FPicture.Graphic.Height);
    if Dest.Right > imgPreview.Width
     then CX := imgPreview.Width / Dest.Right
     else CX := 1;
    if Dest.Bottom > imgPreview.Height
     then CY := imgPreview.Height / Dest.Bottom
     else CY := 1;
    if CY < CX then CX := CY;
    Dest.Right  := Round(Dest.Right  * CX);
    Dest.Bottom := Round(Dest.Bottom * CX);
    Ofs.X := (imgPreview.Width - Dest.Right) div 2;
    Ofs.Y := (imgPreview.Height - Dest.Bottom) div 2;
    OffsetRect(Dest, Ofs.X, Ofs.Y);
    imgPreview.Canvas.StretchDraw(Dest, FPicture.Graphic);
   end;
  end else
   imgPreview.Picture.Graphic := Nil;
 finally
  FChanging := False;
 end;
end;

procedure TPicturePropForm.bbClearClick(Sender: TObject);
begin
 if IsLinked then fedLinked.Text := '';
 FPicture.Graphic := Nil;
end;

procedure TPicturePropForm.chMaskClick(Sender: TObject);
begin
 cceMaskColor.Enabled := chMask.Checked;
end;

procedure TPicturePropForm.chLinkedClick(Sender: TObject);
begin
 CheckTools;
 if fedLinked.Enabled
  then fedLinked.Text := FPictureProp.LinkName
  else fedLinked.Text := '';
end;

procedure TPicturePropForm.fedLinkedAfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
 if Action then begin
  FIsDialogChange := true;
  Name := ExtractRelativePath( ExtractFilePath(ParamStr(0)), Name );
 end;
end;

procedure TPicturePropForm.fedLinkedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then UpdateLink;
end;

procedure TPicturePropForm.fedLinkedExit(Sender: TObject);
begin
 UpdateLink;
end;

procedure TPicturePropForm.fedLinkedChange(Sender: TObject);
var s: string;
begin
 if not FIsDialogChange then exit;
 s := fedLinked.Text;
 if s[1] = '"' then begin
  s := copy(s, 2, Length(s)-2);
  fedLinked.Text := s;
  exit;
 end;
 FIsDialogChange := false;
 UpdateLink;
end;

initialization
  RegisterDefaultPropEditForm(TPictureProp, TPicturePropForm);

end.
