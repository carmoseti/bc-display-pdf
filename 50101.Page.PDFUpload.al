page 50101 "PDF Upload"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    Caption = 'PDF Upload';
    AboutTitle = 'PDF Upload';

    layout
    {
        area(Content)
        {
            group(File)
            {
                field("File Name"; FileName)
                {
                    ApplicationArea = All;
                    Enabled = false;
                    Editable = False;
                }
                field("File Contents Base 64"; FileContentsB64)
                {
                    ApplicationArea = All;
                    MultiLine = True;
                    Enabled = False;
                    Editable = False;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Caption = 'Import File';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;

                Visible = not IsDataFilled;

                trigger OnAction()
                var
                    Base64Convert: Codeunit "Base64 Convert";
                    TempBlob: Codeunit "Temp Blob";
                    FileManagement: Codeunit "File Management";
                    InStr: InStream;
                begin
                    FileName := FileManagement.BLOBImport(TempBlob, '.pdf');

                    TempBlob.CreateInStream(InStr);
                    FileContentsB64 := Base64Convert.ToBase64(InStr);

                    IsDataFilled := true;
                end;
            }

            action(Clear)
            {
                ApplicationArea = All;
                Caption = 'Clear Fields';
                Promoted = true;
                PromotedCategory = Process;
                Image = ClearLog;

                Visible = IsDataFilled;

                trigger OnAction()
                begin
                    FileContentsB64 := '';
                    FileName := '';

                    IsDataFilled := false;
                end;
            }
        }
    }

    var
        FileContentsB64: Text;
        FileName: Text;
        IsDataFilled: Boolean;
}