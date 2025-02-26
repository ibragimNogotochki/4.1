program L4T1;

uses
  Vcl.Forms,
  InputNew in 'InputNew.pas' {InputNewForm},
  RecordWork in 'RecordWork.pas',
  ViewRecs in 'ViewRecs.pas' {ViewForm},
  Main in 'Main.pas' {MainForm},
  About in 'About.pas' {AboutForm},
  CorrRecs in 'CorrRecs.pas' {CorrectForm},
  CorrectSelected in 'CorrectSelected.pas' {CorrectSelectedForm},
  Instruct in 'Instruct.pas' {InstructionForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInstructionForm, InstructionForm);
  Application.Run;
end.
