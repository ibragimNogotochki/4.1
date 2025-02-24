Unit InputNew;

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
  RecordWork,
  Vcl.StdCtrls,
  Vcl.Buttons;

Type
  TInputNewForm = Class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    InvNumEdit: TEdit;
    NameEdit: TEdit;
    PurposeEdit: TEdit;
    WriteBtn: TBitBtn;
    Label6: TLabel;
    PriceEdit: TEdit;
    SaveDialog1: TSaveDialog;
    DayBox: TComboBox;
    YearEdit: TEdit;
    MonthBox: TComboBox;
    Procedure WriteBtnClick(Sender: TObject);
    Procedure NameEditChange(Sender: TObject);
    Procedure PurposeEditChange(Sender: TObject);
    Procedure InvNumEditChange(Sender: TObject);
    Procedure PriceEditChange(Sender: TObject);
    Procedure YearEditChange(Sender: TObject);
    Procedure BlockNonNums(Sender: TObject; Var Key: Char);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Function CheckInputs(): Boolean;
    Procedure DayBoxChange(Sender: TObject);
    procedure MonthBoxChange(Sender: TObject);
  Private
    IsInvNumCorrect, IsPriceCorrect, IsNameCorrect, IsPurposeCorrect, IsDayCorrect, IsMonthCorrect, IsYearCorrect: Boolean;
  Public
    { Public declarations }
  End;
Var
  InputNewForm: TInputNewForm;

Implementation

{$R *.dfm}

Procedure TInputNewForm.BlockNonNums(Sender: TObject; Var Key: Char);
Begin
  If Not CharInSet(Key, ['0' .. '9', #8]) Then
    Key := #0;
End;

Procedure TInputNewForm.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Var
  Recs: TRecArray;
Begin
  Recs := LoadRecsFromFile('dat.bin');
  SortRecsByInv(Recs);
  RewriteRecsToFile(Recs, 'dat.bin');
End;

Procedure TInputNewForm.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key = #27 Then
    Close;
End;

Procedure TInputNewForm.InvNumEditChange(Sender: TObject);
Begin
  If ((InvNumEdit.Text <> '' )And (InvNumEdit.Text[1] = '0')) Then
    InvNumEdit.Text := '';
  IsInvNumCorrect := Not(InvNumEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
End;

procedure TInputNewForm.MonthBoxChange(Sender: TObject);
begin
  IsMonthCorrect := Not(MonthBox.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;

Procedure TInputNewForm.NameEditChange(Sender: TObject);
Begin
  IsNameCorrect := Not(NameEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
End;

Procedure TInputNewForm.PriceEditChange(Sender: TObject);
Begin
  If ((PriceEdit.Text <> '' )And (PriceEdit.Text[1] = '0')) Then
    PriceEdit.Text := '';
  IsPriceCorrect := Not(PriceEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
End;

Procedure TInputNewForm.YearEditChange(Sender: TObject);
Begin
  If ((YearEdit.Text <> '' )And (YearEdit.Text[1] = '0')) Then
    YearEdit.Text := '';
  IsYearCorrect := Not(YearEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
End;

Procedure TInputNewForm.PurposeEditChange(Sender: TObject);
Begin
  IsPurposeCorrect := Not(PurposeEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
End;

Procedure TInputNewForm.WriteBtnClick(Sender: TObject);
Const
  FilePath: String = 'corr.bin';
Var
  RecToWrite: TCorrection;
Begin
  RecToWrite.Op := TOperation.OP_ADD;
  RecToWrite.Rec := CreateRec(StrToInt(InvNumEdit.Text), StrToInt(PriceEdit.Text), NameEdit.Text, PurposeEdit.Text, StrToInt(DayBox.Text), StrToInt(MonthBox.Text), StrToInt(YearEdit.Text));
  WriteCorrToFile(RecToWrite, FilePath);
  MessageBox(Self.Handle, 'Запись добавлена!', 'Успех', MB_OK);
End;

Function TInputNewForm.CheckInputs(): Boolean;
Begin
  CheckInputs := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And IsPurposeCorrect And IsDayCorrect And IsMonthCorrect And
      IsYearCorrect;
End;

Procedure TInputNewForm.DayBoxChange(Sender: TObject);
Begin
  IsDayCorrect := Not(DayBox.Text = '');
  WriteBtn.Enabled := CheckInputs;
End;

End.
