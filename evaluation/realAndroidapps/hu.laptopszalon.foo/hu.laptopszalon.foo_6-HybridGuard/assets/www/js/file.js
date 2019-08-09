
var FileApi = {
		
		
		setItem:function(url,id,callback){
			
			if(typeof device=="object"){
			
			  window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function (fs) {
				  
				  	  var headers={'Accept-Encoding':'text/html'};
					  var imagePath = fs.root.fullPath + "/foo2013/"+id+""; 
						
				      var options = new FileTransfer();			      
				      options.headers = headers;
				      
				      var fileTransfer = new FileTransfer();
				      fileTransfer.download(url+"", imagePath, function (entry) {
				               console.log(json_encode(entry));
				               callback(true);
				      }, function (error) {
				    	  		console.log("Error"+json_encode(error));
				               callback(false);
				      },true,options);
				  
				  
			      
			   },function(){
				   $.get(url).done(function(data) {	
					    console.log("fileSystem not supported:"+data);
						window.localStorage.removeItem(id.replace(".json",""));

						window.localStorage.setItem(id.replace(".json",""),data);
						callback(true);						
					}).fail(function(data){						
						callback(false);
					});
			   });
			}
			else{
				$.get(url).done(function(data) {
					console.log("device not supported");
					window.localStorage.removeItem(id.replace(".json",""));

					window.localStorage.setItem(id.replace(".json",""),data);
					callback(true);
					
				}).fail(function(data){
					
					callback(false);
				});
					
			}
		},
		
		getItem:function(id,callback){
			
			if(typeof device=="object"){
					
				window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function (fs) {
					
					  var imagePath = fs.root.fullPath + "/foo2013/"+id+""; 
				 	  
				 	  window.resolveLocalFileSystemURI(imagePath, 
				 		function(fileEntry){
						 
						  fileEntry.file(function(file){
							  	var reader = new FileReader();
						        reader.onloadend = function(evt) {
						           					           
						            callback(evt.target.result); 
						        };
						        reader.readAsText(file);
						  }, function (error) {
				              
				               callback(false);
					      });
						 },function (error) {						  	
				             
				               callback(false);
						 });
				 },function(){
					 $.get("js/data/"+id).done(function(data) {
							if(data!=""){
								callback(data);								
							}else{
								 callback(false);
							}
					  });
				 });
			
			}
			else{
				var v = window.localStorage.getItem(id.replace(".json",""));
				callback(v);
			}
			
			
		}
		
		
	
		
    
};
