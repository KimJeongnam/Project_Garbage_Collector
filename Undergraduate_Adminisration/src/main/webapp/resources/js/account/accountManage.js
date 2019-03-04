var imputed_Year = '';
var PayrollStatus = '';
// 전체선택 체크박스 클릭
/*$("#allCheck1").click(function() {
	// 만약 전체 선택 체크박스가 체크된상태일경우
	if ($("#allCheck1").prop("checked")) {
		// 해당화면에 전체 checkbox들을 체크해준다
		$(".checkbox1").prop("checked", true);
		// 전체선택 체크박스가 해제된 경우
	} else {
		// 해당화면에 모든 checkbox들의 체크를해제시킨다.
		$(".checkbox1").prop("checked", false);
	}
})*/

/*function allCheck1_event(){
	// 만약 전체 선택 체크박스가 체크된상태일경우
	if ($("#allCheck1").prop("checked")) {
		// 해당화면에 전체 checkbox들을 체크해준다
		$(".checkbox1 flat").prop("checked", true);
		// 전체선택 체크박스가 해제된 경우
	} else {
		// 해당화면에 모든 checkbox들의 체크를해제시킨다.
		$(".checkbox1 flat").prop("checked", false);
	}
}*/
$("#allCheck1").click(function () {
    $(".checkbox1 flat").prop('checked', $(this).prop('checked'));
});

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

function allCheck2_event(){
	// 만약 전체 선택 체크박스가 체크된상태일경우
	if ($("#allCheck2").prop("checked")) {
		// 해당화면에 전체 checkbox들을 체크해준다
		$(".checkbox2").prop("checked", true);
		// 전체선택 체크박스가 해제된 경우
	} else {
		// 해당화면에 모든 checkbox들의 체크를해제시킨다.
		$(".checkbox2").prop("checked", false);
	}
}

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
		obj.imputedYear = imputed_Year;
		listObj.push(obj);
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
				window.location.reload();
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

		var basicPay = $('input[name=basicPay]')[i].value.replace(/\,/g, '');
		var extraPay = $('input[name=extraPay]')[i].value.replace(/\,/g, '');
		var foodExpenses = $('input[name=foodExpenses]')[i].value.replace(
				/\,/g, '');
		var vehicleCost = $('input[name=vehicleCost]')[i].value.replace(/\,/g,
				'');

		obj.basicPay = Number(basicPay);
		obj.extraPay = Number(extraPay);
		obj.foodExpenses = Number(foodExpenses);
		obj.vehicleCost = Number(vehicleCost);
		obj.empNumber = $('input[name=empNumber]')[i].value;
		obj.imputedYear = imputed_Year;
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
				window.location.reload();
			}
		},
		error : function() {
			alert("Error! SaveEnterAmountManually();");
		}
	});
}
function Confirm(imputedYear, paymentClassfication) {
	var obj = new Object();

	obj.imputedYear = imputedYear;
	obj.paymentClassfication = paymentClassfication;
	
	var jsonData = JSON.stringify(obj);
	swal({
		text: "'" + obj.imputedYear + obj.paymentClassfication + "'를 확정처리하겠습니까?\n확정처리된 급여는 수정/삭제할 수 없습니다.",
		type: "info",
		buttons: {
			ok: {
				text: "확인",
				value: true,
				visible: true,
			},
			cancel: {
				text: "취소",
				value: false,
				visible: true,
			}
		},
	}).then((value) => {
		if (value) {
			$.ajax({
				url : '/project/admin/ConfirmPayroll',
				type : 'POST',
				data : jsonData,
				contentType : 'application/json;charset=UTF-8',
				success : function(data) {
					console.log(data);
					swal({
						text : data.message,
						icon : "success",
						button : "확인",
						value: true,
						visible: true,
					}).then((value) => {
						location.reload();
					});
				},
				error : function() {
					swal({
						text: "Error! ConfirmPayroll();",
						icon: "error",
						button: "확인",
					})
				}
			});
		}
	})
} 
function Delete(imputedYear, paymentClassfication) {
	var obj = new Object();

	obj.imputedYear = imputedYear;
	obj.paymentClassfication = paymentClassfication;
	
	var jsonData = JSON.stringify(obj);
	swal({
		text: "'" + obj.imputedYear + obj.paymentClassfication + "'가 전체 삭제됩니다.\n삭제하겠습니까?",
		type: "warning",
		buttons: {
			ok: {
				text: "확인",
				value: true,
				visible: true,
			},
			cancel: {
				text: "취소",
				value: false,
				visible: true,
			}
		},
	}).then((value) => {
		if (value) {
			$.ajax({
				url : '/project/admin/DeletePayroll',
				type : 'POST',
				data : jsonData,
				contentType : 'application/json;charset=UTF-8',
				success : function(data) {
					console.log(data);
					swal({
						text : data.message,
						icon : "success",
						button : "확인",
						value: true,
						visible: true,
					}).then((value) => {
						location.reload();
					});
				},
				error : function() {
					swal({
						text: "Error! ConfirmPayroll();",
						icon: "error",
						button: "확인",
					})
				}
			});
		}
	})
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

function openAccountModal(button, imputedYear,status) {
	if (button == '근무기록확정') {
		var obj = new Object();
		obj.imputedYear = imputedYear;
		obj.payrollStatus = status;
		/*
		 * if($('#PayrollStatus')!=null) obj.PayrollStatus =
		 * $('#PayrollStatus')[0].value;
		 */
		// $('input[name=PayrollStatus]').value
		// $('input[name=PayrollStatus]').value;
		var jsonData = JSON.stringify(obj);
		
		$.ajax({
			url : '/project/admin/ConfirmOvertime',
			type : 'POST',
			data : jsonData,
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
				if (data != null) {
					/*
					 * if ($('#ConfirmOvertime') != null) var table =
					 * $('#datatable').DataTable({ retrieve : true, paging :
					 * false }); table.clear()
					 */
					/*PayrollStatus = status;*/
					imputed_Year = imputedYear;
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
					imputed_Year = imputedYear;
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

function InsertPayroll() {
	var obj = new Object();
	obj.imputedYear = $("#imputedYear").val() + "/" + $("#imputedMonth").val();
	obj.paymentClassfication = $("#paymentClassfication").val();
	obj.beginningPeriod = $("#beginningPeriod").val();
	obj.endPeriod = $("#endPeriod").val();
	obj.paymentDate = $("#paymentDate").val();
	obj.paymentYear = $("#paymentYear").val() + "/" + $("#paymentMonth").val();
	obj.registerName = $("#registerName").val();

	var jsonData = JSON.stringify(obj);

	$.ajax({
		url : '/project/admin/insertPayroll',
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
				window.location.reload();
			}
		},
		error : function() {
			alert("Error! insertPayroll();");
		}
	});
}

function CopyPayroll() {
	var obj = new Object();
	obj.copyPayrollFrom = $("#copyPayrollFrom").val();
	obj.copyPayrollTo = $("#copyPayrollTo").val();

	var jsonData = JSON.stringify(obj);

	$.ajax({
		url : '/project/admin/CopyPayroll',
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
				window.location.reload();
			}
		},
		error : function() {
			alert("Error! LookupWorkRecord();");
		}
	});
}

function autoComplete() {
	var AutoImputedYear = $('#imputedYear').val();
	var AutoImputedMonth = $('#imputedMonth').val();
	var AutoPaymentClassfication = $('#paymentClassfication').val();
	var date = new Date(AutoImputedYear+"-"+AutoImputedMonth+"-01");
	var lastDay = ( new Date( AutoImputedYear, AutoImputedMonth, 0) ).getDate();

	var year = date.getFullYear();
	var month = date.getMonth();
	var nextmonth = date.getMonth() + 2;
	var day = date.getDay();
	
	if(nextmonth < 10) {
		nextmonth = "0" + nextmonth;
	}
	if(day < 10) {
		day="0" +day;
	}
	
	$("#beginningPeriod").val(AutoImputedYear+"-"+AutoImputedMonth+"-"+"01");
	$("#endPeriod").val(AutoImputedYear+"-"+AutoImputedMonth+"-"+lastDay);
	$("#paymentDate").val(date.getFullYear()+"-"+nextmonth + "-10");
	$("#paymentYear").val(AutoImputedYear);
	$("#paymentMonth").val(nextmonth);
	$("#registerName").val(AutoImputedYear+"년"+AutoImputedMonth+"월 "+ AutoPaymentClassfication);
}
