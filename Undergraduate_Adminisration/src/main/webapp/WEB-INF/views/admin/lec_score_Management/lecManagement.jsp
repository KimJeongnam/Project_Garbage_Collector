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
                    <h3> 관리자 수강신청 기간설정 <small>학년 선택 후 입력</small></h3>
                </div>
                <div class="btn-group" style="float: right">
                    <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"> 학년 선택 <span class="caret"></span> </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">1학년</a>
                        </li>
                        <li><a href="#">2학년</a>
                        </li>
                        <li><a href="#">3학년</a>
                        </li>
                        <li><a href="#">4학년</a>
                        </li>
                    </ul>
                </div>






            </div>

            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>선택한 학년</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <!-- start project list -->
                            <table class="table table-striped projects">
                                <thead>
                                    <tr>
                                        <th style="width: 10%; text-align: center">학년</th>


                                        <th style="text-align: center; width: 100px;">수강신청 열람기간</th>
                                        <th style="text-align: center">비고</th>

                                        <th style="width: 20%; text-align: center">???</th>
                                    </tr>
                                </thead>
                                <tbody>




                                    <tr>
                                        <td style="text-align: center;"><a style="font-size: 18px; font-weight: bold">1</a> 학년

                                        </td>


                                        <td style="text-align: center">

                                            <form class="form-horizontal">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <div class="controls">
                                                            <div class="input-prepend input-group">
                                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                                <input type="text" style="width: 200px" name="reservation" id="reservation" class="form-control" value="01/01/2019 - 01/25/2019" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </form>


                                        </td>


                                        <td style="text-align: center">
                                            ???
                                        </td>


                                        <td style="text-align: center">
                                            ????
                                        </td>
                                    </tr>





                                </tbody>
                            </table>
                            <!-- end project list -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->

    <%@ include file="../../Basic/footer.jsp" %>
    <script>

    </script>




</body>

</html>
