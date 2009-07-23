{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit unit_SyncOnLineThread;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  Windows;

type
  TSyncOnLineThread = class(TWorker)
  private

  protected
    procedure WorkFunction; override;
  public

  end;

implementation

uses
  dm_user,
  dm_collection,
  unit_globals,
  unit_database,
  unit_Consts,
  Forms;

{ TImportXMLThread }

procedure TSyncOnLineThread.WorkFunction;
var
  totalBooks: Integer;
  processedBooks: Integer;
  Root: string;
  IDStr: string;
  TmpFolder: String;

  local: boolean;
begin
  totalBooks := DMCollection.tblBooks.RecordCount;
  processedBooks := 0;
  Root := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  try
    DMCollection.tblBooks.First;
    while not DMCollection.tblBooks.Eof do
    begin
      if Canceled then
          Exit;

      //  ���������������� ������ ������
      //  ���������, ���� �� ���� � ������ ������� (��� ID � ����� �����)
      //
      { TODO -oAlex : ����� �����-�� ����� ���������������� ����� ����� ������ }
    try
      IDStr := DMCollection.tblBooksLibID.AsString + ' ';
      TmpFolder := DMCollection.tblBooksFolder.Value;
      StrReplace(IDStr, '', TmpFolder);              // ������� Id �� �����
      if FileExists(Root + TmpFolder)  then
      begin
          // ���� ����, ��������������� � ��������� ������� � ����
        DMCollection.tblBooks.Edit;
        DMCollection.tblBooksLocal.Value := RenameFile(Root + TmpFolder, Root + DMCollection.tblBooksFolder.Value);
        DMCollection.tblBooks.Post;
      end;
      //
      //  ��������� ��� �� ���� ������� ����� � ������ ������� � ����
      //


      Local := FileExists(Root + DMCollection.tblBooksFolder.Value);

      if DMCollection.tblBooksLocal.Value <> local then
      begin
        DMCollection.tblBooks.Edit;
        DMCollection.tblBooksLocal.Value := Local;
        DMCollection.tblBooks.Post;
      end;
    except
      on E:Exception do
        Application.MessageBox(PChar('�����-�� �������� � ������ ' + TmpFolder),'',MB_OK);
    end;

      DMCollection.tblBooks.Next;

      Inc(processedBooks);
      if (processedBooks mod ProcessedItemThreshold) = 0 then
          SetComment(Format('���������� ����: %u �� %u', [processedBooks, totalBooks]));
      SetProgress(processedBooks * 100 div totalBooks);
    end;
    SetComment(Format('���������� ����: %u �� %u', [processedBooks, totalBooks]));
//  except
//    on E:Exception do
//      Application.MessageBox(PChar(TmpFolder),'',MB_OK);
//
//  end;
  finally
  end;
end;

end.
