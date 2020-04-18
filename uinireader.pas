unit UIniReader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, IniFiles;
type
  TIniReader=class
  Constructor Create;

private
    { private declarations }
public
    pathini:string;
    Seccion:string;
    Procedure WriteStr(variable,valor:String);
    Function ReadStr(variable:String):String;
    { public declarations }
end;


implementation
Constructor TIniReader.Create;
Var
    MiFicheroIni : TiniFile;
Begin
  inherited;
 If trim(pathini).Length=0 then
      pathini := ExtractFilePath(Application.ExeName)+'fde.ini';
 If trim(Seccion).Length=0 then
      Seccion := 'CONFIG';
 MiFicheroIni:=TIniFile.Create(pathini);
 MificheroIni.Free;
end;

Procedure TIniReader.WriteStr(variable,valor:String);
Var
    MiFicheroIni : TiniFile;
begin
  MiFicheroIni:=TIniFile.Create(pathini);
  MiFicheroIni.WriteString(Seccion,Variable,valor);
  MiFicheroIni.Free;
end;

Function TIniReader.ReadStr(variable:String):String ;
Var
    MiFicheroIni : TiniFile;
begin
   MiFicheroIni:=TIniFile.Create(pathini);
   Result:=Trim(MiFicheroIni.ReadString(Seccion,Variable,' '));
   MiFicheroIni.Free;
end;


end.

