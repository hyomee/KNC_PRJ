<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/product/management/productManagement.js"></script>
</head>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="far fa-folder"></i> <b>상품관리</b> Product Management</h4>
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
					<a href="#">상품관리</a>
				</li>
			</ul>
			<span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span>
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
							<label class="mr-2 ml-2"> 상품유형 </label>
							<select class="form-control">
							  <option>전체</option>
							  <option>옵션2</option>
							  <option>옵션3</option>
							</select>
							<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="fas fa-archive"></i> <b>상품정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<th>상품코드</th>
						<th>상품명</th>
						<th>상품유형</th>
						<th>상품구분</th>
						<th>요금구분</th>
						<th>판매시작일</th>
						<th>판매종료일</th>
					</thead>
					<tbody>
					<tr>
						<td>PD1001001</td>
						<td>IR_100</td>
						<td>메인</td>
						<td>기업</td>
						<td>후불</td>
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
					</tr>
					<tr>
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
					</tr>
					<tr>
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
					</tr>
					<tr>
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
					</tr>
					<tr>
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
			<h3><i class="far fa-folder"></i> <b>상품 기본 정보</b></h3>
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
				<th>판매채널</th>
				<td><input type="text" class="form-control" id="" value="콜투게더" /></td>
				<th>서비스 도메인</th>
				<td><input type="text" class="form-control" id="" value="비지니스" /></td>
				<th>상품유형</th>
				<td>
					<select class="form-control">
					  <option>메인상품</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" class="form-control" id="" value="IR_100" /></td>
				<th>상품구분</th>
				<td>
					<select class="form-control">
					  <option>기업</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
				<th>요금구분</th>
				<td>
					<select class="form-control">
					  <option>후불</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td colspan="5"><input type="text" class="form-control" id="" value="" /></td>
			</tr>
			<tr>
				<th>요금설명</th>
				<td colspan="5"><input type="text" class="form-control" id="" value="" /></td>
			</tr>
			<tr>
				<th>할인정책</th>
				<td colspan="5"><input type="text" class="form-control" id="" value="" /></td>
			</tr>
			<tr>
				<th>판매 시작일</th>
				<td><input type="text" class="form-control" id="" value="2021-01-10" /></td>
				<th>판매 종료일</th>
				<td class="no-bor-right"><input type="text" class="form-control" id="" value="9999-12-31" /></td>
				<td colspan="2" class="no-bor-left"></td>
			</tr>
			</tbody>
		</table>

		<p class="text-left">
			<a href="#" class="btn btn-lg btn-ty01">상품 구성정보 등록</a>
			<span class="pull-right"><a href="" class="btn btn-lg btn-primary">수정 및 저장</a></span>
		</p>

	</div><!--//page-inner-->
</div>
<!-- content 끝 -->