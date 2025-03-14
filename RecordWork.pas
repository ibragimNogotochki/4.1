Unit RecordWork;

Interface

Uses
  System.SysUtils, Winapi.Windows;

Type
  TProdDate = Record
    Day: 1 .. 31;
    Month: 1 .. 12;
    Year: Word;
  End;

  TAppliance = Record
    InvNumber: Integer;
    Name: String[10];
    Purpose: String[70];
    ProdDate: TProdDate;
    Price: Integer;
  End;

  TOperation = (OP_DEL, OP_EDIT, OP_ADD);

  TCorrection = Record
    Rec: TAppliance;
    Id: Integer;
    Op: TOperation;
  End;

  TRecArray = Array Of TAppliance;
  TCorrArray = Array Of TCorrection;
  PAppliance = ^TAppliance;

Function CreateRec(Const InvNumber, Price: Integer; Const Name, Purpose: String; ProdDay: Byte; ProdMonth: Byte; ProdYear: Word)
    : TAppliance;

Procedure RewriteRecsToFile(Var Recs: TRecArray; Const FilePath: String);

Function RewriteRec(RecPointer: PAppliance; Const InvNumber, Price: Integer; Const Name, Purpose: String; ProdDay: Byte; ProdMonth: Byte;
    ProdYear: Word): TAppliance;


Function DateToStr(Const Date: TProdDate): String;

Procedure ClearFile(Const FilePath: String);

Function LoadRecsFromFile(Const FilePath: String): TRecArray;

Procedure SortRecsByInv(Var Recs: TRecArray);

Function ReadRec(Const FilePath: String; Const Pos: Integer): TAppliance;

Procedure WriteCorrToFile(Const RecToWrite: TCorrection; Const FilePath: String);

Procedure SortRecsInFile(FileName: String);

Procedure ConfirmChanges (Const MainFileName, CorrFileName: String);

Implementation

Function CreateRec(Const InvNumber, Price: Integer; Const Name, Purpose: String; ProdDay: Byte; ProdMonth: Byte; ProdYear: Word)
    : TAppliance;
Var
  Res: TAppliance;
Begin
  Res.InvNumber := InvNumber;
  Res.Price := Price;
  Res.Name := Name;
  Res.Purpose := Purpose;
  Res.ProdDate.Day := ProdDay;
  Res.ProdDate.Month := ProdMonth;
  Res.ProdDate.Year := ProdYear;
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

Procedure RewriteCorrsToFile(Var Corrs: TCorrArray; Const FilePath: String);
Var
  I: Integer;
  WFile: File Of TCorrection;
Begin
  AssignFile(WFile, FilePath);
  Rewrite(WFile);
  For I := 0 To High(Corrs) Do
    Write(WFile, Corrs[I]);
  CloseFile(WFile);
End;

Function ReadRec(Const FilePath: String; Const Pos: Integer): TAppliance;
Var
  F: File Of TAppliance;
  Res: TAppliance;
Begin
  AssignFile(F, FilePath);
  Reset(F);
  Seek(F, Pos);
  Read(F, Res);
  CloseFile(F);
  ReadRec := Res;
End;

Function DateToStr(Const Date: TProdDate): String;
Var
  Res: String;
Begin
  Res := IntToStr(Date.Day) + '/' + IntToStr(Date.Month) + '/' + IntToStr(Date.Year);
  DateToStr := Res;
End;

Function LoadCorrsFromFile(Const FilePath: String): TCorrArray;
Var
  RFile: File Of TCorrection;
  Res: TCorrArray;
  I: Integer;
Begin
  AssignFile(RFile, FilePath);
  Reset(RFile);
  SetLength(Res, FileSize(RFile));
  For I := 0 To High(Res) Do
    Read(RFile, Res[I]);
  CloseFile(RFile);
  LoadCorrsFromFile := Res;
End;

Procedure WriteCorrToFile(Const RecToWrite: TCorrection; Const FilePath: String);
Var
  WFile: File Of TCorrection;
  PrevRecs: TCorrArray;
  I: Integer;
Begin
  If FileExists(FilePath) Then
    PrevRecs := LoadCorrsFromFile(FilePath);
  AssignFile(WFile, FilePath);
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
  I: Integer;
Begin
  AssignFile(RFile, FilePath);
  Reset(RFile);
  SetLength(Res, FileSize(RFile));
  For I := 0 To High(Res) Do
    Read(RFile, Res[I]);
  CloseFile(RFile);
  LoadRecsFromFile := Res;
End;

Function RewriteRec(RecPointer: PAppliance; Const InvNumber, Price: Integer; Const Name, Purpose: String; ProdDay: Byte; ProdMonth: Byte;
    ProdYear: Word): TAppliance;

Begin
  RecPointer.InvNumber := InvNumber;
  RecPointer.Price := Price;
  RecPointer.Name := Name;
  RecPointer.Purpose := Purpose;
  RecPointer.ProdDate.Day := ProdDay;
  RecPointer.ProdDate.Month := ProdMonth;
  RecPointer.ProdDate.Year := ProdYear;
End;

Procedure ClearFile(Const FilePath: String);
Var
  FileToClear: File;
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

Procedure SortCorrsById(Var Corrs: TCorrArray);
Var
  I, J: Integer;
  Temp: TCorrection;
Begin
  For I := 1 To High(Corrs) Do
  Begin
    J := I;
    While ((J > 0) And (Corrs[J - 1].Id > Corrs[J].Id)) Do
    Begin
      Temp := Corrs[J - 1];
      Corrs[J - 1] := Corrs[J];
      Corrs[J] := Temp;
      Dec(J);
    End;
  End;
End;

Procedure SortRecsInFile(FileName: String);
Var
  Recs: TRecArray;
Begin
  Recs := LoadRecsFromFile(FileName);
  SortRecsByInv(Recs);
  RewriteRecsToFile(Recs, FileName);
End;

Procedure SortCorrsInfile(FileName: String);
Var
  Corrs: TCorrArray;
Begin
  Corrs := LoadCorrsFromFile(FileName);
  SortCorrsById(Corrs);
  RewriteCorrsToFile(Corrs, FileName);
End;
Procedure ConfirmChanges(Const MainFileName, CorrFileName: String);
Const
  TempFileName : String = 'temp.bin';
Var
  I: Integer;
  NextRec: TAppliance;
  PrevRecs: TRecArray;
  MainFile, TempFile: File Of TAppliance;
  CorrFile: File Of TCorrection;
  NextCorrection: TCorrection;
Begin
  SortCorrsInFile(CorrFileName);
  AssignFile(MainFile, MainFileName);
  AssignFile(CorrFile, CorrFileName);
  Reset(CorrFile);
  If FileExists(MainFileName) Then
    PrevRecs := LoadRecsFromFile(MainFileName);
  AssignFile(MainFile, MainFileName);
  Rewrite(MainFile);
  For I := Low(PrevRecs) To High(PrevRecs) Do
    Write(MainFile, PrevRecs[I]);
  While Not EOF(CorrFile) Do
  Begin
    Read(CorrFile, NextCorrection);
    If NextCorrection.Op = OP_EDIT Then
    Begin
      Seek(MainFile, NextCorrection.Id);
      Write(MainFile, NextCorrection.Rec);
    End
    Else If NextCorrection.Op = OP_Add Then
    Begin
      Seek(MainFile, FileSize(MainFile));
      Write(MainFile, NextCorrection.Rec);
    End;
  End;
  Seek(CorrFile, 0);
  Reset(Mainfile);
  AssignFile(TempFile, TempFileName);
  Rewrite(TempFile);
  If NextCorrection.Op <> OP_DEL Then
    NextCorrection.Id := -1;
  While Not EOF(MainFile) Do
  Begin
    If(NextCorrection.Id = FilePos(MainFile)) Then
    Begin
      While Not (EOF(CorrFile) Or (NextCorrection.Op = OP_DEL)) Do
        Read(CorrFile, NextCorrection);
      Seek(MainFile, FilePos(MainFile) + 1)
    End;
    If (Not EOF(MainFile)) Then
    Begin
      Read(MainFile, NextRec);
      Write(TempFile, NextRec);
    End
    Else
      Seek(MainFile, FilePos(MainFile) + 1);
  End;
  Close(TempFile);
  Close(MainFile);
  Close(CorrFile);
  System.SysUtils.DeleteFile(MainFileName);
  RenameFile(TempFileName, MainFileName);
  ClearFile(CorrFileName);
End;

End.
