function InitializeControl(controlId) {
    var controlAddIn = document.getElementById(controlId);
    controlAddIn.innerHTML ='<div id="my-pdf"></div>';
}

function SetVisible(IsVisible) {
    if (IsVisible){
        document.querySelector("#my-pdf").style.display = 'block';
    }else{
        document.querySelector("#my-pdf").style.display = 'none';
    }

}

function LoadPDF(PDFDocument,IsFactbox){
    var iframe = window.frameElement;

    console.log(PDFDocument);

    requestAnimationFrame(() => {
        const blob = b64toBlob(PDFDocument, "application/pdf");
        const blobUrl = URL.createObjectURL(blob);

        console.log(blobUrl);
        
        PDFObject.embed(blobUrl, "#my-pdf");

        iframe.style.maxHeight = 72.5 + 'vh';
        iframe.style.height =  72.5 + 'vh';
    });
}

const b64toBlob = (b64Data, contentType='', sliceSize=512) => {
    const byteCharacters = atob(b64Data);
    const byteArrays = [];
  
    for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
      const slice = byteCharacters.slice(offset, offset + sliceSize);
  
      const byteNumbers = new Array(slice.length);
      for (let i = 0; i < slice.length; i++) {
        byteNumbers[i] = slice.charCodeAt(i);
      }
  
      const byteArray = new Uint8Array(byteNumbers);
      byteArrays.push(byteArray);
    }
  
    const blob = new Blob(byteArrays, {type: contentType});
    return blob;
}