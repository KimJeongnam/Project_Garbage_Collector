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
                    <h3>성적 업무 관리</h3>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2><i class="fa fa-align-left"></i> 학점조회</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <!-- start accordion -->
                            <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                                <div class="panel">
                                    <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <h4 class="panel-title">학과별 평균 학점</h4>
                                    </a>
                                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>학과명</th>
                                                        <th>최고 학점</th>
                                                        <th>최저 학점</th>
                                                        <th>평균 학점</th>
                                                    </tr>
                                                </thead>

                                                <tbody>


                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td>경영학과</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">2</th>
                                                        <td>영문학과</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">3</th>
                                                        <td>사회학과</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">4</th>
                                                        <td>수학과</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel">
                                    <a class="panel-heading collapsed" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <h4 class="panel-title">강의별 평균 학점</h4>
                                    </a>
                                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                        <div class="panel-body">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>강의명</th>
                                                        <th>최고 학점</th>
                                                        <th>최저 학점</th>
                                                        <th>평균 학점</th>
                                                    </tr>
                                                </thead>

                                                <tbody>


                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td>골프학개론</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">2</th>
                                                        <td>무도론</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">3</th>
                                                        <td>성교육 예방교육</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">4</th>
                                                        <td>Spring 초급</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>



                                                </tbody>
                                            </table>



                                        </div>
                                    </div>
                                </div>
                                <div class="panel">
                                    <a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <h4 class="panel-title">학년별 평균 학점</h4>
                                    </a>
                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                        <div class="panel-body">

                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>학년</th>
                                                        <th>최고 학점</th>
                                                        <th>최저 학점</th>
                                                        <th>평균 학점</th>
                                                    </tr>
                                                </thead>

                                                <tbody>


                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td>1</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">2</th>
                                                        <td>3</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">3</th>
                                                        <td>4</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">4</th>
                                                        <td>2</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>



                                                </tbody>
                                            </table>



                                        </div>
                                    </div>
                                </div>

                                <div class="panel">
                                    <a class="panel-heading collapsed" role="tab" id="headingFour" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                        <h4 class="panel-title">학생별 평균 학점</h4>
                                    </a>
                                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                        <div class="panel-body">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>이름</th>
                                                        <th>최고 학점</th>
                                                        <th>최저 학점</th>
                                                        <th>평균 학점</th>
                                                    </tr>
                                                </thead>

                                                <tbody>


                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td>정치호</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">2</th>
                                                        <td>박대근</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">3</th>
                                                        <td>김민섭</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">4</th>
                                                        <td>김정남</td>
                                                        <td>4.5</td>
                                                        <td>1.8</td>
                                                        <td>3.8</td>
                                                    </tr>

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end of accordion -->

                        </div>
                    </div>
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
