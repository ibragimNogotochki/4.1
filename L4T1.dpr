program L4T1;

uses
  Vcl.Forms,
  InputNew in 'InputNew.pas' {InputNewForm},
  RecordWork in 'RecordWork.pas',
  ViewRecs in 'ViewRecs.pas' {ViewForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewForm, ViewForm);
  Application.CreateForm(TInputNewForm, InputNewForm);
  Application.Run;
end.
