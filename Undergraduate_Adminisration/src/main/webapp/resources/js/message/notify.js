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
