unit fLibProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, FileCtrl, ExtCtrls;

type
  TfmLibProps = class(TForm)
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    fedLibFilename: TFilenameEdit;
    Label2: TLabel;
    edTitle: TEdit;
    Label3: TLabel;
    mmDesc: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLibProps: TfmLibProps;

implementation

{$R *.DFM}

end.
