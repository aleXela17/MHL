{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov alex.penkov@gmail.com                           }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit unit_Scripts;

interface

uses Classes;

type
  TScriptDesc = class(TCollectionItem)
  private
    FTitle: string;
    FPath: string;
    FParams: string;
    FTmpParams: string;
  protected
    procedure AssignTo(Dest: TPersistent); override;

  public
    procedure Run;

    property Title: string read FTitle write FTitle;
    property Path: string read FPath write FPath;
    property Params: string read FParams write FParams;
    property TmpParams: string read FTmpParams write FTmpParams;
  end;

  TScripts = class(TCollection)
  private
    function GetScript(Index: Integer): TScriptDesc;
    procedure SetScript(Index: Integer; const Value: TScriptDesc);

  public
    constructor Create;
    function AddScript: TScriptDesc;
    procedure Add(const Title: String; const Path: String; const Params: String);
    property Items[Index: Integer]: TScriptDesc read GetScript write SetScript; default;
  end;

implementation

uses
  Windows,
  ShellAPI,
  SysUtils,
  Forms,
  unit_Errors,
  StrUtils;

{ TScriptC }

procedure TScriptDesc.AssignTo(Dest: TPersistent);
begin
  if Dest is TScriptDesc then
    with TScriptDesc(Dest) do
    begin
      Title := Self.Title;
      Path := Self.Path;
      Params := Self.Params;
    end
  else
    inherited AssignTo(Dest);
end;

procedure TScriptDesc.Run;
var
  AHInst: HINST;
  P: string;
begin
  P := IfThen(TmpParams = '', Params, TmpParams);
  AHInst := ShellAPI.ShellExecute(
    Application.Handle,
    nil,
    PChar(Path),
    PChar(P),
    nil,
    SW_SHOWNORMAL
    );
  TmpParams := '';
  if AHInst <= 32 then
    raise Exception.Create(SysErrorMessage(AHInst));
end;

{ TScripts }

constructor TScripts.Create;
begin
  inherited Create(TScriptDesc);
end;

function TScripts.GetScript(Index: Integer): TScriptDesc;
begin
  Result := TScriptDesc(inherited Items[Index]);
end;

procedure TScripts.SetScript(Index: Integer; const Value: TScriptDesc);
begin
  inherited Items[Index] := Value;
end;

function TScripts.AddScript: TScriptDesc;
begin
  Result := TScriptDesc(inherited Add);
end;

procedure TScripts.Add(const Title, Path, Params: string);
var
  Script: TScriptDesc;
begin
  if (Title = '') or (Path = '') {or (Params = '')} then
    raise EMHLError.Create(rstrErrorInvalidArgument);

  BeginUpdate;
  try
    Script := AddScript;
    try
      Script.Title := Title;
      Script.Path := Path;
      Script.Params := Params;
    except
      Script.Free;
      raise;
    end;
  finally
    EndUpdate;
  end;
end;

end.