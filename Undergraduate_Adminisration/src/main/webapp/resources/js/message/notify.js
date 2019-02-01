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
            title: title,
            text: text,
            type: 'info',
            styling: 'bootstrap3'
        });
	}
}

var messageCount = 0;

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
					// 만약 기존 메세지가 없다면 초기화
					showMessages(data.notReadMessages);
					
					
					// 새 메세지가 있을시.
					notifyMessages(data.newMessages);
					
				},
				error:function(){
				}
			});
		}, 1000);	
	}
}

// 새메세지 알림 표시
function notifyMessages(messages){
	if(messages!=null){
		for(var i=0; i<messages.length; i++){
			notifyMessage(messages[i].sendUser, messages[i].message, messages[i].notifyStatus);
		}
	}
}

// 우측 상단 메세지 표시
function showMessages(messages){
	if(messages == null) return;
/*	if(messageCount == messages.length){
		return;
	}else{
		messageCount = messages.length;
	}*/
		
	
	$('#messageCount').text(messages.length);
	
	$('#messages').html('');
	
	var htmlSource = '';
	
	for(var i=0; i<messages.length; i++){
		var msg = messages[i];
		
		var timeAgo = '';
		
		if(msg.day > 0){
			timeAgo = msg.day+"일 전";
		}else if(msg.hour > 0){
			timeAgo = msg.hour+"시간 전"; 
		}else if(msg.min > 0){
			timeAgo = msg.min+"분 전"; 
		}else if(msg.sec > 0){
			timeAgo = 1+"분 전"; 
		}else{
			timaAgo = '오류';
		}
		
		// showMessageInModal('+msg.messageCode+')
		htmlSource += '\
				<li>\
					<a onclick="showMessageInModal('+msg.messageCode+');">\
						<span class="image"><img src="/project/resources/'+msg.senduserimage+'" alt="Profile Image"></span>\
						<span>'+msg.sendUser+'</span><span class="time">'+timeAgo+'</span>\
						<span class="message">'+msg.message+'</span>\
					</a>\
				</li>\
				';
	}
	$('#messages').html(htmlSource);
}

function testModal(){
	$('#msgModal').modal();
}

function showMessageInModal(messageCode){
	var obj = new Object();
	obj.messageCode = messageCode;
	obj.readStatus = 1;
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/rest/api/v1.0/showMessage',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				msgModalSet(data);
			}
		},
		error:function(){
		}
	});
}

function msgModalSet(msg){
	$('#msgModal-image').html('<img src="/project/resources'+msg.senduserimage+'" alt="..." class="img-circle profile_img">');
	$('#msgModal-sendUser').html('<h4>'+msg.sendUser+'</h4>');
	$('#msgModal-message').html(msg.message);
	var time = msg.sendYear+"년"+msg.sendMonth+"월"+msg.sendDay+"일" +
			" "+msg.sendHour+":"+msg.sendMin+":"+msg.sendSec;
	$('#msgModal-sendTime').html(time);
	$('#msgModal').modal();
}



