<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/reservation/management/reservationManagement.js"></script>
</head>
<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="far fa-file-alt"></i> <b>예약관리</b> Reservation Management</h4>
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
					<a href="#">예약</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">예약관리</a>
				</li>
			</ul>
			<span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span>
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form method="post" action="" class="form-inline form-search-box">
						<div class="input-group">
							<label class="mr-2 ml-2"> 판매채널 </label>
							<input type="text" class="form-control form-control-sm" id="">
							<label class="mr-2 ml-2"> 고객명 </label>
							<input type="text" class="form-control form-control-sm" id="">
						</div>
						<div class="input-group input-daterange" id="datePicker" style="width:350px;">
							<label class="mr-2 ml-2"> 예약일자 </label>
							<input type="text" class="form-control form-control-sm mr-2" value="">
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
			<h3><i class="far fa-clock"></i> <b>예약 정보</b></h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<th>예약번호</th>
						<th>회의명</th>
						<th>연결번호</th>
						<th>회의유형</th>
						<th>회의예약일시</th>
						<th>회의기간</th>
						<th>참석자수</th>
						<th>확정코드</th>
						<th>빌링 코드</th>
						<th>중단여부</th>
						<th>경보여부</th>
					</thead>
					<tbody>
					<tr>
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-primary">Beep</span>
						</td>
					</tr>
					<tr>
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-primary">Beep</span>
						</td>
					</tr>
					<tr class="selected">
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-danger">Tone</span>
						</td>
					</tr>
					<tr>
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-danger">Tone</span>
						</td>
					</tr>
					<tr class="selected">
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-primary">Beep</span>
						</td>
					</tr>
					<tr>
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-danger">Tone</span>
						</td>
					</tr>
					<tr class="selected">
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-primary">Beep</span>
						</td>
					</tr>
					<tr>
						<td>123456</td>
						<td>프로젝트 이슈회의</td>
						<td>5010</td>
						<td>Passcode Meet</td>
						<td>2020-12-18 14:00:00</td>
						<td>60</td>
						<td>5</td>
						<td>56781234</td>
						<td>C-234567</td>
						<td>자동종료</td>
						<td>
							<span class="text-danger">Tone</span>
						</td>
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
			<h3><i class="fas fa-list-ul"></i> <b>예약 상세 정보</b></h3>
		</div>
		<ul class="nav nav-pills nav-primary" id="pills-tab" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="true">예약 기본정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="pills-money-tab" data-toggle="pill" href="#pills-money" role="tab" aria-controls="pills-money" aria-selected="false">참석자 정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="pills-member-tab" data-toggle="pill" href="#pills-member" role="tab" aria-controls="pills-member" aria-selected="false">예약 상세정보</a>
			</li>
		</ul>
		<div class="tab-content mb-3" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
				<table class="table table-bordered">
					<colgroup>
						<col style="width:12%" />
						<col style="width:21%" />
						<col style="width:12%" />
						<col style="width:21%" />
						<col style="width:12%" />
						<col style="width:22%" />
					</colgroup>
					<tbody>
					<tr>
						<th>주체자ID</th>
						<td><input type="text" class="form-control form-control-sm" id="" value="홍길동" readonly></td>
						<th>예약ID</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="" value="법인">
							<!--<input type="text" class="form-control form-control-sm no-bor" id="" value="법인"> --><!-- 보더없는 입력박스 스타일 추가 -->
						</td>
						<th>예약요청유형</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>A : Add new</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>예약명</th>
						<td colspan="5"><input type="text" class="form-control form-control-sm" id="" value="2020년-실적보고 회의"></td>
					</tr>
					<tr>
						<th>빌링코드</th>
						<td><input type="text" class="form-control form-control-sm" id="" value="C-098123" readonly /></td>
						<th>확정코드</th>
						<td><input type="text" class="form-control form-control-sm" id="" value="29384756"></td>
						<th>연결번호</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>옵션1</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>회의유형</th>
						<td>
							<select class="form-control form-control-sm" disabled>
							  <option>옵션1</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
						<th>회의일시</th>
						<td>
							<div class="input-group">
								<input type="text" class="form-control form-control-sm" id="" value="2020-12-18">
								<input type="text" class="form-control form-control-sm ml-2" id="" value="14:00:00">
							</div>
						</td>
						<th>회의기간</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="" value="60">
						</td>
					</tr>
					<tr>
						<th>참석자수</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="" value="5">
						</td>
						<th>중단여부</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>0 : 자동종료</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
						<th>경보옵션</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>1 : Beep/Message 통지</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상세설정여부</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" name="optionsRadiosY" value="" checked="">
								<span class="form-radio-sign">아니오</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" name="optionsRadiosY" value="">
								<span class="form-radio-sign">예</span>
							</label>
						</td>
						<th>사전설정여부</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>선택</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
						<th>콜-플로우</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>0 : Bridge default setting</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>호스트회의참여</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" name="optionsRadiosCall" value="" checked="">
								<span class="form-radio-sign">전화걸기</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" name="optionsRadiosCall" value="">
								<span class="form-radio-sign">직접참여</span>
							</label>
						</td>
						<th>예약 저장 여부</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" name="optionsRadiosSave" value="" checked="">
								<span class="form-radio-sign">아니오</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" name="optionsRadiosSave" value="">
								<span class="form-radio-sign">예</span>
							</label>
						</td>
						<th>PIN 검증방법</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" name="optionsRadiosPin" value="" checked="">
								<span class="form-radio-sign">외부검증</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" name="optionsRadiosPin" value="">
								<span class="form-radio-sign">내부검증</span>
							</label>
						</td>
					</tr>
					<tr>
						<th>파티션 ID</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="" value="">
						</td>
						<th>Link Flag</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" name="optionsRadiosLink" value="" checked="">
								<span class="form-radio-sign">아니오</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" name="optionsRadiosLink" value="">
								<span class="form-radio-sign">예</span>
							</label>
						</td>
						<th>특별 지침 여부</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" name="optionsRadiosSpeical" value="" checked="">
								<span class="form-radio-sign">DETUPD</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" name="optionsRadiosSpeical" value="">
								<span class="form-radio-sign">SPECINS</span>
							</label>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="pills-money" role="tabpanel" aria-labelledby="pills-money-tab">
				<div style="height:270px;overflow-y:auto">
					<table class="table table-bordered">
						<thead>
							<th>이름</th>
							<th>전화번호</th>
							<th>E-Mail</th>
							<th>PIN 번호</th>
							<th>역할</th>
							<th>참석모드</th>
							<th>청구식별 ID</th>
							<th>파티션 ID</th>
							<th>참석방법</th>
						</thead>
						<tbody>
						<tr>
							<td>홍길동</td>
							<td>010-1234-5678</td>
							<td>Kim.bugking@gmail.com</td>
							<td>123456789012</td>
							<td>예</td>
							<td>대화참여</td>
							<td></td>
							<td></td>
							<td>Phone</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>010-1234-5678</td>
							<td>Kim.bugking@gmail.com</td>
							<td>123456789012</td>
							<td>예</td>
							<td>대화참여</td>
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
							<td></td>
						</tr>
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="9" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
						</tbody>
					</table>
				</div>
				<table class="table table-bordered mt-2">
					<colgroup>
						<col style="width:10%" />
						<col style="width:23%" />
						<col style="width:10%" />
						<col style="width:23%" />
						<col style="width:10%" />
						<col style="width:24%" />
					</colgroup>
					<tbody>
					<tr>
						<th><button type="button" class="btn btn-sm btn-ty02">참석자명</button></th>
						<td>
							<input type="text" class="form-control form-control-sm" id="">
						</td>
						<th>전화번호</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="">
						</td>
						<th>이메일</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="">
						</td>
					</tr>
					<tr>
						<th>PIN 번호</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="">
						</td>
						<th>역할</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>옵션1</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
						<th>참석모드</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" name="optionsMode" value=""  checked="">
								<span class="form-radio-sign">회의참여</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" name="optionsMode" value="">
								<span class="form-radio-sign">회의감시</span>
							</label>
						</td>
					</tr>
					<tr>
						<th>청구식별ID</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="">
						</td>
						<th>파티션</th>
						<td>
							<input type="text" class="form-control form-control-sm" id="">
						</td>
						<th>참석방법</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>옵션1</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="pills-member" role="tabpanel" aria-labelledby="pills-member-tab">
				내용 미정
			</div>

			<p class="text-center">
				<a href="" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a> <span class="pull-right"><a href="" class="btn btn-lg btn-primary">수정 및 저장</a></span>
			</p>
		</div>
		
	</div><!--//page-inner-->
</div>
<!-- content 끝 -->