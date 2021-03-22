var dataTableList;
var dataTableAttendList;

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
		        	"url":"/resources/json/reservation/management/list.json",  
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
		        	{data: "svcSeqNo", name: "svcSeqNo", defaultContent: ""}, 
		        	{data: "svcName", name: "svcName", defaultContent: ""},
		        	{data: "svcAcntNo", name: "svcAcntNo", defaultContent: ""},
		        	{data: "svcReqType", name: "svcReqType", defaultContent: ""},
		        	{data: "svcReqTypeNm", name: "svcReqTypeNm", defaultContent: ""},
		        	{data: "svcConfDate", name: "svcConfDate", defaultContent: "",
						render: function(data, type, row) {
		             		var data = row.svcConfDate + " "+row.svcConfTime; 
		             		return data;
		             	}		        	
		        	},
		        	{data: "svcConfTime", name: "svcConfTime", defaultContent: ""},
		        	{data: "svcConfDuration", name: "svcConfDuration", defaultContent: ""},
		        	{data: "svcConfParties", name: "svcConfParties", defaultContent: ""},
		        	{data: "svcConfCd", name: "svcConfCd", defaultContent: ""},
		        	{data: "billCode", name: "billCode", defaultContent: ""},
		        	{data: "svcAutoBreakDown", name: "svcAutoBreakDown", defaultContent: ""},
		        	{data: "svcAlertOptions", name: "svcAlertOptions", defaultContent: "",
						render: function(data, type, row) {
		             		if(row.svcAlertOptions == 1) {
		             			data = '<span class="text-primary">Beep</span>'; 
		             		} else {
		             			data = '<span class="text-danger">Tone</span>';
		             		}
		             		return data;
		             	}			        	
		        	}
		        	
		        ],
				columnDefs: [
					{ targets: [3,6], visible : false  }
										
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
			
        // 참석자정보 
		var dataTableAttendListOption = {
			pageLength: 100,
            bInfo: false,
            paging: false,             
            bPaginate: false,
	        searching : false,
	        select : false,
	        bLengthChange: true,
	        processing: true, 
	        ordering: false,
	        serverSide: false,
	        searching: false,
	        language : lang_kor,
	        ajax : {
	            "url":"/resources/json/conference/history/detail.json",  
	            "type":"GET",
	            "dataSrc" : function(res) {
	            	return res.messageBody.data;
	            },
	            "data": function (d) {
	            	
	            	d['X-AUTH-TOKEN'] = '';
	            }
	        },
	        columns : [
	             {data: "attendName", name: "attendName", defaultContent: ""},
	             {data: "attendPhone", name: "attendPhone", defaultContent: ""},
	             {data: "attendEmail", name: "attendEmail", defaultContent: ""},
	             {data: "attendPin", name: "attendPin", defaultContent: ""},
	             {data: "etc1", name: "etc1", defaultContent: ""}, // 역할
	             {data: "etc2", name: "etc2", defaultContent: ""}, // 참석모드
	             {data: "billAcntNo", name: "billAcntNo", defaultContent: ""}, // 
	             {data: "attendPartitionId", name: "attendPartitionId", defaultContent: ""},
	             {data: "etc3", name: "etc3", defaultContent: ""}, // 참석방법
	         ],
			columnDefs: [
				
			],
		};
		
		dataTableAttendList = $('#listTableAttend').DataTable(dataTableAttendListOption);						
			
	
	},
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload()				
	}
}