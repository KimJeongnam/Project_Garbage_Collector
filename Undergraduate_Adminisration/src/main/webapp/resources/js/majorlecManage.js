
var setFacultys = function(facultys) {
	$('#college').empty();

	$('#college').append($('<option>', {
		value : '0',
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
	
	setMode(arguments[1]);
}

var setMajorCode = function(code) {
	$('#majorCode').val(code);
	$('#majorCode_view').val(code);
}

function openMajorModal(mode) {
	$('#majorName').val('');
	$('#count').val('');
	
	getFacultys(setFacultys, arguments);
		
	$('#majorAdd-Modal').modal();
}

function setMode(args){
	var mode = args[0];
	if (mode == '신규') {
		$('#majorModal-title').html("<h4>학과 등록</h4>");
		$('#majorModalBtn').attr({
			onclick : 'addMajor();',
			value : '등록'
		});
		$('#majorModalDelBtn').attr({
			hidden : true
		})
		getMajorCurrval(setMajorCode);
	} else if (mode == '수정') {
		if(args.length<5){
			alert("Error! Usage: openMajorModal(mode" +
					", majorNum" +
					", faculty" +
					", majorName" +
					", maxNum) ");
			return;
		}
		
		var majorNum = args[1];
		var faculty  = args[2];
		var majorName = args[3];
		var maxNum = args[4];
		
		setMajorCode(majorNum);
		$('#college').val(faculty).prop("selected", true);
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

function addMajor(){
	var faculty = $('#college').val();
	var majorName = $('#majorName').val().trim();
	var maxNum = $('#count').val();
	
	if(faculty == null){
		alert("단과대를 선택해 주세요."); return;
	}else if(majorName.length<1){
		alert("학과명을 입력해 주세요."); return;
	}else if(maxNum.length<1){
		alert("최대 학생수를 입력하세요."); return;
	}	
	
	var obj = new Object();
	obj.faculty = faculty;
	obj.majorName = majorName;
	obj.maxNum = maxNum;
	
	var JsonData = JSON.stringify(obj);
	
	$.ajax({
		url : '/project/admin/major_lecture_Manager/addMajor',
		type : 'POST',
		data : JsonData,
		contentType : 'application/json;charset=utf-8',
		success : function(data){
			if(data.status == 0){
				alert("ERROR! 학과 추가 오류.");
			}else{
				$('#majorAdd-Modal').modal('hide');
				getMajors();
			}
		},
		error : function(){	}
	});
}

function modifyMajor(){
	var majorCode = $('#majorCode').val(code);
	var faculty = $('#college').val();
	var majorName = $('#majorName').val().trim();
	var maxNum = $('#count').val();
	
	var obj = new Object();
	obj.majorCode = $('#majorCode').val(code);
	obj.faculty = faculty;
	obj.majorName = majorName;
	obj.maxNum = maxNum;
	
	var JsonData = JSON.stringify(obj);
	
	$.ajax({
		url : '/project/admin/major_lecture_Manager/modifyMajor',
		type : 'POST',
		data : JsonData,
		contentType : 'application/json;charset=utf-8',
		success : function(data){
			if(data.status == 0){
				alert("ERROR! 학과 추가 오류.");
			}else{
				$('#majorAdd-Modal').modal('hide');
				getMajors();
			}
		},
		error : function(){	}
	});
}