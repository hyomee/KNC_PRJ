<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

<!--  jqgrid -->
<script src="/resources/js/jqgrid/jquery.js" type="text/javascript"></script>
<script src="/resources/js/jqgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
<script src="/resources/js/jqgrid/js/minified/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">

var grid$; 
var srch$;

var gridWidth = 0;


$(document).ready(function(){
	
	gridWidth = $('.contents').width();
	fnSearch();
	
});

function fnSearch() {
	
	grid$ = $("#grid1").jqGrid({
		url: '/Member/Management/Jqgrid/List',
		postData: setParam(),
		mtype: 'GET',
		height:'auto',
		datatype : "json",
		jsonReader : {
			root : "list"
		},
		title:"false",
		sortable : false,
		//pager:'#gridPg',
		colNames: ['회원ID', 'E-MAIL', '가입일', '해지일', '회원상태', '정회원전환여부','정회원 전환일','고객ID','담당자'],
		colModel: [
			{name: 'usrId',index: 'usrId', width:(gridWidth*(10/100)), resizable: false,align:'center',sortable : false},
			{name:'usrEmail',index:'usrEmail',align:'left',sortable : false, width:(gridWidth*(10/100))},
			{name:'scrbDttm',index:'scrbDttm',align:'center',sortable : false, width:(gridWidth*(10/100))},
			{name:'tmntDttm',index:'tmntDttm', align:'center', width:(gridWidth*(10/100)), sortable : false},
			{name:'usrStat',index:'usrStat',align:'center', sortable : false, width:(gridWidth*(10/100))},	
			{name:'switchFlag',index:'switchFlag',align:'center', sortable : false, width:(gridWidth*(10/100))},	
			{name:'creationDate',index:'creationDate',align:'center', sortable : false, width:(gridWidth*(10/100))},	
			{name:'custId',index:'custId',align:'center', sortable : false, width:(gridWidth*(15/100))},	
			{name:'switchManager',index:'switchManager',align:'center', sortable : false, width:(gridWidth*(15/100))}	
		],
		
		gridComplete : function() {
			
			//com.hideLoading();
		}
	});
	
	
}


<%-- 파라미터 세팅 --%>
function setParam() {
	var srchParam = {};
	srchParam["usrType"] = $('#srchUsrType').val();
	
	return srchParam;
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
									<table id="grid1"></table>
								</div><!--//table-full-width-->
								<p class="text-right btn-btm">
									<a href="" class="btn btn-lg btn-default">&lt; 이전</a> <a href="" class="btn btn-lg btn-default">다음 &gt;</a>
								</p>
							</div><!--//content-->
						</div><!--card-->
					</div>
				</div>
				<!-- contents 끝 -->
			