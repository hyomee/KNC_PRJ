<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>

	<!-- Fonts and icons -->
	<script src="/resources/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['/resources/css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>
	<!-- jQuery UI -->

	<!--   Core JS Files   -->
	<script src="/resources/js/core/jquery.3.2.1.min.js"></script>
	<script src="/resources/js/core/popper.min.js"></script>
	<script src="/resources/js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script src="/resources/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="/resources/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="/resources/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- DataTables -->
    <script src="/resources/js/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/js/datatables/dataTables.bootstrap4.min.js"></script>   
     
	<!-- Bootstrap Notify -->
	<script src="/resources/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- Sweet Alert -->
	<script src="/resources/js/plugin/sweetalert/sweetalert.min.js"></script>
 
	<!-- Atlantis JS -->
	<script src="/resources/js/atlantis.js"></script>
    <script src="/resources/js/bootstrap-datepicker.js" type="text/javascript"></script>	
    
	<%-- Validator Plugin  --%>
	<script src="/resources/js/validator/jquery.validate.js" ></script>
	<script src="/resources/js/validator/additional-methods.js" ></script>    
   
    <%-- iframe --%>
    <script src="/resources/js/plugin/iframe/jquery.iframe.js" ></script>    

	<%-- moment --%>
	<script src="/resources/js/moment.js" ></script>   
	
    <!-- calltogether JS --> 
    <script src="/resources/js/calltogether.js"></script>   
	