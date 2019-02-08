function getFacultys(callback){
	$.ajax({
		url: '/project/ajax/api/v1.1/getFacultys',
		type: 'GET',
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			callback(data);
		},
		error:function(){
		}
	});
}

function getMajorCurrval(callback){
	$.ajax({
		url : '/project/ajax/api/v1.1/getMajorCurrval',
		type: 'GET',
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			callback(data);
		},
		error:function(){
		}
	});
}