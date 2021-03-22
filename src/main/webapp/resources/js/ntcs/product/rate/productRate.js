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
		        	"url":"/resources/json/product/rate/list.json",  
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
		        	{data: "rateDvCd", name: "rateDvCd", defaultContent: ""},
		        	{data: "rateDvNm", name: "rateDvNm", defaultContent: ""},
		        	{data: "rateAplyDvCd", name: "rateAplyDvCd", defaultContent: ""},
		        	{data: "rateAplyDvNm", name: "rateAplyDvNm", defaultContent: ""},
		        	{data: "rateAplyLvlCd", name: "rateAplyLvlCd", defaultContent: ""},
		        	{data: "rateAplyLvlNm", name: "rateAplyLvlNm", defaultContent: ""},
		        	{data: "rateAplyKdCd", name: "rateAplyKdCd", defaultContent: ""},
		        	{data: "rateAplyKdNm", name: "rateAplyKdNm", defaultContent: ""},
		        	{data: "rateAplyUnitCd", name: "rateAplyUnitCd", defaultContent: ""}, 
		        	{data: "rateAplyUnitNm", name: "rateAplyUnitNm", defaultContent: ""},
		        	{data: "rateAplyUnit", name: "rateAplyUnit", defaultContent: ""},
		        	{data: "rate", name: "rate", defaultContent: "", class:"text-right"},
		        	{data: "valdStrtDttm", name: "valdStrtDttm", defaultContent: ""},
		        	{data: "valdEndDttm", name: "valdEndDttm", defaultContent: ""}
		        	
		        ],
				columnDefs: [
					{ targets: [2,4,6,8], visible : false  },
					{ targets: [11],render: $.fn.dataTable.render.number( ',') } 
										
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
	    $('#listTable').DataTable().ajax.reload();			
	}
}