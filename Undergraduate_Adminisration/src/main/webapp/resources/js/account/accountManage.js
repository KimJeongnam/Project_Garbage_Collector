function lookupWorkRecord(imputedYear){
	var obj = new Object();
	obj.imputedYear = imputedYear;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/admin/lookupWorkRecord',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				if($('#lookupWorkRecord')!= null){
					$('#lookupWorkRecord').html(data);
				}
			}
		},
		error:function(){
			alert("Error! lookupWorkRecord();");
		}
	});
}

function facultyMajorConfirmation(){
	var obj = new Object();
	
	if($('#faculty-major-confirmation')!=null)
		if(!($('#faculty-major-confirmation')[0].value == 0))
			obj.confirmation = $('#faculty-major-confirmation')[0].value;
	
	/*if($('#faculty-major-insert')!=null)
		if(!($('#faculty-major-insert')[0].value == 0))
			obj.insert = $('#faculty-major-insert')[0].value;*/
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/admin/facultyMajorConfirmation',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				if($('#facultyMajorConfirmation')!= null){
					$('#facultyMajorConfirmation').html(data);
				}
			}
		},
		error:function(){
			alert("Error! lookupWorkRecord();");
		}
	});
}