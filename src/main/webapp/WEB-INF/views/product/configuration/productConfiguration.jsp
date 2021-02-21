<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/product/management/productConfiguration.js"></script>
</head>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>상품구성관리</b> Product Configuration</h4>
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
					<a href="#">상품구성관리</a>
				</li>
			</ul>
			<!-- <span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span> -->
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form method="post" action="" class="form-inline form-search-full">
						<div class="input-group">
							<label class="mr-2 ml-2"> 판매채널 </label>
							<select class="form-control">
							  <option>콜투게더</option>
							  <option>옵션2</option>
							</select>
							<label class="mr-2 ml-2"> 서비스 도메인 </label>
							<select class="form-control">
							  <option>기본</option>
							  <option>프로</option>
							  <option>비지니스</option>
							</select>
							<label class="mr-2 ml-2 text-info"> 주상품명 </label>
							<input type="text" class="form-control" id="" value="IR_100" />
							<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="far fa-file-alt"></i> <b>상품 구성 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:400px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<th>서비스그룹</th>
						<th>적용코드</th>
						<th>적용단위</th>
						<th>서비스 요금</th>
					</thead>
					<tbody>
					<tr>
						<td>요금정책</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>기본료</td>
						<td>월</td>
						<td>원</td>
						<td>1,000,000</td>
					</tr>
					<tr>
						<td>무료서비스</td>
						<td>시간</td>
						<td>분</td>
						<td>500</td>
					</tr>
					<tr>
						<td>선택상품</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>통역</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>녹취</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>운영지원</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="4" class="no-data-long">데이터가 없습니다.</td>
					</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->

	</div><!--//page-inner-->
</div>
<!-- content 끝 -->