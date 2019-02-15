<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <%@ include file="../Basic/settings.jsp" %>
    <script type="text/javascript">
	    $(function(){
	    	$('.onclick_search').click(function(){
	    		$('.onclick_search').siblings().css( 'display', 'none' );//형제객체를 찾아서 디스플레이 논
	    		$('.onclick_search').css( 'display', 'none' );//클래스  css 디스플레이 논 설정
	    		$('#search').css( 'border', 'none' ); // 튀어 나오는 보더값 논
	    		$('#tags').val('');//인풋창 초기화
	    	})
	    });
    </script>
</head>

<body>

    <c:forEach var="vo3" items="${search_student}">
	<div class="autocomplete-suggestion onclick_search" onclick="search_student_click('${vo3.userName}','${vo3.stdNumber}');" data-toggle="modal" id="onclick_search" data-target=".bs-example-modal-sm${vo3.stdNumber}"><strong>${vo3.userName}</strong></div>
    </c:forEach>
    <c:forEach var="vo" items="${search_student}">
        <!-- 학생정보 모달  -->
        <div class="modal fade bs-example-modal-sm${vo.stdNumber}" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 99998 !important;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content" style="width: 400px; height: auto; z-index: 99999 !important;">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel2">내 강의 수강생 찾기</h4>
                    </div>
                   		 <div class="modal-body">
                            <div class="profile_details" id="${vo.userName}">
                                <div class="well profile_view">
                                    <div class="col-sm-12" style="height:auto;">
                                        <h2><strong style="color: #73879C;">No. ${vo.stdNumber}</strong></h2>
                                        <div class="left col-xs-7">
                                            <h2>${vo.userName}</h2>
                                            ${vo.userEngName}<br>
                                            <ul class="list-unstyled">
                                                <li><i class="fa fa-phone"> &nbsp; &nbsp;</i>${vo.userCellNum}</li>
                                                <li><i class="fa fa-send"> &nbsp; &nbsp;</i>${vo.userEmail}</li>
                                                <li id="lec_li${vo.stdNumber}" style="margin-top: 5px;">
                                                	<!-- ajax  -->
                                                </li>
                                            </ul>

                                        </div>
                                        <div class="right col-xs-5 text-center">
                                            <img src="${staticPath}${vo.userImage}" alt="" class="img-circle img-responsive" style="height: 152px; width: 126px;">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 bottom text-center">
                                        <div class="col-xs-12 col-sm-6 emphasis">
                                            <p><strong style="color: #73879C;">${vo.grade} 학년&nbsp;</strong>&nbsp;${vo.faculty}&nbsp;${vo.majorName}</p>
                                        </div>


                                        <div class="col-xs-12 col-sm-6 emphasis">

                                            <!-- id만 compose 입력하면 메세지창 뜨으으음 갸꿀!!!!-->
                                            <button onclick="$('.compose').slideToggle();" type="button" class="btn btn-success btn-xs"><i class="fa fa-comments-o">&nbsp;메세지&nbsp;
                                                </i> </button>
                                            <button type="button" onclick="window.location.href='/project/professor/score'" class="btn btn-primary btn-xs">
                                                <i class="fa fa-user"> </i>학점입력
                                            </button>


                                        </div>
                                    </div>
                                </div>
                         </div>
                   	</div>
                </div>
            </div>
        </div>
        <!-- 학생정보 모달 끝 -->
    </c:forEach>
    <script type="text/javascript">
    function search_student_click(studentName,stdNumber) {
        var obj = new Object();
        obj.studentName = studentName;
        
        
        	
            var jsonData = JSON.stringify(obj);
            $.ajax({
                url: '/project/professor/list/search_student_click',
                type: 'POST',
                data: jsonData,
                contentType: 'application/json;charset=UTF-8',
                success: function(data) {
                   $('#lec_li'+stdNumber).html(data);//#divid로 데이터를 뿌려라.
                },
                error: function() {
                	alert("Error! search_student_click();");
                }
            });
        
    }
    </script>
</body>

</html>
