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
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Procedure FillGrid(Recs: TRecArray);
    procedure ShowGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
  private
      NewCorrectable: TCorrection;
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
  Var Recs: TRecArray;
begin
  ShowGrid.Cells[0, 0] := '���. �����';
  ShowGrid.Cells[1, 0] := '����(���.)';
  ShowGrid.Cells[2, 0] := '������������';
  ShowGrid.Cells[3, 0] := '����������';
  ShowGrid.Cells[4, 0] := '���� �������';
  Recs := LoadRecsFromFile('dat.bin');
  FillGrid(Recs);
end;



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
    ShowGrid.Cells[4, I + 1] :=  DateToStr(Recs[I].ProdDate);
  End;
End;

procedure TCorrectForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 Then
    Close;
end;


procedure TCorrectForm.ShowGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
Var
  Recs: TRecArray;
Begin
  NewCorrectable.Rec := ReadRec('dat.bin', ARow - 1);
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
  WriteCorrToFile (NewCorrectable, 'corr.bin');
End;
end.
