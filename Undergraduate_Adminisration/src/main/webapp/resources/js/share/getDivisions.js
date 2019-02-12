function getFacultys(callback){
	var args;
	
	if(arguments.length > 1)
		args = arguments[1];
	
	$.ajax({
		url: '/project/ajax/api/v1.1/getFacultys',
		type: 'GET',
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(arguments.length<2)
				callback(data);
			else 
				callback(data, args);
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