<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form method="post" action="" class="form-inline">
						<div class="input-group">
							<label class="mr-2 ml-2"> 판매채널 </label>
							<input type="text" class="form-control form-control-sm">
							<label class="mr-2 ml-2"> 고객명 </label>
							<input type="text" id="srchCustName" name="srchCustName" class="form-control form-control-sm">
							<label class="mr-2 ml-2"> 계약명 </label>
							<input type="text" id="srchCtrtName" name="srchCtrtName" class="form-control form-control-sm">
							
						</div>
						<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
						<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</span>
						</form>
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
			
			<table class="table table-hover table-bordered" id="listTable">
				<thead>
					<th>계약명</th>
					<th>상품명</th>
					<th>상품구분(코드)</th>
					<th>상품구분</th>
					<th>상태(코드)</th>
					<th>상태</th>
					<th>서비스 시작일</th>
					<th>서비스 종료일</th>
				</thead>
				<tbody>
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="6" class="no-data-cell">데이터가 없습니다.</td>
					</tr -->
				</tbody>
			</table>
			
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
			
			<table class="table table-bordered" id="rateInfoTable">
				<colgroup>
					<col style="width:0" />
					<col style="width:12%" />
					<col style="width:0" />
					<col style="width:21%" />
					<col style="width:12%" />
					<col style="width:21%" />
					<col style="width:12%" />
					<col style="width:22%" />
				</colgroup>
				<thead>
					<th>요금항목(코드)</th>
					<th>요금항목</th>
					<th>요금 단위코드(코드)</th>
					<th>요금 단위코드</th>
					<th>요금 단위</th>
					<th style="text-align:center !important">요금</th>
					<th>서비스 시작일</th>
					<th>서비스 종료일</th>
				</thead>
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
			
		</div><!--//table-->

		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>계약 서비스 요금정보</b></h3>
		</div>

		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<form id="frmRateInfo" name="frmRateInfo">
			<div class="row" id="divRateInfo">
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
							<select id="rateDvCd" name="rateDvCd" class="form-control">
							</select>
						</td>
						<th>적용레벨</th>
						<td>
							<select id="rateAplyLvlCd" name="rateAplyLvlCd" class="form-control required">
							</select>
						</td>
						<th>적용구분</th>
						<td>
							<select id="rateAplyDvCd" name="rateAplyDvCd" class="form-control">
							</select>
						</td>
					</tr>
					<tr>
						<th>적용유형</th>
						<td>
							<select id="rateAplyKdCd" name="rateAplyKdCd" class="form-control">
							</select>
						</td>
						<th>요금단위코드</th>
						<td>
							<select id="rateAplyUnitCd" name="rateAplyUnitCd" class="form-control">
							</select>
						</td>
						<th>요금단위</th>
						<td>
							<select id="rateAplyUnit" name="rateAplyUnit" class="form-control">
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
							<input type="text" id="valdStrtDttm" name="valdStrtDttm" class="form-control">
						</td>
						<th>유효종료일</th>
						<td>
							<input type="text" id="valdEndDttm" name="valdEndDttm" class="form-control">
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			</form>
		</div><!--//table-->
 
	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/customer/rate/customerRate.js"></script>
<!-- content 끝 -->
