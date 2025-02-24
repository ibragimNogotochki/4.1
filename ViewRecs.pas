unit ViewRecs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RecordWork, Vcl.StdCtrls;

type
  TViewForm = class(TForm)
    ShowGrid: TStringGrid;
    RadioButton1: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Procedure FillGrid(Recs: TRecArray);
    Procedure FillAccordingToTask(Recs: TRecArray);
    procedure RadioButton1Click(Sender: TObject);
  private
    Recs: TRecArray;
  public
    { Public declarations }
  end;

var
  ViewForm: TViewForm;

implementation

{$R *.dfm}

procedure TViewForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 Then
    Close;
end;

procedure TViewForm.RadioButton1Click(Sender: TObject);
begin
  If RadioButton1.Checked Then
    FillAccordingToTask(Recs)
  Else
    FillGrid(Recs);
end;

procedure TViewForm.FormCreate(Sender: TObject);
Var
  I: Integer;
begin
  ShowGrid.Cells[0, 0] := 'Инв. номер';
  ShowGrid.Cells[1, 0] := 'Цена(коп.)';
  ShowGrid.Cells[2, 0] := 'Наименование';
  ShowGrid.Cells[3, 0] := 'Назначение';
  ShowGrid.Cells[4, 0] := 'Дата выпуска';
  Recs := LoadRecsFromFile('dat.bin');
  FillGrid(Recs);
end;

Procedure TViewForm.FillGrid(Recs: TRecArray);
Var
  I: Integer;
Begin
  ShowGrid.RowCount := Length(Recs) + 1;
  For I := 0 To High(Recs) Do
  Begin
    ShowGrid.Cells[0, I + 1] := IntToStr(Recs[I].InvNumber);
    ShowGrid.Cells[1, I + 1] := IntToStr(Recs[I].Price);
    ShowGrid.Cells[2, I + 1] := Recs[I].Name;
    ShowGrid.Cells[3, I + 1] := Recs[I].Purpose;
    ShowGrid.Cells[4, I + 1] := DateToStr(Recs[I].ProdDate);
  End;
End;

Procedure TViewForm.FillAccordingToTask(Recs: TRecArray);
Var
  I, OffSet: Integer;
Begin
  ShowGrid.RowCount := 1;
  OffSet := 0;
  For I := 0 To High(Recs) Do
    If (Recs[I].Price < 1001) And (Recs[I].ProdDate.Year < 1999) Then
    Begin
      ShowGrid.RowCount := ShowGrid.RowCount + 1;
      ShowGrid.Cells[0, I + 1 - OffSet] := IntToStr(Recs[I].InvNumber);
      ShowGrid.Cells[1, I + 1 - OffSet] := IntToStr(Recs[I].Price);
      ShowGrid.Cells[2, I + 1 - OffSet] := Recs[I].Name;
      ShowGrid.Cells[3, I + 1 - OffSet] := Recs[I].Purpose;
      ShowGrid.Cells[4, I + 1 - OffSet] := DateToStr(Recs[I].ProdDate);
    End
    Else
      Inc(OffSet);
End;

end.
