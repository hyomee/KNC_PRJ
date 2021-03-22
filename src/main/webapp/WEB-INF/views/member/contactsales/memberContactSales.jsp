<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-briefcase"></i> <b>영업문의</b> Contact Sales</h4>
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
					<a href="#">회원</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">영업문의</a>
				</li>
			</ul>
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">상태</th>
					<td scope="col">
						<form id="frmSearch" name="frmSearch" class="form-inline">
							<div class="input-group">
							<select id="srchContactStat" name="srchContactStat" class="form-control form-control-sm select-long">
							  
							</select>
							</div>
							<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
							<button type="button" class="btn btn-sm btn-primary ml-2" onClick="ntcsObj.search()"><i class="fas fa-search text-white"></i> 조회</button>
							</span>
						</form>
					</td>
				</tr>
			</tbody>
		</table>	
		<div class="page-header mt-3 mb-2">
			<h3><i class="fas fa-phone-volume"></i> <b>영업문의 사항</b></h3>
		</div>
		<div class="no-row-space" style="max-height:400px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<table class="table table-hover table-bordered" id="listTable">
				<thead>
					<th>요청일자</th>
					<th>이름</th>
					<th>이메일</th>
					<th>핸드폰번호</th>
					<th>전화번호</th>
					<th>회사명</th>
				</thead>
				<tbody>
				
				<!-- 데이터가 없을 경우 ->
				<tr>
					<td colspan="6" class="no-data-long">데이터가 없습니다.</td>
				</tr -->
				</tbody>
			</table>
		</div><!--//table-->
		
		<p class="text-right mt-2">
			<a href="#" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="#" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p>

		<table class="table table-bordered">
			<colgroup>
				<col style="width:50%">
				<col style="width:50%">
			</colgroup>
			<tbody>
				<tr>
					<th>문의사항</th>
					<th>처리결과 (설명)</th>
				</tr>
				<tr>
					<td>
						<textarea class="question-box" rows="1" cols="1" placeholder="문의사항을 작성해주세요."></textarea>
					</td>
					<td><textarea class="question-box" rows="1" cols="1" placeholder="처리설명 작성해주세요."></textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-fl-ty">
			<p class="text-right">
				<a href="#" id="btnReceipt" data-toggle="modal" onClick="ntcsObj.receiptModal();" class="btn btn-lg btn-ty01">접수</a>
			</p>
			<p class="text-right">
				<a href="#" id="btnProcess" data-toggle="modal" onClick="ntcsObj.processModal();" class="btn btn-lg btn-ty01">문의사항 처리</a>
			</p>
		</div> 
		<!-- 모달 추가 -->
		<%@ include file="/WEB-INF/views/member/contactsales/memberContactSalesProcessModal.jsp" %>
		<%@ include file="/WEB-INF/views/member/contactsales/memberContactSalesReceiptModal.jsp" %>
	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/member/contactsales/memberContactsales.js"></script>
<!-- content 끝 -->