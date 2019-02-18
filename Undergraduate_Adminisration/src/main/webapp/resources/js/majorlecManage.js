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

//-----------------강의선택--------------
/*
 * 강의 시간을 컨트롤 할수있도록하는 Map Object 타입의 변수로서
 * 자식창(강의 시간선택창)에서 선택한 값들을 lectureTimeMap에 세팅하고 
 * 선택된 값들을
 * 부모창의 lectureTimeMap에 넘겨받는 역할을 함
 */
var lectureTimeMap = new Map();  //선택된 강의 시간

/*
 * 강의 시간 선택 창 open
 */
function openTimeSelector(empNumber){
	var popupX = (window.screen.width / 2) - (1200 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (1000 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	window.open('/project/admin/major_lecture_Manager/getEmptyLecTime/'+empNumber
			, '시간 선택'
			, 'status=no, height=1000, width=1200, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}

// 선택한 시간 map 클리어
function initTime(){
	lectureTimeMap.clear();
}
/*
 *  시간을 선택할시 발동하는 이벤트 함수 (toggle)
 *  ( '시간코드', '선택된 div의 id 값', '요일', '교시')
 *  토글 방식으로 lectureTimeMap에 값이 없다면 
 *  시간코드를 key로 id(div), 요일, 교시를 Object 타입인 value로 
 *  맵에 세팅하고  id의 속성(배경색, 텍스트) 값을 선택으로 세팅하며.
 *   이미 선택했던 시간이면 map에서 해당 시간 코드를 삭제하며
 *  id의 속성(배경색, 텍스트)를 초기화 시킨다.
 */ 
function selectTime(timecode, id, lectureDay, classTime){
	if(lectureTimeMap.has(timecode)){
		$('#chk-'+id).empty();
		$('#li-'+id).css("background", "#6fb758");
		lectureTimeMap.delete(timecode);
	}else{
		var obj = new Object();
		obj.id = id;
		obj.lectureDay = lectureDay;
		obj.classTime = classTime;
		lectureTimeMap.set(timecode, obj);
		$('#chk-'+id).html('선택됨');
		$('#li-'+id).css("background", "#2E9AFE");
	}
}
/*
 * 강의 시간을 선택후 확인버튼 클릭시 발동하는이벤트 함수
 * 선택한 강의시간 데이터들을 정렬 및 가공하여  opener 의 classTimeButton 에 
 * 값을 세팅하고 opener 의 lectureTimeMap에 선택한 강의의 정보들을 넘긴다.
 */
function selectTimeDo(){
	if(lectureTimeMap.size==0) self.close();
	opener.lectureTimeMap = lectureTimeMap;
	var classTimes = '';
	var ids = [];

	for(var key of lectureTimeMap.keys()){
		ids.push(key);
	}
	ids.sort(function(a,b){
		return a-b;
	})
	
	var day = 999;
	var str = '';
	ids.forEach(function(key){
		var obj = lectureTimeMap.get(key);
		
		if(day != Math.floor((key/10))){
			if(str.length>0) str += "], ";
			day = Math.floor((key/10));
			str += obj.lectureDay;
			str += "["+obj.classTime;
		}else
			str += ","+obj.classTime;
			
	});
	str += "]";
	
	$(opener.document).find("#classTimeButton").val(str);
	$(opener.document).find("#classTimeButton").attr("class", "form-control btn btn-success col-md-7 col-xs-12");
	// 현재창 닫기
	self.close();
}
//-----------------강의선택END--------------


// 강의 신규 모달창 열기 ( 새로운 강의를 만들기에 강의코드 다음 시퀀스값을 받아오는 ajax )
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

// 강의 코드 셋
function setLecCode(leccode){
	$('#lecCode_view').val(leccode);
	$('#lecCode').val(leccode);
}

// 교수 선택창 오픈
function openProfessorSelector(){
	var popupX = (window.screen.width / 2) - (1000 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (1000 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.open('/project/admin/major_lecture_Manager/professorSelector/'
			, '교수 선택'
			, 'status=no, height=1000, width=1000, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}

/*
 *  강의 모달창에서 단과대 선택시 발동하는 이벤트
 *  해당 단과대의 학과를 조회하고 학과 select 에 옵션을 세팅한 후 
 *  강의 목록을 다시 조회
 */
function selectLecFaculty(){
	var faculty = $('#lec-facultySelector').val();
	if(faculty == 0){
		$('#lec-majorSelector').empty();
		$('#lec-majorSelector').append($('<option>',{
			value:"0",
			text: "단과대 선택",
			selected: "selected"
		}));
	}else{
		setLecmajorSelector(faculty);
	}
	getLectureList();
}

/*
 * 단과대명을 인수로 받으며 해당 단과대의 학과들을 조회하여
 * 강의 모달창의 학과select에 세팅하는 메소드
 */
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
	});
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

// 교수 리스트 조회
function professorList(){
	
	var obj = new Object();
	
	obj.pageSize = 5;
	
	if(arguments.length==1){
		obj.pageNum = arguments[0];
	}
	
	if($('#pro-faculty-selector').val() != 0)
		obj.faculty = $('#pro-faculty-selector').val();
	
	if($('#pro-major-selector').val() != 0)
		obj.majorNum = $('#pro-major-selector').val();
	
	if($('#pro-search').val().length >0)
		obj.keyword = $('#pro-search').val();
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url : '/project/admin/major_lecture_Manager/getProfessorList',
		type : 'POST',
		contentType : 'application/json;charset=utf-8',
		data : jsonData,
		success : function(data){
			if(data != null)
				$('#professorList').html(data);
		},
		error : function(){ alert("Error : professorList()"); }
	})
}

// 콜백 함수 단과대 조회 ajax 후 해당 select 에 option 을 세팅하는 함수들------START
var init_collegeSelector = function(facultys) {
	for (var i = 0; i < facultys.length; i++)
		$('#collegeSelector').append($('<option>', {
			value : facultys[i],
			text : facultys[i]
		}));
}
var init_lec_facultySelector = function(facultys){
	for (var i = 0; i < facultys.length; i++)
		$('#lec-facultySelector').append($('<option>', {
			value : facultys[i],
			text : facultys[i]
		}));
} 
function init_pro_faculty_selector(facultys){
	var select = $('#pro-faculty-selector');
	
	for(var i=0; i<facultys.length; i++){
		select.append($('<option>', {
			value : facultys[i],
			text : facultys[i]
		}));
	}
}
//콜백 함수 단과대 조회 ajax 후 해당 select 에 option 을 세팅하는 함수들-----END


/*
 * 교수 선택 창의 단과대 select 선택시 동작하는 함수
 * 전체 선택일때는 학과 조회 생략 후 교수 조회 호출
 * 단과대를 선택했을 경우 해당 단과대의 학과들을 조회후 교수선택 창의 학과 선택 select 에
 * option을 세팅 하고 교수리스트를 조회함
 */ 
function selectProFaculty(){
	var faculty = $('#pro-faculty-selector').val();
	if(faculty == 0){
		$('#pro-major-selector').empty();
		$('#pro-major-selector').append($('<option>',{
			value:"0",
			text: "단과대 선택",
			selected: "selected"
		}));
	}else{
		setProMajorSelector(faculty);
	}
	professorList();
}
/*
 * 교수 선택창의 학과 select
 * 단과대를 매개변수로 받으며 해당 단과대의 학과들을 조회한 후 학과select에 option 세팅 함
 */
function setProMajorSelector(faculty){
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
				$('#pro-major-selector').empty();
				$('#pro-major-selector').append($('<option>',{
					value:"0",
					text: "전체",
					selected: "selected"
				}));
				for(var i=0; i<data.length; i++){
					$('#pro-major-selector').append($('<option>',{
						value:data[i].majorNum,
						text:data[i].majorName
					}));
				}
			}
		},
		error : function(){
			alert("Error! setLecmajorSelector()");
		}
	});
}
// 강의 모달창 초기화 함수
function initLectureModal(){
	initTime();				// 선택한 강의 시간을 초기화함
	$('#majorNum').val('');
	$('#lecCode').val('');
	$('#empNumberButton').val('선택 하세요.');
	$('#empNumberButton').attr("class", "form-control btn btn-warning col-md-7 col-xs-12")
	$('#empNumber').val('');
	$('#grade').val('1');
	$('#grantedSemester').val('1');
	$('#classRoom').val('');
	$('#classTimeButton').val('교수를 선택하세요.');
	$('#classTimeButton').attr("class", "form-control btn btn-default col-md-7 col-xs-12");
	$('#classTimeButton').attr("disabled", "disabled");
	$('#lectureClassfication').val("선택");
	$('#lectureName').val("");
	$('#lectureScore').val("1");
	$('#maximumcapacity').val("");
}
