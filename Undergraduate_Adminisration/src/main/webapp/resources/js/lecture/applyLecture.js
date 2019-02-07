function studentLecture(userNumber){
	var obj = new Object();
	obj.userNumber = userNumber;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/lectureList',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				if($('#lectureList')!= null)
					$('#lectureList').html(data);
			}
		},
		error:function(){
			alert("Error! studentLecture();");
		}
	});
}