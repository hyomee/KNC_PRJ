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
		ntcsObj.grid();
	},
	grid : function() {

        // 목록조회
		var dataTableListOption = {
				pageLength: 100,
	            bInfo: false,
	            paging: false,             
	            bPaginate: false,
	            autoWidth: false,
		        bLengthChange: true,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        language : lang_kor,
		        responsive: true,
		        ajax : {
		        	"url":"/resources/json/customer/service/list.json",  
		            //"url":"/management/user/list",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['custName'] = $('#srchCustName').val();
		            	d['ctrtName'] = $('#srchCtrtName').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },
		        aoColumns: [
		        	{data: "ctrtName", name: "ctrtName", defaultContent: ""}, 
		        	{data: "prodName", name: "prodName", defaultContent: ""},
		        	{data: "svcProdDvCd", name: "svcProdDvCd", defaultContent: ""},
		        	{data: "svcProdDvNm", name: "svcProdDvNm", defaultContent: ""},
		        	{data: "svcSttsCd", name: "svcSttsCd", defaultContent: ""}, 
		        	{data: "svcSttsNm", name: "svcSttsNm", defaultContent: ""},
		        	{data: "valdStrtDttm", name: "valdStrtDttm", defaultContent: ""}
		        	
		        ],
				columnDefs: [
					{ targets: [2,4], visible : false  }
										
				],
				drawCallback: function( settings ) {

				  	var api = this.api();
		        
			        var pageInfo = this.api().page.info();
			        var page = pageInfo.page;
			        
			    	console.log('page Info :::: ', pageInfo);
			 		console.log('데이터 ',api.rows().data().length);	        
				}
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		

	},
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload()		
	}
}