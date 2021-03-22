var dataTableList;

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
		        ajax : {
		        	"url":"/resources/json/product/configuration/list.json",  
		            //"url":"/management/user/list",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['prodKdCd'] = $('#srchProdKdCd').val();
		            	d['svcDomain'] = $('#srchSvcDomain').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },
		        aoColumns: [
		        	{data: "ftrCd", name: "ftrCd", defaultContent: ""}, 
		        	{data: "ftrNm", name: "ftrNm", defaultContent: ""},
		        	{data: "initRateAplyUnitCd", name: "initRateAplyUnitCd", defaultContent: ""},
		        	{data: "initRateAplyUnitNm", name: "initRateAplyUnitNm", defaultContent: ""},
		        	{data: "initRateAplyUnit", name: "initRateAplyUnit", defaultContent: ""},
		        	{data: "initRate", name: "initRate", defaultContent: "", class : "text-right"}
		        	
		        ],
				columnDefs: [
					{ targets: [0,2], visible : false  },
					{ targets: [5],render: $.fn.dataTable.render.number( ',') } 
										
				],
				drawCallback: function( settings ) {

				  	var api = this.api();
		        
			        var pageInfo = this.api().page.info();
			        var page = pageInfo.page;
			        
			        ntcsNoData(this.api());
			        
			    	//console.log('page Info :::: ', pageInfo);
			 		//console.log('데이터 ',api.rows().data().length);	        
				}
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);			
	
	},
	// 조회
	search : function() { 
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();			
	}
}