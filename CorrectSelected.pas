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
    ProdDateEdit: TEdit;
    PurposeEdit: TEdit;
    WriteBtn: TBitBtn;
    Label6: TLabel;
    PriceEdit: TEdit;
    SaveDialog1: TSaveDialog;
    DeleteBtn: TBitBtn;
    procedure WriteBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure PurposeEditChange(Sender: TObject);
    procedure InvNumEditChange(Sender: TObject);
    procedure PriceEditChange(Sender: TObject);
    procedure ProdDateEditChange(Sender: TObject);
    procedure BlockNonNums(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    IsInvNumCorrect, IsPriceCorrect, IsNameCorrect, IsPurposeCorrect,
      IsDateCorrect: Boolean;
      RecToCorrectPointer: PAppliance;
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

procedure TCorrectSelectedForm.FormCreate(Sender: TObject);
begin
  RecToCorrectPointer := CorrRecs.CorrectForm.SelectedRecPointer;
  InvNumEdit.Text := IntToStr(RecToCorrectPointer.InvNumber);
  NameEdit.Text := RecToCorrectPointer.Name;
  PurposeEdit.Text := RecToCorrectPointer.Purpose;
  PriceEdit.Text := IntToStr(RecToCorrectPointer.Price);
  ProdDateEdit.Text := RecToCorrectPointer.ProdDate;
end;

procedure TCorrectSelectedForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 Then
    Close;
end;

procedure TCorrectSelectedForm.InvNumEditChange(Sender: TObject);
begin
  IsInvNumCorrect := Not(InvNumEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect;
end;

procedure TCorrectSelectedForm.NameEditChange(Sender: TObject);
begin
  IsNameCorrect := Not(NameEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect;
end;

procedure TCorrectSelectedForm.PriceEditChange(Sender: TObject);
begin
  IsPriceCorrect := Not(PriceEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect;
end;

procedure TCorrectSelectedForm.ProdDateEditChange(Sender: TObject);
begin
  IsDateCorrect := Not(ProdDateEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect;
end;

procedure TCorrectSelectedForm.PurposeEditChange(Sender: TObject);
begin
  IsPurposeCorrect := Not(PurposeEdit.Text = '');
  WriteBtn.Enabled := IsInvNumCorrect And IsPriceCorrect And IsNameCorrect And
    IsPurposeCorrect And IsDateCorrect;
end;

Procedure TCorrectSelectedForm.WriteBtnClick(Sender: TObject);
Const
  FilePath: String = 'dat.bin';
Begin
  RewriteRec(RecTocorrectPointer,StrToInt(InvNumEdit.Text), StrToInt(PriceEdit.Text),
    NameEdit.Text, PurposeEdit.Text, ProdDateEdit.Text);
  MessageBox(Self.Handle, '������ ��������!', '�����' , MB_OK);
  Close;
End;

end.
