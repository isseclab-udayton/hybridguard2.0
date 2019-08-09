
    this.addLocation = function(event) {
  // 		event.preventDefault();
 		navigator.geolocation.getCurrentPosition(
            alert("In hosted geolocation");
      		function(position) {
          	alert(position.coords.latitude + ',' + position.coords.longitude);
      		},
      		function() {
          	alert('Error getting location');
      		});
  		return false;
	};
