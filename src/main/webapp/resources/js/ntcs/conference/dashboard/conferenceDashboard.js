var dashboardDataTable;
var dashboardAttendeesTable;

$(document).ready(function() {	
	ntcsObj.init();
	
	// 회의현황 링크 클릭
  	$('#listTable tbody').on('click', 'tr', function (event) {
 		
    	dashboardDataTable.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    
	 	var data = dashboardDataTable.rows().data(); // 데이터 목록조회
    	var rowIdx = dashboardDataTable.row(this).index(); // 상세조회 

    	var datas = data[rowIdx];
     
    	// 참석자 현황 조회조건 로직 추가 필요함. 
	 	$('#listTableAttendees').DataTable().clear();
	    $('#listTableAttendees').DataTable().ajax.reload();	    
    
     	event.stopPropagation();
  	});	 
	
});	

var ntcsObj = {
	init : function() {
	
		ntcsObj.grid();
	},
	grid : function() {

        // 금일 회의현황
		var dashBoardTableOption = {
			pageLength: 100,
            bInfo: false,
            paging: false,             
            bPaginate: false,				
			autoWidth: false,
	        searching : false,
	        select : false,
	        bLengthChange: true,
	        processing: true, 
	        ordering: false,
	        serverSide: false,
	        searching: false,
	        language : lang_kor,
	        responsive: true,
	        ajax : {
	            "url":"/resources/json/conference/dashboard/list.json",  
	            "type":"GET",
	            "dataSrc" : function(res) {
	            	return res.messageBody.data;
	            },
	            "data": function (d) {
	            	d['X-AUTH-TOKEN'] = '';
	            }
	        },
	        columns : [
	             {data: "svcResvId", name: "svcResvId", defaultContent: "", width:"12%"},
	             {data: "custId", name: "custId", defaultContent: ""},
	             {data: "custNm", name: "custNm", defaultContent: "", width:"15%"},
	             {data: "memberId", name: "memberId", defaultContent: ""},
	             {data: "memberNm", name: "memberNm", defaultContent: "", width:"13%"},
	             {data: "svcName", name: "svcName", defaultContent: "", width:"10%"},
	             {data: "svcConfTime", name: "svcConfTime", defaultContent: "", width:"10%"},
	             {data: "svcConfDuration", name : "svcConfDuration", defaultContent: "", width:"10%"},
	             {data: "maxParties", name: "maxParties", defaultContent: "", width:"10%", class:"text-right"},
	             {data: "svcConfParties", name: "svcConfParties", defaultContent: "", width:"10%", class:"text-right"},
	             {data: "svcDetailFlag", name: "svcDetailFlag", defaultContent: "", width:"10%"},
	             {data: "svcDetailFlagNm", name: "svcDetailFlagNm", defaultContent: "", width:"10%",
	             	render: function(data, type, row) {
	             		if(row.svcDetailFlag = 1) {
	             			data = '<span class="text-primary">진행중</span>'; 
	             		} else {
	             			data = '<span class="text-danger">대기</span>';
	             		}
	             		return data;
	             	}
	             }
	         ],
			columnDefs: [
				{ targets: [1,3,10] , visible : false },
			],
			drawCallback: function( settings ) {
			 	ntcsNoData(this.api());
			}
		};
		
		dashboardDataTable = $('#listTable').DataTable(dashBoardTableOption);	
		
        // 금일 회의현황
		var dashboardAttendeesTableOption = {
			pageLength: 100,
	        bInfo: false,
	        paging: false,             
	        bPaginate: false,				
			autoWidth: false,
            destroy: true,
	        searching : false,
	        select : false,
	        bLengthChange: true,
	        processing: true, 
	        ordering: false,
	        serverSide: false,
	        searching: false,
	        language : lang_kor, 
	        responsive: true,
	        ajax : { 
	            "url":"/resources/json/conference/dashboard/detail.json",  
	            "type":"GET",
	            "dataSrc" : function(res) {
	            	return res.messageBody.data;
	            },
	            "data": function (d) {
	            	// 조회조건 추가 필요
	            	d['X-AUTH-TOKEN'] = '';
	            }
	        },
	        columns : [
	             {data: "attendName", name: "attendName", defaultContent: "", width: "10%"},
	             {data: "attendPin", name: "attendPin", defaultContent: ""},
	             {data: "attendEmail", name: "attendEmail", defaultContent: "", width: "15%"},
	             {data: "attendPhone", name: "attendPhone", defaultContent: "", width: "12%"},
	             {data: "attendConfType", name: "attendConfType", defaultContent: ""},
	             {data: "attendConfTypeNm", name: "attendConfTypeNm", defaultContent: "", width: "12%"},
	             {data: "attendTalkMode", name: "attendTalkMode", defaultContent: "", width: "12%"},
	             {data: "confActivationTime", name: "confActivationTime", defaultContent: "", width: "12%"},
	             {data: "bdrSttsCd", name : "bdrSttsCd", defaultContent: ""},
	             {data: "bdrSttsCdNm", name: "bdrSttsCdNm", defaultContent: "",  width: "10%",
					render: function(data, type, row) {
	             		if(row.bdrSttsCd = 1) {
	             			data = '<span class="text-primary">Connected</span>'; 
	             		} else {
	             			data = '<span class="text-danger">Hold</span>';
	             		}
	             		return data;
	             	}	             
	             }
	         ],
			columnDefs: [
				{ targets: [4,8] , visible : false },
			],
			drawCallback: function( settings ) {
			 	ntcsNoData(this.api());
			}			
		};
		
		dashboardAttendeesTable = $('#listTableAttendees').DataTable(dashboardAttendeesTableOption);	
		
	/*	
	 table
        .columns( 3 )
        .search( "Your_Value" )
        .draw();	
        */	
		//dashboardAttendeesTable.clear().draw();	
			
	},
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload()	
	}
}