<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-desktop"></i> <b>회의예약</b> Conference Reservation</h4>
			<ul class="breadcrumbs">
				<li class="nav-home">
					<a href="#">
						<i class="fas fa-home"></i>
					</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">회의</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">회의예약</a>
				</li>
			</ul> 
			<!--<span class="pull-right"><a href="#" class="btn btn-primary btn-round">+신규등록</a></span>-->
		</div>
		
		
		<table class="table table-bordered mt-3">
			<tbody>
				<tr>
					<td scope="col">
						<form method="post" action="" class="form-inline">
						<label class="mr-2 ml-2"> 판매채널 </label>
							<input type="text" id="srchSalesChannel" name="srchSalesChannel" valeu="콜투게더" class="form-control">		
						<label class="mr-2 ml-2"> <button type="button" data-toggle="modal" onClick="ntcsObj.custNameModal()" class="btn btn-sm btn-info">고객명</button> </label>
							<input type="text" id="srchCustName" name="srchCustName" class="form-control" readonly>
							<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
							<button type="button" id="btnSearch" onClick="ntcsObj.search()" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>	
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>	
		
		<div id="calendar"></div>
		<div class="clearfix mb-4"></div>
		
		<!-- modal 연결 -->
		<%@ include file="/WEB-INF/views/common/modal/custNameModal.jsp" %>		
		
	</div><!--//page-inner-->

</div>   
<link href="/resources/css/calendar.css" rel="stylesheet"/>
<script src="/resources/js/calendar.js" type="text/javascript"></script>	
<script src="/resources/js/ntcs/conference/reservation/conferenceReservation.js"></script> 