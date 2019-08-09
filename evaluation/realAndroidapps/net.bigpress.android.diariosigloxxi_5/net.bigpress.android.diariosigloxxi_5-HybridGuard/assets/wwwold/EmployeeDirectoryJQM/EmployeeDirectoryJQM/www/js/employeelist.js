var serviceURL = "http://localhost/directory/services/";

var employees;

$('#employeeListPage').bind('pageinit', function(event) {
	getEmployeeList();
});

function getEmployeeList() {
	url = 'http://www.diariosigloxxi.com/mobile/sections';
	$.getJSON(url, function(data) {
		$('#employeeList li').remove();
		employees = data; //.items;
		$.each(employees, function(index, employee) {
			$('#employeeList').append('<li><a href="employeedetails.html?id=' + employee.id + '">' +
				
					'<h4>' + employee.nombre+'</h4>' +
					'</a></li>');
		});
		$('#employeeList').listview('refresh');
	});
}