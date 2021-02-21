var dashboardDataTable;

$(document).ready(function() {	
	ntcsObj.init();
});	

var ntcsObj = {
	init : function() {
		ntcsObj.grid();
	},
	grid : function() {

        // 고객 기본정보 목록조회
		var dashBoardTableOption = {
				pageLength: 10,
				autoWidth: true,
		        bPaginate: false,
		        searching : false,
		        select : false,
		        bLengthChange: true,
		     //   bAutoWidth: false,
		        processing: true, 
		     //   ordering: false,
		        serverSide: false,
		        searching: false,
		        ajax : {
		            "url":"/resources/json/customer/management/list.json",  
		            "type":"GET",
		            "data": function (d) {
		            	d['valdStrtDttm'] = $('#srchValdEndDttm').val();
		            	d['valdEndDttm'] = $('#srchValdEndDttm').val();
		            	d['custName'] =  $('#srchCustName').val();
		            }
		        },
		         columns : [
		             {data: "custName"},
		             {data: "custType"},
		             {data: "custClass"},
		             {data: "corpRegNo"},
		             {data: "bizRegNo"},
		             {data: "telNo"},
		             {data: "bizCond"},
		             {data: "valdStrtDttm"}
		         ],
				columnDefs: [
						{ orderable: true,	className: 'dt-text-left',		targets: '_all' }
				],
			};
			
			dashboardDataTable = $('#listTable').DataTable(dashBoardTableOption);		
	},
	search : function() {

		if($('#srchCustName').val() == '') {
			alert('고객명을 입력해 주세요');
			return ;
		}

		var url = '/Conference/Sa/List';
		var params = {};
	
		params['custName'] = $('#srchCustName').val(); 
		
		return false;
		
		$.ajax({ type: "GET"
				, contentType: "application/json"
				, url: url
				, data: params
				, dataType: 'json'
				, success: function (json) { 
	
					$("#tblUserList").empty();
					var tHtml = '';
					if(json) {
						
					}
					
				}, error: function (e) {  
					
				}
		});	

	}
}