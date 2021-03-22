<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
							<select id="srchSvcDomain" name="srchSvcDomain" class="form-control">
							</select>
							<label class="mr-2 ml-2"> 상품유형 </label>
							<select id="srchProdKdCd" name="srchProdKdCd" class="form-control">
							</select>
							
						</div>
						<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
						<button type="button" onClick="ntcsObj.search()" class="btn btn-sm btn-primary ml-3"><i class="fas fa-search text-white"></i> 조회</button>
						</span>
						</form>
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
			
			<table class="table table-hover table-bordered" id="listTable">
				<thead>
					<th>상품코드</th>
					<th>상품명</th>
					<th>상품유형(코드)</th>
					<th>상품유형</th>
					<th>상품구분(코드)</th>
					<th>상품구분</th>
					<th>요금구분(코드)</th>
					<th>요금구분</th>
					<th>판매시작일</th>
					<th>판매종료일</th>
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
			<h3><i class="far fa-folder"></i> <b>상품 기본 정보</b></h3>
		</div>
		
		<div id="divProductInfo">
			<form id="frmProductInfo" name="frmProductInfo">
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
					<td><input type="text" id="svcDomain" name="svcDomain" class="form-control" value="" /></td>
					<th>상품유형</th>
					<td>
						<select id="prodKdCd" name="prodKdCd" class="form-control">
						</select>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" id="prodName" name="prodName" class="form-control" value="" /></td>
					<th>상품구분</th>
					<td>
						<select id="prodDvCd" name="prodDvCd" class="form-control">
						</select>
					</td>
					<th>요금구분</th>
					<td>
						<select id="chargingDvCd" name="chargingDvCd" class="form-control">
						</select>
					</td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td colspan="5"><input type="text" id="prodDscr" name="prodDscr" class="form-control" value=""/></td>
				</tr>
				<tr>
					<th>요금설명</th>
					<td colspan="5"><input type="text" id="tariffDscr" name="tariffDscr" class="form-control" value="" /></td>
				</tr>
				<tr>
					<th>할인정책</th>
					<td colspan="5"><input type="text" id="dscntDscr" name="dscntDscr" class="form-control" value="" /></td>
				</tr>
				<tr>
					<th>판매 시작일</th>
					<td><input type="text" id="valdStrtDttm" name="valdStrtDttm" class="form-control"/></td>
					<th>판매 종료일</th>
					<td class="no-bor-right"><input type="text" id="valdEndDttm" name="valdEndDttm" class="form-control" /></td>
					<td colspan="2" class="no-bor-left"></td>
				</tr>
				</tbody>
			</table>
			</form>
		</div>
		<p class="text-left">
			<a href="#" data-toggle="modal" onClick="ntcsObj.prodConfigInfoModal()" class="btn btn-lg btn-ty01">상품 구성정보 등록</a>
			<span class="pull-right"><a href="#" class="btn btn-lg btn-primary">수정</a></span>
		</p>
		
		<!-- 상품구성정보관리 모달 -->
		<%@ include file="/WEB-INF/views/product/management/productManagementModal.jsp" %>
		
	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/product/management/productManagement.js"></script>
<!-- content 끝 -->