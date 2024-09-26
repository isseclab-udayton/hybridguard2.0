document.addEventListener("deviceready", onDeviceReady14, false);
function onDeviceReady14() 
{
	document.getElementById("createContact").addEventListener("click", createContact);
	function createContact()
	{
		var myContact = navigator.contacts.create({"displayName": "Test User"});
	}
}