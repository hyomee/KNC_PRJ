<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/ntcs/management/user/managementUser.js"></script>
</head>
<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-cog"></i> <b>사용자 관리</b> User Management</h4>
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
					<a href="#">사용자 관리</a>
				</li>
			</ul>
			<span class="pull-right"><a href="#" class="btn btn-primary btn-round btn-xs">+신규등록</a></span>
		</div>
		
		<table class="table table-bordered mt-3">
			<tbody>
				<tr>
					<th scope="col" width="80">검색</th>
					<td scope="col">
						<form id="frmSearch" name="frmSearch" class="form-inline form-search-small">
						<div class="input-group">
							<label class="mr-2 ml-2"> 사용자 그룹 </label>
							<select id="srchUserId" name="srchUserId" class="form-control">
							  <option>운영그룹</option>
							  <option>개발그룹</option>
							</select>
							<button type="button" class="btn btn-sm btn-primary ml-3" onclick="ntcsObj.search()"><i class="fas fa-search text-white"></i> 조회</button>
						</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="page-header mt-3 mb-2">
			<h3>
				<i class="fas fa-portrait"></i> <b>사용자 정보</b
			</h3>
		</div>
		<div class="no-row-space" style="max-height:270px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered" id="listTable" style="width:100%">
					<thead>
						<th>사용자 그룹</th>
						<th>로그인 ID</th>
						<th>로그인 암호</th>
						<th>사용자명</th>
						<th>연락처</th>
						<th>메일주소</th>
						<th>상태</th>
					</thead>
					<tbody>
					
						<!-- 데이터가 없을 경우 ->
						<tr>
							<td colspan="7" class="no-data-cell">데이터가 없습니다.</td>
						</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->
			
		<div class="page-header mt-3">
			<h3><i class="fas fa-user-edit"></i> <b>사용자 등록 정보</b></h3>
		</div>
		
		<div id="userDetail">
		<form id="frmUser" name="frmUser">
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
				<th><span class="ess-mark">*</span>사용자 그룹</th>
				<td colspan="5">
					<select  id="userGroup" name="userGroup" class="form-control required">
					  <option value="1">운영그룹</option>
					  <option value="2">개발그룹</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><span class="ess-mark">*</span>로그인 ID</th>
				<td class="text-left">
					<input type="text" id="userId" name="userId" class="form-control required" />
				</td>
				<th><span class="ess-mark">*</span>로그인 암호</th>
				<td class="text-left">
					<input type="password" id="password" name="password" class="form-control required" />
				</td>
				<th><span class="ess-mark">*</span>사용자명</th>
				<td class="text-left">
					<input type="text" id="userName" name="userName" class="form-control required" />
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<input type="text" id="mtelNo" name="mtelNo" class="form-control" />
				</td>
				<th>메일주소</th>
				<td class="text-left">
					<input type="email" id="eMail" name="eMail" class="form-control email"  />
				</td>
				<th>상태</th>
				<td>
					<select id="useYn" name="useYn" class="form-control">
					  <option value="Y">활성</option>
					  <option value="N">비활성</option>
					</select>
				</td>
			</tr>
			</tbody>
		</table>
		</form>
		</div>
		<p class="text-right">
			<a href="#" class="btn btn-lg btn-primary" onclick="ntcsObj.modify()">수정 및 저장</a>
		</p>

	</div><!--//page-inner-->
</div>
<!-- content 끝 -->