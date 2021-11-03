(*
  Возвращает из строки Source подстроки разделенные символом Delimiter
  Returns from string Source substrings separated by Delimiter

  author: https://t.me/devdemi

  https://github.com/Dev-Demi/ForInParser
*)

unit UForInParser;

interface

{$IF Defined(FPC) or (COMPILERVERSION>=17)}
 {$DEFINE SUPPORTS_INLINE}
 {$DEFINE SUPPORTS_FOR_IN}
{$IFEND}

uses System.SysUtils;

{$IFDEF SUPPORTS_FOR_IN}

Type
  TParserEnumerator = class
  private
    CurString:String;
    SourceString, DelimiterChar: string;
    function GetCurrentString: string;
  public
    // обслуживание перечислителя, не для внешнего использования!
    property Current: string read GetCurrentString;
    function MoveNext: boolean;
    function GetEnumerator: TParserEnumerator; {$IFDEF SUPPORTS_INLINE}inline; {$ENDIF}
    Constructor Create(const Source: string; Delimiter: Char);
    Destructor Destroy; override;
  end;

///   <summary>
///   Возвращает из строки Source подстроки разделенные символом Delimiter
///   Returns from string Source substrings separated by Delimiter
///   <code>https://t.me/devdemi</code>
///   </summary>

function StringParser(const Source: string; Delimiter: Char): TParserEnumerator;
{$ENDIF}

implementation

{$IFDEF SUPPORTS_FOR_IN}

function TParserEnumerator.GetCurrentString: string;
begin
 result:=CurString;
end;

function TParserEnumerator.MoveNext: boolean;
var
 i,LengthStr:integer;

begin
 i:=1;
 LengthStr:=Length(SourceString);

 if LengthStr=0 then
 begin
  Result:=false;
  exit;
 end;

 while (SourceString[i]<>DelimiterChar)and(i<LengthStr) do
  i:=i+1;

 result:= i<=Length(SourceString);

 if Result then
 begin
 if i=Length(SourceString) then
  CurString:=copy(SourceString,1,i)
 else
  CurString:=copy(SourceString,1,i-1);
  delete(SourceString,1,i);
 end;
end;

function TParserEnumerator.GetEnumerator: TParserEnumerator;
begin
  Result := Self;
end;

Constructor TParserEnumerator.Create(const Source: string; Delimiter: Char);
begin
  inherited Create;

  SourceString:=Source;
  DelimiterChar:=Delimiter
end;

Destructor TParserEnumerator.Destroy;
begin
  inherited;
end;

function StringParser(const Source: string; delimiter: Char): TParserEnumerator;
begin
  Result := TParserEnumerator.Create(Source, delimiter);
end;

{$ENDIF}

end.
