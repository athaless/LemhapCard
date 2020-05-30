unit fLibItemProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, FlexLibs, FlexUtils;

type
  TfmLibItemProps = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pbItemView: TPaintBox;
    bbOk: TBitBtn;
    Label1: TLabel;
    edTitle: TEdit;
    Label2: TLabel;
    edDesc: TEdit;
    bbCancel: TBitBtn;
    procedure pbItemViewPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LibItem: TFlexLibItem;
  end;

var
  fmLibItemProps: TfmLibItemProps;

implementation

{$R *.DFM}

procedure TfmLibItemProps.pbItemViewPaint(Sender: TObject);
var CoeffX, CoeffY: double;
    Scale: integer;
    Origin: TPoint;
begin
 with pbItemView, Canvas do begin
  Brush.Color := clWindow;
  Brush.Style := bsSolid;
  FillRect(Rect(0, 0, Width, Height));
  if not Assigned(LibItem) then exit;
  CoeffX := ((Width - 20)* PixelScaleFactor) / LibItem.Width;
  CoeffY := ((Height -20)* PixelScaleFactor) / LibItem.Height;
  if CoeffX < CoeffY
   then Scale := Round(100*CoeffX)
   else Scale := Round(100*CoeffY);
  Origin.X := -(Width - ScaleValue(LibItem.Width, Scale)) div 2;
  Origin.Y := -(Height - ScaleValue(LibItem.Height, Scale)) div 2;
  LibItem.Owner.PaintTo(Canvas, Rect(0, 0, Width, Height),
    Origin, Scale, LibItem, True, True, False, False);
 end;
end;

end.
