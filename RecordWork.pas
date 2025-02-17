Unit RecordWork;

Interface

Uses
  System.SysUtils;

Type
  TAppliance = Record
    InvNumber: Integer;
    Name: String[10];
    Purpose: String[70];
    ProdDate: String[10];
    Price: Integer;
  End;

  TRecArray = Array Of TAppliance;
  PAppliance = ^TAppliance;

Function CreateRec(Const InvNumber, Price: Integer;
  Const Name, Purpose, ProdDate: String): TAppliance;

Procedure RewriteRecsToFile(Var Recs: TRecArray; Const FilePath: String);

Procedure RewriteRec(RecPointer: PAppliance; Const InvNumber, Price: Integer;
  Const Name, Purpose, ProdDate: String);

Procedure WriteRecToFile(Const RecToWrite: TAppliance; Const FilePath: String);

procedure DeleteRec(Var A: TRecArray; Index: Integer);

Procedure ClearFile(Const FilePath: String);

Function LoadRecsFromFile(Const FilePath: String): TRecArray;

Procedure SortRecsByInv(Var Recs: TRecArray);

Implementation

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

Procedure RewriteRecsToFile(Var Recs: TRecArray; Const FilePath: String);
Var
  I: Integer;
  WFile: File Of TAppliance;
Begin
  AssignFile(WFile, FilePath);
  Rewrite(WFile);
  For I := Low(Recs) To High(Recs) Do
    Write(WFile, Recs[I]);
  CloseFile(WFile);
End;

procedure DeleteRec(Var A: TRecArray; Index: Integer);
var
  Last: Integer;
begin
  Last := high(A);
  if Index < Last then
    move(A[Index + 1], A[Index], (Last - Index) * sizeof(A[Index]));
  setLength(A, Last);
end;

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
  setLength(Res, FileSize(RFile));
  For I := 0 To High(Res) Do
    Read(RFile, Res[I]);
  CloseFile(RFile);
  LoadRecsFromFile := Res;
End;

Procedure RewriteRec(RecPointer: PAppliance; Const InvNumber, Price: Integer;
  Const Name, Purpose, ProdDate: String);
Begin
  RecPointer.InvNumber := InvNumber;
  RecPointer.Price := Price;
  RecPointer.Name := Name;
  RecPointer.Purpose := Purpose;
  RecPointer.ProdDate := ProdDate;
End;

Procedure ClearFile(Const FilePath: String);
Var
  FileToClear: File Of TAppliance;
Begin
  AssignFile(FileToClear, FilePath);
  Rewrite(FileToClear);
  CloseFile(FileToClear);
End;

Procedure SortRecsByInv(Var Recs: TRecArray);
Var
  I, J: Integer;
  Temp: TAppliance;
Begin
  For I := 1 To High(Recs) Do
  Begin
    J := I;
    While ((J > 0) And (Recs[J - 1].InvNumber > Recs[J].InvNumber)) Do
    Begin
      Temp := Recs[J - 1];
      Recs[J - 1] := Recs[J];
      Recs[J] := Temp;
      Dec(J);
    End;
  End;
End;

End.
