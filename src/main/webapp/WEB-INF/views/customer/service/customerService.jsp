<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/ntcs/customer/service/customerService.js"></script>
</head>
<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>서비스 관리</b> Service Management</h4>
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
					<a href="#">서비스 관리</a>
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
					</thead>
					<tbody>
					<tr>
						<td>임원회의</td>
						<td>IR-100</td>
						<td>메인상품</td>
						<td>사용중</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
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
					</tr>
					<tr>
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
					</tr>
					<tr>
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
					</tr>
					<tr>
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
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="5" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->

		<!-- p class="text-right mt-2">
			<a href="" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p -->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>계약 서비스 상품 관리</b></h3>
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
					<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->계약명</th>
					<td colspan="5" class="text-left">임원관리</td>
				</tr>
				<tr>
					<th><button type="button" class="btn btn-sm btn-ty02">상품</button></th>
					<td class>IR-100</td>
					<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->상품상태</th>
					<td>
						<select class="form-control">
						  <option>사용</option>
						  <option>중지</option>
						  <option>해지</option>
						</select>
					</td>
					<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->서비스 적용일</th>
					<td>
						<select class="form-control">
						  <option>옵션1</option>
						  <option>옵션2</option>
						  <option>옵션3</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>변경사유코드</th>
					<td>
						<select class="form-control">
						  <option>신규</option>
						  <option>불만족</option>
						  <option>단순변심</option>
						</select>
					</td>
					<th>변경사유</th>
					<td colspan="3"><input type="text" class="form-control no-bor" id=""><!-- 2021-01-29 border없는 input 박스 ::no-bor 클래스명 추가  --></td>
				</tr>
			</tbody>
		</table>
		<p class="text-right">
			<a href="#" class="btn btn-lg btn-ty01">저장 후 서비스관리로 이동</a>
		</p>

	</div><!--//page-inner-->
</div>
<!-- content 끝 -->
		