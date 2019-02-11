function studentBulletinlist(userNumber,year){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.year = year;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/studentBulletinlist',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#bulletinList').html(data);
			}
		},
		error:function(){
			alert("Error! bulletinList();");
		}
	});
}
