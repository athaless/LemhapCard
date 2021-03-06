unit fOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, RxCombos, RXSpin, 
  FlexBase, FlexUtils, ColorComboEdit;

type
  TOptionEditPage = ( opDocument, opGrid, opDuplicates );
  TOptionEditPages = set of TOptionEditPage;

const
  AllOptions = [opDocument, opGrid];

type
  PEditOptions = ^TEditOptions;
  TEditOptions = record
   // Document props
   DocWidth: integer;
   DocHeight: integer;
   // Grid props
   ShowGrid: boolean;
   SnapToGrid: boolean;
   ShowPixGrid: boolean;
   GridStyle: TFlexGridStyle;
   GridColor: TColor;
   GridPixColor: TColor;
   GridHSize: integer;
   GridVSize: integer;
   // Duplicates
   ShiftX: integer;
   ShiftY: integer;
   DupRandom: boolean;
  end;

  TfmOptions = class(TForm)
    bbOk: TBitBtn;
    bbClose: TBitBtn;
    chShowGrid: TCheckBox;
    chSnapToGrid: TCheckBox;
    Label7: TLabel;
    cceGridColor: TColorComboEdit;
    gbGridSize: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    sedGridHSize: TRxSpinEdit;
    sedGridVSize: TRxSpinEdit;
    Bevel1: TBevel;
    rbGridAsLines: TRadioButton;
    rbGridAsDots: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ctrlDocChange(Sender: TObject);
    procedure ctrlGridClick(Sender: TObject);
    procedure ctrlGridChange(Sender: TObject);
    procedure ctrlDupChange(Sender: TObject);
    procedure ctrlDupClick(Sender: TObject);
  private
    { Private declarations }
    FOptions: TEditOptions;
    FEdited: TOptionEditPages;
    procedure ReadFromOptions;
    procedure WriteToOptions;
    procedure SetOptions(const Value: TEditOptions);
  public
    { Public declarations }
    property  Edited: TOptionEditPages read FEdited;
    property  EditOptions: TEditOptions read FOptions write SetOptions;
  end;

var
  fmOptions: TfmOptions;
  EditOptions: TEditOptions;

implementation

{$R *.DFM}

procedure InitDefaultOptions;
begin
 with EditOptions do begin
  // Document props
  DocWidth := 640 * PixelScaleFactor;
  DocHeight := 480 * PixelScaleFactor;
  // Grid props
  ShowGrid := False;
  SnapToGrid := False;
  ShowPixGrid := False;
  GridStyle := gsDots;
  GridColor := clGray;
  GridPixColor := clSilver;
  GridHSize := 10 * PixelScaleFactor;
  GridVSize := 10 * PixelScaleFactor;
  // Duplicates
  ShiftX := 10 * PixelScaleFactor;
  ShiftY := 10 * PixelScaleFactor;
  DupRandom := False;
 end;
end;

// TfmOptions /////////////////////////////////////////////////////////////////

procedure TfmOptions.FormCreate(Sender: TObject);
begin
 //pgOptions.ActivePage := tsDocProps;
end;

procedure TfmOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 WriteToOptions;
 Action := caHide;
end;

procedure TfmOptions.SetOptions(const Value: TEditOptions);
begin
 FOptions := Value;
 ReadFromOptions;
end;

procedure TfmOptions.ReadFromOptions;
begin
 with FOptions do begin
  //sedWidth.Value := DocWidth / PixelScaleFactor;
  //sedHeight.Value := DocHeight / PixelScaleFactor;
  chShowGrid.Checked := ShowGrid;
  chSnapToGrid.Checked := SnapToGrid;
  //chShowPixGrid.Checked := ShowPixGrid;
  case GridStyle of
   gsLines : rbGridAsLines.Checked := true;
   gsDots  : rbGridAsDots.Checked := true;
  end;
  sedGridHSize.Value := GridHSize / PixelScaleFactor;
  sedGridVSize.Value := GridVSize / PixelScaleFactor;
  cceGridColor.ColorValue := GridColor;
  //sedDupShiftX.Value := ShiftX / PixelScaleFactor;
  //sedDupShiftY.Value := ShiftY / PixelScaleFactor;
  //chDupRandom.Checked := DupRandom;
 end;
 FEdited := [];
end;

procedure TfmOptions.WriteToOptions;
begin
 // Documents
 //FOptions.DocWidth := Round(sedWidth.Value * PixelScaleFactor);
 //FOptions.DocHeight := Round(sedHeight.Value * PixelScaleFactor);
 // Grid
 FOptions.ShowGrid := chShowGrid.Checked;
 FOptions.SnapToGrid := chSnapToGrid.Checked;
 //FOptions.ShowPixGrid := chShowPixGrid.Checked;
 if rbGridAsLines.Checked then
  FOptions.GridStyle := gsLines
 else
 if rbGridAsDots.Checked then
  FOptions.GridStyle := gsDots;
 FOptions.GridHSize := Round(sedGridHSize.Value * PixelScaleFactor);
 FOptions.GridVSize := Round(sedGridVSize.Value * PixelScaleFactor);
 FOptions.GridColor := cceGridColor.ColorValue;
 // Duplicates
 //FOptions.ShiftX := Round(sedDupShiftX.Value * PixelScaleFactor);
 //FOptions.ShiftY := Round(sedDupShiftY.Value * PixelScaleFactor);
 //FOptions.DupRandom := chDupRandom.Checked;
end;

procedure TfmOptions.ctrlDocChange(Sender: TObject);
begin
 Include(FEdited, opDocument);
end;

procedure TfmOptions.ctrlGridClick(Sender: TObject);
begin
 Include(FEdited, opGrid);
end;

procedure TfmOptions.ctrlGridChange(Sender: TObject);
begin
 Include(FEdited, opGrid);
end;

procedure TfmOptions.ctrlDupChange(Sender: TObject);
begin
 Include(FEdited, opDuplicates);
end;

procedure TfmOptions.ctrlDupClick(Sender: TObject);
begin
 Include(FEdited, opDuplicates);
end;

initialization
  InitDefaultOptions;

end.
