<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- button id : compose -->
<!-- 메세지보내기 -->
<div class="compose col-md-3 col-xs-12">
	<div class="compose-header">
		새로운 메세지
		<button type="button" class="close compose-close">
			<span>×</span>
		</button>
	</div>

	<div class="compose-body">
		<div id="alerts" style="font-size: 15px;">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<label>공지
		</label>
		<input  type="checkbox" id="msg-notify">
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<input hidden="true" type="checkbox" id="msg-notify">
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_STUDENT')">
		<input hidden="true" type="checkbox" id="msg-notify">
		</sec:authorize>
			받는이 : <span id="compose-recvUser-view"></span>
			<input hidden="true" type="text" id="compose-recvUser">
			<input hidden="true" type="text" id="compose-sendUser">
		</div>
		<div id="editor" class="editor-wrapper" style="height: 125px;"></div>
	</div>

	<div class="compose-footer">
		<button id="send" class="btn btn-sm btn-success" type="button">메세지
			보내기</button>
	</div>
</div>
<!-- /메세지보내기 -->


			<!-- 메세지 모달창 -->
			<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
							
							<div class="modal-title row">
								<div id="msgModal-image" class="col-xs-2 vcenter">
									<img src="${staticPath}/images/img.jpg" alt="Profile" class="img-circle profile_img">
								</div>
								<div class="col-xs-9 vcenter" id="msgModal-sendUser">
									<h4>보낸이</h4>
								</div>
							</div>
						</div>
						<div class="modal-body">
							<div id="msgModal-message">
								None!
							</div>
						</div>
						<div class="modal-footer" id="msgModal-sendTime">
							
						</div>
					</div>
				</div>
			</div>

			<!-- Show the cropped image in modal -->
			<div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
						</div>
						<div class="modal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.png">Download</a>
						</div>
					</div>
				</div>
			</div><!-- /.modal -->
			
		<!-- notification -->
		<div id="custom_notifications" class="custom-notifications dsp_none">
			<ul class="list-unstyled notifications clearfix"
				data-tabbed_notifications="notif-group">
			</ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
		</div>

<!-- 스크립트 순서에 따라 안되는 경우있음 잘 찾아보셈 -->
    <!-- jQuery -->
    <script src="${staticPath}/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="${staticPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- NProgress -->
    <script src="${staticPath}/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="${staticPath}/vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${staticPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${staticPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${staticPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-datetimepicker -->
    <script src="${staticPath}/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="${staticPath}/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="${staticPath}/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- jquery.inputmask -->
    <script src="${staticPath}/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <!-- jQuery Knob -->
    <script src="${staticPath}/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- Cropper -->
    <script src="${staticPath}/vendors/cropper/dist/cropper.min.js"></script>
    <!-- Dropzone.js -->
    <script src="${staticPath}/vendors/dropzone/dist/min/dropzone.min.js"></script>
    <!-- Datatables -->
    <script src="${staticPath}/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${staticPath}/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="${staticPath}/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="${staticPath}/vendors/jszip/dist/jszip.min.js"></script>
    <script src="${staticPath}/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="${staticPath}/vendors/pdfmake/build/vfs_fonts.js"></script>
    <!-- jQuery custom content scroller -->
    <script src="${staticPath}/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- bootstrap-wysiwyg -->
    <script src="${staticPath}/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="${staticPath}/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="${staticPath}/vendors/google-code-prettify/src/prettify.js"></script>
    
    <!-- bootstrap-daterangepicker 추가-->
    <script src="${staticPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${staticPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- PNotify -->
    <script src="${staticPath}/vendors/pnotify/dist/pnotify.js"></script>
    <script src="${staticPath}/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="${staticPath}/vendors/pnotify/dist/pnotify.nonblock.js"></script>
	
	<!-- https://sweetalert.js.org/guides/ -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!-- https://sweetalert.js.org/guides/ -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
	<!-- Custom Theme Scripts -->
    <script src="${staticPath}/build/js/custom.min.js"></script>
    
    <!-- Message 백그라운드 추가 -->
    <script src="${staticPath }/js/message/notify.js"></script>
    
	<!-- 단과대, 학과, 강의 등등 AJAX -->
	<script src="${staticPath }/js/share/getDivisions.js"></script>

	<!-- jQuery autocomplete -->
    <script src="${staticPath }/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	
	<!-- 장학 글   -->
    <script src="${staticPath }/js/bulletin/applybulletin.js"></script>
    <script src="${staticPath }/js/adminjanghak/applyresister.js"></script>
    
    <!-- Chart.js -->
    <script src="${staticPath }/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- morris.js -->
    <script src="${staticPath }/vendors/raphael/raphael.min.js"></script>
    <script src="${staticPath }/vendors/morris.js/morris.min.js"></script>
