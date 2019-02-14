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

function openNewLectureModal(){
	$.ajax({
		url : '/project/admin/major_lecture_Manager/getLectureSeqNextVal',
		type : 'GET',
		success : function(data){
			setLecCode(data.lectureNextVal);
		},
		error : function(){
			alert("강의시간 코드 받아오기 Error!");
		}
	})
	
	$('#lecture-Modal').modal({backdrop:'static', keyboard:false});
}

function setLecCode(leccode){
	$('#lecCode_view').val(leccode);
	$('#lecCode').val(leccode);
}

function openProfessorSelector(){
	var popupX = (window.screen.width / 2) - (800 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (500 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.open('/project/admin/major_lecture_Manager/professorSelector/'
			, '교수 선택'
			, 'status=no, height=500, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}

function openTimeSelector(empNumber){
	var popupX = (window.screen.width / 2) - (1200 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (800 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open('/project/admin/major_lecture_Manager/getEmptyLecTime/'+empNumber
			, '시간 선택'
			, 'status=no, height=800, width=1200, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}

function initTime(){
	for(var key of lectureTimeMap.keys()){
		lectureTimeMap.delete(key);
	}
}

function selectTime(timecode, id){
	if(lectureTimeMap.has(timecode)){
		$('#chk-'+id).empty();
		$('#li-'+id).css("background", "#6fb758");
		lectureTimeMap.delete(timecode);
	}else{
		lectureTimeMap.set(timecode, id);
		$('#chk-'+id).html('선택됨');
		$('#li-'+id).css("background", "#2E9AFE");
	}
}

function setId(id){
	opener.lectureTimeMap = lectureTimeMap;
	// 현재창 닫기
	self.close();
}

function selectLecFaculty(){
	var faculty = $('#lec-facultySelector').val();
	if(faculty == 0){
		$('#lec-majorSelector').empty();
		$('#lec-majorSelector').append($('<option>',{
			value:"0",
			text: "단과대 선택",
			selected: "selected"
		}));
	}
	setLecmajorSelector(faculty);
	getLectureList();
}

function setLecmajorSelector(faculty){
	var obj = new Object();
	
	if(faculty!=0)
		obj.college = faculty;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url : '/project/rest/json/getMajors',
		type : 'POST',
		contentType : 'application/json;charset=utf-8',
		data : jsonData,
		success : function(data){
			if(data != null){
				$('#lec-majorSelector').empty();
				$('#lec-majorSelector').append($('<option>',{
					value:"0",
					text: "전체",
					selected: "selected"
				}));
				for(var i=0; i<data.length; i++){
					$('#lec-majorSelector').append($('<option>',{
						value:data[i].majorNum+"",
						text:data[i].majorName+""
					}));
				}
			}
		},
		error : function(){
			alert("Error! setLecmajorSelector()");
		}
	})
}

// 강의 리스트 조회
function  getLectureList(){
	
	var obj = new Object();
	
	if(arguments.length==1){
		obj.pageNum = arguments[0];
	}
	
	if(typeof $('#lecture-pagesize') != 'undefined')
		obj.pageSize = $('#lecture-pagesize').val();
	
	if(typeof $('#divisionSelector') != 'undefined'){
		if($('#divisionSelector').val() != 'all')
			obj.division = $('#divisionSelector').val();
	}
	
	if(typeof $('#lec-facultySelector') != 'undefined'){
		if($('#lec-facultySelector').val() != 0)
			obj.faculty = $('#lec-facultySelector').val();
	}
	
	if(typeof $('#majorSelector') != 'undefined'){
		if($('#lec-majorSelector').val() != 0)
			obj.major = $('#lec-majorSelector').val();
	}
	
	if(typeof $('#lecture-search-keyword') != 'undefined'){
		if($('#lecture-search-keyword').val().length>0)
			obj.keyword = $('#lecture-search-keyword').val();
	}
		
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url : '/project/admin/major_lecture_Manager/getLectureList',
		type : 'POST',
		contentType : 'application/json;charset=utf-8',
		data : jsonData,
		success : function(data){
			if(data != null)
				$('#lectureList').html(data);
		},
		error : function(){
			alert("Error! getLectureList()");
		}
	});
	
}
