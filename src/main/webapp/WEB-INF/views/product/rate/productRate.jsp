<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
							<select id="srchFtrCd" name="srchFtrCd" class="form-control">
							</select>
						</div>
						<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
						<button type="button" onCLick="ntcsObj.search()" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</span>						
						</form>
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
			<table class="table table-hover table-bordered" id="listTable">
				<thead>
					<th>항목코드</th>
					<th>항목명</th>
					<th>구분코드(코드)</th>
					<th>구분코드</th>
					<th>적용레벨(코드)</th>
					<th>적용레벨</th>
					<th>적용유형(코드)</th>
					<th>적용유형</th>
					<th>단위코드(코드)</th>
					<th>단위코드</th>
					<th>적용단위</th>
					<th style="text-align: center !important;">요금</th>
					<th>유효시작일</th>
					<th>유효종료일</th>
				</thead>
				<tbody>
				
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="7" class="no-data-cell">데이터가 없습니다.</td>
					</tr -->
				</tbody>
			</table>
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
					<select id="ftrCd" name="ftrCd" class="form-control">>
					</select>
				</td>
				<th>항목명</th>
				<td colspan="3">
					<select id="rateDvCd" name="rateDvCd" class="form-control">
					</select>
				</td>
			</tr>
			<tr>
				<th>구분코드</th>
				<td>
					<select id="rateAplyDvCd" name="rateAplyDvCd" class="form-control">
					</select>
				</td>
				<th>적용레벨</th>
				<td>
					<select id="rateAplyLvlCd" name="rateAplyLvlCd" class="form-control">
					</select>
				</td>
				<th>적용유형</th>
				<td>
					<select id="rateAplyKdCd" name="rateAplyKdCd" class="form-control">
					</select>
				</td>
			</tr>
			<tr>
				<th>단위코드</th>
				<td>
					<select id="rateAplyUnitCd" name="rateAplyUnitCd" class="form-control">
					</select>
				</td>
				<th>적용단위</th>
				<td><input type="text" id="rateAplyUnit" name="rateAplyUnit" class="form-control" value="" /></td>
				<th>요금</th>
				<td><input type="text" id="rate" name="rate" class="form-control" id="" value="" /></td>
			</tr>
			<tr>
				<th>유효 시작일</th>
				<td><input type="text" id="valdStrtDttm" name="valdStrtDttm" class="form-control" value="" /></td>
				<th>유효 종료일</th>
				<td class="no-bor-right"><input type="text" id="valdEndDttm" name="valdEndDttm" class="form-control" id="" value="" /></td>
				<td colspan="2" class="no-bor-left"></td>
			</tr>
			</tbody>
		</table>

		<p class="text-right">
			<a href="#" id="btnModify" class="btn btn-lg btn-primary">수정</a>
		</p>

	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/product/rate/productRate.js"></script>
<!-- content 끝 -->