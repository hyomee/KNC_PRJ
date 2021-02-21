<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/management/billitem/managementBilLitem.js"></script>
</head>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="far fa-list-alt"></i> <b>요금항목관리</b> Charge Item Management</h4>
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
					<a href="#">관리</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">요금항목관리</a>
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
							<label class="mr-2 ml-2"> 요금항목 그룹 </label>
							<select class="form-control">
							  <option>전체</option>
							  <option>서비스요금항목</option>
							  <option>지원서비스요금항목</option>
							  <option>...</option>
							</select>
							<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="fas fa-paperclip"></i> <b>요금항목 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<th>요금항목그룹</th>
						<th>요금항목코드</th>
						<th>요금항목명(한글)</th>
						<th>요금항목명(영어)</th>
					</thead>
					<tbody>
					<tr>
						<td>서비스 요금항목</td>
						<td>201</td>
						<td>웹케스팅</td>
						<td></td>
					</tr>
					<tr>
						<td>서비스 요금항목</td>
						<td>202</td>
						<td>데이터케스팅</td>
						<td></td>
					</tr>
					<tr>
						<td>서비스 요금항목</td>
						<td>203</td>
						<td>화상회의</td>
						<td></td>
					</tr>
					<tr>
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
					</tr>
					<tr>
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
					</tr>
					<tr>
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
					</tr>
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="4" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-coins"></i> <b>요금항목 등록 정보</b></h3>
		</div>
		
		<table class="table table-bordered">
			<colgroup>
				<col style="width:15%" />
				<col style="width:35%" />
				<col style="width:15%" />
				<col style="width:35%" />
			</colgroup>
			<tbody>
			<tr>
				<th>요금항목그룹</th>
				<td>
					<select class="form-control">
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
				<th>요금항목코드</th>
				<td colspan="3">
					<select class="form-control">
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>항목명(한글)</th>
				<td>
					<input type="text" class="form-control" id="" value="" />
				</td>
				<th>항목명(영문)</th>
				<td>
					<input type="text" class="form-control" id="" value="" />
				</td>
			</tr>
			</tbody>
		</table>

		<p class="text-right">
			<a href="#" class="btn btn-lg btn-primary">수정 및 저장</a>
		</p>

	</div><!--//page-inner-->
</div>
<!-- content 끝 -->