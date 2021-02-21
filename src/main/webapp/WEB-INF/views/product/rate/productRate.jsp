<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/product/rate/productRate.js"></script>
</head>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>요금관리</b> Charing Management</h4>
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
					<a href="#">상품</a>
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
						<form method="post" action="" class="form-inline form-search-small">
						<div class="input-group">
							<label class="mr-2 ml-2"> 서비스 그룹 </label>
							<select class="form-control">
							  <option>선택상품</option>
							  <option>옵션2</option>
							</select>
							<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="far fa-file-alt"></i> <b>요금정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<th>항목코드</th>
						<th>항목명</th>
						<th>구분코드</th>
						<th>적용레벨</th>
						<th>적용유형</th>
						<th>단위코드</th>
						<th>적용단위</th>
						<th>요금</th>
						<th>유효시작일</th>
						<th>유효종료일</th>
					</thead>
					<tbody>
					<tr>
						<td>500</td>
						<td>통역_기본</td>
						<td>기본료</td>
						<td>가입</td>
						<td>정액</td>
						<td>건당</td>
						<td>1</td>
						<td>300,000</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
					</tr>
					<tr>
						<td>600</td>
						<td>녹취_기본</td>
						<td>기본료</td>
						<td>가입</td>
						<td>정액</td>
						<td>건당</td>
						<td>1</td>
						<td>500,000</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
					</tr>
					<tr>
						<td>501</td>
						<td>녹취_사용</td>
						<td>사용료</td>
						<td>가입</td>
						<td>정액</td>
						<td>분</td>
						<td>10</td>
						<td>5,000</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
					</tr>
					<tr>
						<td>500</td>
						<td>녹취_프리</td>
						<td>공제</td>
						<td>가입</td>
						<td>정액</td>
						<td>건당</td>
						<td>5</td>
						<td>0</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
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
						<td></td>
					</tr>
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="7" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->

		<!-- p class="text-right mt-2">
			<a href="" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p -->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>요금 등록 정보</b></h3>
		</div>
		
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
				<th>서비스 그룹</th>
				<td>
					<select class="form-control">
					  <option>선택상품</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
				<th>항목명</th>
				<td colspan="3">
					<select class="form-control">
					  <option>통역_기본</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>구분코드</th>
				<td>
					<select class="form-control">
					  <option>기본료</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
				<th>적용레벨</th>
				<td>
					<select class="form-control">
					  <option>청구계정</option>
					  <option>가입서비스</option>
					  <option>...</option>
					</select>
				</td>
				<th>적용유형</th>
				<td>
					<select class="form-control">
					  <option>정액</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>단위코드</th>
				<td>
					<select class="form-control">
					  <option>건당</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
				<th>적용단위</th>
				<td><input type="text" class="form-control" id="" value="1" /></td>
				<th>요금</th>
				<td><input type="text" class="form-control" id="" value="300,000" /></td>
			</tr>
			<tr>
				<th>유효 시작일</th>
				<td><input type="text" class="form-control" id="" value="2021-01-10" /></td>
				<th>유효 종료일</th>
				<td class="no-bor-right"><input type="text" class="form-control" id="" value="9999-12-31" /></td>
				<td colspan="2" class="no-bor-left"></td>
			</tr>
			</tbody>
		</table>

		<p class="text-right">
			<a href="#" class="btn btn-lg btn-primary">수정 및 저장</a>
		</p>

	</div><!--//page-inner-->
</div>
<!-- content 끝 -->