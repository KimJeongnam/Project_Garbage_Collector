function studentLecture(userNumber, page){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	
	if($('#lectureList-pagesize')!=null)
		obj.pageSize = $('#lectureList-pagesize')[0].value;
	if($('#lectureList-search-keyword')[0].value.length > 0){
		obj.keyword = $('#lectureList-search-keyword')[0].value;
	}
	
	if($('#lectureList-major')!=null)
		if(!($('#lectureList-major')[0].value == 0))
			obj.major = $('#lectureList-major')[0].value;
	if($('#lectureList-classification')!=null)
		if(!($('#lectureList-classification')[0].value == 0))
			obj.classification = $('#lectureList-classification')[0].value;
	if($('#lectureList-grade')!=null)
		if(!($('#lectureList-grade')[0].value == 0))
			obj.grade = $('#lectureList-grade')[0].value;
	
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
				if($('#schoolTimeTable')!= null){
					$('#schoolTimeTable').empty();
					$('#schoolTimeTable').html(data);
					setTimeout(function(){
						schedules.each(function(){
							// create SchedulePlan objects
							objSchedulesPlan.push(new SchedulePlan($(this)));
						});
				}, 100);
				}
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
			/*alert("Error! studentMyLecture();");*/
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
			if(data.message != null){
				swal({
					text:data.message,
					icon: "error",
					button:"확인",
				});
				//alert(data.message);
				//return;
			}
			studentLecture(userNumber,1);
			studentMyLecture(userNumber);
			studentTimetable(userNumber);
		},
		error:function(){
			alert("Error! applyLecture();");
		}
	});
}

function cancelLecture(userNumber, infoCode){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.infoCode = infoCode;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/cancelLecture',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data.message != null){
				alert(data.message);
				return;
			}
			studentLecture(userNumber,1);
			studentMyLecture(userNumber);
			studentTimetable(userNumber);
		},
		error:function(){
			swal({
				text:"학점입력이 되어있는 강의는 수강취소가 불가능 합니다.",
				icon: "error",
				button:"확인",
			});
		}
	});
}