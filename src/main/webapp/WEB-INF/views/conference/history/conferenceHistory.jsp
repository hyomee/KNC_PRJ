<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-clipboard-list"></i> <b>회의 이력</b> Conference History</h4>
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
					<a href="#">회의 이력</a>
				</li>
			</ul>
			<!-- <span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span> -->
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form id="frmSearch" name="frmSearch" class="form-inline form-search-box">
						<div class="input-group input-daterange" style="margin-bottom:4px;" id="datePicker">
							<label class="mr-2"> 기간 </label>
								<input type="text" id="srchSvcConfDurationFr" name="srchSvcConfDurationFr" class="form-control form-control-sm" value=""><div class="input-group-addon addstyle ml-0 mr-0">~</div>
								<input type="text" id="srchSvcConfDurationTo" name="srchSvcConfDurationTo" class="form-control form-control-sm mr-2" value="">
								<button type="button" id="btn1Month" class="btn btn-sm btn-gray mr-2">1개월</button>
								<button type="button" id="btn3Month" class="btn btn-sm btn-gray mr-2">3개월</button>
						</div> 
						<div class="input-group">
							<label class="mr-2 ml-2"> 판매채널 </label>
								<input type="text" id="srchSalesChannel" name="srchSalesChannel" class="form-control form-control-sm">		
							<label class="mr-2 ml-2">
								<button type="button" data-toggle="modal" onClick="ntcsObj.custNameModal()" class="btn btn-sm btn-info">고객명</button>
							<label class="mr-2 ml-2">
								<input type="hidden" id="srchCustId" name="srchCustId">
								<input type="text" id="srchCustName" name="srchCustName" class="form-control form-control-sm" readonly>
								<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
								<button type="button" onClick="ntcsObj.search()" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
								</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="fas fa-clipboard-check"></i> <b>금일 회의 현황</b>
				<span class="btn-exel-right"><a href="#" class="btn btn-sm"><img src="/resources/images/icon_exel.png"> 엑셀 다운로드</a></span>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<table class="table table-hover table-bordered" id="listTable">
				<thead>
					<tr>
						<th>회의 일자</th>
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
						<th>녹취</th> 
					</tr>
					
				</thead>
				<tbody>
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="11" class="no-data-cell">데이터가 없습니다.</td>
					</tr -->
				</tbody>
			</table>
		</div><!--//table-->

		<p class="text-right mt-2">
			<a href="#" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="#" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
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
						<th>종료시간</th>
						<th>상태(코드)</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="9" class="no-data-cell">데이터가 없습니다.</td>
					</tr -->
				</tbody>
			</table>
		</div><!--//table-->

		<!-- modal 연결 -->
		<%@ include file="/WEB-INF/views/common/modal/custNameModal.jsp" %>
		
	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/conference/history/conferenceHistory.js"></script>
<!-- content 끝 -->