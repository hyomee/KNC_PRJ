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
	            autoWidth : false,
		        bLengthChange: true,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        language: lang_kor,
		        responsive: true,
		        ajax : {
		        	"url":"/resources/json/customer/contract/list.json",  
		            //"url":"/management/user/list",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['userId'] = $('#srchUserId').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },
		        aoColumns: [
		        	{data: "ctrtId", name: "ctrtId", defaultContent: ""},
		        	{data: "ctrtName", name: "ctrtName", defaultContent: ""},
		        	{data: "ctrtSttsCd", name: "ctrtSttsCd", defaultContent: ""},
		        	{data: "ctrtSttsNm", name: "ctrtSttsNm", defaultContent: ""},
		        	{data: "svcNo", name: "svcNo", defaultContent: ""},
		        	{data: "ctrtAppnt", name: "ctrtAppnt", defaultContent: ""},
		        	{data: "salesUsrId", name: "salesUsrId", defaultContent: ""},
		        	{data: "salesUsrNm", name: "salesUsrNm", defaultContent: ""},
		        	{data: "salesOrgId", name: "salesOrgId", defaultContent: ""},
		        	{data: "salesOrgNm", name: "salesOrgNm", defaultContent: ""},
		        	{data: "valdStrtDttm", name: "valdStrtDttm", defaultContent: ""}, 
		        	{data: "valdEndDttm", name: "valdEndDttm", defaultContent: ""}, 
		        	
		        ],
				columnDefs: [
					{ targets: [2,6,8], visible : false  }
										
				],
				drawCallback: function( settings ) {

				  	var api = this.api();
		        
			        var pageInfo = this.api().page.info();
			        var page = pageInfo.page;
			        
			    	console.log('page Info :::: ', pageInfo);
			 		console.log('데이터 ',api.rows().data().length);
			 		
			 		ntcsNoData(this.api());
				}
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		

	},
	// 조회
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload()		
	}, 
	// 청구계정 Modal Popup
	baModalPopup : function() {
		console.log('청구계정 popup');
		//custNameModalPopup();
		$('#billingAccountModal').modal({backdrop: 'static', keyboard: false});
	},
	// 납부계정 Modal Popup
	paModalPopup : function() {
		console.log('납부계정 popup');
		$('#paymentAccountModal').modal({backdrop: 'static', keyboard: false});
	},
	// 회의연결번호 Modal Popup
	dnisModalPopup : function() {
		$('#dnisModal').modal({backdrop: 'static', keyboard: false});
	},
	// 고객명 모달 팝업
	custNameModal : function(custId) {
		custNameModalPopup(custId);
	}		
	
}