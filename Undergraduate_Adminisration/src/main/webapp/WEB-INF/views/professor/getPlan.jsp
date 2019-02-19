<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-striped jambo_table">
    <thead>
        <tr>
            <th style="width: 10%; text-align: center">주차별</th>


            <th style="text-align: center">강의 진행계획</th>
            <th style="text-align: center">강의 비고</th>

            <th style="width: 20%; text-align: center">메뉴</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="vo" items="${vo}" varStatus="status">
            <tr>
                <td style="text-align: center;"><a style="font-size: 18px; font-weight: bold">${vo.week}</a> 주
                </td>


                <td style="text-align: center">
                    <a>${vo.contents}</a>

                </td>


                <td style="text-align: center">
                    ${vo.text}
                </td>


                <td style="text-align: center">
                    <c:if test="${empty vo.contents}">
                        <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                    </c:if>
                    <c:if test="${!empty vo.contents}">
                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>

    </tbody>
</table>
