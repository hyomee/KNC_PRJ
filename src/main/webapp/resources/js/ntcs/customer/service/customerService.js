var historyTable;

$(document).ready(function() {	
	ntcsObj.init();
	
	 $("#listTable tbody").click( function( e ) { 
        if ( $(this).hasClass('row_selected') ) {
            $(this).removeClass('row_selected');
        }
        else {
            historyTable.$('tr.row_selected').removeClass('row_selected');
            $(this).addClass('row_selected');
        }
    });
	
});	

var ntcsObj = {
	init : function() {
		//ntcsObj.grid();
	},
	grid : function() {
	
        // 고객 기본정보 목록조회
		var historyTableOption = {
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
		            "url":"/resources/json/conference/history/list.json",  
		            "type":"GET",
		            "data": function (d) {
		            	
		            }
		        },
		         columns : [
		             {data: "svcConfCate"},
		             {data: "svcResvRd"},
		             {data: "attendName"},
		             {data: "memberId"},
		             {data: "svcName"},
		             {data: "svcConfCime"},
		             {data: "svcConfCuration"},
		             {data: "svcConfMaxCarties"},
		             {data: "svcConfCarties"},
		             {data: "svcConfCpdate"}
		         ],
				columnDefs: [
						{ orderable: true,	className: 'dt-text-left',		targets: '_all' }
				],
			};
			
			//historyDataTable = $('#listTable').DataTable(historyTableOption);		
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