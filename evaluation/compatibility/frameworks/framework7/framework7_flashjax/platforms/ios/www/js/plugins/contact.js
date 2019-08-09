document.addEventListener("deviceready", contactOnDeviceReady, false);
function contactOnDeviceReady()
{
	document.getElementById("createContact").addEventListener("click", createContact);
	function createContact()
	{
		var myContact = navigator.contacts.create({"displayName": "Test User"});
		alert("contact created");
	}
}
