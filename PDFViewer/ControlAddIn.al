controladdin "PDFV2 PDF Viewer"
{
    Scripts = 'PDFViewer/Vendor/jquery-3.7.1.min.js', 'PDFViewer/Vendor/pdfobject-2.3.0.min.js', 'PDFViewer/script.js';
    StartupScript = 'PDFViewer/Startup.js';
    StyleSheets = 'PDFViewer/stylesheet.css';

    MinimumHeight = 400;
    MinimumWidth = 100;
    // MaximumHeight = 2000;
    // MaximumWidth = 4000;
    HorizontalStretch = true;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;

    event ControlAddinReady();
    procedure LoadPDF(PDFDocument: Text; IsFactbox: Boolean)
    procedure SetVisible(IsVisible: Boolean)
}