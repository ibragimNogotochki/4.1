Unit CorrRecs;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  RecordWork,
  Vcl.StdCtrls,
  Vcl.Buttons,
  CorrectSelected;

Type
  TCorrectForm = Class(TForm)
    ShowGrid: TStringGrid;
    Procedure FormCreate(Sender: TObject);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure FillGrid(Recs: TRecArray);
    Procedure ShowGridSelectCell(Sender: TObject; ACol, ARow: LongInt; Var CanSelect: Boolean);
  Private
    NewCorrectable: TCorrection;
  Public
    SelectedRecPointer: PAppliance;
  End;

Var
  CorrectForm: TCorrectForm;

Implementation

{$R *.dfm}

Procedure TCorrectForm.FormCreate(Sender: TObject);
Const
  FileName: String = 'dat.bin';
Var
  Recs: TRecArray;
Begin
  ShowGrid.Cells[0, 0] := 'Инв. номер';
  ShowGrid.Cells[1, 0] := 'Цена(коп.)';
  ShowGrid.Cells[2, 0] := 'Наименование';
  ShowGrid.Cells[3, 0] := 'Назначение';
  ShowGrid.Cells[4, 0] := 'Дата выпуска';
  Recs := LoadRecsFromFile(FileName);
  FillGrid(Recs);
End;

Procedure TCorrectForm.FillGrid(Recs: TRecArray);
Var
  I: Integer;
Begin
  ShowGrid.RowCount := Length(Recs) + 1;
  For I := Low(Recs) To High(Recs) Do
  Begin
    ShowGrid.Cells[0, I + 1] := IntToStr(Recs[I].InvNumber);
    ShowGrid.Cells[1, I + 1] := IntToStr(Recs[I].Price);
    ShowGrid.Cells[2, I + 1] := Recs[I].Name;
    ShowGrid.Cells[3, I + 1] := Recs[I].Purpose;
    ShowGrid.Cells[4, I + 1] := DateToStr(Recs[I].ProdDate);
  End;
End;

Procedure TCorrectForm.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key = #27 Then
    Close;
End;

Procedure TCorrectForm.ShowGridSelectCell(Sender: TObject; ACol, ARow: LongInt; Var CanSelect: Boolean);
Const
  MainFileName: String = 'dat.bin';
  CorrFileName: String = 'corr.bin';
Begin
  NewCorrectable.Rec := ReadRec(MainFileName, ARow - 1);
  NewCorrectable.Id := ARow - 1;
  SelectedRecPointer := @NewCorrectable.Rec;
  Application.CreateForm(TCorrectSelectedForm, CorrectSelectedForm);
  CorrectSelectedForm.ShowModal;
  CorrectSelectedForm.Destroy;
  CorrectSelectedForm := Nil;
  If SelectedRecPointer.InvNumber = -1 Then
    NewCorrectable.Op := TOperation.OP_DEL
  Else
    NewCorrectable.Op := TOperation.OP_EDIT;
  WriteCorrToFile(NewCorrectable, CorrFileName);
End;

End.
