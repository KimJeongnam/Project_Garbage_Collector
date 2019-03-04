<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="/project/resources" />
<table id="datatable" class="table table-striped table-hover">
    <thead>
        <tr>
            <th style="text-align: center; width: 5%;">번호</th>
            <th style="text-align: center; width: 7%;">이름</th>
            <th style="text-align: center; width: 7%;">학번</th>
            <th id="none" style="text-align: center; width: 5%;">사진</th>
            <th style="text-align: center;">점수</th>
            <th style="text-align: center; width: 5%;">학점</th>
            <th id="none" style="text-align: center; width: 20%;">메뉴</th>
        </tr>
    </thead>

    <tbody>

        <c:forEach var="vo2" items="${vo}" varStatus="status">
            <tr>
                <td style="text-align-last: center;">
                    <h4>${status.index+1}</h4>
                </td>
                <td>
                    <h4><a style="text-align-last: center;">${vo2.userName}</a></h4>
                </td>
                <td style="text-align-last: center;">
                    <h4>${vo2.stdNumber}</h4>
                </td>
                <td>
                    <ul class="list-inline">
                        <li>
                            <img src="${staticPath}${vo2.userImage}" class="avatar" alt="Avatar" onclick="window.open('${staticPath}${vo2.userImage}')">
                        </li>
                    </ul>
                </td>
                <td class="project_progress">
                    <div class="progress progress_sm">
                        <c:set var="credit" value="${vo2.credit}" />
                        <c:choose>
                            <c:when test="${credit eq 'A+' || credit eq 'A'}">
                                <c:set var="bar_class" value="progress-bar progress-bar-striped active" />
                            </c:when>
                            <c:when test="${credit eq 'B+' || credit eq 'B'}">
                                <c:set var="bar_class" value="progress-bar progress-bar-info progress-bar-striped active" />
                            </c:when>
                            <c:when test="${credit eq 'C+' || credit eq 'C'}">
                                <c:set var="bar_class" value="progress-bar progress-bar-success progress-bar-striped active" />
                            </c:when>
                            <c:when test="${credit eq 'D+' || credit eq 'D'}">
                                <c:set var="bar_class" value="progress-bar progress-bar-warning progress-bar-striped active" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="bar_class" value="progress-bar progress-bar-danger progress-bar-striped active" />
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${!empty vo2.jscore}">
                            <!--클래스명 가운데  progress-bar-/안넣음  90점 이상 /info 80점 이상 /success 70점 이상 /warning 60점 이상 /danger 50점대 포함 이하-->
                            <div class="${bar_class}" role="progressbar" data-transitiongoal="${vo2.jscore}">
                                <h2>${vo2.jscore}점</h2>
                            </div>
                        </c:if>
                        <c:if test="${empty vo2.jscore}">
                            <h2 style="text-align: center;">미입력</h2>
                        </c:if>
                    </div>
                </td>
                <td>
                    <h1 style="text-align-last: center;">${vo2.credit}</h1>
                </td>
                <td style="text-align-last: center;">
                    <c:if test="${empty vo2.jscore}">
                        <a href="#" class="btn btn-primary btn-md" data-toggle="modal" data-target=".bs-example-modal-sm${vo2.stdNumber}${status.index+1}"><i class="fa fa-folder"></i>입력</a>
                    </c:if>
                    <c:if test="${!empty vo2.jscore}">
                        <a href="#" class="btn btn-warning btn-md" data-toggle="modal" data-target=".bs-example-modal-sm${vo2.stdNumber}${status.index+2}"><i class="fa fa-pencil"></i>수정</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<c:forEach var="vo" items="${vo}" varStatus="status">

    <!-- 학생정보 모달  -->
    <div class="modal fade bs-example-modal-sm${vo.stdNumber}${status.index+1}" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 99998 !important;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width: 400px; z-index: 99999 !important;">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">학점입력</h4>
                </div>
                <div class="modal-body">
                    <!-- 학점 입력 부분 -->
                    <form action="insertScore" data-parsley-validate="" class="form-horizontal form-label-left">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">이름 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" disabled="disabled" class="form-control col-md-7 col-xs-12" name="userName" value="${vo.userName}">
                                <input type="hidden" name="infoCode" value="${vo.incode}">
                                <input type="hidden" name="grade" value="${vo.grade}">
                                <input type="hidden" name="semester2" value="${vo.semester2}">
                                <input type="hidden" name="userName" value="${vo.userName}">
                                <input type="hidden" name="lecName" value="${vo.lectureName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">강의명 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" disabled="disabled" class="form-control col-md-7 col-xs-12" name="lectureName" value="${vo.lectureName}">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">점수 <span class="required">*</span>
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-8">
                                <input type="number" required="required" id="myinput_drs${status.index}" name="score" oninput="setScore(this,'${status.index}')" class="form-control col-md-7 col-xs-12" min="0" max="100" maxlength="3" title="점수는 0 ~ 100 까지 입력 가능합니다." />
                            </div>


						<div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">학점 <span class="required">*</span>
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-8">
                                <input type="text" readonly="readonly" id="credit${status.index}" name="credit" class="form-control col-md-7 col-xs-12">
                            </div>

						</div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                <input type="submit" class="btn btn-primary" value="입력">
                                <input type="button" class="btn btn-dark" data-dismiss="modal" aria-label="Close" value="취소">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bs-example-modal-sm${vo.stdNumber}${status.index+2}" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 99998 !important;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width: 400px; z-index: 99999 !important;">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">학점수정</h4>
                </div>
                <div class="modal-body">
                    <form action="updateScore" data-parsley-validate="" class="form-horizontal form-label-left">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">이름 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                            						<!-- disabled="disabled" 는 파라미터로 못받아옴 readonly="readonly" 는 파라미터로 받아옴 -->
                                <input type="text" readonly="readonly" name="userName2" class="form-control col-md-7 col-xs-12" value="${vo.userName}">
								<input type="hidden" name="infoCode" value="${vo.incode}">
								 <input type="hidden" name="lecName" value="${vo.lectureName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">강의명 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" disabled="disabled" name="lectureName" class="form-control col-md-7 col-xs-12" value="${vo.lectureName}">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">점수 <span class="required">*</span>
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-8">
                                <input type="number" required="required" name="score" id="myinput_drs${status.index+100}" value="${vo.jscore}" oninput="setScore2(this,'${status.index+100}')" class="form-control col-md-7 col-xs-12" min="0" max="100" maxlength="3" title="점수는 0 ~ 100 까지 입력 가능합니다." />
                            </div>


                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="college">학점 <span class="required">*</span>
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-8">
                                <input type="text" readonly="readonly" name="credit2" id="credit${status.index+100}" class="form-control col-md-7 col-xs-12" value="${vo.credit}">
                            </div>


                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                <input type="submit" class="btn btn-primary" value="수정">
                                <input type="button" class="btn btn-dark" data-dismiss="modal" aria-label="Close" value="취소">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 학생정보 모달 끝 -->

</c:forEach>

<!-- Custom Theme Scripts -->
<script src="${staticPath}/build/js/custom2.js"></script>

<script>
    function maxLengthCheck(object) {
        if (object.value.length > object.maxLength)
            object.value = object.value.slice(0, object.maxLength)
    }

    function setScore(object, idx) {
        maxLengthCheck(object);

        var tf_input = object;
        var setSocre = $('#credit' + idx);

        var score = tf_input.value;

        if (95 <= score && score <= 100) {
            setSocre.val("A+");
        } else if (90 <= score && score < 95) {
            setSocre.val("A");
        } else if (85 <= score && score < 90) {
            setSocre.val("B+");
        } else if (80 <= score && score < 85) {
            setSocre.val("B");
        } else if (75 <= score && score < 80) {
            setSocre.val("C+");
        } else if (70 <= score && score < 75) {
            setSocre.val("C");
        } else if (65 <= score && score < 70) {
            setSocre.val("D+");
        } else if (60 <= score && score < 65) {
            setSocre.val("D");
        } else if (score < 60) {
            setSocre.val("F");
        } else {
            setSocre.val("");
        }

    }
    
    function setScore2(object, idx) {
        maxLengthCheck(object);

        var tf_input = object;
        var setSocre = $('#credit' + idx);

        var score = tf_input.value;

        if (95 <= score && score <= 100) {
            setSocre.val("A+");
        } else if (90 <= score && score < 95) {
            setSocre.val("A");
        } else if (85 <= score && score < 90) {
            setSocre.val("B+");
        } else if (80 <= score && score < 85) {
            setSocre.val("B");
        } else if (75 <= score && score < 80) {
            setSocre.val("C+");
        } else if (70 <= score && score < 75) {
            setSocre.val("C");
        } else if (65 <= score && score < 70) {
            setSocre.val("D+");
        } else if (60 <= score && score < 65) {
            setSocre.val("D");
        } else if (score < 60) {
            setSocre.val("F");
        } else {
            setSocre.val("");
        }

    }
    
    

</script>
