<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
		var userNumber = '${userNumber }';
		
		function syncMessage(notReadMsg){
			
		}
		
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
							//alert(data[i].message);
							notifyMessage(newMessages[i].sendUser, newMessages[i].message, 0);
						}
						
					},
					error:function(){
					}
				});
			}, 1000);	
		}
	</script>