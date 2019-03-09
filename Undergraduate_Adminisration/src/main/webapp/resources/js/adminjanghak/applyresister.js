function adminregistrationList(userNumber,page){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	
	
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
	function adminjudgeList(){
		
		var obj = new Object();
	
		if(arguments.length > 0)
		obj.pageNum = arguments[0];
		
		if($('#auditList')!=null)
			if($('#auditList')[0].value != 'all')
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
