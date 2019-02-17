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
