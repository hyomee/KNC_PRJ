<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- contents 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>고객관리</b> Customer Management</h4>
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
					<a href="#">고객관리</a>
				</li>
			</ul>
			<span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span>
		</div>
		
		<table class="table table-bordered mt-4">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form method="post" action="" class="form-inline form-search-box">
						<div class="input-group input-daterange" style="margin-bottom:4px;" id="datePicker">
							<label class="mr-2"> 기간 </label>
								<input type="text" id="srchValdStrtDttm" name="srchValdStrtDttm" class="form-control form-control-sm" value=""><div class="input-group-addon addstyle ml-0 mr-0">~</div>
								<input type="text" id="srchValdEndDttm" id="srchValdEndDttm" class="form-control form-control-sm mr-2" value="">
								<button type="button" id="btn1Month" class="btn btn-sm btn-gray mr-2">1개월</button>
								<button type="button" id="btn3Month" class="btn btn-sm btn-gray mr-2">3개월</button>
						</div>
						<div class="input-group">
							<label class="mr-2 ml-2"> 판매채널 </label>
								<input type="text" id="" name="" class="form-control form-control-sm">		
							<label class="mr-2 ml-2"> 고객명 </label>
								<input type="text" id="" name="" class="form-control form-control-sm">
								<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
								<button type="button" class="btn btn-sm btn-primary ml-3" onClick="ntcsObj.search()"><i class="fas fa-search text-white"></i> 조회</button>
								</span>
						</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>	
		<div class="page-header mt-3 mb-2">
			<h3><i class="far fa-file-alt"></i> <b>고객 기본 정보</b></h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 -->
			
			<table class="table table-hover table-bordered" id="custDataTable">
				<thead>
					<th>고객ID</th>
					<th>고객명</th>
					<th>고객유형(코드)</th>
					<th>고객유형</th>
					<th>고객구분(코드)</th>
					<th>고객구분</th>
					<th>주민/법인번호</th>
					<th>사업자등록번호</th>
					<th>대표 전화번호</th>
					<th>상태(코드)</th>
					<th>상태</th>
					<th>등록/해지일</th>
				</thead>
				<tbody>
				<!-- 데이터가 없을 경우 ->
				<tr>
					<td colspan="8" class="no-data-cell">데이터가 없습니다.</td>
				</tr -->
				</tbody>
			</table>
			
		</div><!--//table-->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>고객 상세 정보</b></h3>
		</div>
		<ul class="nav nav-pills nav-primary" id="pills-tab" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" id="pills-profile-tab" data-idx="0" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="true">상세기본정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="pills-money-tab" data-idx="1" data-toggle="pill" href="#pills-money" role="tab" aria-controls="pills-money" aria-selected="false">청·수납 정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="pills-member-tab" data-idx="2" data-toggle="pill" href="#pills-member" role="tab" aria-controls="pills-member" aria-selected="false">구성원정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="pills-dnis-tab" data-toggle="pill" data-idx="3" href="#pills-dnis" role="tab" aria-controls="pills-dnis" aria-selected="false">DNIS정보</a>
			</li>
		</ul>
		<!-- 고객 상세정보 - 상세기본정보 -->
		<div class="tab-content mb-3" id="pills-tabContent">
			
			<div class="tab-pane fade show active pillsProfileContent" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
				<form id="frmPillsProfile" name="frmPillsProfile">
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
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->대표자명</th>
						<td class="text-left"><input type="text" id="repName" name="repName" class="form-control form-control-sm required" value="" readonly></td>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->고객유형</th>
						<td class="text-left">
							<select id="custType" name= "custType" class="form-control form-control-sm required">
							  <option value="">선택하세요.</option>
							  <option value="1">옵션1</option>
							  <option value="2">옵션2</option>
							  <option value-"3">옵션3</option>
							</select>							
							<!--<input type="text" class="form-control form-control-sm no-bor" id="" value="법인"> --><!-- 보더없는 입력박스 스타일 추가 -->
						</td>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->고객구분</th>
						<td class="text-left">
							<select id="custClass" name="custClass" class="form-control form-control-sm required">
							  <option value="">선택하세요.</option>
							  <option value="1">옵션1</option>
							  <option value="2">옵션2</option>
							  <option value-"3">옵션3</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>주민/법인번호</th>
						<td><input type="text" id="corpRegNo" name="corpRegNo" class="form-control form-control-sm"></td>
						<th><span class="ess-mark">*</span><!-- 고객유형이 개인이 아닌 경우 필수입력 항목 -->사업자등록번호</th>
						<td class="text-left"><input type="text" id="bizRegNo" name="bizRegNo" class="form-control form-control-sm required"></td>
						<th>전화번호</th>
						<td><input type="text" id="telNo" name="telNo" class="form-control form-control-sm url2"></td>
					</tr>
					<tr>
						<th>업종</th>
						<td>
							<select id="selBizType" name="selBizType" class="form-control form-control-sm">
							  <option value="">선택하세요.</option>
							  <option value="1">옵션1</option>
							  <option value="2">옵션2</option>
							  <option value-"3">옵션3</option>
							</select>
						</td>
						<th>업태</th>
						<td>
							<select id="selBizCond" name="selBizCond" class="form-control form-control-sm">
							  <option value="">선택하세요.</option>
							  <option value="1">옵션1</option>
							  <option value="2">옵션2</option>
							  <option value-"3">옵션3</option>
							</select>
						</td>
						<th>과세여부</th>
						<td class="text-left">
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" id="taxFlag" name="taxFlag" value="1">
								<span class="form-radio-sign">과세</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" id="taxFlag" name="taxFlag" value="2">
								<span class="form-radio-sign">비과세</span>
							</label>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="5"><input type="text" id="txtDtlAddr" name="txtDtlAddr" class="form-control form-control-sm"></td>
					</tr>
					<tr>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->사용자명</th>
						<td class="text-left"><input type="text" id="custName" name="custName" class="form-control form-control-sm required"></td>
						<th>팩스번호</th>
						<td><input type="text" id="faxNo" name="faxNo" class="form-control form-control-sm"></td>
						<th>휴대폰번호</th>
						<td><input type="text" id="txtMtelNo" name="txtMtelNo" class="form-control form-control-sm"></td>
					</tr>
					<tr>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->E-Mail</th>
						<td class="text-left"><input type="text" id="email" name="email" class="form-control form-control-sm required"></td>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->판매채널</th>
						<td colspan="3">
							<select id="" name="" class="form-control form-control-sm" style="width:23%;">
							  <option>선택하세요.</option>
							  <option>옵션1</option>
							  <option>옵션2</option>
							  <option>...</option>
							</select>
						</td>
					</tr>
					
					</tbody>
				</table>
				</form>
			</div>
			
			<div class="tab-pane fade pillsMoneyContent" id="pills-money" role="tabpanel" aria-labelledby="pills-money-tab">
				<form id="frmPillsMoney" name="frmPillsMoney">
				<table class="table table-bordered">
					<colgroup>
						<col style="width:10%" />
						<col style="width:23%" />
						<col style="width:10%" />
						<col style="width:23%" />
						<col style="width:10%" />
						<col style="width:24%" />
					</colgroup>
					<tbody>
					<tr>
						<th>청구상태</th>
						<td>
							<select id="acntSttsCd" name="acntSttsCd" class="form-control form-control-sm">
							  <option>활성</option>
							  <option>비활성</option>
							</select>
						</td>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->청구주기</th>
						<td class="text-left">
							<select id="billCyclCd" name="billCyclCd" class="form-control form-control-sm required">
							  <option>매월 1일 ~ 말일</option>
							  <option>옵션2</option>
							</select>
						</td>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->청구서 유형</th>
						<td class="text-left">
							<select id="bltxtKdCd" name="bltxtKdCd" class="form-control form-control-sm">
							  <option>지로</option>
							  <option>이메일</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목  -->수령인명</th>
						<td class="text-left"><input type="text" id="bltxtRcptName" name="bltxtRcptName" class="form-control form-control-sm required"></td>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 -->E-mail</th>
						<td><input type="text" id="bltxtEmail" name="bltxtEmail" class="form-control form-control-sm required email"></td>
						<th>휴대폰 번호</th>
						<td>
							<div class="input-group">
								<input type="text" id="bltxtMtelNo" name="bltxtMtelNo" class="form-control form-control-sm mr-2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
							</div>
						</td>
					</tr>
					<tr>
						<th>수령지 주소</th>
						<td colspan="5">
							<div class="input-group">
								<input type="text" id="bltxtZipCd" name="bltxtZipCd" class="col-sm-2 form-control form-control-sm mr-2" />
								<input type="text" id="bltxtBaseAddr" name="bltxtBaseAddr" class="col-sm-10 form-control form-control-sm" />
							</div>
						</td>
					</tr>
					<tr>
						<th>세금계산서</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" id="taxInvoiceFlag" name="taxInvoiceFlag" value="1">
								<span class="form-radio-sign">발행</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" id="taxInvoiceFlag" name="taxInvoiceFlag" value="2">
								<span class="form-radio-sign">비발행</span>
							</label>
						</td>
						<th>과세여부</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" id="taxFlag" name="taxFlag" value="1">
								<span class="form-radio-sign">과세</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" id="taxFlag" name="taxFlag" value="2">
								<span class="form-radio-sign">비과세</span>
							</label>
						</td>
						<th>팩스번호</th>
						<td>
							<div class="input-group">
								<input type="text" id="faxNo" name="faxNo" class="form-control form-control-sm mr-2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
							</div>
						</td>
					</tr>
					<tr>
						<th>통화코드</th>
						<td>
							<select id="billCurCd" name="billCurCd" class="form-control form-control-sm">
							</select>
						</td>
						<th>환율반영일</th>
						<td>
							<select id="exrateRfctDd" name="exrateRfctDd" class="form-control form-control-sm">
							</select>
						</td>
						<th>고정환율</th>
						<td>
							<input type="text" id="" name="" class="form-control form-control-sm">
						</td>
					</tr>
					<tr>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목  -->납부자명</th>
						<td><input type="text" id="pymName" name="pymName" class="form-control form-control-sm required"></td>
						<th>납부방법</th>
						<td>
							<select id="pymKdCd" name="pymKdCd" class="form-control form-control-sm">
							</select>
						</td>
						<th>결제일자</th>
						<td>
							<select id="pymDdt" name="pymDdt" class="form-control form-control-sm">
							</select>
						</td>
					</tr>
					<tr>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목  -->은행(카드)사</th>
						<td class="text-left">
							<select id="pymCardCd" name="pymCardCd" class="form-control form-control-sm required">
							  <option value="1">국민은행</option>
							  <option value="2">농협</option>
							</select>
						</td>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목  -->계좌(카드) 번호</th>
						<td class="text-left"><input type="text" id="pymAccuntNo" name="pymAccuntNo" class="form-control form-control-sm required"></td>
						<th>가상계좌번호</th>
						<td><input type="text" id="pymAcntNo" name="pymAcntNo" class="form-control form-control-sm"></td>
					</tr>
					</tbody>
				</table>
				</form>
			</div>
			<div class="tab-pane fade pillsMemberContent" id="pills-member" role="tabpanel" aria-labelledby="pills-member-tab">
				<table class="table table-bordered">
					<colgroup>
						<col style="width:10%" />
						<col style="width:23%" />
						<col style="width:10%" />
						<col style="width:23%" />
						<col style="width:10%" />
						<col style="width:24%" />
					</colgroup>
					<tbody>
					<tr>
						<th><span class="ess-mark">*</span><!-- ess-mark 필수입력항목 스타일 -->그룹정보</th>
						<td colspan="5">
							<div class="input-group" style="width:300px;">
								<select class="form-control form-control-sm mr-2">
								  <option>마케팅</option>
								  <option>옵션2</option>
								  <option>...</option>
								</select>   
								<a href="#" data-toggle="modal" onClick="ntcsObj.detail.memberInfoPopup()" class="btn btn-primary btn-round btn-xs">+신규등록</a>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<div class="no-row-space" style="height:270px;overflow-y:auto;">
								<table class="table table-bordered" id="memberInfoDataTable" style="width:100%">
									<thead>
										<th>이름</th>
										<th>연락처</th>
										<th>E-Mail</th>
										<th>권한</th>
										<th>시작일</th>
										<th>종료일</th>
									</thead>
									<tbody>

									<!-- 데이터가 없을 경우 ->
									<tr>
										<td colspan="6" class="no-data-cell">데이터가 없습니다.</td>
									</tr -->
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade pillsDnisContent" id="pills-dnis" role="tabpanel" aria-labelledby="pills-dnis-tab">
				<table class="table table-bordered">
					<tbody>
					<tr>
						<td colspan="6">
							<div class="input-group mt-2 mb-2">
								<a href="#" data-toggle="modal" onClick="ntcsObj.detail.dnisModalPopup()" class="btn btn-primary btn-round btn-xs">DNIS 등록</a>
							</div>  
							
							<div "no-row-space" style="height:270px;overflow-y:auto;">
								<table class="table table-bordered" id="dnisInfoDataTable" style="width:100%">
									<thead>
										<th>DNIS</th>
										<th>전체 전화번호</th>
										<th>Prefix</th>
										<th>상태</th>
									</thead>
									<tbody>
									
									<!-- 데이터가 없을 경우 ->
									<tr>
										<td colspan="4" class="no-data-cell">데이터가 없습니다.</td>
									</tr -->
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</div>

			<p class="text-center">
				<a href="#" onClick="ntcsObj.detail.btnPrev()" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> 
				<a href="#" onClick="ntcsObj.detail.btnNext()" class="btn btn-md btn-gray">다음 
				<i class="fas fa-arrow-circle-right"></i></a> <span class="pull-right"><a href="#" onclick="ntcsObj.detail.customerInfoSave()" class="btn btn-md btn-primary">수정</a></span>
			</p>
		</div>
		
	</div><!--//page-inner-->
				
</div>	
<form id="frm" name="frm">
	<input type="hidden" id="custTabId" name="custTabId" value="pills-profile-tab"/>
	<input type="hidden" id="custTabIdx" name="custTabIdx" value="0"/>
</form>

<!-- modal -->
<%@ include file="/WEB-INF/views/customer/management/customerManagementMiModal.jsp" %>
<%@ include file="/WEB-INF/views/customer/contract/customerContractDnisModal.jsp" %>

<script type="text/javascript" src="/resources/js/ntcs/customer/management/customerManagement.js"></script>

		
		