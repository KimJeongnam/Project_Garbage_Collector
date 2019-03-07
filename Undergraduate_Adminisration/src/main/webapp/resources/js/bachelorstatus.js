function ansycTaskBachelorStatus(){
	setInterval(function(){
		$.ajax({
			url:'/project/share/ajax/getBachelorStatus',
			type:'GET',
			success:function(data){
				if(data != null){
					var bachelorStatus = data.bachelorStatus;
					$('#bachelorstatus-area').html('['+bachelorStatus+']');
				}
			}
		});
	}, 500);
}