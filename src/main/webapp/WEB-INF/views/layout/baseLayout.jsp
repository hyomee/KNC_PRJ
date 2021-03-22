<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head> 
<body> 
<div class="wrapper">
	
     <tiles:insertAttribute name="header" />    

    <!-- Left side column. contains the logo and sidebar -->
    <div class="sidebar sidebar-style-2">
     	 <tiles:insertAttribute name="left" />   
    </div>

    <!-- Content Wrapper. Contains page content -->
    <div class="main-panel">
         <tiles:insertAttribute name="body" />   
    </div>
    <!-- /.content-wrapper -->
	
</div>
</body>
</html>