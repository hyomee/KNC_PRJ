<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
			<span class="pull-right"><a href="#"  data-toggle="modal" onClick="ntcsObj.addDnisModal()" class="btn btn-primary btn-round btn-xs">+신규등록</a></span>
		</div>
		
		<table class="table table-bordered mt-2">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form method="post" action="" class="form-inline form-search-box">
						<div class="input-group">
							<label class="mr-2 ml-2"> 번호대역 </label>
							<select id="srchDnis" name="srchDnis" class="form-control">
							</select>
							<label class="mr-2 ml-2"> 사용여부 </label>
							<select id="srchDnisStatus" name="srchDnisStatus" class="form-control">
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
				<i class="far fa-file-alt"></i> <b>DNIS 정보</b>
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<table class="table table-hover table-bordered" id="listTable"> 
				<thead>
					<th>DNIS</th>
					<th>지역번호</th>
					<th>전화 국번호</th>
					<th>라인번호</th>
					<th>전화번호</th>
					<th>상태(코드)</th>
					<th>상태</th>
				</thead>
				<tbody>
				
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="6" class="no-data-cell">데이터가 없습니다.</td>
					</tr -->
				</tbody>
			</table>
		</div><!--//table-->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-list-ul"></i> <b>DNIS 등록 정보</b></h3>
		</div>
		<div id="dnisInfo">
		<form id="frmDnis" name="frmDnis">
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
					<input type="text" id="areaNo" name="areaNo" class="form-control" value=""/>
				</td>
				<th>전화 국번호</th>
				<td>
					<input type="text" id="prefixNo" name="prefixNo" class="form-control" />
				</td>
				<th>라인번호</th>
				<td>
					<input type="text"  id="lineNo" name="lineNo" class="form-control"/>
				</td>
			</tr>
			<tr>
				<th>DNIS</th>
				<td>
					<input type="text" id="dnis" name="dnis" class="form-control" readonly/> <!--   no-bor  -->
				</td>
				<th>전화번호</th>
				<td>
					<input type="text" id="fullTelNo" name="fullTelNo" class="form-control" />
				</td>
				<th>상태</th>
				<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
					<label class="form-radio-label">
						<input class="form-radio-input" type="radio" id="dnisStatus" name="dnisStatus" value="1">
						<span class="form-radio-sign">비사용</span>
					</label>
					<label class="form-radio-label ml-3">
						<input class="form-radio-input" type="radio" id="dnisStatus" name="dnisStatus" value="2">
						<span class="form-radio-sign">사용</span>
					</label>
				</td>
			</tr>
			</tbody>
		</table>
		</form>
		</div>
		
		<p class="text-right">
			<a href="#" id="btnModify" class="btn btn-lg btn-primary" data-toggle="modal" onClick="ntcsObj.modifyDnisModal()">수정</a>
		</p>
		<!-- DNIS 등록 모달 -->
		<%@ include file="/WEB-INF/views/management/dnis/managementDnisModalAdd.jsp" %>

	</div><!--//page-inner-->
</div>
<script type="text/javascript" src="/resources/js/ntcs/management/dnis/managementDnis.js"></script>
<!-- content 끝 -->