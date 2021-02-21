<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Calltogether Admin</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>
	<%@ include file="/WEB-INF/views/common/include/css.jsp"%>
	<%@ include file="/WEB-INF/views/common/include/script.jsp"%>
    <decorator:head/>
</head> 
<body>
<div class="wrapper">
	
        <page:applyDecorator name="top" />

    <!-- Left side column. contains the logo and sidebar -->
    <div class="sidebar sidebar-style-2">
        <page:applyDecorator name="left" />
    </div>

    <!-- Content Wrapper. Contains page content -->
    <div class="main-panel">
        <decorator:body />
    </div><!-- /.content-wrapper -->
	<!-- 
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 0.0.1
        </div>
        <strong>Copyright &copy; 2015 sample </strong> All rights reserved.
    </footer>
     -->
</div>
</body>
</html>