<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="staticPath" value="/project/resources" />
<table class="table table-striped">
    <thead>
        <tr>
            <th style="width: 10%; text-align: center">주차별</th>
            <th style="text-align: center">강의 계획</th>
            <th style="width: 10%; text-align: center">강의 비고</th>
            <th style="width: 20%; text-align: center">메뉴</th>
        </tr>
    </thead>
    <tbody>
    	<c:set var="week" value="0"/>
        <c:forEach var="vo" items="${vo}" varStatus="status">
        <c:set var="lec" value="${vo.lecCode}"/>
        <c:set var="name" value="${vo.lectureName}"/>
        
		<c:if test="${!empty vo.week}">
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
                        <a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target=".bs-example-modal-lg${vo.lecCode}${status.index+1000}"><i class="fa fa-pencil"></i>수정</a>
                </td>
            </tr>
            <c:set var="week" value="${week+1}"/>
        </c:if>
        </c:forEach>
        
        <c:if test="${week<16}">
        
        <tr>
                <td style="text-align: center;">
                </td>


                <td style="text-align: center">
                    <a>작성된 강의계획서가 없습니다.</a>

                </td>


                <td style="text-align: center">
                </td>


                <td style="text-align: center">
  					<a href="#" class="btn btn-success btn-xs" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-folder"></i>작성</a>
                </td>
            </tr>
		</c:if>
		
    </tbody>
</table>




<!--신규 작성모달 -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 99998 !important;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="z-index: 99999 !important;">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">강의계획서 작성</h4>
                </div>
                <div class="modal-body">
                   <form action="insertPlan" data-parsley-validate="" class="form-horizontal form-label-left">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">강의명 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="hidden" name="lecCode" value="${lec}">
                                <input type="text" readonly="readonly" class="form-control col-md-7 col-xs-12" name="lecName" value="${name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="comment" class="control-label col-md-3 col-sm-3 col-xs-12">강의 계획 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                               <textarea class="form-control" rows="6" id="comment" name="contents" style="resize: none;" required="required"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">주차 <span class="required">*</span>
                            </label>
                            <div class="col-md-1 col-sm-1 col-xs-4">
                            <c:if test="${week>=1}">
                                <input type="text" readonly="readonly" name="week" value="${week+1}" class="form-control"/>
                            </c:if>
                            <c:if test="${week==0}">
                            	<input type="text" readonly="readonly" name="week" value="1" class="form-control"/>
                            </c:if>  
                            </div>
                            <label class="control-label" style="float: left;">주 <span class="required"></span></label>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" style="margin-left: 60px;">비고 <span class="required"></span>
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <input type="text" name="text" class="form-control">
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                <input type="submit" class="btn btn-primary" value="입력">
                                <input type="button" class="btn btn-dark" data-dismiss="modal" aria-label="Close" value="취소">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

 <c:forEach var="vo2" items="${vo}" varStatus="status">
<!-- 수정모달 -->

    <div class="modal fade bs-example-modal-lg${vo2.lecCode}${status.index+1000}" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 99998 !important;">
            <div class="modal-dialog modal-lg">
            <div class="modal-content" style="z-index: 99999 !important;">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">강의계획서 수정</h4>
                </div>
                <div class="modal-body">
                   <form action="updatePlan" data-parsley-validate="" class="form-horizontal form-label-left">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">강의명 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="hidden" name="lecCode" value="${vo2.lecCode}">
                                <input type="text" readonly="readonly" class="form-control col-md-7 col-xs-12" name="lecName" value="${vo2.lectureName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="comment" class="control-label col-md-3 col-sm-3 col-xs-12">강의 계획 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                               <textarea class="form-control" rows="6" id="comment" name="contents" style="resize: none;" required="required">${vo2.contents}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">주차 <span class="required">*</span>
                            </label>
                            <div class="col-md-1 col-sm-1 col-xs-4">
                                <input type="text" readonly="readonly" name="week" value="${vo2.week}" class="form-control"/>
                            </div>
                            <label class="control-label" style="float: left;">주 <span class="required"></span></label>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" style="margin-left: 60px;">비고 <span class="required"></span>
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <input type="text" name="text" value="${vo2.text}" class="form-control">
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                <input type="submit" class="btn btn-primary" value="수정">
                                <input type="button" class="btn btn-dark" data-dismiss="modal" aria-label="Close" value="취소">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 모달 끝 -->

</c:forEach>


<!-- Custom Theme Scripts -->
<script src="${staticPath}/build/js/custom2.js"></script>