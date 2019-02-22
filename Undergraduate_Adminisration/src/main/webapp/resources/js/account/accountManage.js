//전체선택 체크박스 클릭 
$("#allCheck1").click(function() {
	// 만약 전체 선택 체크박스가 체크된상태일경우
	if ($("#allCheck1").prop("checked")) {
		// 해당화면에 전체 checkbox들을 체크해준다
		$(".checkbox1").prop("checked", true);
		// 전체선택 체크박스가 해제된 경우
	} else {
		// 해당화면에 모든 checkbox들의 체크를해제시킨다.
		$(".checkbox1").prop("checked", false);
	}
})

// 전체선택 체크박스 클릭
$("#allCheck2").click(function() {
	// 만약 전체 선택 체크박스가 체크된상태일경우
	if ($("#allCheck2").prop("checked")) {
		// 해당화면에 전체 checkbox들을 체크해준다
		$(".checkbox2").prop("checked", true);
		// 전체선택 체크박스가 해제된 경우
	} else {
		// 해당화면에 모든 checkbox들의 체크를해제시킨다.
		$(".checkbox2").prop("checked", false);
	}
})

function fixSetting() {
	var worktime = $("#worktime").get(0).value;
	for (var i = 0; i < $(".checkbox1").size(); i++) {
		if ($(".checkbox1")[i].checked) {
			$(".checkboxResult" + i).val(worktime)
		}
	}
}
function fixSetting2() {
	var payamount = $("#payamount").get(0).value;
	for (var i = 0; i < $(".checkbox2").size(); i++) {
		if ($(".checkbox2")[i].checked) {
			if ($("#kindsofpay").val() == '기본급') {
				$(".basicPay" + i).val(payamount)
			}
			if ($("#kindsofpay").val() == '추가근무수당') {
				$(".extraPay" + i).val(payamount)
			}
			if ($("#kindsofpay").val() == '식대') {
				$(".foodExpenses" + i).val(payamount)
			}
			if ($("#kindsofpay").val() == '차량유지비') {
				$(".vehicleCost" + i).val(payamount)
			}
		}
	}
}

function saveOverTime() {
	var listObj = new Array();
	for (var i = 0; i < $('input[name=overtime]').size(); i++) {
		var obj = new Object();
		obj.overtime = $('input[name=overtime]')[i].value;
		obj.empNumber = $('input[name=empNumber]')[i].value;
		listObj.push(obj);
		//listObj.obj = obj;
	}
	var jsonData = JSON.stringify(listObj);
	$.ajax({
		url : '/project/admin/ConfirmationWorkRecord',
		type : 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data) {
			if (data.message != null) {
				swal({
					text : data.message,
					icon : "success",
					button : "확인",
				});
			}
		},
		error : function() {
			alert("Error! ConfirmationWorkRecord();");
		}
	});
}

function SaveEnterAmountManually() {
	var listObj = new Array();
	for (var i = 0; i < $('input[name=basicPay]').size(); i++) {
		var obj = new Object();
		
		
		
		
		var basicPay = $('input[name=basicPay]')[i].value.replace(/\,/g,'');
		var extraPay = $('input[name=extraPay]')[i].value.replace(/\,/g,'');
		var foodExpenses = $('input[name=foodExpenses]')[i].value.replace(/\,/g,'');
		var vehicleCost = $('input[name=vehicleCost]')[i].value.replace(/\,/g,'');
		
		obj.basicPay = Number(basicPay);
		obj.extraPay = Number(extraPay);
		obj.foodExpenses = Number(foodExpenses);
		obj.vehicleCost = Number(vehicleCost);
		obj.empNumber = $('input[name=empNumber]')[i].value;
		listObj.push(obj);
	}
	var jsonData = JSON.stringify(listObj);
	$.ajax({
		url : '/project/admin/SaveEnterAmountManually',
		type : 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data) {
			if (data.message != null) {
				swal({
					text : data.message,
					icon : "success",
					button : "확인",
				});
			}
		},
		error : function() {
			alert("Error! SaveEnterAmountManually();");
		}
	});
}
$("#Confirm").click(
		function() {
			var tdArr = new Array(); // 배열 선언

			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();

			// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			// td.eq(index)를 통해 값을 가져올 수도 있다.
			var imputedYear = td.eq(0).text();
			var paymentClassfication = td.eq(1).text();

			if (confirm(imputedYear + paymentClassfication
					+ "를 확정처리하겠습니까?\n확정처리된 급여는 수정/삭제할 수 없습니다.")) {
			} else {
			}

		});
function Delete() {
	var texto1 = $(this).parent().children().eq(0).text();
	var texto2 = $(this).parent().children().eq(1).text();
	if (confirm(texto1 + texto2 + "가 전체 삭제됩니다.\n삭제하겠습니까?")) {
	} else {
	}
}

function calcTotalTable() {
	var total = 0;
	$('.totalPayment').each(function() {
		// add some validation
		total += $j(this).val();
	});

	$('#total').val(total);
}
// 콤마찍기
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마풀기
function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

// 값 입력시 콤마찍기
function AutoComma(obj) {
	obj.value = comma(uncomma(obj.value));
}

function openAccountModal(button, imputedYear) {
	if (button == '근무기록확정') {
		var obj = new Object();
		obj.imputedYear = imputedYear;

		var jsonData = JSON.stringify(obj);

		$.ajax({
			url : '/project/admin/ConfirmOvertime',
			type : 'POST',
			data : jsonData,
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
				if (data != null) {
					if ($('#ConfirmOvertime') != null)
						var table = $('#datatable').DataTable({
							retrieve : true,
							paging : false
						});
					table.clear()
					$('#ConfirmOvertime').html(data);
				}
			},
			error : function() {
				alert("Error! ConfirmOvertime();");
			}
		});
	}
	;

	if (button == '금액직접입력') {
		var obj = new Object();
		obj.imputedYear = imputedYear;

		var jsonData = JSON.stringify(obj);

		$.ajax({
			url : '/project/admin/EnterAmountManually',
			type : 'POST',
			data : jsonData,
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
				if (data != null) {
					if ($('#EnterAmountManuallyList') != null)
						var table = $('#datatable-fixed-header').DataTable({
							retrieve : true,
							paging : false
						});
					table.clear()
					$('#EnterAmountManuallyList').html(data);
				}
			},
			error : function() {
				alert("Error! EnterAmountManually();");
			}
		});
	}
	;
	if (button == '조회') {
		var obj = new Object();
		obj.imputedYear = imputedYear;

		var jsonData = JSON.stringify(obj);

		$.ajax({
			url : '/project/admin/LookupWorkRecord',
			type : 'POST',
			data : jsonData,
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
				if (data != null) {
					if ($('#LookupWorkRecordList') != null)
						var table = $('#datatable-buttons').DataTable({
							retrieve : true,
							paging : false
						});
					table.clear()
					$('#LookupWorkRecordList').html(data);
				}
			},
			error : function() {
				alert("Error! LookupWorkRecord();");
			}
		});

	}
	;
}

function resetOverTime() {
	$('#overtimeForm').find('input').val('');
}

function ResetSaveEnterAmountManually() {
	$('#"SaveEnterAmountManuallyForm"').find('input').val('');
}

function CopyPayroll() {
	var obj = new Object();
	obj.copyPayrollFrom = $("#copyPayrollFrom").val();
	obj.copyPayrollTo = $("#copyPayrollTo").val();
	
	var jsonData = JSON.stringify(obj);
	
	$.ajax({
		url : '/project/admin/LookupWorkRecord',
		type : 'POST',
		data : jsonData,
		contentType : 'application/json;charset=UTF-8',
		success : function(data) {
			if (data != null) {
				if ($('#LookupWorkRecordList') != null)
					var table = $('#datatable-buttons').DataTable({
						retrieve : true,
						paging : false
					});
				table.clear()
				$('#LookupWorkRecordList').html(data);
			}
		},
		error : function() {
			alert("Error! LookupWorkRecord();");
		}
	});
	
}