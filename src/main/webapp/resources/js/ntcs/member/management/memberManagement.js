var dataTableList;

$(document).ready(function() {	
	ntcsObj.init();
	
	 $("#listTable tbody").click( function( e ) { 
        if ( $(this).hasClass('row_selected') ) {
            $(this).removeClass('row_selected');
        }
        else {
            dataTableList.$('tr.row_selected').removeClass('row_selected');
            $(this).addClass('row_selected');
        }
    });
	
});	

var ntcsObj = {
	init : function() {
		//ntcsObj.grid();
	},
	grid : function() {
	
        // 목록조회
		var dataTableListOption = {
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
			
			//dataTableList = $('#listTable').DataTable(dataTableListOption);		
	},
	search : function() {
		
	}
}