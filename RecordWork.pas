unit RecordWork;

interface

Uses System.SysUtils;

Type
  TAppliance = Record
    InvNumber: Integer;
    Name: String[10];
    Purpose: String[50];
    ProdDate: String[10];
    Price: Integer;
  End;

  TRecArray = Array Of TAppliance;

Function CreateRec(InvNumber, Price: Integer; Name, Purpose, ProdDate: String)
  : TAppliance;

Procedure WriteRecToFile(RecToWrite: TAppliance; FilePath: String);

implementation

Function CreateRec(InvNumber, Price: Integer; Name, Purpose, ProdDate: String)
  : TAppliance;
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

Procedure WriteRecsToFile(RecsToWrite: TRecArray; FilePath: String);
Var
  WFile: File Of TAppliance;
  I: Integer;
Begin
  AssignFile(WFile, FilePath);
  Rewrite(WFile);
  For I := 0 To High(RecsToWrite) Do
    Write(WFile, RecsToWrite[I]);
  CloseFile(WFile);
End;

Function LoadRecsFromFile(FilePath: String): TRecArray;
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

end.
