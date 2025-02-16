unit CorrRecs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RecordWork, Vcl.StdCtrls, Vcl.Buttons, CorrectSelected;

type
  TCorrectForm = class(TForm)
    ShowGrid: TStringGrid;
    ConfirmBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Procedure FillGrid(Recs: TRecArray);
    procedure ShowGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure ConfirmBtnClick(Sender: TObject);
  private
      Recs: TRecArray;
  public
      SelectedRecPointer: PAppliance;
  end;

var
  CorrectForm: TCorrectForm;

implementation

{$R *.dfm}

procedure TCorrectForm.FormCreate(Sender: TObject);
Var
  I: Integer;
begin
  ShowGrid.Cells[0, 0] := '���. �����';
  ShowGrid.Cells[1, 0] := '����(���.)';
  ShowGrid.Cells[2, 0] := '������������';
  ShowGrid.Cells[3, 0] := '����������';
  ShowGrid.Cells[4, 0] := '���� �������';
  Recs := LoadRecsFromFile('dat.bin');
  ShowGrid.RowCount := Length(Recs) + 1;
  SortRecsByInv(Recs);
  FillGrid(Recs);
end;

procedure TCorrectForm.ConfirmBtnClick(Sender: TObject);
begin
  RewriteRecsToFile(Recs, 'dat.bin');
end;

Procedure TCorrectForm.FillGrid(Recs: TRecArray);
Var
  I: Integer;
Begin
  For I := 0 To High(Recs) Do
  Begin
    ShowGrid.Cells[0, I + 1] := IntToStr(Recs[I].InvNumber);
    ShowGrid.Cells[1, I + 1] := IntToStr(Recs[I].Price);
    ShowGrid.Cells[2, I + 1] := Recs[I].Name;
    ShowGrid.Cells[3, I + 1] := Recs[I].Purpose;
    ShowGrid.Cells[4, I + 1] := Recs[I].ProdDate;
  End;
End;

procedure TCorrectForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 Then
    Close;
end;

procedure TCorrectForm.ShowGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
Begin
  SelectedRecPointer := @Recs[ARow - 1];
  Application.CreateForm(TCorrectSelectedForm, CorrectSelectedForm);
  CorrectSelectedForm.ShowModal;
  CorrectSelectedForm.Destroy;
  CorrectSelectedForm := Nil;
  FillGrid(Recs);
End;
end.
