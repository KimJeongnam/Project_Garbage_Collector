function notifyMessage(title, text, important){
	if(important == 0){
		new PNotify({
	        title: title,
	        text: text,
	        type: 'success',
	        styling: 'bootstrap3'
	    });
	}else{
		new PNotify({
            title: 'Sticky Info',
            text: 'Sticky Info... I\'m not even gonna make a joke.',
            type: 'info',
            hide: false,
            styling: 'bootstrap3'
        });
	}
}

var userNumber = '${userNumber }';

function ansycTaskMessage(userNumber){
	if(userNumber.length!=0){
		setInterval(function(){
			var obj = new Object();
			obj.userNumber = userNumber;
			
			var jsonData = JSON.stringify(obj);
			
			$.ajax({
				url: '/project/rest/api/v1.0/messages',
				type: 'POST',
				data : jsonData,
				contentType : 'application/json;charset=UTF-8',
				success : function(data){
					var newMessages = data.newMessages;
					var notReadMessages = data.notReadMessages;
					
					for(var i=0; i<newMessages.length; i++){
						notifyMessage(newMessages[i].sendUser, newMessages[i].message, 0);
					}
					
				},
				error:function(){
				}
			});
		}, 1000);	
	}
}
