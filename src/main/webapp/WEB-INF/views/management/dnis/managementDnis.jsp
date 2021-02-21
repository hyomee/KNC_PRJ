<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/management/dnis/managementDnis.js"></script>
</head> 

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>DNIS 관리</b> DNIS Management</h4>
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
					<a href="#">DNIS 관리</a>
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
							<label class="mr-2 ml-2"> 번호대역 </label>
							<select class="form-control">
							  <option>1000</option>
							  <option>옵션2</option>
							</select>
							<label class="mr-2 ml-2"> 사용여부 </label>
							<select class="form-control">
							  <option>전체</option>
							  <option>사용</option>
							  <option>비사용</option>
							</select>
							<button type="button" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="far fa-file-alt"></i> <b>DNIS 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered">
					<thead>
						<th>DNIS</th>
						<th>지역번호</th>
						<th>전화 국번호</th>
						<th>라인번호</th>
						<th>전화번호</th>
						<th>상태</th>
					</thead>
					<tbody>
					<tr>
						<td>1100</td>
						<td>032</td>
						<td>223</td>
						<td>1234</td>
						<td>032-223-1234</td>
						<td>사용</td>
					</tr>
					<tr class="selected">
						<td>1101</td>
						<td>032</td>
						<td>223</td>
						<td>1235</td>
						<td>032-223-1235</td>
						<td>비사용</td>
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
			<h3><i class="fas fa-list-ul"></i> <b>DNIS 등록 정보</b></h3>
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
				<th>지역번호</th>
				<td>
					<input type="text" class="form-control no-bor" id="" value="032"/>
				</td>
				<th>전화 국번호</th>
				<td>
					<input type="text" class="form-control" id="" value="223" />
				</td>
				<th>라인번호</th>
				<td>
					<input type="text" class="form-control" id="" value="1234" />
				</td>
			</tr>
			<tr>
				<th>DNIS</th>
				<td>
					<input type="text" class="form-control" id="" value="1100" />
				</td>
				<th>전화번호</th>
				<td>
					<input type="text" class="form-control" id="" value="032-223-1234" />
				</td>
				<th>상태</th>
				<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
					<label class="form-radio-label">
						<input class="form-radio-input" type="radio" name="optionsRadios" value="" checked="">
						<span class="form-radio-sign">비사용</span>
					</label>
					<label class="form-radio-label ml-3">
						<input class="form-radio-input" type="radio" name="optionsRadios" value="">
						<span class="form-radio-sign">사용</span>
					</label>
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