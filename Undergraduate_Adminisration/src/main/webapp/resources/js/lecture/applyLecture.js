function studentLecture(userNumber, page){
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
				studentMyLecture(userNumber);
				studentTimetable(userNumber);
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
					$('#schoolTimeTable').empty();
					$('#schoolTimeTable').html(data);
			}
		},
		error:function(){
			alert("Error! studentLecture();");
		}
	});
}

function studentMyLecture(userNumber){
	var obj = new Object();
	obj.userNumber = userNumber;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/studentMyLecture',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				if($('#MyLectureList')!= null)
					$('#MyLectureList').html(data);
			}
		},
		error:function(){
			alert("Error! studentMyLecture();");
		}
	});
}

function applyLecture(userNumber, lecCode){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.lecCode = lecCode;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/applyLecture',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			studentMyLecture(userNumber);
			studentTimetable(userNumber);
		},
		error:function(){
			alert("Error! applyLecture();");
		}
	});
}

function cancelLecture(userNumber, lecCode){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.lecCode = lecCode;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/cancelLecture',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			/*if(data != null){
				if($('#schoolTimeTable')!= null && $('#MyLectureList')!= null)
					$('#schoolTimeTable').html(data);
					$('#MyLectureList').html(data);
			}*/
			studentMyLecture(userNumber);
			studentTimetable(userNumber);
		},
		error:function(){
			alert("Error! cancelLecture();");
		}
	});
}