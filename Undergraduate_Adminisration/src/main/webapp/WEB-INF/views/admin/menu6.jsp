<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../Basic/settings.jsp" %>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp" %>
	
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>시간제 급여관리</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="검색">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">검색</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>급여계산/대장<small></small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <p class="text-muted font-13 m-b-30">
                            교직원의 급여를 확인, 수정하는 페이지
                        </p>
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                                <tr class="headings">
                                    <th>
                                        <input type="checkbox" id="check-all" class="flat" name="table_records">
                                    </th>
                                    <th>신고귀속</th>
                                    <th>구분</th>
                                    <th>대장 명칭</th>
                                    <th>지급일</th>
                                    <th>지급연월</th>
                                    <th>지급총액</th>
                                   <th>관리</th>

                                </tr>
                            </thead>


                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
                                                               <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>2019/01-1</td>
                                    <td>급여</td>
                                    <td>2019년 1월 급여</td>
                                    <td>2019/02/10</td>
                                    <td>2019/01</td>
                                    <td>1,900,000</td>
                                    <td><button>조회</button><button>명세서 출력</button><button>수정</button></td>
                                </tr>
      


                            </tbody>
                        </table>

                    </div>
                </div>
            </div>




        </div>
    </div>
</div>
</div>
</div>
</div>
<!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>