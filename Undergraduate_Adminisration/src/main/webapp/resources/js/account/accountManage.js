function openAccountModal(mode) {
	$('#majorName').val('');
	$('#count').val('');
	
	getFacultys(setFacultys, arguments);
		
	$('#majorAdd-Modal').modal();
}