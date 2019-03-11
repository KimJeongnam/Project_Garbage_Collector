

function studentBulletinlist(userNumber,page){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/studentBulletinlist',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#bulletinList').html(data);
			}
		},
		error:function(){
			alert("Error! bulletinList();");
		}
	});
}

function studentmanagementlist(userNumber,page){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	/*if($('#bulletinList-year')!=null)
		obj.year = $('#bulletinList-year')[0].value;
	if($('#bulletinList-semester')!=null)
		obj.smester = $('#bulletinList-semester')[0].value;*/
	
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/studentmanagementlist',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#managementlist').html(data);
			}
		},
		error:function(){
			alert("Error! managementList();");
		}
	});
}











//과제 관리
function reportlist(userNumber,lecname){
	var obj = new Object();
	obj.userNumber = userNumber;
	
	
	if($("#mystatus").val() != null){
		obj.select = $("#mystatus").val();
	}
	
	/*if(lecname != ""){
		$("#mystatus").val(lecname);
		$("#mystatus").text(lecname);
		obj.select = lecname
		alert(lecname);
	}*/

	/*if(lecname != null){
		
		obj.select = $("#mystatus").val();
		alert("2번");
	}*/
	
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/reportlist',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#reprotList').html(data);
			}
		},
		error:function(){
			alert("Error! reprotList();");
		}
	});
}



//과제 관리 p_reportlist
function reportcontent(userNumber,reportcode){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.reportcode = reportcode;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/student/reportContent',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#reportcontent').html(data);
			}
		},
		error:function(){
			alert("Error! reprotList();");
		}
	});
}











//과제 관리 
function p_reportlist(userNumber){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.subject = $("#mystatus option:selected").text();
	
	
	if($("#mystatus").val() != null){
		obj.select = $("#mystatus").val();
	}
	
	
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/professor/personnel',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#Personnel').html(data);
			}
		},
		error:function(){
			alert("Error! reprotList();");
		}
	});
}

//과제 추가
function re_contentform(userNumber){
	var obj = new Object();
	obj.userNumber = userNumber;
	
	if($("#mystatus").val() != null){
		obj.select = $("#mystatus").val();
		obj.subject = $("#mystatus option:selected").text();
	}
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/professor/re_contentform',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#re_contentform').html(data);
			}
		},
		error:function(){
			alert("Error! reprotList();");
		}
	});
}

//과제 추가
function report_Personnel2(reportcode,leccode){
	var obj = new Object();
	obj.select = leccode
	obj.reportcode = reportcode;
	
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/professor/report_contentform',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#Personnel2').html(data);
			}
		},
		error:function(){
			alert("Error! reprotList();");
		}
	});
}

//과제 제출 후 화면 단 유지
