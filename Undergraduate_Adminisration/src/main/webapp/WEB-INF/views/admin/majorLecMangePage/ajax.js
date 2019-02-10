//미완성 상태
function getMajors(){
	var college = $('#collegeSelector').val();

	var obj = new Object();
	
	if(college != 0){
		obj.college = college;
	}
	
	var JsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '',
		type: 'POST',
		data: JsonData,
		contentType : 'application/json;charset=utf-8',
		success: function(data){
			
		},
		error: function(){
			
		}
	});

	
}

