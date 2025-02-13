unit RecordWork;

interface

Uses System.SysUtils;

Type
  TAppliance = Record
    InvNumber: Integer;
    Name: String[10];
    Purpose: String[70];
    ProdDate: String[10];
    Price: Integer;
  End;

  TRecArray = Array Of TAppliance;

Function CreateRec(Const InvNumber, Price: Integer;
  Const Name, Purpose, ProdDate: String): TAppliance;

Procedure WriteRecToFile(Const RecToWrite: TAppliance; Const FilePath: String);

Function LoadRecsFromFile(Const FilePath: String): TRecArray;

Procedure SortRecsByInv(Var Recs: TRecArray);

implementation

Function CreateRec(Const InvNumber, Price: Integer;
  Const Name, Purpose, ProdDate: String): TAppliance;
Var
  Res: TAppliance;
Begin
  Res.InvNumber := InvNumber;
  Res.Price := Price;
  Res.Name := Name;
  Res.Purpose := Purpose;
  Res.ProdDate := ProdDate;
  CreateRec := Res;
End;

Procedure WriteRecToFile(Const RecToWrite: TAppliance; Const FilePath: String);
Var
  WFile: File Of TAppliance;
  PrevRecs: TRecArray;
  I: Integer;
Begin
  AssignFile(WFile, FilePath);
  If FileExists(FilePath) Then
    PrevRecs := LoadRecsFromFile(FilePath);
  Rewrite(WFile);
  For I := Low(PrevRecs) To High(PrevRecs) Do
    Write(WFile, PrevRecs[I]);
  Write(WFile, RecToWrite);
  CloseFile(WFile);
End;

Function LoadRecsFromFile(Const FilePath: String): TRecArray;
Var
  RFile: File Of TAppliance;
  Res: TRecArray;
  I, RecCount: Integer;
Begin
  AssignFile(RFile, FilePath);
  Reset(RFile);
  SetLength(Res, FileSize(RFile));
  For I := 0 To High(Res) Do
    Read(RFile, Res[I]);
  CloseFile(RFile);
  LoadRecsFromFile := Res;
End;

Procedure SortRecsByInv(Var Recs: TRecArray);
Var
  I, J: Integer;
  Temp: TAppliance;
Begin
  For I := 1 To High(Recs) Do
  Begin
    J:= I;
    While((J > 0) And (Recs[J-1].InvNumber > Recs[J].InvNumber)) Do
    Begin
      Temp := Recs[J - 1];
      Recs[J - 1] := Recs[J];
      Recs[J] := Temp;
      Dec(J);
    End;
  End;
End;
end.
