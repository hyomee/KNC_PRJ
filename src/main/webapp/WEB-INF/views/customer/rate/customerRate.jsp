<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/ntcs/customer/rate/customerRate.js"></script>
</head>
<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>요금관리</b> Rate Information</h4>
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
					<a href="#">고객</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">요금관리</a>
				</li>
			</ul>
			<span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span>
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form method="post" action="" class="form-inline">
						<div class="input-group">
							<label class="mr-2 ml-2"> 판매채널 </label>
							<input type="text" class="form-control form-control-sm" id="">
							<label class="mr-2 ml-2"> 고객명 </label>
							<input type="text" class="form-control form-control-sm" id="">
							<label class="mr-2 ml-2"> 계약명 </label>
							<input type="text" class="form-control form-control-sm" id="">
							<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="far fa-file-alt"></i> <b>계약 서비스 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
		<div class="row">
			<table class="table table-hover table-bordered">
				<thead>
					<th>계약명</th>
					<th>상품명</th>
					<th>상품구분</th>
					<th>상태</th>
					<th>서비스 시작일</th>
					<th>서비스 종료일</th>
				</thead>
				<tbody>
				<tr>
					<td>임원회의</td>
					<td>IR-100</td>
					<td>메인상품</td>
					<td>사용중</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
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
				</tr>
				<tr>
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
				</tr>
				<tr>
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
				</tr>
				<tr>
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
				</tr>
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="6" class="no-data-cell">데이터가 없습니다.</td>
					</tr -->
				</tbody>
			</table>
		</div>
	</div><!--//table-->
		
	<div class="page-header mt-3">
		<h3><i class="fas fa-list-ul"></i> <b>계약 서비스 요금정보</b></h3>
	</div>

	<form class="form-inline">
		<div class="form-group form-top-box">
			<label>상품명</label>
			<input type="text" class="form-control form-control-sm" id="">
		</div>
	</form>

	<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
		<div class="row">
			<table class="table table-bordered">
				<colgroup>
					<col style="width:12%" />
					<col style="width:21%" />
					<col style="width:12%" />
					<col style="width:21%" />
					<col style="width:12%" />
					<col style="width:22%" />
				</colgroup>
				<thead>
					<th>요금항목</th>
					<th>요금 단위코드</th>
					<th>요금 단위</th>
					<th>요금</th>
					<th>서비스 시작일</th>
					<th>서비스 종료일</th>
				</thead>
				<tbody>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<tr>
					<td>기본료</td>
					<td>금액</td>
					<td>원</td>
					<td>15,000</td>
					<td>2020-01-01</td>
					<td>2100-01-01</td>
				</tr>
				<!-- 데이터가 없을 경우 ->
				<tr>
					<td colspan="6" class="no-data-cell">데이터가 없습니다.</td>
				</tr -->
				</tbody>
			</table>
		</div>
	</div><!--//table-->

	<div class="page-header mt-3">
		<h3><i class="fas fa-list-ul"></i> <b>계약 서비스 요금정보</b></h3>
	</div>

	<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
		<div class="row">
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
					<th>요금항목</th>
					<td>
						<select class="form-control">
						  <option>옵션1</option>
						  <option>옵션2</option>
						  <option>옵션3</option>
						</select>
					</td>
					<th>적용레벨</th>
					<td>
						<select class="form-control">
						  <option>가입서비스</option>
						  <option>옵션2</option>
						  <option>옵션3</option>
						</select>
					</td>
					<th>적용구분</th>
					<td>
						<select class="form-control">
						  <option>Flat</option>
						  <option>옵션2</option>
						  <option>옵션3</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>적용유형</th>
					<td>
						<select class="form-control">
						  <option>선택</option>
						  <option>정액</option>
						  <option>정율</option>
						</select>
					</td>
					<th>요금단위코드</th>
					<td>
						<select class="form-control">
						  <option>선택</option>
						  <option>금액</option>
						  <option>시간</option>
						  <option>건수</option>
						  <option>사용량</option>
						</select>
					</td>
					<th>요금단위</th>
					<td>
						<select class="form-control">
						  <option>선택</option>
						  <option>옵션1</option>
						  <option>옵션2</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>요금</th>
					<td>
						<select class="form-control">
						  <option>선택</option>
						  <option>옵션1</option>
						  <option>옵션2</option>
						</select>
					</td>
					<th>유효시작일</th>
					<td>
						<input type="text" class="form-control no-bor" id=""><!-- 2021-01-29 border없는 input 박스 ::no-bor 클래스명 추가 -->
					</td>
					<th>유효종료일</th>
					<td>
						<input type="text" class="form-control" id="" readonly><!-- 2021-01-29 비활성화 readonly 추가 -->
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div><!--//table-->

	<p class="text-right">
		<a href="" class="btn btn-lg btn-primary">수정 및 저장</a>
	</p>

</div><!--//page-inner-->
</div>
<!-- content 끝 --