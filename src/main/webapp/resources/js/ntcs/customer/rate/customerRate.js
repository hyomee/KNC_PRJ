var dataTableList;
var dataTableRateInfoList;
var view$;

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
		view$ = ntcsToObj($('#divRateInfo'));
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
		        language : lang_kor,
		        responsive: true,
		        ajax : {
		        	"url":"/resources/json/customer/rate/list.json",  
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
		        	{data: "valdStrtDttm", name: "valdStrtDttm", defaultContent: ""}, 
		        	{data: "valdEndDttm", name: "valdEndDttm", defaultContent: ""} 
		        ],
				columnDefs: [
					{ targets: [2,4], visible : false  }
										
				],
				drawCallback: function( settings ) {
					ntcsNoData(this.api());
				}
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		

        // 목록조회
		var dataTableRateInfoListOption = {
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
		        language : lang_kor,
		        responsive: true,
		        ajax : {
		        	"url":"/resources/json/customer/rate/rateInfo.json",  
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
		        	{data: "rateDvCd", name: "rateDvCd", defaultContent: ""}, // TsmCtrtSvcRate
		        	{data: "rateDvNm", name: "rateDvNm", defaultContent: ""},
		        	{data: "rateAplyUnitCd", name: "rateAplyUnitCd", defaultContent: ""},
		        	{data: "rateAplyUnitNm", name: "rateAplyUnitNm", defaultContent: ""},
		        	{data: "rateAplyUnit", name: "rateAplyUnit", defaultContent: ""}, 
		        	{data: "rate", name: "rate", defaultContent: "", class:"text-right"},
		        	{data: "valdStrtDttm", name: "valdStrtDttm", defaultContent: ""}, // 유효시작일
		        	{data: "valdEndDttm", name: "valdEndDttm", defaultContent: ""} // 유효종료일 
		        ], 
				columnDefs: [
					{ targets: [0,2], visible : false  },
					{ targets: [5],render: $.fn.dataTable.render.number( ',' )   }
					
				],
				drawCallback: function( settings ) {

		        	ntcsNoData(this.api());
			        var pageInfo = this.api().page.info();
			        var page = pageInfo.page;
			          
				}
			};
			
			dataTableRateInfoList = $('#rateInfoTable').DataTable(dataTableRateInfoListOption);	

	},
	// 검색
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload()		
	},
	// 수정
	modify : function() {
	
		var params = ntcsData(view$); 
		console.log('수정 ',params);
		params['operatorId'] = 'updateUser';
		
		var messageData=[];
		messageData.push({"message:data":params});
		
		var reqParams = requestParams(messageData);
	
		var returnVal = ntcsValidator("frmRateInfo");
    	if (!returnVal) return false;
	
		var url = '/management/user';	
		$.ajax({ type: "PUT"
				, contentType: "application/json"
				, url: url
				, data: reqParams
				, dataType: 'json'
				, success: function (json) { 
					alert('성공');
				}, error: function (e) {  
					alert('실패');
				}
		});			
	
	}
	
}