unit InputNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RecordWork, Vcl.StdCtrls, Vcl.Buttons;

type
  TInputNewForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    InvNumEdit: TEdit;
    NameEdit: TEdit;
    ProdDateEdit: TEdit;
    PurposeEdit: TEdit;
    WriteBtn: TBitBtn;
    Label6: TLabel;
    PriceEdit: TEdit;
    SaveDialog1: TSaveDialog;
    ChooseFileBtn: TBitBtn;
    procedure WriteBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure PurposeEditChange(Sender: TObject);
    procedure InvNumEditChange(Sender: TObject);
    procedure PriceEditChange(Sender: TObject);
    procedure ProdDateEditChange(Sender: TObject);
    procedure BlockNonNums(Sender: TObject; var Key: Char);
    procedure ChooseFileBtnClick(Sender: TObject);
  private
    FilePath: String;
    IsInvNumCorrect, IsPriceCorrect, IsNameCorrect, IsPurposeCorrect,
      IsDateCorrect, IsFileChosen: Boolean;
  public
    { Public declarations }
  end;

var
  InputNewForm: TInputNewForm;

implementation

{$R *.dfm}

procedure TInputNewForm.ChooseFileBtnClick(Sender: TObject);
Var
  Temp: File;
begin
  If SaveDialog1.Execute Then
  Begin
    FilePath := SaveDialog1.FileName;
    If  Not (Copy(FilePath, High(FilePath) - 4, 4) = '.bin') Then
      FilePath := FilePath + '.bin';
    IsFileChosen := True;
  End;
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect And IsFileChosen;
end;

procedure TInputNewForm.BlockNonNums(Sender: TObject; var Key: Char);
begin
  If Not CharInSet(Key, ['0' .. '9', #8]) Then
    Key := #0;
end;

procedure TInputNewForm.InvNumEditChange(Sender: TObject);
begin
  IsInvNumCorrect := Not(InvNumEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect And IsFileChosen;
end;

procedure TInputNewForm.NameEditChange(Sender: TObject);
begin
  IsNameCorrect := Not(NameEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect And IsFileChosen;
end;

procedure TInputNewForm.PriceEditChange(Sender: TObject);
begin
  IsPriceCorrect := Not(PriceEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect And IsFileChosen;
end;

procedure TInputNewForm.ProdDateEditChange(Sender: TObject);
begin
  IsDateCorrect := Not(ProdDateEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect And IsFileChosen;
end;

procedure TInputNewForm.PurposeEditChange(Sender: TObject);
begin
  IsPurposeCorrect := Not(PurposeEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect And IsFileChosen;
end;

Procedure TInputNewForm.WriteBtnClick(Sender: TObject);
Var
  RecToWrite: TAppliance;
Begin
  RecToWrite := CreateRec(StrToInt(InvNumEdit.Text), StrToInt(PriceEdit.Text),
    NameEdit.Text, PurposeEdit.Text, ProdDateEdit.Text);
  WriteRecToFile(RecToWrite, FilePath);
  ShowMessage('Записано');
End;

end.
