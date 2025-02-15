unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, InputNew, ViewRecs, About,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TMainForm = class(TForm)
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
    procedure AddRecsClick(Sender: TObject);
    procedure ViewRecsClick(Sender: TObject);
    procedure AboutDevClick(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  InputNewForm: TInputNewForm;
  AboutForm: TAboutForm;

implementation

{$R *.dfm}



procedure TMainForm.AboutDevClick(Sender: TObject);
begin
  Application.CreateForm(TAboutForm, AboutForm);
  AboutForm.ShowModal;
  AboutForm.Destroy;
  AboutForm := Nil;
end;

procedure TMainForm.AddRecsClick(Sender: TObject);
begin
  Application.CreateForm(TInputNewForm, InputNewForm);
  InputNewForm.ShowModal;
  InputNewForm.Destroy;
  InputNewForm := Nil;
end;

procedure TMainForm.ViewRecsClick(Sender: TObject);
begin
  Application.CreateForm(TViewForm, ViewForm);
  ViewForm.ShowModal;
  ViewForm.Destroy;
  ViewForm := Nil;
end;

Procedure TMainForm.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
    ExitCode := MessageBox(MainForm.Handle, 'Выйти?', 'Подтверждение', MB_ICONQUESTION + MB_YESNO);
    If ExitCode = ID_YES Then
      CanClose := True
    Else
      CanClose := False;
End;


end.
