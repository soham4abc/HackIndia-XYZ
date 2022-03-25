function getDataUrl(img) {
    // Create canvas
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    // Set width and height
    canvas.width = img.width;
    canvas.height = img.height;
    // Draw the image
    ctx.drawImage(img, 0, 0);
    return canvas.toDataURL('image/jpeg');
 }
 // Select the image
 const img = document.querySelector('#my-image');
 img.addEventListener('load', function (event) {
    const dataUrl = getDataUrl(event.currentTarget);
    console.log(dataUrl);
 });