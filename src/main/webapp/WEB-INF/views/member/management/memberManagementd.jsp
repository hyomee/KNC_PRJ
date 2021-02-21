<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>

<link rel="stylesheet" type="text/css" href="/resources/css/jqgrid/ui.jqgrid.css" />

<script src="/resources/js/jquery-3.5.1.js" type="text/javascript"></script>
<script src="/resources/js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>

<script type="text/javascript">

var userTable;

$(document).ready(function(){
	
	fnSearch();
	
});

function fnSearch() {
	
	var option = {
			pageLength: 10,
            bPaginate: false,
            searching : false,
            bLengthChange: true,
            bAutoWidth: false,
            processing: true,
            ordering: false,
            serverSide: false,
            searching: false,
            ajax : {
                "url":"/Member/Management/Datatable/List",
                "type":"GET",
                "data": function (d) {
                	
                }
            },
            columns : [
                {data: "usrId"},
                {data: "usrEmail"},
                {data: "scrbDttm"},
                {data: "tmntDttm"},
                {data: "usrStat"},
                {data: "switchFlag"},
                {data: "creationDate"},
                {data: "custId"},
                {data: "switchManager"},
                
            ]			
	};

	userTable = $('#userTable').DataTable(option);	
	
}

</script>
</head>
				<div class="contents">
					<div class="container-fluid">
						<h2>
							<strong>회원관리</strong> <span class="f16 text-muted">User Management</span>
						</h2>

						<div class="card bg-wsky">
							<div class="content">
								<form class="form-inline">
									<div class="form-group">
										<label>회원유형</label>
											<select id="srchUsrType" name="srchUsrType" class="form-control" style="min-width:200px;">
											  <option value="1">정회원</option>
											  <option value="2">준회원</option>
											  <option value="3">임시회원</option>
											</select>
										<button type="button" id="btnSearch" onclick="fnSearch()" class="btn btn-primary">조회</button>
									</div>
								</form>
							</div><!--header-->
						</div>
						<!--//row-->
						<div class="card">
							<div class="header">
								<h4 class="title">회원 정보</h4>
							</div>
							<div class="content">
								<div class="table-full-width" style="height:375px;overflow-y:auto">
									<table class="table table-bordered" id="userTable">
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
										<tbody id="tblUserList">
										<!--
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
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>akstp</td>
											<td>akstp@gmail.com</td>
											<td>2019-01-01</td>
											<td>9999-12-31</td>
											<td>활성</td>
											<td>예</td>
											<td>2020-01-01</td>
											<td>C10001001</td>
											<td>홍길동</td>
										</tr>
										 -->
										</tbody>
									</table>
								</div><!--//table-full-width-->
								<p class="text-right btn-btm">
									<a href="" class="btn btn-lg btn-default">&lt; 이전</a> <a href="" class="btn btn-lg btn-default">다음 &gt;</a>
								</p>
							</div><!--//content-->
						</div><!--card-->
					</div>
				</div>
				<!-- contents 끝 -->
			