<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="far fa-chart-bar"></i> <b>회의현황</b> Conference DashBoard</h4>
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
					<a href="#">회의현황</a>
				</li>
			</ul>
		</div>

		<div class="row text-left mt-2">
			<div class="col-sm-6 col-xs-12">
				<div class="card left-card-box">
					<h4 class="title text-white">금일 예약 회의</h4>
					<strong class="text-white">568</strong>
				</div>
				<!--card-->
			</div>
			<div class="col-sm-6 col-xs-12">
				<div class="card right-card-box">
					<h4 class="title text-white">활성화 된 회의</h4>
					<strong class="text-white">5</strong>
				</div>
				<!--card-->
			</div>
		</div>
		
		<div class="page-header mt-3 mb-2">
			<h3><i class="fas fa-clipboard-check"></i> <b>금일 회의 현황</b></h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<table class="table table-hover table-bordered" id="listTable">
				<thead>
					<tr>
						<th>예약ID</th>
						<th>고객ID</th>
						<th>고객명</th>
						<th>주체자(ID)</th>
						<th>주체자</th>
						<th>회의명</th>
						<th>회의시간</th>
						<th>회의기간</th>
						<th style="text-align: center !important;">최대 참석자 수</th>
						<th style="text-align: center !important;">참석자 수</th>
						<th>회의상태(코드)</th>
						<th>회의상태</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div><!--//table-->
			
		<p class="text-right mt-2">
			<a href="" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p>
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>참석자 현황</b></h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<table class="table table-hover table-bordered" id="listTableAttendees">
				<thead>
					<tr>
						<th>참석자명</th>
						<th>PIN 번호</th>
						<th>E-Mail</th>
						<th>연락전화번호</th>
						<th>참석 유형(코드)</th>
						<th>참석 유형</th>
						<th>대화모드</th>
						<th>참석시간</th>
						<th>상태(코드)</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div><!--//table-->
		

	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/conference/dashboard/conferenceDashboard.js"></script>
<!-- content 끝 -->

		