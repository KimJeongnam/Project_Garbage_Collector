<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />



<head>
    <meta charset="UTF-8">
    <%@ include file="../../Basic/settings.jsp" %>
    <title>Insert title here</title>
</head>

<body class="nav-md">
    <%@ include file="../../Basic/navbar.jsp" %>

    <!-- page content -->

    <!-- page content -->
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3> 학사일정 기간설정 <small>수강신청 / 개강 / 학점입력 / 종강</small></h3>
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
                            <!-- start project list -->
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
                                                <fmt:formatDate type="both" value="${vo.startSelectLecture}" pattern="MM 월 dd 일" />
                                            </td>

                                            <td style="text-align: center">
                                                <fmt:formatDate type="both" value="${vo.endSelectLecture}" pattern="MM 월 dd 일" />
                                            </td>


                                            <td style="text-align: center">
                                                <fmt:formatDate type="both" value="${vo.openingDay}" pattern="MM 월 dd 일" />
                                            </td>


                                            <td style="text-align: center">
                                                <fmt:formatDate type="both" value="${vo.gradeOpeningDay}" pattern="MM 월 dd 일" />
                                            </td>


                                            <td style="text-align: center">
                                                <fmt:formatDate type="both" value="${vo.endingDay}" pattern="MM 월 dd 일" />
                                            </td>


                                        </tr>

                                    </c:forEach>
                                </tbody>



                            </table>
                            <!-- end project list -->
                        </div>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-5">
                    <div class="x_panel" style="margin-bottom: 0px;">
                        <div class="x_title">
                            <h2>학사일정 추가/수정 <small>위의 목록에서 현재 학기 선택 수정  & 작성 후 추가 </small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up" id="input-tag-icon"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <form class="form-horizontal form-label-left input_mask">
                                <fieldset>
                                	<h4 id="clcl" style="visibility:hidden;"><span id="ye"></span><small>년도</small><span id="se"></span><small>학기를 선택함(추가 미적용)</small></h4>
                                </fieldset>
                                <div class="row">
                                
                                    수강신청 시작일 ~ 수강신청 종료일
                                    <fieldset>
                                        <div>
                                            <div class="controls">
                                                <div class="input-prepend input-group">
                                                    <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                    <input type="text" name="daterange1" id="daterange1" class="form-control" value="">
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
                                                    <input type="text"name="daterange2" id="daterange2" class="form-control" value="">
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
                                                    <input type="text" name="datePick" id="datePick" readonly="readonly" class="form-control" value="">
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
									
                                    <div class="ln_solid"></div>	
                                    <small>실행일 09:00 부터 종료일 22:00 로 설정 되어있습니다.</small>
                                    <small>일정 추가 년도 / 학기는 현재 시점으로 고정됩니다.</small>
                                    <div class="form-group">
                                        <div style="align-content: center;">
                                            <button type="button" class="btn btn-dark" id="input-tap-close">닫기</button>
                                            <button class="btn btn-primary" type="reset">비우기</button>
                                            <button type="submit" class="btn btn-success">수정</button>
                                            <button type="submit" class="btn btn-info">추가</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



                <div class="col-md-7">
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





                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div style="align-content: center;">
                                            <button type="button" class="btn btn-dark" id="input-tap-close1">닫기</button>
                                            <button type="submit" class="btn btn-warning">실행</button>
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
    	function update_sc(year, seme , ssl, esl, sd, sid, ed) {
            
    		$('#daterange1').data('daterangepicker').setStartDate(ssl);
    		$('#daterange1').data('daterangepicker').setEndDate(esl);
    		$('#daterange1').daterangepicker({
    		        locale: {
    		            format: 'YYYY년도 MM월 DD일'
    		        }
    		    });
    		$('#daterange2').data('daterangepicker').setStartDate(sd);
    		$('#daterange2').data('daterangepicker').setEndDate(ed);
    		$('#daterange2').daterangepicker({
 		        locale: {
 		            format: 'YYYY년도 MM월 DD일'
 		        }
 		    });
    		$('#datePick').data('daterangepicker').setStartDate(sid);
    		
    		$('#ye').text(year);
    		$('#se').text(seme);
    		$('#clcl').css( "visibility", "visible");
    		
    		
    		
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

            // fix for some div with hardcoded fix class
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

            // fix for some div with hardcoded fix class
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
        	    maxYear: parseInt(moment().format('YYYY'),10)
        	  })
        	});
        
    </script>

</body>

</html>
