document.getElementById("Scan_Barcode").addEventListener("click", scanbar);
function scanbar() 
{
	console.log("in scanbar");
	scanner.startScanning();
}