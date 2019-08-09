
(function () {
	'use strict';

	angular
	.module('AngularInstance' )
	.controller('UploadController', run);

	
	function run(  $scope , caHelper , $timeout) {
		var vm = this;
		vm.helper = caHelper;
		
        vm.countUploading = function( dataPack ){
            //console.log( dataPack.JsonObject.Data  )
            if( dataPack.JsonObject.Data == undefined ) return -1 ;
            var data = dataPack.JsonObject.Data ;
            var count = 0 ;
            $.each( data , function( index, element ){
                if( element.ErrorCode ==  3 || element.ErrorCode == 1 ) count++;
            });
            return count ;
        }
        
		var activate = function(){
            vm.upload = window.SavePostQueue ;
            
            $scope.$watch( function(){ return vm.upload }, function( newValue , oldValue){
               $timeout( function(){	!$scope.$$phase ? $scope.$apply() : null ; } , 200 ); 
            });
		}
		
		activate();
	


	}
})();


(function () {
	'use strict';

	angular
	.module('AngularInstance' )
	.controller('UploadDisplayController', run);

	
	function run(  $scope , caHelper , $interval ) {
		var vm = this;
		vm.helper = caHelper;
		
        vm.remove = function( index ){
            window.SavePostQueue.JsonObject.Data.splice( index , 1 );
            window.FeedManager.CacheFeed( window.SavePostQueue );   

        }
        
        vm.checkIsPending = function( dataPack ){
            if( dataPack.ErrorCode == 1 || dataPack.ErrorCode == 3 )
                return true;
            return false ;
        }
        
		var activate = function(){
			
			vm.upload = window.SavePostQueue.JsonObject.Data ; 
		}
		
		activate();
	
  		$interval(function(){ vm.upload = window.SavePostQueue.JsonObject.Data ; }, 200);


	}
})();


AngularInstance.controller('IntroMLLController', function (  $scope , caHelper ) {
    var vm = this;
    vm.helper = caHelper;

    vm.getTeams = function(){
        
        window.GetTeamFollowing.Variables = {
            teamSport : 'Memorial7' 
            , teamLevel : 'Professional'
            , profileId : loginNameSpace.loggedUserID
        };
        
        window.GetTeamFollowing.DataUpdatedEvent = function( data ){ 
        	vm.team = data.Data ;
            $scope.$apply();
    	}
        window.GetTeamFollowing.Execute( window.FeedManager ) ;

    }
    
    vm.setUrl = function( x ){
        if( x.teamIcon == undefined )
            return teamsearchNameSpace.teamSportIcon ;
        var profilePhoto = domainNameSpace.name + x.teamIcon;

        return profilePhoto ;

    }
    
    vm.isNotFollowing = function( x , notfollowClass ){
		if (x.isFollowing == '')  return  notfollowClass ;
    }
    
    vm.follow = function( x ){
        searchNameSpace.followTeam( x.teamId ) ;
    }

    var activate = function(){
        vm.getTeams();
    };
    
    activate();



	
});