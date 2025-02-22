unit ViewRecs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RecordWork;

type
  TViewForm = class(TForm)
    ShowGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
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

procedure TViewForm.FormCreate(Sender: TObject);
Var
  Recs: TRecArray;
  I: Integer;
begin
  ShowGrid.Cells[0, 0] := '���. �����';
  ShowGrid.Cells[1, 0] := '����(���.)';
  ShowGrid.Cells[2, 0] := '������������';
  ShowGrid.Cells[3, 0] := '����������';
  ShowGrid.Cells[4, 0] := '���� �������';
  Recs := LoadRecsFromFile('dat.bin');
  ShowGrid.RowCount := Length(Recs) + 1;
  For I := 0 To High(Recs) Do
  Begin
    ShowGrid.Cells[0, I + 1] := IntToStr(Recs[I].InvNumber);
    ShowGrid.Cells[1, I + 1] := IntToStr(Recs[I].Price);
    ShowGrid.Cells[2, I + 1] := Recs[I].Name;
    ShowGrid.Cells[3, I + 1] := Recs[I].Purpose;
    ShowGrid.Cells[4, I + 1] := DateToStr(Recs[I].ProdDate);
  End;
end;

end.
