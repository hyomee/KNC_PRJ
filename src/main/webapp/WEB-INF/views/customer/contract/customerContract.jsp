<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>계약관리</b> Contract Management</h4>
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
					<a href="#">계약관리</a>
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
							<label class="mr-2 ml-2"> 판매채널 </label>
								<input type="text" class="form-control form-control-sm" id="">		
							<label class="mr-2 ml-2">  </label>	
							<button type="button" data-toggle="modal" onClick="ntcsObj.custNameModal()" class="btn btn-sm btn-info">고객명</button>
							<label class="mr-2 ml-2">  </label>
								<input type="hidden" class="form-control form-control-sm" id="srchCustId" name="srchCustId">
								<input type="text" class="form-control form-control-sm" id="srchCustName" name="srchCustName" readonly>
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
				<i class="far fa-file-alt"></i> <b>계약 기본 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
		<table class="table table-hover table-bordered" id="listTable">
				<thead>
					<th>계약 ID</th>
					<th>계약명</th>
					<th>계약상태</th>
					<th>계약상태</th>
					<th>서비스번호</th>
					<th>계약 신청자</th>
					<th>계약 담당자</th>
					<th>계약 담당자</th>
					<th>매출부서</th>
					<th>매출부서</th>
					<th>계약 시작일</th>
					<th>계약 종료일</th>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div><!--//table-->

		<!-- p class="text-right mt-2">
			<a href="" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p -->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>계약 상세 정보</b></h3>
		</div>
		
		<div id="divCtrtInfo">
		<form id="frmCtrtInfo" name="frmCtrtInfo">
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
				<th>고객명</th>
				<td></td>
				<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->계약명</th>
				<td colspan="3"><input type="text" id="ctrtName" name="ctrtName" value="" class="form-control required" /></td>
			</tr>
			<tr>
				<th><button type="button" data-toggle="modal" onClick="ntcsObj.baModalPopup()" class="btn btn-sm btn-ty02">청구계정</button></th>
				<td></td>
				<th><button type="button" data-toggle="modal" onClick="ntcsObj.paModalPopup()" class="btn btn-sm btn-outline-secondary">납부계정</button></th>
				<td></td>
				<th><button type="button" data-toggle="modal" onClick="ntcsObj.dnisModalPopup()" class="btn btn-sm btn-info">연결번호</button></th>
				<td></td>
			</tr>
			<tr>
				<th>계약상태</th>
				<td>
					<select id="ctrtSttsCd" name="ctrtSttsCd" class="form-control">
					  
					</select>
				</td>
				<th>계약변경사유</th> <!-- textbox로 변경 필요 -->
				<td>
					<select class="form-control">
					  <option>선택하세요.</option>
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>...</option>
					</select>
				</td>
				<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->계약신청자</th>
				<td><input type="text" id="ctrtAppnt" name="" class="form-control required"></td>
			</tr>
			<tr>
				<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->계약담당자</th>
				<td>
					<select id="salesUsrId" name="salesUsrId" class="form-control required">
					</select>
				</td>
				<th>계약매출부서</th>
				<td>
					<select id="salesOrgId" name="salesOrgId" class="form-control">
					</select>
				</td>
				<th>빌링 시작일</th>
				<td><input type="text"  id="billStrtDttm" name="billStrtDttm"  value="" class="form-control" /></td>
			</tr>
			<tr>
				<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->계약기간</th> <!-- 확인 필요 -->
				<td>
					<select class="form-control">
					  <option>1개월</option>
					  <option>3개월</option>
					  <option>6개월</option>
					  <option>1년</option>
					  <option>3년</option>
					</select>
				</td>
				<th>계약시작일</th>
				<td><input type="text" id="valdStrtDttm" name="valdStrtDttm" value="" class="form-control"/></td>
				<th>계약 종료일</th>
				<td><input type="text" id="valdEndDttm" name="valdEndDttm" class="form-control" id="" value="9999-12-31" /></td>
			</tr>
			</tbody>
		</table>
		</form>
		</div>
		
		<p class="text-right">
			<a href="#" onClick="ntcsObj.add()" class="btn btn-lg btn-ty01">저장 후 서비스관리로 이동</a>
		</p>


		<!-- modal 연결 -->
		<%@ include file="/WEB-INF/views/customer/contract/customerContractPaModal.jsp" %>
		<%@ include file="/WEB-INF/views/customer/contract/customerContractBaModal.jsp" %>
		<%@ include file="/WEB-INF/views/customer/contract/customerContractDnisModal.jsp" %>
		<%@ include file="/WEB-INF/views/common/modal/custNameModal.jsp" %>			

	</div><!--//page-inner-->
</div>

<script type="text/javascript" src="/resources/js/ntcs/customer/contract/customerContract.js"></script>
<!-- content 끝 -->