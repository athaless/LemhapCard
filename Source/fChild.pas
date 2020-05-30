unit fChild;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RxGIF, FlexBase;

type
  TFlexChildForm = class(TForm)
    Flex: TFlexPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActiveChange(Sender: TObject);
    procedure FlexPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FFilename: string;
    FOnActiveChange: TNotifyEvent;
    procedure SetFilename(const Value: string);
  public
    { Public declarations }
    destructor Destroy; override;
    property  Filename: string read FFileName write SetFilename;
    property  OnActiveChange: TNotifyEvent read FOnActiveChange
      write FOnActiveChange;
  end;

var
  FlexChildForm: TFlexChildForm;

implementation

uses FlexUtils, FlexControls, Main;

{$R *.DFM}

// TFlexChildForm /////////////////////////////////////////////////////////////

destructor TFlexChildForm.Destroy;
begin
 inherited;
 FormActiveChange(Self);
end;

procedure TFlexChildForm.FormCreate(Sender: TObject);
begin
 Flex.InDesign := true;
end;

procedure TFlexChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFlexChildForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var ModalRes: integer;
begin
 CanClose := true;
 if not Flex.Modified then exit;
 ModalRes := MessageDlg('Salvar "'+ExtractFileName(FFilename)+'"?',
   mtWarning, [mbYes, mbNo, mbCancel], 0);
 case ModalRes of
  mrYes:
    if not EditMainForm.SaveChanges(Self) then
     CanClose := false;
  mrNo:
    ;
  mrCancel:
    CanClose := false;
 end;
end;

procedure TFlexChildForm.FormActiveChange(Sender: TObject);
begin
 if Assigned(FOnActiveChange) then FOnActiveChange(Self);
end;

procedure TFlexChildForm.FlexPanel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if Sender = Flex then begin
  Flex.SetFocus;
  if not Flex.Focused then Windows.SetFocus(Flex.Handle);
 end;
end;

procedure TFlexChildForm.SetFilename(const Value: string);
begin
 if Value = FFilename then exit;
 FFileName := Value;
 Caption := ExtractFileName(FFilename);
end;

procedure TFlexChildForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_MENU) and (Flex.ToolMode = ftmSelect) and
    not Assigned(Flex.CreatingControlClass) then
  Flex.ToolMode := ftmPan;
end;

procedure TFlexChildForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_MENU) and
   ((Flex.ToolMode = ftmPan) or (Flex.ToolMode = ftmPanning)) then
  Flex.ToolMode := ftmSelect;
end;

end.
