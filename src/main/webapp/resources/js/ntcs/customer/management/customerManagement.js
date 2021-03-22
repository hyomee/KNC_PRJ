var custTable;
var memberInfoTable;
var dnisInfoTable;
var dnisInfoEditorTable;
var pillsProfileContent$;
var pillsMoneyContent$;
var pillsMemberContent$;
var pillsDnisContent$;

$(document).ready(function() {	
	ntcsObj.init();

	 	 
//$('ul.nav.nav-pills li a').click(function() {		

	//$(this).index()
    //$(this).parent().addClass('active').siblings().removeClass('active');			
//});	
	
	// 고객 상세정보 TAB CLICK
	$('.nav li a').click(function() {

		var tabId =  $(this).attr("id"); 
		var tabIdx = $(this).data("idx");

		// 청·수납 정보
		if(tabId == 'pills-money-tab') { 
			ntcsObj.detail.detailBillInfo();
		} else if(tabId == 'pills-member-tab') { // 구성원정보
			ntcsObj.detail.custMemberInfo();
		} else if(tabId == 'pills-dnis-tab') { // DNIS정보
			ntcsObj.detail.dnisInfo();
		} else if(tabId == 'pills-profile') { // 상세기본정보
			ntcsObj.detail.customerInfo(); 
		} else {
		
		}
			
		$('#custTabId').val(tabId);
		$('#custTabIdx').val(tabIdx);
		
	});
	
	
  // 고객 기본 정보 row select 
  $('#custDataTable tbody').on('click', 'tr', function (event) {

    custTable.$('tr.selected').removeClass('selected');
    $(this).addClass('selected');
    
	 var data=custTable.rows().data(); // 데이터 목록조회
     var rowIdx = custTable.row(this).index(); // 상세조회 
		
     event.stopPropagation();
  });	
  
  // 구성원정보 row select 
  $('#memberInfoDataTable tbody').on('click', 'tr', function (event) {
 	console.log('기본정보');
    memberInfoTable.$('tr.selected').removeClass('selected');
    $(this).addClass('selected');
    
    event.stopPropagation();
  });	 	
  
  // DNIS 정보 select 
  $('#dnisInfoDataTable tbody').on('click', 'tr', function (event) {
 
    dnisInfoTable.$('tr.selected').removeClass('selected');
    $(this).addClass('selected');
    		 	
    event.stopPropagation();
  });	 	  
   	
	
}); // document.ready end


// 1개월 전 
$(document).on("click", "#btn1Month", function(){ 
	$('#srchValdStrtDttm').val(lastMonth);
	$('#srchValdEndDttm').val(today);
});

// 3개월 전
$(document).on("click", "#btn3Month", function(){ 
	$('#srchValdStrtDttm').val(last3Month);
	$('#srchValdEndDttm').val(today);
});

var ntcsObj = {
	init : function() {
	
		$('#srchValdStrtDttm').datepicker({
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
		$('#srchValdStrtDttm').datepicker('setDate', 'today');
		
		$('#srchValdEndDttm').datepicker({
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
		$('#srchValdEndDttm').datepicker('setDate', 'today');	
		
		// grid init
		ntcsObj.grid();
		
		// 고객상세정보 object 
		pillsProfileContent$ = ntcsToObj($('.pillsProfileContent'));
		pillsMoneyContent$ = ntcsToObj($('.pillsMoneyContent'));
		pillsMemberContent$ = ntcsToObj($('.pillsMemberContent'));
		pillsDnisContent$ = ntcsToObj($('.pillsDnisContent'));

	}, 
	search : function() {
	
 		$('#custDataTable').DataTable().clear();
    	$('#custDataTable').DataTable().ajax.reload();
    	
    	$('.nav-item').find('a').removeClass('active');
    	$('#pills-profile-tab').trigger('click');
		$('#custTabId').val("pills-profile-tab");
		$('#custTabIdx').val(0);    	
	}, 
	// datatable init
	grid : function() { 
        // 고객 기본정보 목록조회
		var custTableOption = {
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
		            "url":"/resources/json/customer/management/list.json",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['valdStrtDttm'] = $('#srchValdEndDttm').val();
		            	d['valdEndDttm'] = $('#srchValdEndDttm').val();
		            	d['custName'] =  $('#srchCustName').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },
		        aoColumns : [
		        	 {data: "custId", name: "custId", defaultContent: ""}, 
		             {data: "custName", name: "custName", defaultContent: ""},
		             {data: "custType", name: "custType", defaultContent: ""}, 
		             {data: "custTypeNm", name: "custTypeNm", defaultContent: ""},
		             {data: "custClass", name: "custClass", defaultContent: ""},
					 {data: "custClassNm", name: "custClassNm", defaultContent: ""},
		             {data: "corpRegNo", name: "corpRegNo", defaultContent: ""},
		             {data: "bizRegNo", name: "bizRegNo", defaultContent: ""},
		             {data: "telNo", name: "telNo", defaultContent: ""},
		             {data: "bizCond", name: "bizCond", defaultContent: ""},
		             {data: "bizCondNm", name: "bizCondNm", defaultContent: ""},
		             {data: "valdStrtDttm", name: "valdStrtDttm", defaultContent: ""},
		         ],
				columnDefs: [
					{ targets :[0,2,4,9] ,visible : false}	
				],
				drawCallback: function( settings ) {
				 	ntcsNoData(this.api());
				}				
			};
			
			custTable = $('#custDataTable').DataTable(custTableOption);	
			
			// 구성원정보
			var memnerInfoOption = {
	            bInfo: false,
	            paging: false,             
	            bPaginate: false,
	            autoWidth: false,
		        searching : false,
		        select : false,
		        bLengthChange: true,
		        bAutoWidth: true,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        language : lang_kor,
		        responsive: true,			        
		        ajax : {
		            "url":"/resources/json/customer/management/detail.json",
		            "type":"GET",
		            "data": function (d) {
		            },
		            "dataSrc":"custMemberList"
		        },
		         columns : [
		             {data: "memberName"},
		             {data: "mtelNo"},
		             {data: "email"},
		             {data: "memberRole"},
		             {data: "creationDate"},
		             {data: "updateDate"}
		         ],
				columnDefs: [
						{ orderable: true,	className: 'dt-text-left',		targets: '_all' }
				],
				drawCallback: function( settings ) {
				 	ntcsNoData(this.api());
				}				
			};
			
			memberInfoTable = $('#memberInfoDataTable').DataTable(memnerInfoOption);
			
			
			// DNIS 정보	
			var dnisInfoOption = {
	            bInfo: false,
	            paging: false,             
	            bPaginate: false,
	            autoWidth: false,
		        select : false,
		        bLengthChange: true,
		        bAutoWidth: true,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        language : lang_kor,
		        responsive: true,			        
		        ajax : {
		            "url":"/resources/json/customer/management/detail.json",
		            "type":"GET",
		            "data": function (d) {
		            },
		            "dataSrc":"dnisList"
		        },
		         columns : [
		             {data: "dnis"},
		             {data: "fullTelNo"},
		             {data: "prefixNo"},
		             {data: "dnisStatus"}
		         ],   
				columnDefs: [
						{ orderable: true,	className: 'dt-text-left',		targets: '_all' }
				],
				drawCallback: function( settings ) {
				 	ntcsNoData(this.api());
				}				
			};

			dnisInfoTable = $('#dnisInfoDataTable').DataTable(dnisInfoOption);					
			
			
			
	}, 
	// 상세 
	detail : { 
		// 고객 상세정보
		customerInfo : function() {
		 
			// Customer/Managemnt/Detail로 변경
			var url = '/resources/json/customer/management/detail.json';
			var params = {};
			//params['custId']  = custId
			//params['valdEndDttm']  = valdEndDttm
			
			$.ajax({ type: "GET"
					, contentType: "application/json"
					, url: url
					, data: params
					, dataType: 'json'
					, success: function (json) { 
						
						if(json.info) {
						
							var datas = json.info;
	
							$('.pillsProfileContent #repName').val(datas.repName);
							$('.pillsProfileContent #custType').val(datas.custType);
							$('.pillsProfileContent #custClass').val(datas.custClass);
							$('.pillsProfileContent #corpRegNo').val(datas.corpRegNo);
							$('.pillsProfileContent #bizRegNo').val(datas.bizRegNo);
							$('.pillsProfileContent #telNo').val(datas.telNo);
							$('.pillsProfileContent #bizType').val(datas.bizType);
							$('.pillsProfileContent #bizCond').val(datas.bizCond);			
							$('.pillsProfileContent input:radio[name=taxFlag]:input[value=' + datas.taxFlag + ']').attr("checked", true);

							$('.pillsPoffileContent #baseAddr').val(datas.baseAddr);
							$('.pillsPoffileContent #dtlAddr').val(datas.dtlAddr);
							$('.pillsPoffileContent #telNo').val(datas.telNo);
							$('.pillsPoffileContent #faxNo').val(datas.faxNo);
							$('.pillsPoffileContent #mtelNo').val(datas.mTelNo);
							$('.pillsPoffileContent #email').val(datas.email);
							$('.pillsPoffileContent #custName').val(datas.custName);						
							
						}
						
					}, error: function (e) {  
						
					}
			});	
		 // 청수납정보	
		}, detailBillInfo : function() { 
			
			// Customer/Managemnt/Detail로 변경
			var url = '/resources/json/customer/management/detail.json';
			var params = {};
			//params['custId']  = custId
			//params['valdEndDttm']  = valdEndDttm
			
			$.ajax({ type: "GET"
					, contentType: "application/json"
					, url: url
					, data: params
					, dataType: 'json'
					, cache: false
					, success: function (json) { 
						
						if(json.info) {
							var datas = json.billInfo;
							$('.pillsMoneyContent #acntSttsCd').val(datas.billAcntSttsCd);
							$('.pillsMoneyContent #billCyclCd').val(datas.billCyclCd);
							$('.pillsMoneyContent #bltxtKdCd').val(datas.bltxtKdCd);
							$('.pillsMoneyContent #bltxtRcptName').val(datas.bltxtRcptName);
							$('.pillsMoneyContent #bltxtEmail').val(datas.bltxtEmail);
							$('.pillsMoneyContent #bltxtMtelNo').val(datas.bltxtMtelNo);
							$('.pillsMoneyContent #bltxtZipCd').val(datas.txtBltxtZipCd);
							$('.pillsMoneyContent #bltxtBaseAddr').val(datas.bltxtBaseAddr + datas.bltxtDtlAddr);
							$(".pillsMoneyContent input[name=taxInvoiceFlag][value='"+datas.taxInvoiceFlag+"']").prop("checked",true);
							$(".pillsMoneyContent input[name=taxFlag][value='"+datas.taxFlag+"']").prop("checked",true);
							$('.pillsMoneyContent #bltxtFaxNo').val(datas.bltxtFaxNo);
							$('.pillsMoneyContent #billCurCd').val(datas.billCurCd);
							$('.pillsMoneyContent #exrateRfctDd').val(datas.exrateRfctDd);
							
							$('.pillsMoneyContent #pymName').val(datas.pymName);
							$('.pillsMoneyContent #pymKdCd').val(datas.pymKdCd);
							$('.pillsMoneyContent #pymDdt').val(datas.pymDd);
							$('.pillsMoneyContent #pymCardCd').val(datas.pymCardCd);		
							$('.pillsMoneyContent #pymAccuntNo').val(datas.pymAccuntNo);
							$('.pillsMoneyContent #pymAcntNo').val(datas.pymAcntNo);
							
						}
						
					}, error: function (e) {  
						
					}
			});				
		
		},
		// 구성원정보
		custMemberInfo : function() {
	 		$('#memberInfoDataTable').DataTable().clear();
	    	$('#memberInfoDataTable').DataTable().ajax.reload();
		
		},
		// DNIS정보 
		dnisInfo : function() {
	 		$('#dnisInfoDataTable').DataTable().clear();
	    	$('#dnisInfoDataTable').DataTable().ajax.reload();		
		},
		// 이전버튼
		btnPrev : function() {
			var tabIdx = Number($('#custTabIdx').val());
			tabIdx = tabIdx - 1;
			if(tabIdx < 0) { return false; }
			else {
				var tabArr = ["pills-profile-tab","pills-money-tab","pills-member-tab","pills-dnis-tab"];
				$('#'+tabArr[tabIdx]).trigger('click');
			}

		},
		// 다음 버튼
		btnNext : function() {
			var tabIdx = Number($('#custTabIdx').val());
			tabIdx = tabIdx + 1;
			if(tabIdx > 3) { return false; }
			else {
				
				$('#custTabIdx').val(tabIdx);
				var tabArr = ["pills-profile-tab","pills-money-tab","pills-member-tab","pills-dnis-tab"];    
				$('#'+tabArr[tabIdx]).trigger('click');
			}
		}, 
		// 수정 및 저장
		customerInfoSave : function() {
			var tabId = $('#custTabId').val();
			
			if(tabId == 'pills-money-tab') {  // 청수납정보
			
				var returnVal =  ntcsValidator("frmPillsMoney");
	        	if (!returnVal) return false;
				
				 //  if(!ntcsObj.detail.validateMoneyInfo()) return false;	
			
				var params = ntcsData(pillsMoneyContent$);
				var url = '/Customer/Managemnt/BillAccount';	
				$.ajax({ type: "PUT"
						, contentType: "application/json"
						, url: url
						, data: params
						, dataType: 'json'
						, cache: false
						, success: function (json) { 
							alert('성공');
						}, error: function (e) {  
							alert('실패');
						}
				});					
				
			} else if(tabId == 'pills-member-tab') { // 구성원정보
				alert('구성원 정보 저장');
			} else if(tabId == 'pills-dnis-tab') { // DNIS정보
				alert('DNIS 정보 저장');
			} else { 
					
				
				var returnVal =  ntcsValidator("frmPillsProfile");
	        	if (!returnVal) return false;					
					
				//if(!ntcsObj.detail.validateCustomerInfo()) return false;	
					
				var params = ntcsData(pillsProfileContent$);
				
				var url = '/Customer/Managemnt/Detail';	
				$.ajax({ type: "PUT"
						, contentType: "application/json"
						, url: url
						, data: params
						, dataType: 'json'
						, cache: false
						, success: function (json) { 
							alert('상세기본정보 수정및 저장 성공');
						}, error: function (e) {  
							alert('상세기본정보 수정및 저장 실패');
						}
				});					
 
			}			
				
		},
		// 상세기본정보 validation check
		validateCustomerInfo : function() {

			var target$;
	
	 		target$ = pillsProfileContent$.find("input[name='repName']");
	 		if (checkValue(target$, "대표자명을 입력해 주세요.")) {
	 			return false;
	 		}
	 		
	 		target$ = pillsProfileContent$.find("select[name='custType']");
	 		if (checkValue(target$, "고객유형을 선택해 주세요.")) {
	 			return false;
	 		}	 		
	 		
	 		target$ = pillsProfileContent$.find("select[name='custClass']");
	 		if (checkValue(target$, "고객구분을 선택해 주세요.")) {
	 			return false;
	 		}	 		
	 		
	 		target$ = pillsProfileContent$.find("input[name='custName']");
	 		if (checkValue(target$, "사용자명을 입력해 주세요.")) {
	 			return false;
	 		}	 	
	 			 		 		
	 		target$ = pillsProfileContent$.find("input[name='email']");
	 		if (checkValue(target$, "E-mail을 입력해 주세요.")) {
	 			return false;
	 		}	 	
	 		
	 		target$ = pillsProfileContent$.find("input[name='email']");
	 		if (checkValue(target$, "연락처를 입력해 주세요.")) {
	 			return false;
	 		}	 
	 				 			 		
	 		return true;
		
		},
		// 구성원정보 Modal Popup
		memberInfoPopup : function() {
			$('#memberInfoModal').modal({backdrop: 'static', keyboard: false});
		},				
		// 회의연결번호 Modal Popup
		dnisModalPopup : function() {
			$('#dnisModal').modal({backdrop: 'static', keyboard: false});
		}			
		
	}
	
};

