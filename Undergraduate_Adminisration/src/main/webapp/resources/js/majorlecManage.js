// 단과대 세팅
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

// 강의 코드 세팅
var setMajorCode = function(code) {
	$('#majorCode').val(code);
	$('#majorCode_view').val(code);
}

// 학과 신규, 수정 모달 열었을대
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
			onclick : 'modifyMajor();',
			value : '수정'
		});
		$('#majorModalDelBtn').attr({
			onclick : "deleteMajor('"+majorNum+"');",
			hidden : false
		})
	}
}
// 학과 조회
function getMajors() {
	var college = $('#collegeSelector').val();
	var pageSize = $('#major-pagesize').val();
	var keyword = $('#major-search-keyword').val().trim();
	
	var obj = new Object();
	obj.pageSize = pageSize;
	
	if(keyword.length>0)
		obj.keyword = keyword;
	
	if(arguments.length==1)
		obj.pageNum = arguments[0];
	else
		obj.pageNum = 1;

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
	
	var pageNum = $('#majorPageNum').val();
	
	if(!confirm("학과 '폐지' 하시겠습니까?")) return;
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
				getMajors(pageNum);
			}
		},
		error : function(){	}
	});
}

function addMajor(){
	var faculty = $('#college').val();
	var majorName = $('#majorName').val().trim();
	var maxNum = $('#count').val();
	
	var pageNum = $('#majorPageNum').val();
	
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
				getMajors(pageNum);
			}
		},
		error : function(){	}
	});
}

function modifyMajor(){
	var majorNum = $('#majorCode').val();
	var faculty = $('#college').val();
	var majorName = $('#majorName').val().trim();
	var maxNum = $('#count').val();
	
	var pageNum = null;
	
	if($('#majorPageNum').val().length>0)
		pageNum = $('#majorPageNum').val();
	
	if(!confirm("학과 '수정' 하시겠습니까?")) return;
	
	if(faculty == null){
		alert("Error 단과대를 선택해 주세요."); return;
	}else if(majorName.length<1){
		alert("Error 학과명을 입력해 주세요."); return;
	}else if(maxNum.length<1){
		alert("Error 최대 학생수를 입력하세요."); return;
	}
	
	var obj = new Object();
	obj.majorNum = majorNum;
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
				alert("ERROR! 학과 수정 오류.");
			}else{
				$('#majorAdd-Modal').modal('hide');
				getMajors(pageNum);
			}
		},
		error : function(){	}
	});
}

//=============== 강의 관리 =============================

var lectureTimeMap = new Map();  //선택된 강의 시간


function openTimeSelector(empNumber){
	var popupX = (window.screen.width / 2) - (200 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (300 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open('/project/admin/major_lecture_Manager/getEmptyLecTime/'+empNumber
			, '시간 선택'
			, 'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}

function initTime(){
	for(var key of lectureTimeMap.keys()){
		lectureTimeMap.delete(key);
	}
}

function selectTime(timecode, id){
	if(lectureTimeMap.has(timecode)){
		$('#chk-'+id).empty();
		$('#li-'+id).css("background", "#d46a6a");
		lectureTimeMap.delete(timecode);
		Schedulereflash();
	}else{
		lectureTimeMap.set(timecode, id);
		$('#chk-'+id).html('선택됨');
		$('#li-'+id).css("background", "#2E9AFE");
		Schedulereflash();
	}
}

function setId(id){
	opener.lectureTimeMap = lectureTimeMap;
	// 현재창 닫기
	self.close();
}
