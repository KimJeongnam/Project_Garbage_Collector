<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@ include file="../../Basic/settings.jsp" %>
    <title>Insert title here</title>
</head>

<body class="nav-md">
    <%@ include file="../../Basic/navbar.jsp" %>

    <!-- page content -->
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3> 학사일정 업무 <small>수강신청 / 개강 / 학점입력 / 종강</small></h3>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>학사일정 목록 조회</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped jambo_table">
                                <thead>
                                    <tr>
                                        <th style="width: 3%; text-align: center">삭제</th>
                                        <th style="width: 6%; text-align: center">연도</th>
                                        <th style="width: 3%; text-align: center">학기</th>
                                        <th style="width: 10%; text-align: center">수강신청 시작일</th>
                                        <th style="width: 10%; text-align: center">수강신청 종료일</th>
                                        <th style="width: 10%; text-align: center">개강일</th>
                                        <th style="width: 10%; text-align: center">학점입력 시작일</th>
                                        <th style="width: 10%; text-align: center">종강일</th>

                                    </tr>
                                </thead>


                                <tbody>

                                    <c:forEach var="vo" items="${vo}" varStatus="status">
                                        <tr onclick="update_sc('${vo.year}','${vo.semester}','${vo.startSelectLecture}','${vo.endSelectLecture}','${vo.openingDay}','${vo.gradeOpeningDay}','${vo.endingDay}');" style="cursor: pointer;">

                                            <td style="text-align: center;">
                                                <a onclick="delete_sc('${vo.year}','${vo.semester}');" style="cursor: pointer; "><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                            </td>


                                            <td style="text-align: center">
                                                ${vo.year }년도
                                            </td>


                                            <td style="text-align: center">
                                                ${vo.semester }학기
                                            </td>


                                            <td style="text-align: center">
                                                <fmt:parseDate value="${vo.startSelectLecture}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                                <fmt:formatDate value="${myDate}" pattern="yy년 MM 월 dd 일" />
                                            </td>

                                            <td style="text-align: center">
                                                <fmt:parseDate value="${vo.endSelectLecture}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                                <fmt:formatDate value="${myDate}" pattern="yy년 MM 월 dd 일" />
                                            </td>


                                            <td style="text-align: center">
                                                <fmt:parseDate value="${vo.openingDay}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                                <fmt:formatDate value="${myDate}" pattern="yy년 MM 월 dd 일" />
                                            </td>


                                            <td style="text-align: center">
                                                <fmt:parseDate value="${vo.gradeOpeningDay}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                                <fmt:formatDate value="${myDate}" pattern="yy년 MM 월 dd 일" />
                                            </td>


                                            <td style="text-align: center">
                                                <fmt:parseDate value="${vo.endingDay}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                                <fmt:formatDate value="${myDate}" pattern="yy년 MM 월 dd 일" />
                                            </td>


                                        </tr>

                                    </c:forEach>
                                </tbody>


                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-7">
                    <div class="x_panel" style="margin-bottom: 0px;">
                        <div class="x_title">
                            <h2>학사일정 추가/수정 <small>위의 목록에서 선택 수정 & 작성 후 추가 </small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up" id="input-tag-icon"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content11">
                            <form id="xx" class="form-horizontal form-label-left input_mask" action="post">
                                <fieldset id="clcl" style="visibility:hidden;">
                                    <h4><span id="ye"></span><small id="sm1">년도</small><span id="se"></span><small id="sm2">학기를 선택함</small></h4>
                                </fieldset>
                                <div class="row">
                                    학기
                                    <fieldset>
                                        <div>
                                            <div class="controls">
                                                <div class="input-prepend input-group">
                                                    <div class="btn-group">
                                                        <label class="btn btn-default" id="op1">
                                                            <input type="radio" name="options" value="1" id="option1" required> 1 학기
                                                        </label>
                                                        <label class="btn btn-default" id="op2">
                                                            <input type="radio" name="options" value="2" id="option2" required> 2 학기
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    년도
                                    <fieldset>
                                        <div>
                                            <div class="controls">
                                                <div class="input-prepend input-group date">
                                                    <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                    <input id="yn" type="number" name="yearNum" min="2010" max="2030" class="form-control" maxlength="4" title="연도는 2010 ~ 2030년 까지 입력 가능합니다." required>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    수강신청 시작일 ~ 수강신청 종료일
                                    <fieldset>
                                        <div>
                                            <div class="controls">
                                                <div class="input-prepend input-group">
                                                    <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                    <input type="text" name="daterange1" id="daterange1" class="form-control" required>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    개강일 ~ 종강일
                                    <fieldset>
                                        <div>
                                            <div class="controls">
                                                <div class="input-prepend input-group">
                                                    <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                    <input type="text" name="daterange2" id="daterange2" class="form-control" required>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    학점입력기간 시작일 (종료일은 종강일)
                                    <fieldset>
                                        <div>
                                            <div class="controls">
                                                <div class="input-prepend input-group date">
                                                    <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                    <input type="text" name="datePick" id="datePick" class="form-control" required>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>


                                    <!-- servie에서 받을 ssl,esl,sd,sid,ed,yearNum,options -->
                                    <input type="text" id="ss" name="ssl" hidden="true">
                                    <input type="text" id="es" name="esl" hidden="true">
                                    <input type="text" id="sd" name="sd" hidden="true">
                                    <input type="text" id="si" name="sid" hidden="true">
                                    <input type="text" id="edd" name="ed" hidden="true">




                                    <small>실행일 09:00 부터 종료일 22:00 로 설정 되어있습니다.</small>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div style="align-content: center;">
                                            <button type="button" class="btn btn-dark" id="input-tap-close">닫기</button>
                                            <button class="btn btn-primary" type="reset" id="clear">비우기</button>
                                            <button id="modify_button" type="submit" name="butt" formaction="/project/admin/lec_score_Management/lecScUpdate" class="btn btn-success">수정</button>
                                            <button id="add_button" type="submit" name="butt" formaction="/project/admin/lec_score_Management/lecScInsert" class="btn btn-info" onsubmit="addcheck();">추가</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



                <div class="col-md-5">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>학사일정 바로 실행 <small>수강신청 / 개강 / 종강 / 학점입력 즉시 제어</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up" id="input-tag-icon"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <form class="form-horizontal form-label-left input_mask">
                                <div class="row">
                                
                                    <c:set var="now" value="<%=new java.util.Date()%>"/>
                                    
                                    <c:set var="sysYear">
                                        <fmt:formatDate value="${now}" pattern="yyyy"/>
                                    </c:set>
                                    
                                    
                                    <h4><span>
                                            <c:out value="${sysYear}" /></span><small>년도</small><span>${semester}</span><small>학기</small></h4>
                                    바로 실행할 명령을 선택하시오.<br>
                                    <fieldset class="form-group">
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="1" required="required">
                                                개강
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="2" required="required">
                                                종강
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="3" required="required">
                                                학점입력
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios4" value="4" required="required">
                                                수강신청시작
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios5" value="5" required="required">
                                                수강신청종료
                                            </label>
                                        </div>
                                    </fieldset>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" id="chkchk" class="form-check-input" required="required">
                                            즉시 실행하시겠습니까?
                                        </label>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div style="align-content: center;">
                                            <button type="button" class="btn btn-dark" id="input-tap-close1">닫기</button>
                                            <button type="submit" formaction="/project/admin/lec_score_Management/excuteScUpdate" id="chkchk2" class="btn btn-warning" disabled>실행</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- /page content -->

    <%@ include file="../../Basic/footer.jsp" %>
    <script>
        var mode = '';
        $(function() {
            $('#option2').click(function() {
                $("#option1").prop('checked', false);
                $("#option2").prop('checked', true);
                $("#op1").removeClass('active');
                $("#op2").addClass('active');
            });
            $('#option1').click(function() {
                $("#option2").prop('checked', false);
                $("#option1").prop('checked', true);
                $("#op2").removeClass('active');
                $("#op1").addClass('active');
            });
            $('#clear').click(function() {
                $("#option2").prop('checked', false);
                $("#option1").prop('checked', false);
                $("#op2").removeClass('active');
                $("#op1").removeClass('active');
                $("#clcl").css('visibility', 'hidden');
                $('#yn').val('');
            });

            $(document).on('click', '#xx', function() {
                $('#ye').text('수정중');
                $('#se').text('');
                $('#sm1').text('');
                $('#sm2').text('');
            });

            $(document).on('click', '#datatable', function() {
                $('#sm1').text('년도');
                $('#sm2').text('학기를 선택함');

            });

            $("#chkchk").change(function() {
                if ($("#chkchk").is(":checked")) {
                    $('#chkchk2').prop("disabled", false);
                } else {
                    $('#chkchk2').prop("disabled", true);
                }
            });


        });

        $('#clear').click(function() {
            mode = 'add';
            $('#add_button').prop("disabled", false);
        });

        function update_sc(year, seme, str_ssl, str_esl, str_sd, str_sid, str_ed) {

            var ssl = new Date(str_ssl);
            var esl = new Date(str_esl);
            var sd = new Date(str_sd);
            var sid = new Date(str_sid);
            var ed = new Date(str_ed);

            $('#yn').val(year);
            mode = 'modify';
            $('#add_button').prop("disabled", true);

            $('#daterange1').daterangepicker({
                locale: {
                    format: 'YYYY년도 MM월 DD일'
                }
            });
            $('#daterange1').data('daterangepicker').setStartDate(ssl);
            $('#daterange1').data('daterangepicker').setEndDate(esl);

            $('#daterange2').daterangepicker({
                locale: {
                    format: 'YYYY년도 MM월 DD일'
                }
            });
            $('#daterange2').data('daterangepicker').setStartDate(sd);
            $('#daterange2').data('daterangepicker').setEndDate(ed);


            $('#datePick').data('daterangepicker').setStartDate(sid);

            $('#ye').text(year);
            $('#se').text(seme);

            if (seme != 1) {
                $("#option1").prop('checked', false);
                $("#option2").prop('checked', true);
                $("#op1").removeClass('active');
                $("#op2").addClass('active');
            } else {
                $("#option2").prop('checked', false);
                $("#option1").prop('checked', true);
                $("#op2").removeClass('active');
                $("#op1").addClass('active');
            }

            $('#clcl').css("visibility", "visible");

            var curr_date = ssl.getDate();
            var curr_month = ssl.getMonth() + 1; //달은 0 부터
            var curr_year = ssl.getFullYear();
            var dd1 = curr_year + "-" + curr_month + "-" + curr_date;
            $('#ss').val(dd1);

            var curr_date = esl.getDate();
            var curr_month = esl.getMonth() + 1; //달은 0 부터
            var curr_year = esl.getFullYear();
            var dd2 = curr_year + "-" + curr_month + "-" + curr_date;
            $('#es').val(dd2);

            var curr_date = sd.getDate();
            var curr_month = sd.getMonth() + 1; //달은 0 부터
            var curr_year = sd.getFullYear();
            var dd3 = curr_year + "-" + curr_month + "-" + curr_date;
            $('#sd').val(dd3);

            var curr_date = sid.getDate();
            var curr_month = sid.getMonth() + 1; //달은 0 부터
            var curr_year = sid.getFullYear();
            var dd4 = curr_year + "-" + curr_month + "-" + curr_date;
            $('#edd').val(dd4);

            var curr_date = ed.getDate();
            var curr_month = ed.getMonth() + 1; //달은 0 부터
            var curr_year = ed.getFullYear();
            var dd5 = curr_year + "-" + curr_month + "-" + curr_date;
            $('#si').val(dd5);

        }

        function delete_sc(year, semester) {

            var obj = new Object();
            obj.year = year;
            obj.semester = semester;

            var jsonData = JSON.stringify(obj);
            swal({
                text: year + "년도 " + semester + "학기 학사일정을 삭제하시겠습니까?",
                buttons: {
                    cancel: {
                        text: "취소",
                        value: false,
                        visible: true,
                    },
                    ok: {
                        text: "확인",
                        value: true,
                        visible: true,
                    }
                },
            }).then((value) => {
                if (value) {
                    $.ajax({
                        url: '/project/admin/lec_score_Management/lecManagement/delete_sc',
                        type: 'POST',
                        data: jsonData,
                        contentType: 'application/json;charset=UTF-8',
                        success: function(data) {
                            console.log(data);
                            swal({
                                text: year + "년도 " + semester + "학기 학사일정을 삭제하였습니다.",
                                icon: "success",
                                button: "확인",
                                value: true,
                                visible: true,
                            }).then((value) => {
                                location.reload();
                            });
                        },
                        error: function() {
                            swal({
                                text: "Error! delete_sc();",
                                icon: "error",
                                button: "확인",
                            });
                        }
                    });
                }
            });
        }




        $('#input-tap-close').click(function() {
            var $BOX_PANEL = $(this).closest('.x_panel'),
                $ICON = $('#input-tag-icon'),
                $BOX_CONTENT = $BOX_PANEL.find('.x_content');

            if ($BOX_PANEL.attr('style')) {
                $BOX_CONTENT.slideToggle(200, function() {
                    $BOX_PANEL.removeAttr('style');
                });
            } else {
                $BOX_CONTENT.slideToggle(200);
                $BOX_PANEL.css('height', 'auto');
            }

            $ICON.toggleClass('fa-chevron-up fa-chevron-down');
        });


        $('#input-tap-close1').click(function() {
            var $BOX_PANEL = $(this).closest('.x_panel'),
                $ICON = $('#input-tag-icon'),
                $BOX_CONTENT = $BOX_PANEL.find('.x_content');

            if ($BOX_PANEL.attr('style')) {
                $BOX_CONTENT.slideToggle(200, function() {
                    $BOX_PANEL.removeAttr('style');
                });
            } else {
                $BOX_CONTENT.slideToggle(200);
                $BOX_PANEL.css('height', 'auto');
            }

            $ICON.toggleClass('fa-chevron-up fa-chevron-down');
        });



        $(function() {
            $('input[name="daterange1"]').daterangepicker({
                drops: "up",
                locale: {
                    format: 'YYYY년도 MM월 DD일'
                }
            });
            $('input[name="daterange1"]').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('YYYY년도 MM월 DD일') + ' - ' + picker.endDate.format('YYYY년도 MM월 DD일'));
            });

            $('input[name="daterange1"]').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });
        });

        $(function() {
            $('input[name="daterange2"]').daterangepicker({
                drops: "up",
                locale: {
                    format: 'YYYY년도 MM월 DD일'
                }
            });
            $('input[name="daterange2"]').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('YYYY년도 MM월 DD일') + ' - ' + picker.endDate.format('YYYY년도 MM월 DD일'));
            });

            $('input[name="daterange2"]').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });
        });

        $(function() {
            $('input[name="datePick"]').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
                minYear: 2019,
                drops: "up",
                locale: {
                    format: 'YYYY년도 MM월 DD일'
                },
                maxYear: parseInt(moment().format('YYYY'), 10)
            })
        });



        $('input[type="text"]').keydown(function() {
            if (event.keyCode === 13) {
                event.preventDefault();
            }
        });



        $(window).load(function() {
            $('#datePick').val('');
            $('#daterange1').val('');
            $('#daterange2').val('');
            $("#datePick").on("change click", function() {

                if (typeof $("#datePick").data('daterangepicker') === 'undefined') return;

                if (typeof $("#datePick").data('daterangepicker').startDate === 'undefined') {
                    return;
                }
                var d5 = $("#datePick").data('daterangepicker').startDate.format("YYYY-MM-DD");
				
                if(!checkYear($('#datePick'))) return;
                if (mode == 'modify') {
                    if (typeof $('#yn') != 'undefined') {
                        if ($('#yn').val().length > 0)
                            if ($("#datePick").data('daterangepicker').startDate.format("YYYY") != $('#yn').val()) {
                                swal("년도 선택 에러 ", "년도가  다릅니다. 다시 설정해 주세요.", "error");
                                $('#datePick').val('');
                                var date = new Date($('#yn').val() + '-01-01');
                                setDateSinglepicker($("#datePick"), date);
                            }
                    }
                }else{
                	induceSelectYear($('#datePick'));
                }
                $('#si').val(d5);


            });


            $("#daterange1").on("change click", function() {


                if (typeof $("#daterange1").data('daterangepicker') === 'undefined') return;

                if (typeof $("#daterange1").data('daterangepicker').startDate === 'undefined' &&
                    typeof $("#daterange1").data('daterangepicker').endDate === 'undefined') {
                    return;
                }
                var d1 = $("#daterange1").data('daterangepicker').startDate.format("YYYY-MM-DD");
                var d2 = $("#daterange1").data('daterangepicker').endDate.format("YYYY-MM-DD");

                if(!checkYear($('#daterange1'))) return;
                if (mode == 'modify') {
                    if (typeof $('#yn') != 'undefined') {
                        if ($('#yn').val().length > 0)
                            if ($("#daterange1").data('daterangepicker').startDate.format("YYYY") != $('#yn').val()) {
                                swal("년도 선택 에러 ", "년도가  다릅니다. 다시 설정해 주세요.", "error");
                                $('#daterange1').val('');
                                var date = new Date($('#yn').val() + '-01-01');
                                setDateRangepicker($("#daterange1"), date);
                            }

                    }
                }else{
                	induceSelectYear($('#daterange1'));
                }
                $('#ss').val(d1);
                $('#es').val(d2);

            });


            $("#daterange2").on("change click", function() {

				
                if (typeof $("#daterange2").data('daterangepicker') === 'undefined') return;

                if (typeof $("#daterange2").data('daterangepicker').startDate === 'undefined' &&
                    typeof $("#daterange2").data('daterangepicker').endDate === 'undefined') {
                    return;
                }
                var d3 = $("#daterange2").data('daterangepicker').startDate.format("YYYY-MM-DD");
                var d4 = $("#daterange2").data('daterangepicker').endDate.format("YYYY-MM-DD");
				
                if(!checkYear($('#daterange2'))) return;
                
                if (mode == 'modify') {
                    if (typeof $('#yn') != 'undefined') {
                        if ($('#yn').val().length > 0)
                            if ($("#daterange2").data('daterangepicker').startDate.format("YYYY") != $('#yn').val()) {
                                swal("년도 선택 에러 ", "년도가  다릅니다. 다시 설정해 주세요.", "error");
                                $('#daterange2').val('');
                                var date = new Date($('#yn').val() + '-01-01');
                                setDateRangepicker($("#daterange2"), date);
                            }
                    }
                }else{
                	induceSelectYear($('#daterange2'));
                }
                $('#sd').val(d3);
                $('#edd').val(d4);


            });
			
            $('#yn').on("change click", function(){
            	if($('#yn').val().length==4){
            		var get_year = $('#yn').val();
            		var date = new Date($('#yn').val() + '-01-01');
            		setDateSinglepicker($("#datePick"), date);
            		setDateRangepicker($("#daterange1"), date);
            		setDateRangepicker($("#daterange2"), date);
            	}
            });



        });
        
        function checkYear(picker){
        	if($('#yn').val().length!=4 && $('#yn').val().length > 0){
        		swal("Warning ", "년도 형식 이 잘못되었습니다.", "warning",{
        			button: false,
        		});
        		picker.val('');
        		$('#yn').focus();
        		return false;
        	}else
        		return true;
        }
        
        function induceSelectYear(picker){
        	if($('#yn').val().length ==0){
        		swal("Warning ", "년도를 먼저 설정해 주세요.", "warning",{
        			button: false,
        		});
        		picker.val('');
        		$('#yn').focus();
        	}
        }

        function setDateSinglepicker(picker, date) {
            picker.daterangepicker({
                singleDatePicker: true,
                locale: {
                    format: 'YYYY년도 MM월 DD일'
                }
            });

            var curr_date = date.getDate();
            var curr_month = date.getMonth() + 1; //달은 0 부터
            var curr_year = date.getFullYear();
            var dd1 = curr_year + "-" + curr_month + "-" + curr_date;
            picker.data('daterangepicker').setStartDate(dd1);
        }

        function setDateRangepicker(picker, date) {
            picker.daterangepicker({
                locale: {
                    format: 'YYYY년도 MM월 DD일'
                }
            });

            var curr_date = date.getDate();
            var curr_month = date.getMonth() + 1; //달은 0 부터
            var curr_year = date.getFullYear();
            var dd1 = curr_year + "-" + curr_month + "-" + curr_date;
            
            picker.data('daterangepicker').setStartDate(dd1);
            picker.data('daterangepicker').setEndDate(dd1);
        }
    </script>



</body>

</html>