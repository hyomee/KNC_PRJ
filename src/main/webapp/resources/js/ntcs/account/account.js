var dataTableList;
var search$;
var view$;
var gridWidth = 0;
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

	//view$ = ntcsToObj($('#accountDetail'));
});	 
 
var ntcsObj = {
	init : function() {
		gridWidth = $('.content').width();
		ntcsObj.grid();
		
		// 회원
		var srchAccountTypeList = [{cd:'0008', nm: '정회원'}, {cd:'0004', nm: '준회원'}, {cd:'0002', nm: '임시회원'}];
		ntcsCombo($('.input-group'), 'srchAccountType', null, srchAccountTypeList, '전체', 0);			
	},
	grid : function() {
		
        // 목록조회
		var dataTableListOption = {
				pageLength: 100,
	            bInfo: false,
	            paging: false,             
	            bPaginate: false,				
				autoWidth: false,
		        select : false,
		        bLengthChange: true,
		     //   bAutoWidth: false,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        language : lang_kor,
		        responsive: true,
				ajax : {
		        	//"url":"/account/list",  
		            "url":"/resources/json/account/list.json",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['accountType'] = $('#srchAaccountType option:selected').val();
		            	//d['limit'] = $('#limit').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },	
		        aoColumns : [ 
					{data: "accountId", name: "accountId", defaultContent: "", width:"10%"},
					{data: "accountEmail", name: "accountEmail", defaultContent: "", width:"20%"},
					{data: "scrbDttm", name: "scrbDttm", defaultContent: "", width:"10%"},
					{data: "tmntDttm", name: "tmntDttm", defaultContent: "", width:"10%"},
					{data: "accountStat", name: "accountStat", defaultContent: "", width:"10%"},
					{data: "switchFlag", name: "switchFlag", defaultContent: "", width:"10%"},
					{data: "updateDate", name: "updateDate", defaultContent: "", width:"10%"},
					{data: "custId", name: "custId", defaultContent: "", width:"10%"},
					{data: "switchManager", name: "switchManager", defaultContent: "", width:"10%"}
		         ],
				columnDefs: [
					
				],
				drawCallback: function( settings ) {
				 	ntcsNoData(this.api());
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