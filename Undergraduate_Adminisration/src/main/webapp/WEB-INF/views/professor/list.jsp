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
                    <h3>내 강의 모든 학생 명단</h3>
                </div>
                <div class="title_right">
                    <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="이름을 적어주세요">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">검색</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_content">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                        	
								  <c:forEach var="vo1" items="${myClass}">
                                    <ul class="pagination pagination-split">
                                        <li><a href="#">${vo1.lectureName}</a></li>
                                    </ul>
                                  </c:forEach> 
                            
                                </div>

                                <div class="clearfix"></div>
  							
  							<c:forEach var="vo2" items="${list}">
                                <div class="col-md-3 col-sm-3 col-xs-12 profile_details">
                                    <div class="well profile_view">
                                        <div class="col-sm-12" style="height:200px;">
                                        	<!-- 밑은 나중에 직원/학생 조회 할 때 사용할것  -->
                                            <!-- <h4 class="brief"><i>명예교수</i></h4> -->
                                            
                                            <div class="left col-xs-7">
                                                <h2>${vo2.userName}</h2> 
                                                <p><strong>${vo2.grade} 학년&nbsp;</strong>&nbsp;${vo2.faculty }&nbsp;${vo2.majorName}</p>
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-phone"> &nbsp; &nbsp;</i>${vo2.userCellNum}</li>
                                                    <li><i class="fa fa-send"> &nbsp; &nbsp;</i>${vo2.userEmail}</li>
                                                </ul>
                                            </div>
                                            <div class="right col-xs-5 text-center">
                                                <img src="${staticPath}${vo2.userImage}" alt="" class="img-circle img-responsive">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 bottom text-center">
                                            <div class="col-xs-12 col-sm-6 emphasis">
                                            		여기다 과목명?
                                            </div>
                                            
                                            
                                            <div class="col-xs-12 col-sm-6 emphasis">

                                                <!-- id만 compose 입력하면 메세지창 뜨으으음 갸꿀!!!!-->
                                                <button id="compose" type="button" class="btn btn-success btn-xs"><i class="fa fa-comments-o">&nbsp;&nbsp;메세지&nbsp;&nbsp;
                                                    </i> </button>
                                                <button type="button" class="btn btn-primary btn-xs">
                                                    <i class="fa fa-user"> </i> &nbsp;학점입력&nbsp;&nbsp;
                                                </button>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	
	
	
	
	
    <!-- 메세지보내기 -->
    <div class="compose col-md-6 col-xs-12">
        <div class="compose-header">
            New Message
            <button type="button" class="close compose-close">
                <span>×</span>
            </button>
        </div>

        <div class="compose-body">
            <div id="alerts"></div>

            <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor">
                <div class="btn-group">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                    </ul>
                </div>

                <div class="btn-group">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a data-edit="fontSize 5">
                                <p style="font-size:17px">Huge</p>
                            </a>
                        </li>
                        <li>
                            <a data-edit="fontSize 3">
                                <p style="font-size:14px">Normal</p>
                            </a>
                        </li>
                        <li>
                            <a data-edit="fontSize 1">
                                <p style="font-size:11px">Small</p>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="btn-group">
                    <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                    <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                    <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                    <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                </div>

                <div class="btn-group">
                    <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                    <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                    <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                    <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                </div>

                <div class="btn-group">
                    <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                    <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                    <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                    <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                </div>

                <div class="btn-group">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
                    <div class="dropdown-menu input-append">
                        <input class="span2" placeholder="URL" type="text" data-edit="createLink" />
                        <button class="btn" type="button">Add</button>
                    </div>
                    <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
                </div>

                <div class="btn-group">
                    <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
                    <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
                </div>

                <div class="btn-group">
                    <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                    <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                </div>
            </div>

            <div id="editor" class="editor-wrapper"></div>
        </div>

        <div class="compose-footer">
            <button id="send" class="btn btn-sm btn-success" type="button">Send</button>
        </div>
    </div>
    <!-- /메세지보내기 -->





    <!-- /page content -->

    <%@ include file="../Basic/footer.jsp" %>

    <script type="text/javascript">
        $(function() {

        });

    </script>
</body>

</html>
