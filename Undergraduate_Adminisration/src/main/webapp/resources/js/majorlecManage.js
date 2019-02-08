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
		$('#majorModal-title').html("<h4>학과 수정</h4>");
		$('#majorModalBtn').attr({
			onclick : '',
			value : '수정'
		});
		$('#majorModalDelBtn').attr({
			hidden : false
		})
		var majorNum = arguments[1];
		var faculty  = arguments[2];
		var majorName = arguments[3];
		var maxNum = arguments[4];
		
		setMajorCode(majorNum);
		$('#college').val(faculty);
		$('#majorName').val(majorName);
		$('#count').val(maxNum);
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
		url : '/project/admin/getMajors',
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
