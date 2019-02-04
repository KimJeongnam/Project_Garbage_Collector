function studentLecture(userNumber){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	if($('#lectureList-pagesize')!=null)
		obj.pageSize = $('#lectureList-pagesize')[0].value;
	if($('#lectureList-search-keyword')[0].value.length > 0){
		obj.keyword = $('#lectureList-search-keyword')[0].value;
	}
	
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

function studentTimetable(userNumber){
	var obj = new Object();
	obj.userNumber = userNumber;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/schoolTimeTable',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				if($('#schoolTimeTable')!= null)
					$('#schoolTimeTable').html(data);
			}
		},
		error:function(){
			alert("Error! studentLecture();");
		}
	});
}