program LCards;

uses
  Forms,
  Main in 'Main.pas' {EditMainForm},
  fChild in 'fChild.pas' {FlexChildForm},
  fOptions in 'fOptions.pas' {fmOptions},
  ToolMngr in 'ToolMngr.pas' {ToolContainer},
  fInspector in 'fInspector.pas' {fmInspector},
  fLibrary in 'fLibrary.pas' {fmLibrary},
  fLibProps in 'fLibProps.pas' {fmLibProps},
  fLibItemProps in 'fLibItemProps.pas' {fmLibItemProps},
  fPreview in 'fPreview.pas' {fmPreview},
  fDocProps in 'fDocProps.pas' {fmDocProps},
  fUserData in 'fUserData.pas' {fmUserData},
  fLayers in 'fLayers.pas' {fmLayers},
  UserDataFrm in 'UserDataFrm.pas' {UserDataForm},
  PenFrm in 'PenFrm.pas' {PenPropForm},
  PictureFrm in 'PictureFrm.pas' {PicturePropForm},
  StrListFrm in 'StrListFrm.pas' {StrListPropForm},
  BrushFrm in 'BrushFrm.pas' {BrushPropForm},
  FTools in 'FTools.pas' {FormTools},
  FNovo2 in 'FNovo2.pas' {FormNovo2},
  fAboutPrg in 'fAboutPrg.pas' {formAbout},
  Inicio in 'Inicio.pas' {FormInicio};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'LemhapCards';
  Application.CreateForm(TEditMainForm, EditMainForm);

  FormInicio:= TFormInicio.Create(Application);
  FormInicio.Show;
  FormInicio.Update;
     Application.CreateForm(TfmInspector, fmInspector);
     Application.CreateForm(TfmLibrary, fmLibrary);
     Application.CreateForm(TfmUserData, fmUserData);
     Application.CreateForm(TFormTools, FormTools);
     Application.CreateForm(TfmLayers, fmLayers);
     Application.CreateForm(TUserDataForm, UserDataForm);
     Application.CreateForm(TPenPropForm, PenPropForm);
     Application.CreateForm(TPicturePropForm, PicturePropForm);
     Application.CreateForm(TStrListPropForm, StrListPropForm);
     Application.CreateForm(TBrushPropForm, BrushPropForm);
     Application.CreateForm(TFormNovo2, FormNovo2);
  //FormInicio.Hide;
  //FormInicio.Free;
  Application.Run;
end.

