Unit About;

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
  Vcl.StdCtrls;

Type
  TAboutForm = Class(TForm)
    Info: TLabel;
    Procedure FormCreate(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  AboutDev: TAboutForm;

Implementation

{$R *.dfm}

Procedure TAboutForm.FormCreate(Sender: TObject);
Begin
  Info.Caption := 'Выполнил студент группы 451004 Акименко Алексей Эуардович.';
End;

End.
