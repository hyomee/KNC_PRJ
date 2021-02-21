<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/ntcs/conference/dashboard/conferenceDashboard.js"></script>
</head>
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
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>예약ID</th>
							<th>고객명</th>
							<th>주체자</th>
							<th>회의명</th>
							<th>회의시간</th>
							<th>회의기간</th>
							<th>최대 참석자 수</th>
							<th>참석자 수</th>
							<th>회의상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>C4758392</td>
							<td>삼성전자</td>
							<td>홍기동</td>
							<td>주간보고</td>
							<td>10:00</td>
							<td>60:00</td>
							<td>15</td>
							<td>12</td>
							<td>
								<span class="text-primary">진행중</span>
							</td>
						</tr>
						<tr>
							<td>C4758393</td>
							<td>엘지전자</td>
							<td>이순신</td>
							<td>일일보고</td>
							<td>10:30</td>
							<td>30:00</td>
							<td>5</td>
							<td>0</td>
							<td>
								<span class="text-danger">대기</span>
							</td>
						</tr>
						<tr>
							<td>C4758394</td>
							<td>삼성전자</td>
							<td>이순신</td>
							<td>일일보고</td>
							<td>10:30</td>
							<td>30:00</td>
							<td>5</td>
							<td>0</td>
							<td>
								<span class="text-primary">진행중</span>
							</td>
						</tr>
						<tr>
							<td>C4758395</td>
							<td>엘지전자</td>
							<td>이순신</td>
							<td>일일보고</td>
							<td>13:30</td>
							<td>20:00</td>
							<td>5</td>
							<td>0</td>
							<td>
								<span class="text-danger">대기</span>
							</td>
						</tr>
						<tr>
							<td>C4758396</td>
							<td>삼성전자</td>
							<td>이순신</td>
							<td>일일보고</td>
							<td>08:30</td>
							<td>14:00</td>
							<td>45</td>
							<td>10</td>
							<td>
								<span class="text-danger">대기</span>
							</td>
						</tr>
						<tr>
							<td>C4758396</td>
							<td>삼성전자</td>
							<td>이순신</td>
							<td>일일보고</td>
							<td>08:30</td>
							<td>14:00</td>
							<td>45</td>
							<td>10</td>
							<td>
								<span class="text-danger">대기</span>
							</td>
						</tr>
						<tr>
							<td>C4758396</td>
							<td>삼성전자</td>
							<td>이순신</td>
							<td>일일보고</td>
							<td>08:30</td>
							<td>14:00</td>
							<td>45</td>
							<td>10</td>
							<td>
								<span class="text-danger">대기</span>
							</td>
						</tr>
						<tr>
							<td>C4758396</td>
							<td>삼성전자</td>
							<td>이순신</td>
							<td>일일보고</td>
							<td>08:30</td>
							<td>14:00</td>
							<td>45</td>
							<td>10</td>
							<td>
								<span class="text-danger">대기</span>
							</td>
						</tr>
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="9" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>참석자 현황</b></h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>참석자명</th>
							<th>PIN 번호</th>
							<th>E-Mail</th>
							<th>연락전화번호</th>
							<th>참석 유형</th>
							<th>대화모드</th>
							<th>참석시간</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-primary">Connected</span>
							</td>
						</tr>
						<tr>
							<td>유관순</td>
							<td>4958903313</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-danger">Hold</span>
							</td>
						</tr>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-danger">Hold</span>
							</td>
						</tr>
						<tr>
							<td>유관순</td>
							<td>4958903313</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-primary">Connected</span>
							</td>
						</tr>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-primary">Connected</span>
							</td>
						</tr>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-danger">Hold</span>
							</td>
						</tr>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-danger">Hold</span>
							</td>
						</tr>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-danger">Hold</span>
							</td>
						</tr>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-danger">Hold</span>
							</td>
						</tr>
						<tr>
							<td>이순신</td>
							<td>4958903312</td>
							<td>Kim.bugking@gmail.com</td>
							<td>010-1234-5678</td>
							<td>Dial Out</td>
							<td>대화</td>
							<td>10:01</td>
							<td>
								<span class="text-primary">Connected</span>
							</td>
						</tr>
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="9" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->
		
		<p class="text-right mt-2">
			<a href="" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p>
		
	</div><!--//page-inner-->
</div>
<!-- content 끝 -->
		