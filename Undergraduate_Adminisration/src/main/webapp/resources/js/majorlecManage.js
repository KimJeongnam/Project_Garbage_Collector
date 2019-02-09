var setFacultys = function(facultys) {
	$('#college').empty();

	$('#college').append($('<option>', {
		text : '선택하세요',
		disabled : 'disabled',
		selected : 'selected'
	}));

	for (var i = 0; i < facultys.length; i++) {
		$('#college').append($('<option>', {
			value : facultys[i],
			text : facultys[i]
		}));
	}
}

var setMajorCode = function(code) {
	$('#majorCode').val(code);
	$('#majorCode_view').val(code);
}

function openMajorModal(mode) {
	$('#majorName').val('');
	$('#count').val('');
	getFacultys(setFacultys);
	
	if (mode == '신규') {
		$('#majorModal-title').html("<h4>학과 등록</h4>");
		$('#majorModalBtn').attr({
			onclick : '',
			value : '등록'
		});
		$('#majorModalDelBtn').attr({
			hidden : true
		})
		getMajorCurrval(setMajorCode);
	} else if (mode == '수정') {
		if(arguments.length<5){
			alert("Error! Usage: openMajorModal(mode" +
					", majorNum" +
					", faculty" +
					", majorName" +
					", maxNum) ");
			return;
		}
		
		var majorNum = arguments[1];
		var faculty  = arguments[2];
		var majorName = arguments[3];
		var maxNum = arguments[4];
		
		setMajorCode(majorNum);
		$('#college').val(faculty);
		$('#majorName').val(majorName);
		$('#count').val(maxNum);
		
		$('#majorModal-title').html("<h4>학과 수정</h4>");
		$('#majorModalBtn').attr({
			onclick : '',
			value : '수정'
		});
		$('#majorModalDelBtn').attr({
			onclick : "deleteMajor('"+majorNum+"');",
			hidden : false
		})
	}
	
	
	
	$('#majorAdd-Modal').modal();
}

function getMajors() {
	var college = $('#collegeSelector').val();

	var obj = new Object();

	if (college != 0) {
		obj.college = college;
	}

	var JsonData = JSON.stringify(obj);

	$.ajax({
		url : '/project/admin/major_lecture_Manager/getMajors',
		type : 'POST',
		data : JsonData,
		contentType : 'application/json;charset=utf-8',
		success : function(data) {
			if (data != null)
				$('#majorList').html(data);
		},
		error : function() {

		}
	});
}

function deleteMajor(majorNum){
	var obj = new Object();
	
	obj.majorNum = majorNum;
	
	var JsonData = JSON.stringify(obj);
	
	$.ajax({
		url : '/project/admin//major_lecture_Manager/ajax/deleteMajor',
		type : 'POST',
		data : JsonData,
		contentType : 'application/json;charset=utf-8',
		success : function(data){
			if(data.status == 'fail'){
				alert("ERROR! 삭제 실패");
			}else{
				$('#majorAdd-Modal').modal('hide');
				getMajors();
			}
		},
		error : function(){	}
	});
}

function getLectureList(){
	
	$.ajax({
		url : '/project/ajax/v1.0/deleteMajor',
		type : 'POST',
		data : JsonData,
		contentType : 'application/json;charset=utf-8',
		success : function(data){
			if(data.status == 'fail'){
				alert("ERROR! 삭제 실패");
			}else{
				$('#majorAdd-Modal').modal('hide');
				getMajors();
			}
		},
		error : function(){	}
	});
}
