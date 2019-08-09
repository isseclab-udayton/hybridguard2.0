var Category = {
		
	add:function(e){
		var userid =  $(e).attr('id').replace('userlist_', '');
		var username =  $(e).attr('title');
		//$('#availableTags #userlist_'+userid).remove();
		$('#bit_hidden_'+userid).remove(); 
		$('#bit-'+userid).remove();
		
		
		$("#categoryHolder").prepend('<li id="bit-'+userid+'" class="bit-box">'+username+'<a href="#" class="closebutton icon-cancel"></a></li><li class="bit-input" id="bit_hidden_'+userid+'" style="display: none; "><input class="smallinput" type="text" autocomplete="off" name="job_tags[]" value="'+username+'"></li>');
		$('#bit-'+userid+' .closebutton').bind('click', function(event) {			
			$('#bit_hidden_'+userid).remove(); 
			$('#bit-'+userid).remove();
			 return false;
			 //$('#availableUsers #userlist_'+userid).show();
			
		});	
	},
	
	
	
	manualTag:function(e){
		
		var username =  $(e).attr('value');
		var userid =  $(e).val().replace(' ', '_');
		//var userid = username;
		//$('#availableTags #userlist_'+userid).remove();
		$('#bit_hidden_'+userid).remove(); 
		$('#bit-'+userid).remove();
		
		$(e).val("");
		
		$("#categoryHolder").append('<li id="bit-'+userid+'" class="bit-box">'+username+'<a href="#" class="closebutton icon-cancel"></a><div class="bit-input" id="bit_hidden_'+userid+'" style="display: none; "><input class="smallinput" type="text" autocomplete="off" name="job_tags[]" value="'+userid+'"></div></li>');
		$('#bit-'+userid+' .closebutton').bind('click', function(event) {			
			$('#bit_hidden_'+userid).remove(); 
			$('#bit-'+userid).remove();
			 return false;
			 //$('#availableUsers #userlist_'+userid).show();
			
		});	
		return false;
	},


}

