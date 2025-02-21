unit CorrectSelected;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RecordWork, Vcl.StdCtrls, Vcl.Buttons;

type
  TCorrectSelectedForm = class(TForm)
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
    DeleteBtn: TBitBtn;
    procedure WriteBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure PurposeEditChange(Sender: TObject);
    procedure InvNumEditChange(Sender: TObject);
    procedure PriceEditChange(Sender: TObject);
    procedure BlockNonNums(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    Procedure MonthBoxChange(Sender: TObject);
    Procedure DayBoxChange(Sender: TObject);
    Function CheckInputs(): Boolean;
    procedure YearEditChange(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    IsInvNumCorrect, IsPriceCorrect, IsNameCorrect, IsPurposeCorrect,
      IsDayCorrect, isMonthCorrect, IsYearCorrect: Boolean;
  public
    { Public declarations }
  end;

var
  CorrectSelectedForm: TCorrectSelectedForm;

implementation

{$R *.dfm}

Uses
  CorrRecs;

procedure TCorrectSelectedForm.BlockNonNums(Sender: TObject; var Key: Char);
begin
  If Not CharInSet(Key, ['0' .. '9', #8]) Then
    Key := #0;
end;

procedure TCorrectSelectedForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  Recs: TRecArray;
begin
  Recs := LoadRecsFromFile('dat.bin');
  SortRecsByInv(Recs);
  RewriteRecsToFile(Recs, 'dat.bin');
end;

procedure TCorrectSelectedForm.FormCreate(Sender: TObject);
Var
  RecToChange: PAppliance;
begin
  RecToChange := CorrRecs.CorrectForm.SelectedRecPointer;
  InvNumEdit.Text := IntToStr(RecToChange.InvNumber);
  PriceEdit.Text := IntToStr(RecToChange.Price);
  NameEdit.Text := RecToChange.Name;
  PurposeEdit.Text := RecToChange.Purpose;
  DayBox.ItemIndex := RecToChange.ProdDate.Day - 1;
  MonthBox.ItemIndex := RecToChange.ProdDate.Month - 1;
  YearEdit.Text := IntToStr(RecToChange.ProdDate.Year);
end;

procedure TCorrectSelectedForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 Then
    Close;
end;

procedure TCorrectSelectedForm.MonthBoxChange(Sender: TObject);
begin
  IsMonthCorrect := Not(MonthBox.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;

procedure TCorrectSelectedForm.DayBoxChange(Sender: TObject);
begin
  IsDayCorrect := Not(DayBox.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;

procedure TCorrectSelectedForm.DeleteBtnClick(Sender: TObject);
begin
  CorrRecs.CorrectForm.SelectedRecPointer.InvNumber := -1;
  Close;
end;

procedure TCorrectSelectedForm.InvNumEditChange(Sender: TObject);
begin
  IsInvNumCorrect := Not(InvNumEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;

procedure TCorrectSelectedForm.NameEditChange(Sender: TObject);
begin
  IsNameCorrect := Not(NameEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;

procedure TCorrectSelectedForm.PriceEditChange(Sender: TObject);
begin
  IsPriceCorrect := Not(PriceEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;


procedure TCorrectSelectedForm.PurposeEditChange(Sender: TObject);
begin
  IsPurposeCorrect := Not(PurposeEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;

Procedure TCorrectSelectedForm.WriteBtnClick(Sender: TObject);
Const
  FilePath: String = 'dat.bin';
Var
  RecToWrite: TAppliance;
Begin
  RecToWrite := RewriteRec(CorrRecs.CorrectForm.SelectedRecPointer, StrToInt(InvNumEdit.Text), StrToInt(PriceEdit.Text),
    NameEdit.Text, PurposeEdit.Text, StrToInt(DayBox.Text), StrToInt(MonthBox.Text), StrToInt(YearEdit.Text));
  WriteRecToFile(RecToWrite, FilePath);
  MessageBox(Self.Handle, 'Запись изменена!', 'Успех' , MB_OK);
  Close;
End;

procedure TCorrectSelectedForm.YearEditChange(Sender: TObject);
begin
  IsYearCorrect := Not(YearEdit.Text = '');
  WriteBtn.Enabled := CheckInputs;
end;

Function TCorrectSelectedForm.CheckInputs(): Boolean;
Begin
   CheckInputs := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDayCorrect And IsMonthCorrect And IsYearCorrect;
End;



end.
