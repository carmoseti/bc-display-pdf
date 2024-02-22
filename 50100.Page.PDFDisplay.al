page 50100 "PDFV2 PDF Viewer"
{
    Caption = 'EDMS Document Viewer';
    AboutTitle = 'Document Viewer';
    PageType = Card;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            field("Document Link"; TestDocumentLink)
            {
                ApplicationArea = All;
                Caption = 'EDMS Document Link';
                Editable = False;
                ExtendedDatatype = URL;
            }
            group(General)
            {
                ShowCaption = False;
                usercontrol(PDFViewer; "PDFV2 PDF Viewer")
                {
                    ApplicationArea = All;

                    trigger ControlAddinReady()
                    begin
                        CurrPage.PDFViewer.LoadPDF(TestDocumentB64, false);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        // Progress dialog....


        TestDocumentLink := 'https://test.pdf.com';
    end;

    var
        TestDocumentLink: Text;
        PDFAsTxt: Text;
        PDFAliasLbl: Label 'data:application/pdf;base64,', Locked = true;
}