unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, InputNew, ViewRecs, About;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Files: TMenuItem;
    Funcs: TMenuItem;
    AddRecs: TMenuItem;
    CorrectRecs: TMenuItem;
    N5: TMenuItem;
    ViewRecs: TMenuItem;
    N7: TMenuItem;
    DeleteRecs: TMenuItem;
    AboutDev: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    N12: TMenuItem;
    Quit: TMenuItem;
    procedure AddRecsClick(Sender: TObject);
    procedure ViewRecsClick(Sender: TObject);
    procedure AboutDevClick(Sender: TObject);
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

end.
