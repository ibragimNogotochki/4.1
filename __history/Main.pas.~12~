Unit Main;

Interface

Uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  InputNew,
  ViewRecs,
  About,
  Vcl.StdCtrls,
  Vcl.Buttons,
  RecordWork,
  CorrRecs;

Type
  TMainForm = Class(TForm)
    MainMenu1: TMainMenu;
    Files: TMenuItem;
    AboutDev: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    N12: TMenuItem;
    Quit: TMenuItem;
    AddNewBtn: TBitBtn;
    ViewRecs: TBitBtn;
    DeleteRecs: TBitBtn;
    CorrectRecs: TBitBtn;
    Procedure AddRecsClick(Sender: TObject);
    Procedure ViewRecsClick(Sender: TObject);
    Procedure AboutDevClick(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Procedure DeleteRecsClick(Sender: TObject);
    procedure CorrectRecsClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    Const MainFilePath: String = 'dat.bin';
  End;

Var
  MainForm: TMainForm;
  InputNewForm: TInputNewForm;
  AboutForm: TAboutForm;

Implementation

{$R *.dfm}

Procedure TMainForm.AboutDevClick(Sender: TObject);
Begin
  Application.CreateForm(TAboutForm, AboutForm);
  AboutForm.ShowModal;
  AboutForm.Destroy;
  AboutForm := Nil;
End;

Procedure TMainForm.AddRecsClick(Sender: TObject);
Begin
  Application.CreateForm(TInputNewForm, InputNewForm);
  InputNewForm.ShowModal;
  InputNewForm.Destroy;
  InputNewForm := Nil;
End;

procedure TMainForm.CorrectRecsClick(Sender: TObject);
begin
  Application.CreateForm(TCorrectForm, CorrectForm);
  CorrectForm.ShowModal;
  CorrectForm.Destroy;
  CorrectForm := Nil;
end;

Procedure TMainForm.DeleteRecsClick(Sender: TObject);
Begin
  ExitCode := MessageBox(MainForm.Handle, 'Удалить все записи?', 'Подтверждение', MB_ICONQUESTION + MB_YESNO);
  If ExitCode = ID_YES Then
    ClearFile(MainFilePath);
End;

Procedure TMainForm.ViewRecsClick(Sender: TObject);
Begin
  Application.CreateForm(TViewForm, ViewForm);
  ViewForm.ShowModal;
  ViewForm.Destroy;
  ViewForm := Nil;
End;

Procedure TMainForm.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
  ExitCode := MessageBox(MainForm.Handle, 'Выйти?', 'Подтверждение', MB_ICONQUESTION + MB_YESNO);
  If ExitCode = ID_YES Then
    CanClose := True
  Else
    CanClose := False;
End;

End.
