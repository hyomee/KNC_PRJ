var dataTableList;

$(document).ready(function() {	
	ntcsObj.init();
	
	// 사용자 등록정보 클릭시 상세조회
  	$('#listTable tbody').on('click', 'tr', function (event) {
 
    	dataTableList.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    
	 	var data = dataTableList.rows().data(); // 데이터 목록조회
    	var rowIdx = dataTableList.row(this).index(); // 상세조회 

    	var datas = data[rowIdx];
    	
    	var contactStat = datas.contactStat;
    	if(contactStat == 1) {
    		 $('#btnReceipt').show();
    		 $('#btnProcess').hide();
    		  
    	} else if(contactStat == 2) {
			 $('#btnReceipt').hide();
    		 $('#btnProcess').show();   	 
    	} else {
    		 $('#btnReceipt').hide();
    		 $('#btnProcess').hide();    	
    	} 
    
     	event.stopPropagation();
  	});	
});	

var ntcsObj = {
	init : function() {
		ntcsObj.grid();
		$('#btnReceipt').hide();
		$('#btnProcess').hide(); 		
		
		// 회원
		var srchContactStatList = [{cd:'1', nm: '요청'}, {cd:'2', nm: '처리중'}, {cd:'9', nm: '완료'}];
		ntcsCombo($('.input-group'), 'srchContactStat', null, srchContactStatList, '전체', 0);			
	},
	grid : function() {
	
        // 목록조회
		var dataTableListOption = {
				pageLength: 10,
				autoWidth: true,
	            bInfo: false,
	            paging: false,             
	            bPaginate: false,	
		        select : false,
		        bLengthChange: true,
		     //   bAutoWidth: false,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        ajax : {
		            "url":"/resources/json/member/contactsales/list.json",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['contactStat'] = $('#srchContactStat option:selected').val();
		            	//d['limit'] = $('#limit').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },
		        aoColumns : [ 
					{data: "contactDate", name: "contactDate", defaultContent: "", width:"12%"},
					{data: "name", name: "name", defaultContent: "", width:"15%"},
					{data: "email", name: "email", defaultContent: ""},
					{data: "mtelNo", name: "mtelNo", defaultContent: "", width:"15%"},
					{data: "telNo", name: "telNo", defaultContent: "", width:"15%"},
					{data: "companyName", name: "companyName", defaultContent: "", width:"15%"},
					{data: "contactId", name: "contactId", defaultContent: ""},
					{data: "contactStat", name: "contactStat", defaultContent: ""}
		         ],		
				columnDefs: [
					{ targets : [6,7], visible : false }
				],
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		
	},
	// 조회
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();
    		 $('#btnReceipt').hide();
    		 $('#btnProcess').hide(); 	    			
	},
	// 영업문의 접수 (Modal) 
	receiptModal : function() {
		$('#modalReceipt').modal({backdrop: 'static', keyboard: false});	
	
	},
	// 영업문의 처리(Modal)
	processModal : function() {
		$('#modalProcess').modal({backdrop: 'static', keyboard: false});	
	
	}	
	
}