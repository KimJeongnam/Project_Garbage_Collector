

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

// 1초에 한번씩 새로운 메세지가있는지 요청하는 Ajax 
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
					// 읽지 않은 메세지들 오른쪽 위화면에 띄워주기
					showMessages(data.notReadMessages);
					
					// 새 메세지가 있다면
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
		
	if(messages.length==0){
		$('#messageCount').html('<i class="fa fa-envelope-o"></i> ');
	}else
		$('#messageCount').html('<i class="fa fa-envelope-o"></i> <span class="badge bg-green">'+messages.length+'</span>');
	
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
		if(msg.notifyStatus == 0){
			htmlSource += '\
					<li>\
						<a onclick="showMessageInModal('+msg.messageCode+');">\
							<span class="image"><img src="/project/resources/'+msg.senduserimage+'" alt="Profile Image"></span>\
							<b><span>'+msg.sendUser+'</span></b><span class="time">'+timeAgo+'</span>\
							<span class="message">'+msg.message+'</span>\
						</a>\
					</li>\
					';
		}else{
			htmlSource += '\
				<li>\
					<a onclick="showMessageInModal('+msg.messageCode+');">\
						<span class="image"><img src="/project/resources/'+msg.senduserimage+'" alt="Profile Image"></span>\
						<b><span class="fa fa-bullhorn"></span>[공지]&nbsp;<span>'+msg.sendUser+'</span></b><span class="time">'+timeAgo+'</span>\
						<span class="message">'+msg.message+'</span>\
					</a>\
				</li>\
				';
		}
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
	// 메세지 읽으면 readStatus 를 1로 업데이트를 시켜주기 위한 Ajax
	// 업데이트 후 해당 메세지의 정보를 가져와 msgModalSet() 함수에 던진다.
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

function getMessages(userNumber, page){
	var obj = new Object();
	obj.userNumber = userNumber;
	obj.pageNum = page;
	
	if($('#msg-pagesize')!=null)
		obj.pageSize = $('#msg-pagesize')[0].value;
	if($('#msg-search-keyword')[0].value.length > 0){
		obj.keyword = $('#msg-search-keyword')[0].value;
	}
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url: '/project/ajax/api/v1.1/messages/list',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				if($('#messageBoard')!= null)
					$('#messageBoard').html(data);
			}
		},
		error:function(){
			swal({
				text:"Error! getMessages();",
				icon: "error",
				button:"확인",
			});
		}
	});
}

function showMessageInPage(messageCode, userNumber, pageNum){
	var obj = new Object();
	obj.messageCode = messageCode;
	obj.readStatus = 1;
	
	var jsonData = JSON.stringify(obj);
	// 메세지 읽으면 readStatus 를 1로 업데이트를 시켜주기 위한 Ajax
	// 업데이트 후 해당 메세지의 정보를 가져와 msgModalSet() 함수에 던진다.
	$.ajax({
		url: '/project/ajax/api/v1.1/messages/show',
		type: 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data){
			if(data != null){
				$('#show-msg-panel').html(data);
				getMessages(userNumber, pageNum);
			}
		},
		error:function(){
		}
	});
}

function toggleMessageModal(recvUser, sendUser){
	$('#compose-recvUser-view').html(recvUser);
	$('#compose-recvUser').val(recvUser);
	$('#compose-sendUser').val(sendUser);
	$('.compose').slideToggle();
}

function sendMessage(){
	var recvUser = $('#compose-recvUser').val();
	var sendUser = $('#compose-sendUser').val();
	var message = $('#editor').html();
	
	if(recvUser.length<1)
		swal("Error", "recvUser 에러", "error");
	if(message.length<1)
		swal("", "메세지 내용이 비었습니다.", "warning");
	
	var notify = 0;
	if($('#msg-notify').is(":checked")){
		notify = 1;
	}
	
	sendMessageAjax(recvUser, sendUser, message, notify)
}

function sendMessageAjax(recvUser, sendUser, message, notify){
	var obj = new Object();
	obj.recvUser = recvUser;
	obj.sendUser = sendUser;
	obj.message = message;
	obj.notify = notify;
	var jsonData = JSON.stringify(obj);
	$.ajax({
		url:'/project/rest/api/v1.0/messsage/send',
		type:'POST',
		contentType:'application/json;charset=utf-8',
		data:jsonData,
		success:function(data){
			if(data.result!=0){
				swal("Success!", "메세지 전송 성공", "success");
				$('.compose').slideToggle();
			}else{
				swal("Error!", "메세지 전송 실패!!", "error");
				$('.compose').slideToggle();
			}
		},
		error:function(){
			swal("Error!", "sendMessageAjax()", "error");
		},
	})
}
