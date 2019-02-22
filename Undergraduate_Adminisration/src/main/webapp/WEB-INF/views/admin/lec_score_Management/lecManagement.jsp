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
                                    <tr>
                                    
                                        <td style="text-align: center">
                                            <a id="delete_sc" onclick=""><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                        </td>
                                        
                                        
                                        <td style="text-align: center">
											${vo.year }
                                        </td>


                                        <td style="text-align: center">
                                        	${vo.semester }
                                        </td>


                                        <td style="text-align: center">
											${vo.startSelectLecture }
                                        </td>

                                        <td style="text-align: center">
                                        	${vo.endSelectLecture }
                                        </td>


                                        <td style="text-align: center">
                                        	${vo.openingDay }
                                        </td>


                                        <td style="text-align: center">
                                        	${vo.gradeOpeningDay}
                                        </td>
                                        
                                        
                                        <td style="text-align: center">
                                        	${vo.endingDay}
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
                <div>
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>학사일정 추가/수정 <small>위의 목록에서 선택 또는 작성 후 추가/수정</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up" id="input-tag-icon"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <form class="form-horizontal form-label-left input_mask">
                            		수강신청 시작일
                                <fieldset>
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="controls">
                                            <div class="input-prepend input-group">
                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                <input type="text" name="reservation-time" id="reservation-time" class="form-control" value="01/01/2019 - 12/31/2019">
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                	수강신청 종료일
                               	<fieldset>
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="controls">
                                            <div class="input-prepend input-group">
                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                <input type="text" name="reservation-time1" id="reservation-time1" class="form-control" value="01/01/2019 - 12/31/2019">
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                	개강일
                                <fieldset>
                                   <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="controls">
                                            <div class="input-prepend input-group">
                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                <input type="text" name="reservation-time2" id="reservation-time2" class="form-control" value="01/01/2019 - 12/31/2019">
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>    
									학점입력기간 시작일
                                <fieldset>
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="controls">
                                            <div class="input-prepend input-group">
                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                <input type="text" name="reservation-time3" id="reservation-time3" class="form-control" value="01/01/2019 - 12/31/2019">
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                	종강일
                                <fieldset>
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="controls">
                                            <div class="input-prepend input-group">
                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                <input type="text" name="reservation-time4" id="reservation-time4" class="form-control" value="01/01/2019 - 12/31/2019">
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
								
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div style="align-content: center;">
                                        <button type="button" class="btn btn-danger" id="input-tap-close">닫기</button>
                                        <button class="btn btn-primary" type="reset">비우기</button>
                                        <button type="submit" class="btn btn-success">수정</button>
                                        <button type="submit" class="btn btn-info">추가</button>
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


        $('#reservation').daterangepicker(null, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

        $('#reservation-time1').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY h:mm A'
            }
        });
        $('#reservation').daterangepicker(null, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

        $('#reservation-time2').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY h:mm A'
            }
        });
        $('#reservation').daterangepicker(null, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

        $('#reservation-time3').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY h:mm A'
            }
        });
        $('#reservation').daterangepicker(null, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

        $('#reservation-time4').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY h:mm A'
            }
        });

    </script>

</body>

</html>
