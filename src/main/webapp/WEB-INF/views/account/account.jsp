<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="/resources/js/ntcs/account/account.js"></script>

</head>
<!-- content 시작 -->
<div class="content">
	<div class="page-inner">
		<div class="page-header">
			<h4 class="page-title"><i class="fas fa-user-friends"></i> <b>회원관리</b> User Management</h4>
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
					<a href="#">회원관리</a>
				</li>
			</ul>
		</div>
		
		<table class="table table-bordered mt-3">
			<tbody>
				<tr>
					<th scope="col" width="80">회원유형</th>
					<td scope="col">
						<form method="post" action="" class="form-inline">
							<select class="form-control form-control-sm select-long">
							  <option>정회원</option>
							  <option>준회원</option>
							  <option>임시회원</option>
							</select>
							<button type="button" class="btn btn-sm btn-primary ml-2"><i class="fas fa-search text-white"></i> 조회</button>
						</form>
					</td>
				</tr>
			</tbody>
		</table>	
		<div class="page-header mt-3 mb-2">
			<h3><i class="far fa-file-alt"></i> <b>회원 정보</b></h3>
		</div>
		<div class="no-row-space" style="max-height:400px;overflow-y:auto"><!-- 2021-02-04 no-row-space 클래스명 추가시 스크롤 처리 -->
			<div class="row">
				<table class="table table-hover table-bordered" id="dataTable">
					<thead>
						<th>회원ID</th>
						<th>E-MAIL</th>
						<th>가입일</th>
						<th>해지일</th>
						<th>회원상태</th>
						<th>정회원전환여부</th>
						<th>정회원 전환일</th>
						<th>고객ID</th>
						<th>담당자</th>
					</thead>
					<tbody>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td></td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr class="selected">
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td></td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr class="selected">
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td>2020-01-01</td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr class="selected">
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td>2020-01-01</td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr class="selected">
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td>2020-01-01</td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr class="selected">
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td>2020-01-01</td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr class="selected">
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td>2020-01-01</td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td></td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td></td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td>2020-01-01</td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td>2020-01-01</td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td></td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td></td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<tr>
						<td>bugking70</td>
						<td>admin@gmail.com</td>
						<td>2020-01-01</td>
						<td>9999-12-31</td>
						<td>활성</td>
						<td>아니오</td>
						<td></td>
						<td>C20000200</td>
						<td>홍길동</td>
					</tr>
					<!-- 데이터가 없을 경우 ->
					<tr>
						<td colspan="9" class="no-data-long">데이터가 없습니다.</td>
					</tr -->
					</tbody>
				</table>
			</div>
		</div><!--//table-->
		
		<p class="text-right mt-2">
			<a href="" class="btn btn-md btn-gray"><i class="fas fa-arrow-circle-left"></i> 이전</a> <a href="" class="btn btn-md btn-gray">다음 <i class="fas fa-arrow-circle-right"></i></a>
		</p>
		
	</div><!--//page-inner-->
</div>
<!-- content 끝 -->