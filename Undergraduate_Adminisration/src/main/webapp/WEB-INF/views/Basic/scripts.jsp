<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
		<!-- <!-- notification -->
		<div id="custom_notifications" class="custom-notifications dsp_none">
			<ul class="list-unstyled notifications clearfix"
				data-tabbed_notifications="notif-group">
			</ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
		</div> -->

<!-- 스크립트 순서에 따라 안되는 경우있음 잘 찾아보셈 -->
    <!-- jQuery -->
    <script src="/project/resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/project/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- NProgress -->
    <script src="/project/resources/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="/project/resources/vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/project/resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/project/resources/vendors/moment/min/moment.min.js"></script>
    <script src="/project/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-datetimepicker -->
    <script src="/project/resources/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="/project/resources/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="/project/resources/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- jquery.inputmask -->
    <script src="/project/resources/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <!-- jQuery Knob -->
    <script src="/project/resources/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- Cropper -->
    <script src="/project/resources/vendors/cropper/dist/cropper.min.js"></script>
    <!-- Dropzone.js -->
    <script src="/project/resources/vendors/dropzone/dist/min/dropzone.min.js"></script>
    <!-- Datatables -->
    <script src="/project/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/project/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="/project/resources/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="/project/resources/vendors/jszip/dist/jszip.min.js"></script>
    <script src="/project/resources/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="/project/resources/vendors/pdfmake/build/vfs_fonts.js"></script>
    <!-- jQuery custom content scroller -->
    <script src="/project/resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- bootstrap-wysiwyg -->
    <script src="/project/resources/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="/project/resources/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="/project/resources/vendors/google-code-prettify/src/prettify.js"></script>
    
    <!-- bootstrap-daterangepicker 추가-->
    <script src="/project/resources/vendors/moment/min/moment.min.js"></script>
    <script src="/project/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- PNotify -->
    <script src="/project/resources/vendors/pnotify/dist/pnotify.js"></script>
    <script src="/project/resources/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="/project/resources/vendors/pnotify/dist/pnotify.nonblock.js"></script>
    
	<!-- Custom Theme Scripts -->
    <script src="/project/resources/build/js/custom.min.js"></script>
    
    <!-- Message 백그라운드 추가 -->
    <script src="${staticPath }/js/message/notify.js"></script>
    