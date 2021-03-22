<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- content 시작 -->

<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>공통코드 관리</b> Common Code Management</h4>
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
					<a href="#">공통코드 관리</a>
				</li>
			</ul>
			<span class="pull-right"><a href="#" data-toggle="modal" onClick="ntcsObj.addCommonCodeModal()" class="btn btn-primary btn-round btn-xs">+신규등록</a></span>
		</div> 
		
		<table class="table table-bordered mt-3">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form id="frmSearch" name="frmSearch" class="form-inline form-search-small">
						<div class="input-group">
							<label class="mr-2 ml-2"> 코드 그룹 </label>
							<select id="srchCommonGroupCd" name="srchCommonGroupCd" class="form-control">
							  
							</select>
						</div>
						<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
							<button type="button" class="btn btn-sm btn-primary ml-3" onclick="ntcsObj.search()"><i class="fas fa-search text-white"></i> 조회</button>
						</span>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="far fa-file-alt"></i> <b>공통코드 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			
			<table class="table table-hover table-bordered" id="listTable" style="width:100%">
				<thead>
					<th>언어</th>
					<th>코드그룹코드</th>
					<th>코드그룹</th>
					<th>공통코드</th>
					<th>코드명(한글)</th>
					<th style="text-align:center !important">설명</th>
				</thead>
				<tbody>
				
				</tr>
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="4" class="no-data-cell">데이터가 없습니다.</td>
					</tr -->
				</tbody>
			</table>
			
		</div><!--//table-->
		
		<!--  이전 다음 -->	
		<p class="text-right mt-2">
			<a href="#" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="#" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p>
					
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>공통코드 등록 정보</b></h3>
		</div>
		
		<div id="codeDetail">
		<form id="frmcode" name="frmcode">
		<input type="hidden" id="langType" name="langType" value=""/>
		<table class="table table-bordered">
			<colgroup>
				<col style="width:15%" />
				<col style="width:35%" />
				<col style="width:15%" />
				<col style="width:35%" />
			</colgroup>
			<tbody>
			<tr>
				<th><span class="ess-mark">*</span>코드그룹</th>
				<td class="text-left">
					<select id="commonGroupCd" name="commonGroupCd" class="form-control required">
					  <option value=""></option>
					  <option value="1">서비스요금항목</option>
					</select>
				</td>
				<th><span class="ess-mark">*</span>공통코드</th>
				<td class="text-left">
					<select id="commonCd" name="commonCd" class="form-control required">
					  <option value=""></option>
					  <option value="201">웹캐스팅1</option>
					  <option value="202">웹캐스팅2</option>
					  <option value="203">웹캐스팅3</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><span class="ess-mark">*</span>코드명(한글)</th>
				<td class="text-left">
					<input type="text"  id="commonCdNm" name="commonCdNm" value="" class="form-control required" />
				</td>
				<th>코드설명</th>
				<td>
					<input type="text" id="codeDesc1" name="codeDesc1"  value="" class="form-control" />
				</td>
			</tr>
			</tbody>
		</table>
		</form>
		</div>
		
		<p class="text-right">
			<a href="#" id="btnModify" class="btn btn-lg btn-primary" data-toggle="modal" onClick="ntcsObj.modifyCommonCodeModal()">수정</a>
		</p> 

		<!-- 공통코드 관리 등록 모달 -->
		<%@ include file="/WEB-INF/views/management/code/managementCodeModalAdd.jsp" %>

	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/management/code/managementCode.js"></script>
<!-- content 끝 -->