function studentBulletinlist(userNumber,page){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	if($('#bulletinList-year')!=null)
		obj.year = $('#bulletinList-year')[0].value;
	if($('#bulletinList-semester')!=null)
		obj.smester = $('#bulletinList-semester')[0].value;
	
	
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
function reportlist(userNumber){
	var obj = new Object();
	obj.userNumber = userNumber;
	
	if($("#mystatus").val() != null){
		obj.select = $("#mystatus").val();
	}
	
	/*if($("#mystatus option:selected").val() != null){
		obj.select = $("#mystatus option:selected").val();
		alert($("#mystatus").val());
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

//과제 관리
function reportcontent(reportcode){
	var obj = new Object();
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
