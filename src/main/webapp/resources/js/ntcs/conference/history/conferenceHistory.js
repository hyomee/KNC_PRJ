var historyDataTable;
var historyAttendeesTable;

$(document).ready(function() {	
	ntcsObj.init();
	
	// 회의이력 링크 클릭
  	$('#listTable tbody').on('click', 'tr', function (event) {
 		
    	historyDataTable.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    
	 	var data = historyDataTable.rows().data(); // 데이터 목록조회
    	var rowIdx = historyDataTable.row(this).index(); // 상세조회 

    	var datas = data[rowIdx];
    
    	// 참석자 현황 조회조건 로직 추가 필요함. 
	 	$('#listTableAttendees').DataTable().clear();
	    $('#listTableAttendees').DataTable().ajax.reload();	    
    
     	event.stopPropagation();
  	});	
	 
 
	// 기간(시작일)
	$('#srchSvcConfDurationFr').datepicker({
		format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		//startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		//endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		//calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		//clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		//datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		//daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		//daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		//multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		//multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		templates : {
			leftArrow: '&laquo;',
			rightArrow: '&raquo;'
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		//title: "테스트",	//캘린더 상단에 보여주는 타이틀
		todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		
	});//datepicker end
	$('#srchSvcConfDurationFr').datepicker('setDate', 'today');

	// 기간(종료일)
	$('#srchSvcConfDurationTo').datepicker({
		format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		//startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		//endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		//calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		//clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		//datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		//daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		//daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		//multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		//multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		templates : {
			leftArrow: '&laquo;',
			rightArrow: '&raquo;'
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		//title: "테스트",	//캘린더 상단에 보여주는 타이틀
		todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		
	});//datepicker end
	$('#srchSvcConfDurationTo').datepicker('setDate', 'today');
	
});	

// 1개월 전 
$(document).on("click", "#btn1Month", function(){ 
	$('#srchSvcConfDurationFr').val(lastMonth);
	$('#srchSvcConfDurationTo').val(today);
});

// 3개월 전
$(document).on("click", "#btn3Month", function(){ 
	$('#srchSvcConfDurationFr').val(last3Month);
	$('#srchSvcConfDurationTo').val(today);
});

var ntcsObj = {
	init : function() {
		ntcsObj.grid();
	},
	grid : function() {
	
        // 고객 기본정보 목록조회
		var historyTableOption = {
			pageLength: 100,
            bInfo: false,
            paging: false,             
            bPaginate: false,				
			autoWidth: false,
	        searching : false,
	        select : false,
	        bLengthChange: true,
	     //   bAutoWidth: false,
	        processing: true, 
	        ordering: false,
	        serverSide: false,
	        searching: false,
	        language: lang_kor,
	        responsive: true,
	        ajax : {
	            "url":"/resources/json/conference/history/list.json",  
	            "type":"GET",
	            "data": function (d) {
	            	
	            },
	            "dataSrc" : function(res) {
	            	return res.messageBody.data;
	            },		            
	        },
	        aoColumns : [
	         	 {data: "svcConfDate", name: "svcConfDate", defaultContent: "", width:"10%"},
	             {data: "svcResvId", name: "svcResvId", defaultContent: "", width:"10%"},
	             {data: "custId", name: "custId", defaultContent: ""},
	             {data: "custNm", name: "custNm", defaultContent: "", width:"10%"},
	             {data: "memberId", name: "memberId", defaultContent: ""},
	             {data: "memberNm", name: "memberNm", defaultContent: "", width:"10%"},
	             {data: "svcName", name: "svcName", defaultContent: "", width:"10%"},
	             {data: "svcConfTime", name: "svcConfTime", defaultContent: "", width:"8%"},
	             {data: "svcConfDuration", name : "svcConfDuration", defaultContent: "", width:"8%"},
	             {data: "maxParties", name: "maxParties", defaultContent: "", width:"8%", class:"text-right"},
	             {data: "svcConfParties", name: "svcConfParties", defaultContent: "", width:"8%", class:"text-right"},
	             {data: "svcDetailFlag", name: "svcDetailFlag", defaultContent: ""},
	             {data: "svcDetailFlagNm", name: "svcDetailFlagNm", defaultContent: "", width:"8%",
					render: function(data, type, row) {
	             		if(row.svcDetailFlag == 1) {
	             			data = '<span class="text-success">대기</span>'; 
	             		} else if(row.svcDetailFlag == 2) {
	             			data = '<span class="text-primary">진행중</span>';
	             		} else {
	             			data = '<span class="text-danger">종료</span>';
	             		}
	             		return data;
	             	}		             
	             },
	             {data: "billRecCode", name: "billRecCode", defaultContent: "", width:"8%",
					render: function(data, type, row) {
	             		if(row.svcDetailFlag == 1) {
	             			data = '<span class="text-trans-on">녹취</span>'; 
	             		} else {
	             			data = '<span class="text-trans-off">녹취</span>';
	             		}
	             		return data;
	             	}	             
	             
	             }
	         ],
			columnDefs: [
				{ targets : [2,4,11], visible : false }
			],
			drawCallback: function( settings ) {
			 	ntcsNoData(this.api());
			},
			language : lang_kor			
		};
		
		historyDataTable = $('#listTable').DataTable(historyTableOption);		
			
        // 금일 회의현황
		var historyAttendeesTableOption = {
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
	             {data: "attendName", name: "attendName", defaultContent: "", width:"10%"},
	             {data: "attendPin", name: "attendPin", defaultContent: ""},
	             {data: "attendEmail", name: "attendEmail", defaultContent: "", width:"15%"},
	             {data: "attendPhone", name: "attendPhone", defaultContent: "", width:"10%"},
	             {data: "attendConfType", name: "attendConfType", defaultContent: ""},
	             {data: "attendConfTypeNm", name: "attendConfTypeNm", defaultContent: "", width:"10%"},
	             {data: "attendTalkMode", name: "attendTalkMode", defaultContent: "", width:"10%"},
	             {data: "svcConfTime", name: "svcConfTime", defaultContent: "", width:"8%"},
	             {data: "svcConfEndTime", name: "svcConfEndTime", defaultContent: "", width:"8%"},
	             {data: "bdrSttsCd", name : "bdrSttsCd", defaultContent: "", width:"8%"},
	             {data: "bdrSttsCdNm", name: "bdrSttsCdNm", defaultContent: "", width:"8%", 
					render: function(data, type, row) { 
	             		if(row.bdrSttsCd == 1) {
	             			data = '<span class="text-primary">Connected</span>'; 
	             		} else {
	             			data = '<span class="text-danger">Hold</span>';
	             		}
	             		return data;
	             	}	             
	             }
	         ],
			columnDefs: [
				{ targets: [4,9] , visible : false },
			],
			drawCallback: function( settings ) {
			 	ntcsNoData(this.api());
			}	
		};
		
		historyAttendeesTable = $('#listTableAttendees').DataTable(historyAttendeesTableOption);					
			
	},
	// 조회
	search : function() {
	
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload()	
		
	},
	// 고객명 모달 팝업
	custNameModal : function(custId) {
		custNameModalPopup(custId);
	}
}