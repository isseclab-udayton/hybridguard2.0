/*var commonForAllNameSpace = {

	// usage commonForAllNameSpace.searchPopupButtonOnClick();
	searchPopupButtonOnClick: function () {
		var text = $('#searchPopUpInputText');
		searchNameSpace.instantSearch = 'on';

		var searchFor = $("#searchPopupChoice").val();
		if (searchFor == 'fans') {
			location.hash = '../search/searchPeopleView.html';
			searchNameSpace.getPeopleFeed(loginNameSpace.loggedUserID);
		} else if (searchFor == 'teams') {
			location.hash = '../search/searchTeamView.html';
			searchNameSpace.getTeamFeed(loginNameSpace.loggedUserID);
		}
	}
}*/