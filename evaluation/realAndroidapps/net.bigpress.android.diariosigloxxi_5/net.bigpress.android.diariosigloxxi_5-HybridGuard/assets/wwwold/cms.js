


function loadsections() {
	url = 'http://www.diariosigloxxi.com/mobile/sections';
	$.getJSON(url, function(data) {
  var items = [];

  $.each(data, function(key, section) {
	 // console.log(val);
    items.push('<a data-role="button" href="#section'+section.id+'">'+section.nombre+'</a>\n');
	createpage(section);
  });

  $('<ul/>', {
    'class': 'my-new-list',
    html: items.join('')
  }).appendTo('#sectionlist');
});
}


function createpage(section) {
	begin = '<div data-role="page" id="section'+section.id+'" data-add-back-btn="true">';
 header = '<div data-role="header"><h1>Second Page</h1></div>';
content = '<div data-role="content"><h1>Second Page</h1></div>';
footer = '<div data-role="footer"><h4>Click back to go back to main page</h4></div>';
end = '</div>';
	src = begin+header+content+footer+end;

$('body').append(src);
}

function loadsection() {
	
}


function loadarticle() {
	
	
}