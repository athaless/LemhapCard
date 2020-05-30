unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ToolWin, Menus, ImgList, ActnList, ExtCtrls, RXSplit,
  StdActns, Buttons, TB2ToolWindow, TB2Item, TB2Dock, TB2Toolbar, ClipBrd,
  FlexBase, FlexProps, FlexUtils, FlexControls, fChild, fOptions, //Printers,
  Jpeg, FlexPath;

const
  RAZAO_CARTAO   = 1.7272;
  RAZAO_ENVELOPE = 2.0614;
  RAZAO_PAPEL    = 0.7070;

type
  TEditMainForm = class(TForm)
    MainMenu1: TMainMenu;
    imgToolIcons: TImageList;
    sbrMain: TStatusBar;
    imgStdIcons: TImageList;
    miFile: TMenuItem;
    miNew: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    alMain: TActionList;
    acFileNew: TAction;
    acFileExit: TAction;
    acFileOpen: TAction;
    acFileSave: TAction;
    acEditCut: TAction;
    acEditCopy: TAction;
    acEditPaste: TAction;
    acArrangeForwardOne: TAction;
    acArrangeBackOne: TAction;
    acArrangeToFront: TAction;
    acArrangeToBack: TAction;
    acArrangeGroup: TAction;
    acArrangeUngroup: TAction;
    acLayerNew: TAction;
    acLayerDelete: TAction;
    acEditDelete: TAction;
    acSchemeNew: TAction;
    acSchemeDelete: TAction;
    miArrange: TMenuItem;
    BackOne1: TMenuItem;
    ForwardOne1: TMenuItem;
    acArrangeToBack1: TMenuItem;
    acArrangeToFront1: TMenuItem;
    N2: TMenuItem;
    acArrangeGroup1: TMenuItem;
    acArrangeUngroup1: TMenuItem;
    Mnemo1: TMenuItem;
    Newscheme1: TMenuItem;
    Deletescheme1: TMenuItem;
    N3: TMenuItem;
    Newlayer1: TMenuItem;
    Deletelayer1: TMenuItem;
    miEdit: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    acWindowArrange: TWindowArrange;
    acWindowCascade: TWindowCascade;
    acWindowClose: TWindowClose;
    acWindowMinimizeAll: TWindowMinimizeAll;
    acWindowTileHorizontal: TWindowTileHorizontal;
    acWindowTileVertical: TWindowTileVertical;
    miWindow: TMenuItem;
    Cascade1: TMenuItem;
    TileHorizontally1: TMenuItem;
    TileVertically1: TMenuItem;
    MinimizeAll1: TMenuItem;
    BackOne2: TMenuItem;
    Close1: TMenuItem;
    acFileProperties: TAction;
    Properties1: TMenuItem;
    acDockerInspector: TAction;
    acDockerLibrary: TAction;
    pmControl: TPopupMenu;
    BackOne3: TMenuItem;
    ForwardOne2: TMenuItem;
    Toback1: TMenuItem;
    Tofront1: TMenuItem;
    N5: TMenuItem;
    Group1: TMenuItem;
    Ungroup1: TMenuItem;
    N6: TMenuItem;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    Delete2: TMenuItem;
    tdDockUp: TTBDock;
    tdDockLeft: TTBDock;
    tdDockRight: TTBDock;
    tbtStdTools: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    tbTools: TTBToolbar;
    tbtPictureTool: TTBItem;
    tbtTextTool: TTBItem;
    tbtEllipseTool: TTBItem;
    tbtRectTool: TTBItem;
    tbtPolyLineTool: TTBItem;
    tbtArrowTool: TTBItem;
    tbtZoomTool: TTBItem;
    tbtLayoutTools: TTBToolbar;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    tbtAlignTools: TTBToolbar;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    acAlignLeft: TAction;
    acAlignHCenter: TAction;
    acAlignRight: TAction;
    acAlignTop: TAction;
    acAlignVCenter: TAction;
    acAlignBottom: TAction;
    acAlignCenter: TAction;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem14: TTBItem;
    od_Main: TOpenDialog;
    sd_Main: TSaveDialog;
    acFilePreview: TAction;
    Prview1: TMenuItem;
    TBItem16: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    N7: TMenuItem;
    miAddToLibrary: TMenuItem;
    acViewOptions: TAction;
    miView: TMenuItem;
    Options1: TMenuItem;
    acLibItemAdd: TAction;
    acFilePrint: TAction;
    TBItem15: TTBItem;
    N8: TMenuItem;
    Print1: TMenuItem;
    pd_Main: TPrintDialog;
    acZoomIn: TAction;
    acZoomOut: TAction;
    acEditDuplicate: TAction;
    TBItem29: TTBItem;
    N4: TMenuItem;
    Duplicate1: TMenuItem;
    Duplicate2: TMenuItem;
    tbtZoomTools: TTBToolbar;
    TBControlItem1: TTBControlItem;
    cbZoom: TComboBox;
    TBItem17: TTBItem;
    TBItem28: TTBItem;
    TBItem30: TTBItem;
    acZoomActual: TAction;
    tdDockBottom: TTBDock;
    miToolBarsDelimiter: TMenuItem;
    Inspector1: TMenuItem;
    Library1: TMenuItem;
    acDockerUserData: TAction;
    Userdata1: TMenuItem;
    TBSeparatorItem2: TTBSeparatorItem;
    acHelpAbout: TAction;
    miHelp: TMenuItem;
    About1: TMenuItem;
    acTranslateRotateCW: TAction;
    acTranslateRotateCCW: TAction;
    acTranslateFlipHorz: TAction;
    acTranslateFlipVertical: TAction;
    tbtTranslateTools: TTBToolbar;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    N10: TMenuItem;
    acFileExport: TAction;
    N9: TMenuItem;
    Export1: TMenuItem;
    sd_Export: TSaveDialog;
    acDockerLayers: TAction;
    Layermanager1: TMenuItem;
    acGridShow: TAction;
    acGridPixelShow: TAction;
    acGridSnap: TAction;
    tbtGridTools: TTBToolbar;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    acLayerToBack: TAction;
    acLayerToFront: TAction;
    tbtPanTool: TTBItem;
    acDebugPoints: TAction;
    tbtShapeTool: TTBItem;
    tbtCurveEditTools: TTBToolbar;
    acCurveJoin: TAction;
    acCurveBreak: TAction;
    acCurveClose: TAction;
    acCurveToLine: TAction;
    acCurveToCurve: TAction;
    acCurveBreakApart: TAction;
    acCurveCombine: TAction;
    TBItem39: TTBItem;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    TBItem42: TTBItem;
    TBItem43: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem44: TTBItem;
    TBItem45: TTBItem;
    acCurveFlatten: TAction;
    TBItem46: TTBItem;
    acCurveConvertToCurve: TAction;
    TBItem47: TTBItem;
    acHelp: TAction;
    acFileNewFrom: TAction;
    TBItem48: TTBItem;
    NovoEnvelope1: TMenuItem;
    N11: TMenuItem;
    TBSeparatorItem10: TTBSeparatorItem;
    acEnviarLemhap: TAction;
    EnviarparaLemhap1: TMenuItem;
    Help1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tbtToolClick(Sender: TObject);
    procedure cbActiveLayerChange(Sender: TObject);
    procedure acFileNewExecute(Sender: TObject);
    procedure acLayerNewExecute(Sender: TObject);
    procedure acLayerDeleteExecute(Sender: TObject);
    procedure acFileExitExecute(Sender: TObject);
    procedure acFileOpenExecute(Sender: TObject);
    procedure acSchemeDeleteExecute(Sender: TObject);
    procedure acSchemeNewExecute(Sender: TObject);
    procedure acFilePropertiesExecute(Sender: TObject);
    procedure acArrangeForwardOneExecute(Sender: TObject);
    procedure acArrangeBackOneExecute(Sender: TObject);
    procedure acArrangeToFrontExecute(Sender: TObject);
    procedure acArrangeToBackExecute(Sender: TObject);
    procedure acArrangeGroupExecute(Sender: TObject);
    procedure acArrangeUngroupExecute(Sender: TObject);
    procedure acEditDeleteExecute(Sender: TObject);
    procedure acDockerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acEditCopyExecute(Sender: TObject);
    procedure acEditPasteExecute(Sender: TObject);
    procedure acEditCutExecute(Sender: TObject);
    procedure acEditPasteUpdate(Sender: TObject);
    procedure acAlignExecute(Sender: TObject);
    procedure acFilePreviewExecute(Sender: TObject);
    procedure acLibItemAddExecute(Sender: TObject);
    procedure acViewOptionsExecute(Sender: TObject);
    procedure acFilePrintExecute(Sender: TObject);
    procedure acZoomInExecute(Sender: TObject);
    procedure acZoomOutExecute(Sender: TObject);
    procedure cbZoomExit(Sender: TObject);
    procedure cbZoomClick(Sender: TObject);
    procedure cbZoomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acEditDuplicateExecute(Sender: TObject);
    procedure acZoomActualExecute(Sender: TObject);
    procedure sbrMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure acHelpAboutExecute(Sender: TObject);
    procedure acFileSaveExecute(Sender: TObject);
    procedure acTranslateRotateCWExecute(Sender: TObject);
    procedure acTranslateRotateCCWExecute(Sender: TObject);
    procedure acTranslateFlipHorzExecute(Sender: TObject);
    procedure acTranslateFlipVerticalExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbtStdToolsClose(Sender: TObject);
    procedure acFileExportExecute(Sender: TObject);
    procedure acGridShowExecute(Sender: TObject);
    procedure acGridPixelShowExecute(Sender: TObject);
    procedure acGridSnapExecute(Sender: TObject);
    procedure acLayerToFrontExecute(Sender: TObject);
    procedure acLayerToBackExecute(Sender: TObject);
    procedure acDebugPointsExecute(Sender: TObject);
    procedure acCurveJoinExecute(Sender: TObject);
    procedure acCurveBreakExecute(Sender: TObject);
    procedure acCurveCloseExecute(Sender: TObject);
    procedure acCurveToLineExecute(Sender: TObject);
    procedure acCurveToCurveExecute(Sender: TObject);
    procedure acCurveBreakApartExecute(Sender: TObject);
    procedure acCurveCombineExecute(Sender: TObject);
    procedure acCurveFlattenExecute(Sender: TObject);
    procedure acCurveConvertToCurveExecute(Sender: TObject);
    procedure acHelpExecute(Sender: TObject);
    procedure acFileNewFromExecute(Sender: TObject);
    procedure acEnviarLemhapExecute(Sender: TObject);
  private
    { Private declarations }
    FIniting: boolean;
    FIsFileLoading: boolean;
    FInspDataNeedUpdate: boolean;
    FInspPropsNeedUpdate: boolean;
    FFilerProgress: integer;
    FToolbarItems: TList;
    procedure RegisterExternalControls;
    function  GetToolScale: integer;
    procedure SetCurrentOptions(Flex: TFlexPanel;
      const Edited: TOptionEditPages = AllOptions);
    function  CreateToolWindow(ToolForm: TCustomForm;
      DockTo: TTBDock): TTBToolWindow;
    procedure ToolbarItemClick(Sender: TObject);
    procedure ToolWindowClose(Sender: TObject);
    procedure ToolWinNeedClose(Sender: TObject);
    procedure ToolWinPopupChange(Sender: TObject);
    procedure ControlPropChanged(Sender: TObject; Prop: TCustomProp);
    procedure CheckTools;
    procedure CheckToolbars;
    procedure CheckToolButtons(Sender: TObject);
    procedure CheckUpdates(Flex: TFlexPanel);
    procedure ChildChange(Sender: TObject);
    procedure ActiveLibChange(Sender: TObject);
    function  CreateDocument(const DocName: string): TFlexChildForm;
    function  GetActiveFlex: TFlexPanel;
    procedure FlexEndSelUpdate(Sender: TObject);
    procedure UpdateToolWins(Flex: TFlexPanel);
    procedure UpdateLayers(Flex: TFlexPanel);
    procedure UpdateSchemes(Flex: TFlexPanel);
    procedure UpdateAllOptions(const Edited: TOptionEditPages = AllOptions);
    procedure FlexProgress(Sender: TObject; Progress: integer;
      Process: TFlexFilerProcess);
    function  GetInFilerProcess: boolean;
    procedure BeginFilerProcess;
    procedure EndFilerProcess;

    procedure FileOpen(StrFile, StrCaption: String);
  public
    { Public declarations }
    procedure ControlNotify(Sender: TObject; Control: TFlexControl;
      Notify: TFlexNotify);
    function  SaveChanges(ChildForm: TFlexChildForm): boolean;
    property  ActiveFlex: TFlexPanel read GetActiveFlex;
    property  InFilerProcess: boolean read GetInFilerProcess;

    procedure FileOpenFromTemplate(StrTemplate: String);
  end;

var
  EditMainForm: TEditMainForm;

implementation

uses ToolMngr, Consts, fInspector, fLibrary, fPreview, fDocProps, fUserData,
  fLayers, FTools, FNovo2, fAboutPrg{, fPointsDbg};

{$R *.DFM}

const
  SDeleteLayer  = 'Do you really want to delete layer %s?';
  SDeleteScheme = 'Do you really want to delete scheme %s?';

procedure TEditMainForm.FormCreate(Sender: TObject);
var List: TStringList;
    i, Index: integer;
    Item: TMenuItem;
begin
 FIniting := true;
 LoadFlexCursors;
 RegisterExternalControls;
 // Insert all toolbars to main menu
 FToolbarItems := TList.Create;
 List := TStringList.Create;
 try
  // Collect all toolbars
  for i:=0 to ComponentCount-1 do
   if Components[i] is TTBToolbar then
    List.AddObject(TTBToolbar(Components[i]).Caption, Components[i]);
  if List.Count > 0 then begin
   // Sort by captions
   List.Sort;
   // Place to main menu
   Index := miView.IndexOf(miToolBarsDelimiter);
   if Index < 0 then Index := 0;
   for i:=List.Count-1 downto 0 do begin
    Item := TMenuItem.Create(miView);
    Item.OnClick := ToolbarItemClick;
    Item.Caption := List[i];
    Item.Tag := integer(List.Objects[i]);
    miView.Insert(Index, Item);
    FToolbarItems.Add(Item);
   end;
  end else
   // No toolbars: Hide delimiter in main menu
   miToolBarsDelimiter.Visible := false;
 finally
  List.Free;
 end;
 CheckToolbars;
end;

procedure TEditMainForm.FormDestroy(Sender: TObject);
begin
 FToolbarItems.Free;
end;

procedure TEditMainForm.FormShow(Sender: TObject);
var {Tlw1,} Tlw2{, Tlw3}: TTBToolWindow;
begin
 if FIniting then begin
  {
  // Show Inspector
  Tlw1 := CreateToolWindow(fmLayers, tdDockRight);
  // Show layer manager
  Tlw2 := CreateToolWindow(fmInspector, Nil);
  // Arrange
  if Assigned(Tlw2) then Tlw2.CurrentDock := tdDockRight;
  if Assigned(Tlw1) then Tlw1.DockPos := Tlw1.DockPos + 190;
  }

  { Show Inspector } Tlw2 := CreateToolWindow(fmInspector, tdDockRight);
  //{ Show Tipos     } Tlw3 := CreateToolWindow(FormTipos  , Nil);
  // Arrange
  //if Assigned(Tlw3) then Tlw3.CurrentDock := tdDockRight;
  if Assigned(Tlw2) then Tlw2.DockPos     := Tlw2.DockPos + 190;

  // Init
  fmLibrary.OnLibChange := ActiveLibChange;
  FIniting := False;
  CheckTools;
 end;
end;

function TEditMainForm.CreateDocument(const DocName: string): TFlexChildForm;
begin
 Result := TFlexChildForm.Create(Application);
 with Result do begin
  Flex.InDesign := true;
  Flex.OnNotify := ControlNotify;
  Flex.OnPropChanged := ControlPropChanged;
  Flex.OnEndSelectionUpdate := FlexEndSelUpdate;
  Flex.OnProgress := FlexProgress;
  Flex.OnToolMode := CheckToolButtons;
  Flex.PopupMenu := pmControl;
  WindowState:= wsNormal;
  OnActiveChange := ChildChange;
  if DocName = ''
  then begin
         Filename := 'Documento' + IntToStr(Self.MDIChildCount+1);
         Flex.Modified := False;
         SetCurrentOptions(Flex);
         FormStyle := fsMDIChild;

         acFileProperties.OnExecute(Self);
       end
  else begin
         Caption := DocName;
       end;
  ChildChange(Result);
 end;
end;

procedure TEditMainForm.RegisterExternalControls;
var i: integer;
    B: TBitmap;
    TBItem: TTBItem;
    Hint: string;
begin
 if Length(RegisteredFlexControls) = 0 then exit;
 B := TBitmap.Create;
 try
  B.Width := imgToolIcons.Width;
  B.Height := imgToolIcons.Height;
  for i:=0 to High(RegisteredFlexControls) do begin
   FillRect(B.Canvas.Handle, Rect(0, 0, B.Width, B.Height),
     GetStockObject(WHITE_BRUSH) );
   Hint := '';
   if not RegisteredFlexControls[i].GetToolInfo(B, Hint) then continue;
   tbTools.Images.AddMasked(B, B.TransparentColor);
   TBItem := TTBItem.Create(Self);
   TBItem.ImageIndex := tbTools.Images.Count-1;
   TBItem.GroupIndex := 1;
   TBItem.Hint := Hint;
   TBItem.Tag := integer(RegisteredFlexControls[i]);
   TBItem.OnClick := tbtToolClick;
   tbTools.Items.Add(TBItem);
  end;
 finally
  B.Free;
 end;
end;

procedure TEditMainForm.acFileNewExecute(Sender: TObject);
begin
  CreateDocument('');
end;

procedure TEditMainForm.acFileNewFromExecute(Sender: TObject);
begin
  FormNovo2.ShowModal;
end;

function TEditMainForm.GetActiveFlex: TFlexPanel;
begin
 if Assigned(ActiveMDIChild) and (ActiveMDIChild is TFlexChildForm)
  then Result := TFlexChildForm(ActiveMDIChild).Flex
  else Result := Nil; 
end;

procedure TEditMainForm.ChildChange(Sender: TObject);
var Flex: TFlexPanel;
begin
 if Assigned(ActiveMDIChild)
  then Flex := TFlexChildForm(ActiveMDIChild).Flex
  else Flex := Nil;
 if Assigned(Flex) and (csDestroying in Flex.ComponentState) then Flex := Nil;
 UpdateToolWins(Flex);
 UpdateLayers(Flex);
 UpdateSchemes(Flex);

 //Linha abaixo já estava comentada - By Clv 28/09/2003
 //SetCurrentOptions(Flex);
 CheckTools;
end;

procedure TEditMainForm.UpdateToolWins(Flex: TFlexPanel);
begin
 fmInspector.ActiveFlex := Flex;
 fmLibrary.ActiveFlex := Flex;
 fmUserData.ActiveFlex := Flex;
 fmLayers.ActiveFlex := Flex;
end;

procedure TEditMainForm.ControlPropChanged(Sender: TObject; Prop: TCustomProp);
begin
 if FIsFileLoading then exit;
 if Sender = fmInspector.Control then fmInspector.UpdateProps(Prop);
 if (Sender = fmUserData.SelControl) and Assigned(Prop) and
    (Prop = TFlexControl(Sender).UserData) then fmUserData.UpdateData;
 if Assigned(Sender) and (Sender is TFlexLayer) and Assigned(fmLayers) then
  fmLayers.UpdateData(TFlexLayer(Sender));
 CheckTools;
end;

procedure TEditMainForm.ActiveLibChange(Sender: TObject);
begin
 CheckTools;
end;

procedure TEditMainForm.ToolbarItemClick(Sender: TObject);
var i: integer;
    Item: TMenuItem;
    ToolBar: TTBToolbar;
begin
 for i:=0 to FToolbarItems.Count-1 do begin
  Item := TMenuItem(FToolbarItems[i]);
  if Item <> Sender then continue;
  ToolBar := TTBToolbar(Item.Tag);
  ToolBar.Visible := not ToolBar.Visible;
  break;
 end;
 CheckToolbars;
end;

procedure TEditMainForm.tbtStdToolsClose(Sender: TObject);
begin
 CheckToolbars;
end;

procedure TEditMainForm.CheckToolbars;
var i: integer;
    Item: TMenuItem;
    ToolBar: TTBToolbar;
begin
 for i:=0 to FToolbarItems.Count-1 do begin
  Item := TMenuItem(FToolbarItems[i]);
  ToolBar := TTBToolbar(Item.Tag);
  Item.Checked := ToolBar.Visible;
 end;
end;

procedure TEditMainForm.CheckToolButtons(Sender: TObject);
begin
 if Sender <> ActiveFlex then exit;
 with TFlexPanel(Sender) do
 case ToolMode of
  ftmSelect:
    if not Assigned(CreatingControlClass) then tbtArrowTool.Click;
  ftmPan:
    tbtPanTool.Click;
 end;
end;

procedure TEditMainForm.CheckTools;
var Flex: TFlexPanel;
    IsDoc, IsSel, IsSelMany, IsModified: boolean;
    IsSelGroup, IsSelCurve, IsLib, IsChecked: boolean;
    IsSelAllCurves: boolean;
    IsLastLayer, IsFirstLayer: boolean;
    SelCount, i, FigCount: integer;
    CurveCaps: TPathEditFuncs;
begin
 Flex := ActiveFlex;
 // Flags
 if Assigned(Flex) then with Flex do begin
  IsDoc := True;
  SelCount := SelectedCount;
  IsSel := SelCount > 0;
  IsSelMany := SelCount > 1;
  IsSelGroup := (SelCount = 1) and (Selected[0] is TFlexGroup);
  IsSelCurve := (SelCount = 1) and (Selected[0].PointCount > 0);
  if IsSelCurve then begin
   CurveCaps := Flex.EditPointsCaps;
   FigCount := Length(Selected[0].PointsInfo.Figures);
  end else begin
   CurveCaps := [];
   FigCount := 0;
  end;
  IsSelAllCurves := true;
  for i:=0 to SelCount-1 do
   if Selected[i].PointCount = 0 then begin
    IsSelAllCurves := false;
    break;
   end;
  IsModified := Flex.Modified;
  IsLastLayer := Layers.IndexOf(ActiveLayer) = Layers.Count-1;
  IsFirstLayer := Layers.IndexOf(ActiveLayer) = 0;
  //acLayerDelete.Enabled := cbActiveLayer.Items.Count > 1;
  //acSchemeDelete.Enabled := cbActiveScheme.Items.Count > 1;
 end else begin
  IsDoc := False;
  IsSel := False;
  IsSelMany := False;
  IsSelGroup := False;
  IsSelAllCurves := False;
  IsSelCurve := False;
  CurveCaps := [];
  FigCount := 0;
  IsModified := False;
  IsLastLayer := False;
  IsFirstLayer := False;
  //cbActiveLayer.Clear;
  //cbActiveScheme.Clear;
  acLayerDelete.Enabled := False;
  acSchemeDelete.Enabled := False;
 end;
 IsLib := Assigned(fmLibrary) and Assigned(fmLibrary.ActiveLibrary);
 IsChecked := false;
 // Draw tools
 for i:=0 to tbTools.Items.Count-1 do with tbTools.Items[i] do begin
  Enabled := IsDoc;
  if not IsDoc then
   Checked := False
  else
  if Checked then
   IsChecked := true;
 end;
 if IsDoc and not IsChecked then tbtArrowTool.Checked := true;
 // Grid
 acGridShow.Checked := EditOptions.ShowGrid;
 acGridPixelShow.Checked := EditOptions.ShowPixGrid;
 acGridSnap.Checked := EditOptions.SnapToGrid;
 // Dockers
 acDockerInspector.Checked := Assigned(FindToolParentContainer(fmInspector));
 acDockerLibrary.Checked := Assigned(FindToolParentContainer(fmLibrary));
 acDockerUserData.Checked := Assigned(FindToolParentContainer(fmUserData));
 acDockerLayers.Checked := Assigned(FindToolParentContainer(fmLayers));
 // Edit
 acEditDelete.Enabled := IsSel;
 acEditCut.Enabled := IsSel;
 acEditCopy.Enabled := IsSel;
 acEditDuplicate.Enabled := IsSel;
 acLibItemAdd.Enabled := IsSel and IsLib;
 // Layout
 //cbActiveLayer.Enabled := IsDoc;
 //cbActiveScheme.Enabled := IsDoc;
 acLayerNew.Enabled := IsDoc;
 acSchemeNew.Enabled := IsDoc;
 acLayerToFront.Enabled := IsDoc and not IsLastLayer;
 acLayerToBack.Enabled := IsDoc and not IsFirstLayer;
 // File
 acFileProperties.Enabled := IsDoc;
 acFilePreview.Enabled := IsDoc and not Assigned(fmPreview);
 acFileSave.Enabled := IsDoc and IsModified;
 acFilePrint.Enabled := IsDoc;
 acFileExport.Enabled := IsDoc;
 // Arrange
 acArrangeForwardOne.Enabled := IsSel;
 acArrangeBackOne.Enabled := IsSel;
 acArrangeToFront.Enabled := IsSel;
 acArrangeToBack.Enabled := IsSel;
 acArrangeGroup.Enabled := IsSelMany;
 acArrangeUngroup.Enabled := IsSelGroup;
 // Translate
 acTranslateRotateCW.Enabled := IsSel;
 acTranslateRotateCCW.Enabled := IsSel;
 acTranslateFlipHorz.Enabled := IsSel;
 acTranslateFlipVertical.Enabled := IsSel;
 // Curve edit
 acCurveJoin.Enabled := pfJoin in CurveCaps;
 acCurveBreak.Enabled := pfBreak in CurveCaps;
 acCurveClose.Enabled := pfClose in CurveCaps;
 acCurveToLine.Enabled := pfToLine in CurveCaps;
 acCurveToCurve.Enabled := pfToCurve in CurveCaps;
 acCurveFlatten.Enabled := IsSelCurve and
   Flex.Selected[0].PointsInfo.IsCurve;
 acCurveBreakApart.Enabled := FigCount > 1;
 acCurveCombine.Enabled := IsSelMany and IsSelAllCurves;
 acCurveConvertToCurve.Enabled := IsSel;
 // Align
 acAlignLeft.Enabled := IsSelMany;
 acAlignHCenter.Enabled := IsSelMany;
 acAlignRight.Enabled := IsSelMany;
 acAlignTop.Enabled := IsSelMany;
 acAlignVCenter.Enabled := IsSelMany;
 acAlignBottom.Enabled := IsSelMany;
 acAlignCenter.Enabled := IsSelMany;
 // Zoom
 cbZoom.Enabled := IsDoc;
 if cbZoom.Enabled
  then cbZoom.Text := IntToStr(Flex.Scale)+'%'
  else cbZoom.Text := '';
 acZoomIn.Enabled := IsDoc and (Flex.Scale < MaxScale);
 acZoomOut.Enabled := IsDoc and (Flex.Scale > MinScale);
 acZoomActual.Enabled := IsDoc and (Flex.Scale <> 100);
end;

procedure TEditMainForm.tbtToolClick(Sender: TObject);
var i: integer;
begin
 if Sender is TTBCustomItem then
  TTBCustomItem(Sender).Checked := true;
 for i:=0 to MDIChildCount-1 do
  with (MDIChildren[i] as TFlexChildForm).Flex do
  if Sender = tbtZoomTool then begin
   EditPointControl := Nil;
   CreatingControlClass := Nil;
   ToolMode := ftmZoom;
  end else
  if Sender = tbtPanTool then begin
   //EditPointControl := Nil;
   CreatingControlClass := Nil;
   ToolMode := ftmPan;
  end else
  if Sender = tbtShapeTool then begin
   CreatingControlClass := Nil;
   //if SelectedCount = 1 then EditPointControl := Selected[0];
   ToolMode := ftmPointEdit;
  end else begin
   if Sender = tbtArrowTool then begin
    CreatingControlClass := Nil;
    EditPointControl := Nil;
   end else
   if Sender = tbtPolyLineTool then
    CreatingControlClass := TFlexCurve
   else
   if Sender = tbtRectTool then
    CreatingControlClass := TFlexBox
   else
   if Sender = tbtEllipseTool then
    CreatingControlClass := TFlexEllipse
   else
   if Sender = tbtTextTool then
    CreatingControlClass := TFlexText
   else
   if Sender = tbtPictureTool then
    CreatingControlClass := TFlexPicture
   else
   if TTBCustomItem(Sender).Tag <> 0 then
    CreatingControlClass := TFlexControlClass(TTBCustomItem(Sender).Tag);
   //if ToolMode in [ftmZoom, ftmZooming, ftmPan, ftmPanning] then
    ToolMode := ftmSelect;
  end;
end;

procedure TEditMainForm.SetCurrentOptions(Flex: TFlexPanel;
  const Edited: TOptionEditPages);
begin
 if not Assigned(Flex) then exit;
 with EditOptions do begin
 { if opDocument in Edited then begin
   Flex.DocWidth := DocWidth;
   Flex.DocHeight := DocHeight;
  end; }
  if opGrid in Edited then begin
   Flex.ShowGrid := ShowGrid;
   Flex.SnapToGrid := SnapToGrid;
   Flex.ShowPixGrid := ShowPixGrid;
   Flex.GridStyle := GridStyle;
   Flex.GridColor := GridColor;
   Flex.GridPixColor := GridPixColor;
   Flex.GridHorizSize := GridHSize;
   Flex.GridVertSize := GridVSize;
   Flex.Refresh;
  end;
 end;
end;

function TEditMainForm.CreateToolWindow(ToolForm: TCustomForm;
  DockTo: TTBDock): TTBToolWindow;
var Cont: TToolContainer;
begin
 if Assigned(DockTo) and (DockTo.ToolbarCount > 0) then begin
  Cont := FindChildContainer(DockTo.Toolbars[0]);
  if Assigned(Cont) then begin
   Cont.InsertTool(ToolForm);
   Cont.ActivePageForm := ToolForm;
   Result := Nil;
   exit;
  end;
 end;
 Result := TTBToolWindow.Create(Self);
 with Result do begin
  Caption := '';
  CloseButtonWhenDocked := True;
  Width := 206;
  Height := 300;
  FloatingPosition := Self.ClientToScreen(Point(50, 50));
  Stretch := True;
  MinClientWidth := 100;
  //BorderStyle := bsNone;
  DragHandleStyle := dhDouble;
  //OnDockChanged := TBToolWindow1DockChanged;
  OnClose := ToolWindowClose;
  if Assigned(DockTo) then begin
   CurrentDock := DockTo
  end else begin
   Parent := Self;
   Floating := True;
  end;
  with TToolContainer.Create(Result) do begin
   Parent := Result;
   Caption := '';
   BorderStyle := bsNone;
   Show;
   OnNeedClose := ToolWinNeedClose;
   OnPopupChange := ToolWinPopupChange;
   if Assigned(ToolForm) then InsertTool(ToolForm);
  end;
 end;
end;

procedure TEditMainForm.ToolWindowClose(Sender: TObject);
var Container: TToolContainer;
begin
 Container := FindChildContainer(TWinControl(Sender));
 if Assigned(Container) then Container.RemoveAll;
 Sender.Free;
end;

procedure TEditMainForm.ToolWinNeedClose(Sender: TObject);
var Control: TWinControl;
begin
 Control := TWinControl(Sender).Parent;
 if Control is TTBToolWindow then TTBToolWindow(Control).Hide;
end;

procedure TEditMainForm.ToolWinPopupChange(Sender: TObject);
begin
 if not (csDestroying in ComponentState) then CheckTools;
end;

procedure TEditMainForm.acLayerNewExecute(Sender: TObject);
var Layer: TFlexLayer;
begin
 if not Assigned(ActiveFlex) then exit;
 with ActiveFlex do begin
  Layer := Layers.New;
  ActiveLayer := Layer;
 end;
 fmInspector.Control := Layer;
end;

procedure TEditMainForm.acLayerDeleteExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 with ActiveFlex do
  if MessageDlg(Format(SDeleteLayer, [ActiveLayer.Name]),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Layers.Remove(ActiveLayer);
end;

procedure TEditMainForm.acSchemeNewExecute(Sender: TObject);
var Scheme: TFlexScheme;
begin
 if not Assigned(ActiveFlex) then exit;
 with ActiveFlex do begin
  Scheme := TFlexScheme.Create(Schemes.Owner, Schemes, Nil); //Schemes.New;
  ActiveScheme := Scheme;
 end;
 fmInspector.Control := Scheme;
end;

procedure TEditMainForm.acSchemeDeleteExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 with ActiveFlex do
  if MessageDlg(Format(SDeleteScheme, [ActiveScheme.Name]),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Schemes.Remove(ActiveScheme);
end;

procedure TEditMainForm.cbActiveLayerChange(Sender: TObject);
begin
end;

{
procedure TEditMainForm.cbActiveLayerChange(Sender: TObject);
begin
 if Assigned(ActiveFlex) then with ActiveFlex do begin
  ActiveLayer :=
    TFlexLayer(cbActiveLayer.Items.Objects[cbActiveLayer.ItemIndex]);
  UnselectAll;
  fmInspector.Control := ActiveLayer;
 end;
end;

procedure TEditMainForm.cbActiveSchemeChange(Sender: TObject);
begin
 if Assigned(ActiveFlex) then begin
  ActiveFlex.ActiveScheme :=
   TFlexScheme(cbActiveScheme.Items.Objects[cbActiveScheme.ItemIndex]);
  fmInspector.Control := ActiveFlex.ActiveScheme;
 end;
end;
}

function TEditMainForm.SaveChanges(ChildForm: TFlexChildForm): boolean;
begin
 sd_Main.InitialDir:= FormTools.MyGetLocalDir + DIR_DADOS;
 sd_Main.FileName := TFlexChildForm(ActiveMDIChild).Filename;
 Result := sd_Main.Execute;
 if not Result then exit;
 BeginFilerProcess;
 try
  Result := ChildForm.Flex.SaveToFile(sd_Main.Filename);
  ActiveMDIChild.Caption := ExtractFileName(sd_Main.Filename);
 finally
  EndFilerProcess;
 end;
 CheckTools;
end;

procedure TEditMainForm.acFileSaveExecute(Sender: TObject);
begin
 SaveChanges(TFlexChildForm(ActiveMDIChild));
end;

procedure TEditMainForm.acFileExportExecute(Sender: TObject);
var
  Flex: TFlexPanel;
  Ext: string;
  Graphic: TGraphic;
  MC: TMetafileCanvas;
  Bmp: TBitmap;
begin
 Flex := ActiveFlex;
 if not Assigned(Flex) then exit;
 if not sd_Export.Execute then exit;
 Ext := ExtractFileExt(sd_Export.FileName);
 if Ext = '' then Ext := '.bmp'; // Default extenstion
 if pos(UpperCase('*'+Ext), UpperCase(sd_Export.Filter)) = 0 then
  Ext := '.bmp';
  //raise EInvalidGraphic.CreateFmt(SUnknownExtension, [Ext]);
 Delete(Ext, 1, 1);
 Ext := LowerCase(Ext);
 // Define graphic class
 if (pos('jpg', Ext) = 1) or (pos('jpeg', Ext) = 1) then
  Graphic := TJpegImage.Create
 else
 if (pos('wmf', Ext) = 1) or (pos('emf', Ext) = 1) then
  Graphic := TMetafile.Create
 else
  Graphic := TBitmap.Create;
 try
  if Graphic.ClassType = TJpegImage then begin
   // Create bitmap for jpeg output
   Bmp := TBitmap.Create;
   try
    Bmp.Width := ScaleValue(Flex.DocWidth, 100);
    Bmp.Height := ScaleValue(Flex.DocHeight, 100);
    Flex.PaintTo(Bmp.Canvas, Rect(0, 0, Bmp.Width, Bmp.Height),
     Point(0, 0), 100, Flex.ActiveScheme, False, False, False, True);
    // Assign to jpeg
    Graphic.Assign(Bmp);
   finally
    Bmp.Free;
   end;
  end else begin
   Graphic.Width := ScaleValue(Flex.DocWidth, 100);
   Graphic.Height := ScaleValue(Flex.DocHeight, 100);
   if Graphic.ClassType = TBitmap then
    // Paint to bitmap canvas
    Flex.PaintTo(TBitmap(Graphic).Canvas, Rect(0, 0, Width, Height),
      Point(0, 0), 100, Flex.ActiveScheme, False, False, False, True)
   else begin
    // Paint to metafile canvas
    MC := TMetafileCanvas.Create(TMetafile(Graphic), 0);
    try
     Flex.PaintTo(MC,
       Rect(0, 0, ScaleValue(Flex.DocWidth, 100), ScaleValue(Flex.DocHeight, 100)),
       Point(0, 0), 100, Flex.ActiveScheme, False, False, False, True, True);
    finally
     MC.Free;
    end;
   end;
  end;
  Graphic.SaveToFile(sd_Export.FileName);
 finally
  Graphic.Free;
 end;
end;

procedure TEditMainForm.FileOpen(StrFile, StrCaption: String);
var Child: TFlexChildForm;
begin
 Child := CreateDocument(ExtractFilename(StrFile));
 try
  if not Assigned(Child) then exit;
  BeginFilerProcess;
  try
   FIsFileLoading := true;
   Child.Flex.LoadFromFile(StrFile);
   if (StrCaption = '')
     then Child.Filename := 'Documento' + IntToStr(Self.MDIChildCount+1);
   Child.FormStyle := fsMDIChild;
   // Update tools
   fmUserData.UpdateData;
   UpdateLayers(Child.Flex);
   UpdateSchemes(Child.Flex);
   fmLibrary.FlexSelectionChange;
   fmInspector.UpdateData;
   fmInspector.UpdateProps(Nil);
  finally
   FIsFileLoading := false;
   EndFilerProcess;
  end;
 except
  Child.Free;
  raise;
 end;
 CheckTools;
end;

procedure TEditMainForm.FileOpenFromTemplate(StrTemplate: String);
begin
  FileOpen(StrTemplate, '');
end;

procedure TEditMainForm.acFileOpenExecute(Sender: TObject);
begin
 od_Main.InitialDir:= FormTools.MyGetLocalDir;
 od_Main.FileName  := '';
 if not od_Main.Execute then exit;
 FileOpen(od_Main.Filename, ExtractFileName(od_Main.Filename));
end;

procedure TEditMainForm.acFilePrintExecute(Sender: TObject);
begin
 //if not Assigned(ActiveFlex) or not pd_Main.Execute then exit;
 //ActiveFlex.Print(Printer, True, pd_Main.PrintRange = prSelection);
end;

procedure TEditMainForm.acViewOptionsExecute(Sender: TObject);
var fmOptions: TfmOptions;
begin
 fmOptions := TfmOptions.Create(Application);
 try
  fmOptions.EditOptions := EditOptions;
  if fmOptions.ShowModal = mrOk then begin
   Move(fmOptions.EditOptions, EditOptions, SizeOf(EditOptions));
   UpdateAllOptions(fmOptions.Edited);
  end;
 finally
  fmOptions.Free;
 end;
end;

procedure TEditMainForm.acFilePropertiesExecute(Sender: TObject);
var Flex: TFlexPanel;
begin
 Flex := ActiveFlex;
 if not Assigned(Flex) then exit;
 fmDocProps := TfmDocProps.Create(Application);
 with fmDocProps do
 try
  Tag := integer(Flex);
  if ShowModal = mrOk then Flex.Refresh;
 finally
  fmDocProps.Free;
 end;
end;

procedure TEditMainForm.acDockerExecute(Sender: TObject);
var ToolForm: TCustomForm;
    Container: TToolContainer;
//  Tlw: TTBToolWindow;
begin
 if Sender = acDockerInspector then ToolForm := fmInspector else
 if Sender = acDockerLibrary   then ToolForm := fmLibrary else
 if Sender = acDockerUserData  then ToolForm := fmUserData else
 if Sender = acDockerLayers    then ToolForm := fmLayers else exit;
 //tlwInspector.Visible := not tlwInspector.Visible;
 Container := FindToolParentContainer(ToolForm);
 if not Assigned(Container)
  then {Tlw := }CreateToolWindow(ToolForm, tdDockRight)
  else Container.RemoveTool(ToolForm);
 CheckTools;
end;

procedure TEditMainForm.UpdateLayers(Flex: TFlexPanel);
//var StrList: TStringList;
//    i: integer;
begin
{
 if not Assigned(Flex) then exit;
 StrList := Nil;
 cbActiveLayer.Items.BeginUpdate;
 try
  StrList := TStringList.Create;
  for i:=0 to Flex.Layers.Count-1 do
   StrList.AddObject(Flex.Layers[i].Name, Flex.Layers[i]);
  StrList.Sort;
  cbActiveLayer.ItemIndex := -1;
  cbActiveLayer.Items.Assign(StrList);
  cbActiveLayer.ItemIndex := StrList.IndexOfObject(Flex.ActiveLayer);
  cbActiveLayer.Refresh;
 finally
  cbActiveLayer.Items.EndUpdate;
  StrList.Free;
 end;
 fmLayers.UpdateData;
 }
end;

procedure TEditMainForm.UpdateSchemes(Flex: TFlexPanel);
//var StrList: TStringList;
//    i: integer;
begin
 {
 if not Assigned(Flex) then exit;
 StrList := Nil;
 cbActiveScheme.Items.BeginUpdate;
 try
  StrList := TStringList.Create;
  for i:=0 to Flex.Schemes.Count-1 do
   StrList.AddObject(Flex.Schemes[i].Name, Flex.Schemes[i]);
  StrList.Sort;
  cbActiveScheme.Items.Assign(StrList);
  cbActiveScheme.ItemIndex := StrList.IndexOfObject(Flex.ActiveScheme);
 finally
  cbActiveScheme.Items.EndUpdate;
  StrList.Free;
 end;
 }
end;

procedure TEditMainForm.UpdateAllOptions(const Edited: TOptionEditPages);
var i: integer;
begin
 for i:=0 to MDIChildCount-1 do with TFlexChildForm(MDIChildren[i]) do
  SetCurrentOptions(Flex, Edited);
end;

procedure TEditMainForm.CheckUpdates(Flex: TFlexPanel);
begin
 if Flex.SelectionUpdateCounter = 0 then begin
  if FInspDataNeedUpdate then begin
   fmInspector.UpdateData;
   FInspDataNeedUpdate := False;
  end;
  if FInspPropsNeedUpdate then begin
   fmInspector.UpdateProps(Nil);
   FInspDataNeedUpdate := False;
  end;
 end;
end;

procedure TEditMainForm.FlexEndSelUpdate(Sender: TObject);
begin
 if Sender = ActiveFlex then CheckUpdates(TFlexPanel(Sender));
end;

procedure TEditMainForm.ControlNotify(Sender: TObject;
  Control: TFlexControl; Notify: TFlexNotify);
var Flex: TFlexPanel;
begin
 if FIsFileLoading or not Assigned(Sender) or not (Sender is TFlexPanel) then exit;
 Flex := TFlexPanel(Sender);
 sbrMain.SimpleText := 'Selecionado: '+IntToStr(Flex.SelectedCount);
 if Flex <> ActiveFlex then exit;
 if Notify in [ fnName, fnCreated, fnDestroyed, fnOrder ] then begin
  {if Flex.SelectionUpdateCounter = 0 then fmInspector.UpdateData; }
  FInspDataNeedUpdate := True;

 end;
 case Notify of
  fnDestroyed:
    begin
     if Control = fmInspector.Control then fmInspector.Control := Nil;
     fmUserData.UpdateData;
    end;
  fnName:
    if Assigned(Control) then
     if Control is TFlexLayer then UpdateLayers(Flex) else
     if Control is TFlexScheme then UpdateSchemes(Flex);
  fnSelect:
    begin
     if Flex.SelectedCount = 1
      then fmInspector.Control := Flex.Selected[0]
      else fmInspector.Control := Nil;
     fmLibrary.FlexSelectionChange;
     fmUserData.UpdateData;
     if Flex.HandleAllocated then Windows.SetFocus(Flex.Handle);
    end;
  fnLayers:
    UpdateLayers(Flex);
  fnSchemes:
    begin
     UpdateSchemes(Flex);
     FInspDataNeedUpdate := True;
     FInspPropsNeedUpdate := True;
   {  fmInspector.UpdateData;
     fmInspector.UpdateProps(Nil); }
    end;
 end;
 CheckUpdates(Flex);
 CheckTools;
end;

procedure TEditMainForm.BeginFilerProcess;
begin
 Screen.Cursor := crHourGlass;
 sbrMain.SimplePanel := False;
end;

procedure TEditMainForm.EndFilerProcess;
begin
 Screen.Cursor := crDefault;
 sbrMain.SimplePanel := True;
end;

function TEditMainForm.GetInFilerProcess: boolean;
begin
 Result := not sbrMain.SimplePanel;
end;

procedure TEditMainForm.FlexProgress(Sender: TObject; Progress: integer;
  Process: TFlexFilerProcess);
begin
 if not InFilerProcess then exit;
 FFilerProgress := Progress;
 sbrMain.Refresh;
end;

procedure TEditMainForm.sbrMainDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var R: TRect;
begin
 if Panel <> sbrMain.Panels[0] then exit;
 R := Rect;
 InflateRect(R, -1, -1);
 R.Right := R.Left + Round(FFilerProgress / 100 * (R.Right - R.Left)); 
 with sbrMain.Canvas do begin
  Brush.Style := bsSolid;
  Brush.Color := clNavy;
  FillRect(R);
 end;
end;

procedure TEditMainForm.acArrangeForwardOneExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.ForwardOne;
end;

procedure TEditMainForm.acArrangeBackOneExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.BackOne;
end;

procedure TEditMainForm.acArrangeToFrontExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.ToFront;
end;

procedure TEditMainForm.acArrangeToBackExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.ToBack;
end;

procedure TEditMainForm.acArrangeGroupExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.Group;
end;

procedure TEditMainForm.acArrangeUngroupExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.Ungroup;
end;

procedure TEditMainForm.acEditDeleteExecute(Sender: TObject);
var Flex: TFlexPanel;
begin
 Flex := ActiveFlex;
 if not Assigned(Flex) or not Flex.Focused then exit;
 if (Flex.ToolMode = ftmPointEdit) and (Flex.EditPointSelectedTotal > 0) then begin
  if Flex.EditPointControl.PointCount - Flex.EditPointSelectedTotal > 2 then
   Flex.DeleteSelectedPoints;
 end else
  Flex.DeleteSelected;
end;

procedure TEditMainForm.acEditCopyExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.CopyToClipboard;
end;

procedure TEditMainForm.acEditCutExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.CutToClipboard;
end;

procedure TEditMainForm.acEditPasteExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.PasteFromClipboard;
end;

procedure TEditMainForm.acEditPasteUpdate(Sender: TObject);
begin
 acEditPaste.Enabled := Assigned(ActiveFlex) and
   Clipboard.HasFormat(CF_FLEXDOC);
end;

procedure TEditMainForm.acAlignExecute(Sender: TObject);
var Align: TFlexAlign;
begin
 if Sender = acAlignLeft     then Align := faLeft else
 if Sender = acAlignHCenter  then Align := faHCenter else
 if Sender = acAlignRight    then Align := faRight else
 if Sender = acAlignTop      then Align := faTop else
 if Sender = acAlignVCenter  then Align := faVCenter else
 if Sender = acAlignBottom   then Align := faBottom else
 if Sender = acAlignCenter   then Align := faCenter
                             else Align := faLeft;
 if Assigned(ActiveFlex) then ActiveFlex.AlignSelected(Align);
end;

procedure TEditMainForm.acFilePreviewExecute(Sender: TObject);
var WasModified: boolean;
begin
 fmPreview := TfmPreview.Create(Nil);
 try
  BeginFilerProcess;
  try
   WasModified := ActiveFlex.Modified;
   fmPreview.Flex.OnProgress := FlexProgress;
   fmPreview.Flex.Assign(ActiveFlex);
   fmPreview.Flex.OnProgress := Nil;
   ActiveFlex.Modified := WasModified;
  finally
   EndFilerProcess;
  end;
  CheckTools;
  fmPreview.Caption := fmPreview.Caption + ' ['+ActiveMDIChild.Caption+']';
  fmPreview.ShowModal;
 finally
  fmPreview.Free;
  fmPreview := Nil;
  CheckTools;
 end;
end;

procedure TEditMainForm.acLibItemAddExecute(Sender: TObject);
begin
 if Assigned(fmLibrary) then fmLibrary.acLibAddItem.Execute;
end;

procedure TEditMainForm.acZoomInExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then with ActiveFlex do Zoom(Scale * 2, Nil);
end;

procedure TEditMainForm.acZoomOutExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then with ActiveFlex do Zoom(Scale div 2, Nil);
end;

procedure TEditMainForm.acZoomActualExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then with ActiveFlex do Zoom(100, Nil);
end;

function TEditMainForm.GetToolScale: integer;
var i, Len: integer;
    s: string;
begin
 Result := 100;
 if not Assigned(ActiveFlex) then exit;
 s := cbZoom.Text;
 Len := Length(s);
 for i:=1 to Len+1 do
  if (i > Len) or not (s[i] in ['0'..'9']) then begin
   Result := StrToIntDef(copy(s, 1, i-1), -1);
   if Result < 0 then Result := ActiveFlex.Scale;
   break;
  end;
end;

procedure TEditMainForm.cbZoomExit(Sender: TObject);
var NewScale: integer;
begin
 NewScale := GetToolScale;
 if Assigned(ActiveFlex) then with ActiveFlex do
  if NewScale <> Scale then Zoom(NewScale, Nil);
end;

procedure TEditMainForm.cbZoomClick(Sender: TObject);
var NewScale: integer;
begin
 NewScale := GetToolScale;
 if Assigned(ActiveFlex) then with ActiveFlex do
  if NewScale <> Scale then Zoom(NewScale, Nil);
end;

procedure TEditMainForm.cbZoomKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
  cbZoomClick(cbZoom)
 else
 if Key = VK_ESCAPE then
  CheckTools;
end;

procedure TEditMainForm.acEditDuplicateExecute(Sender: TObject);
var Shift: TPoint;
    SelList: TList;
    i: integer;
begin
 if not Assigned(ActiveFlex) then exit;
 SelList := Nil;
 with ActiveFlex do
 try
  Shift := Point(EditOptions.ShiftX, EditOptions.ShiftY);
  if EditOptions.DupRandom then begin
   Randomize;
   Shift.X := Round(Random * 2*Shift.X) - Shift.X;
   Shift.Y := Round(Random * 2*Shift.Y) - Shift.Y;
   SelList := TList.Create;
   for i:=0 to SelectedCount-1 do SelList.Add(Selected[i]);
  end;
  Duplicate(Shift.X, Shift.Y);
  if Assigned(SelList) then begin
   BeginSelectionUpdate;
   try
    UnselectAll;
    for i:=0 to SelList.Count-1 do Select(TFlexControl(SelList[i]));
   finally
    EndSelectionUpdate;
   end;
  end;
 finally
  SelList.Free;
 end;
end;

procedure TEditMainForm.acHelpAboutExecute(Sender: TObject);
begin
 ShowAbout;
end;

procedure TEditMainForm.acTranslateRotateCWExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.Rotate(-90, False);
end;

procedure TEditMainForm.acTranslateRotateCCWExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.Rotate(90, False);
end;

procedure TEditMainForm.acTranslateFlipHorzExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.Rotate(0, True);
end;

procedure TEditMainForm.acTranslateFlipVerticalExecute(Sender: TObject);
begin
 if Assigned(ActiveFlex) then ActiveFlex.Rotate(180, True);
end;

procedure TEditMainForm.acGridShowExecute(Sender: TObject);
begin
 EditOptions.ShowGrid := not EditOptions.ShowGrid;
 UpdateAllOptions;
 CheckTools;
end;

procedure TEditMainForm.acGridPixelShowExecute(Sender: TObject);
begin
 EditOptions.ShowPixGrid := not EditOptions.ShowPixGrid;
 UpdateAllOptions;
 CheckTools;
end;

procedure TEditMainForm.acGridSnapExecute(Sender: TObject);
begin
 EditOptions.SnapToGrid := not EditOptions.SnapToGrid;
 UpdateAllOptions;
 CheckTools;
end;

procedure TEditMainForm.acLayerToFrontExecute(Sender: TObject);
var Index: integer;
begin
 if Assigned(ActiveFlex) then with ActiveFlex do begin
  Index := Layers.IndexOf(ActiveLayer);
  if Index < Layers.Count-1 then Layers.ChangeOrder(Index, Index+1);
 end;
end;

procedure TEditMainForm.acLayerToBackExecute(Sender: TObject);
var Index: integer;
begin
 if Assigned(ActiveFlex) then with ActiveFlex do begin
  Index := Layers.IndexOf(ActiveLayer);
  if Index > 0 then Layers.ChangeOrder(Index, Index-1);
 end;
end;

procedure TEditMainForm.acFileExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TEditMainForm.acDebugPointsExecute(Sender: TObject);
begin
// ShowPointsDebug;
end;

procedure TEditMainForm.acCurveJoinExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.EditPoints(pfJoin);
 CheckTools;
end;

procedure TEditMainForm.acCurveBreakExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.EditPoints(pfBreak);
 CheckTools;
end;

procedure TEditMainForm.acCurveCloseExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.EditPoints(pfClose);
 CheckTools;
end;

procedure TEditMainForm.acCurveToLineExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.EditPoints(pfToLine);
 CheckTools;
end;

procedure TEditMainForm.acCurveToCurveExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.EditPoints(pfToCurve);
 CheckTools;
end;

procedure TEditMainForm.acCurveFlattenExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 with ActiveFlex do FlattenSelected((Scale/100) * (1/PixelScaleFactor));
 CheckTools;
end;

procedure TEditMainForm.acCurveBreakApartExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.BreakApartSelected;
 CheckTools;
end;

procedure TEditMainForm.acCurveCombineExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.CombineSelected;
 CheckTools;
end;

procedure TEditMainForm.acCurveConvertToCurveExecute(Sender: TObject);
begin
 if not Assigned(ActiveFlex) then exit;
 ActiveFlex.ConvertSelectedToCurves;
end;

procedure TEditMainForm.acHelpExecute(Sender: TObject);
var cStr: String;
begin
  cStr := 'hh "' + FormTools.MyGetLocalDir + DIR_HELP + '\LemhapCards.chm"'#0;
  WinExec(@cStr[1], SW_SHOW);
end;

procedure TEditMainForm.acEnviarLemhapExecute(Sender: TObject);
var StrAplic: String;
begin
  StrAplic:= FormTools.MyGetLocalDir + 'UploaderLemhap.exe';

  if (FileExists(StrAplic))
    then WinExec(PChar(StrAplic), SW_SHOW)
    else MessageDlg('Aplicativo "' + StrAplic + '" não foi encontrado.', mtWarning, [mbOk], 0);
end;

end.


