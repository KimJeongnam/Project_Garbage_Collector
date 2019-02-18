function adminregistrationList(userNumber,page){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	if($('#registrationList-year')!=null)
		obj.year = $('#registrationList-year')[0].value;
	if($('#registrationList-semester')!=null)
		obj.smester = $('#registrationList-semester')[0].value;
	
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/admin/resister/adminregistrationList2',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
					$('#registrationList').html(data);
			}
		},
		error:function(){
			alert("Error! registrationList();");
		}
	});
}
	function adminjudgeList(userNumber,page){
		
		var obj = new Object();
		obj.userNumber = userNumber;
		obj.pageNum = page;
		
		if($('#auditList')!=null)
			obj.audit = $('#auditList')[0].value;
		
		
		var jsonData = JSON.stringify(obj);
		
		$.ajax({
			url: '/project/admin/resister/adminjudgeList',
			type: 'POST',
			data : jsonData,
			contentType : 'application/json;charset=UTF-8',
			success : function(data){
				if(data != null){
						$('#judgeList').html(data);
				}
			},
			error:function(){
				alert("Error! registrationList();");
			}
		});
}
