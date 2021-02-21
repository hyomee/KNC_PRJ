<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/ntcs/bill/hotbill/hotBill.js"></script>
</head>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>실시간 요금정보</b> Hot Bill</h4>
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
					<a href="#">청·수납</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">실시간 요금정보</a>
				</li>
			</ul>
			<!-- <span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span> -->
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form method="post" action="" class="form-inline form-search-box">
						<div class="input-group input-daterange" style="margin-bottom:4px;" id="datePicker">
							<label class="mr-2"> 기간 </label>
								<input type="text" class="form-control form-control-sm" value=""><div class="input-group-addon addstyle ml-0 mr-0">~</div>
								<input type="text" class="form-control form-control-sm mr-2" value="">
								<button type="button" class="btn btn-sm btn-gray mr-2">1개월</button>
								<button type="button" class="btn btn-sm btn-gray mr-2">3개월</button>
						</div>
						<div class="input-group">
							<label class="mr-2 ml-2"> 판매채널 </label>
								<input type="text" class="form-control form-control-sm" id="">		
							<label class="mr-2 ml-2"> 고객명 </label>
								<input type="text" class="form-control form-control-sm" id="">
								<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
						<script>
							$(function() {	
								$('#datePicker').datepicker({
									format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
									//startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
									//endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
									autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
									//calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
									//clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
									//datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
									//daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
									//daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
									disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
									immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
									//multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
									//multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
									templates : {
										leftArrow: '&laquo;',
										rightArrow: '&raquo;'
									}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
									showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
									//title: "테스트",	//캘린더 상단에 보여주는 타이틀
									todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
									toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
									weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
									language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
									
								});//datepicker end
								$('.input-daterange input').datepicker('setDate', 'today');
							});//ready end
						</script>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="fas fa-file-alt"></i> <b>청·수납 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>회의 일자</th>
							<th>회의명</th>
							<th>사용금액</th>
							<th>할인금액</th>
							<th>조정금액</th>
							<th>공급금액</th>
							<th>부가세</th>
							<th>총 청구금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2020-12-18</td>
							<td>월간보고</td>
							<td>150,000</td>
							<td>30,000</td>
							<td>0</td>
							<td>120,000</td>
							<td>12,000</td>
							<td>132,000</td>
						</tr>
						<tr>
							<td>2020-12-18</td>
							<td>월간보고</td>
							<td>150,000</td>
							<td>30,000</td>
							<td>0</td>
							<td>120,000</td>
							<td>12,000</td>
							<td>132,000</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="8" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-user-clock"></i> <b>실시간 요금 상세 내역 (참석자 별)</b></h3>
		</div>

		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>참석자명</th>
							<th>참석 시작시간</th>
							<th>참석 종료시간</th>
							<th>참석 시간</th>
							<th>사용금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>홍길동</td>
							<td>2020-12-18 10:00:00</td>
							<td>2020-12-18 10:45:00</td>
							<td>45</td>
							<td>0</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>2020-12-18 10:00:00</td>
							<td>2020-12-18 10:45:00</td>
							<td>45</td>
							<td>0</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>2020-12-18 10:00:00</td>
							<td>2020-12-18 10:45:00</td>
							<td>45</td>
							<td>0</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>2020-12-18 10:00:00</td>
							<td>2020-12-18 10:45:00</td>
							<td>45</td>
							<td>0</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>2020-12-18 10:00:00</td>
							<td>2020-12-18 10:45:00</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>2020-12-18 10:00:00</td>
							<td>2020-12-18 10:45:00</td>
							<td></td>
							<td>0</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>2020-12-18 10:00:00</td>
							<td>2020-12-18 10:45:00</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<!-- 데이터 없을 경우 추가 ->
						<tr>
							<td colspan="5">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->

		<p class="text-right mt-2">
			<a href="#" class="btn btn-lg btn-ty02">닫기</a>
		</p>

	</div><!--//page-inner-->
</div>
<!-- content 끝 -->