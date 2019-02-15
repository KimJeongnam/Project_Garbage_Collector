<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="/project/resources" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<table class="table table-striped projects">
    <thead>
        <tr>
            <th style="text-align-last: center; width: 3%;">번호</th>
            <th style="text-align-last: center; width: 5%;">이름</th>
            <th style="text-align-last: center; width: 5%;">학번</th>
            <th style="text-align-last: center; width: 1%;">사진</th>
            <th>점수</th>
            <th style="text-align-last: center; width: 5%;">학점</th>
            <th style="text-align-last: center; width: 20%;">메뉴</th>
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
                    <a href="#" class="btn btn-primary btn" data-toggle="modal" data-target=".bs-example-modal-sm${vo2.stdNumber}${status.index+1}"><i class="fa fa-folder"></i>입력</a>
                    <a href="#" class="btn btn-info btn" data-toggle="modal" data-target=".bs-example-modal-sm${vo2.stdNumber}${status.index+2}"><i class="fa fa-pencil"></i>수정</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<c:forEach var="vo" items="${vo}" varStatus="status">

    <!-- 학생정보 모달  -->
    <div class="modal fade bs-example-modal-sm${vo.stdNumber}${status.index+1}" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 99998 !important;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width: 400px; height: 360px; z-index: 99999 !important;">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">학점입력</h4>
                </div>
                <div class="modal-body">
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bs-example-modal-sm${vo.stdNumber}${status.index+2}" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 99998 !important;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width: 400px; height: 360px; z-index: 99999 !important;">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">학점수정</h4>
                </div>
                <div class="modal-body">
                    
                </div>
            </div>
        </div>
    </div>
    <!-- 학생정보 모달 끝 -->

</c:forEach>

<!-- Custom Theme Scripts -->
<script src="${staticPath}/build/js/custom2.js"></script>
