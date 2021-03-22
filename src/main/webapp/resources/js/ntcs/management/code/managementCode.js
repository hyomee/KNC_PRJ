var dataTableList;
var search$;
var view$;
var modalView$;
var gridWidth = 0;

$(document).ready(function() {	
	ntcsObj.init();
	
	// 공통코드 정보 클릭시 상세조회
  	$('#listTable tbody').on('click', 'tr', function (event) {
 
    	dataTableList.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    
	 	var data=dataTableList.rows().data(); // 데이터 목록조회
    	var rowIdx = dataTableList.row(this).index(); // 상세조회 
  
     	var langType = data[rowIdx].langType;
     	var commonGroupCd = data[rowIdx].commonGroupCd;
     	var commonCd = data[rowIdx].commonCd;
    
    	// 데이터 연결되면 적용
       	// ntcsObj.info(langType, commonGroupCd, commonCd);
		// 데이터 연결되면 삭제 예정
		$('#langType').val(langType);
		$("#commonGroupCd option[value='"+commonGroupCd+"']").attr("selected","selected");
		$("#commonCd option[value='" + commonCd + "']").attr("selected","selected");
		$('#commonCd').val();	
		$('#commonCdNm').val(data[rowIdx].commonCdNm);
		$('#codeDesc1').val(data[rowIdx].codeDesc1);		       
        $('#btnModify').show();
     	event.stopPropagation();
  	});		
	
	view$ = ntcsToObj($('#codeDetail'));
	search$ = ntcsToObj($('.searchArea'));
});	
 

var ntcsObj = {
	init : function() {
		gridWidth = $('.content').width();
		ntcsObj.grid();
		$('#btnModify').hide();
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
		     //   bAutoWidth: false,
		        processing: true, 
		        ordering: false,
		        serverSide: true, 
		        searching: false,
		        fixedColumns: true,
		        language : lang_kor,
		        responsive: true,
			    colReorder: {
			        'allowReorder': false
			    },		        
		        ajax : { 
		            "url":"/management/code/list",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },		            
		            "data": function (d) {
		            	d['langType'] = 'KOR';
		            	d['commonGroupCd'] = $('#srchCommonGroupCd option:selected').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },
		        aoColumns: [
		         	{data: "langType", name: "langType", defaultContent: ""},
					{data: "commonGroupCd", name: "commonGroupCd", defaultContent: ""},
					{data: "commonGroupCdNm", name: "commonGroupCdNm", defaultContent: "",width:(gridWidth*(20/100))},
					{data: "commonCd", name: "commonCd", defaultContent: "", width:(gridWidth*(10/100))},
					{data: "commonCdNm", name: "commonCdNm", defaultContent: "", width:(gridWidth*(20/100))},
					{data: "codeDesc1", name: "codeDesc1", defaultContent: "", class : "text-left", width:(gridWidth*(50/100))},
		         ],
				columnDefs: [
					{ targets : [0,1], visible : false }
				],
				drawCallback: function( settings ) {
				 	ntcsNoData(this.api());
				}
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		
	},
	// 코드그룹(combobox)
	codeGroup : function() {
		
		//var params = ntcsData(view$); 
		//params['langType'] = 'KOR';
		
		$.ajax({ type: "GET"
				, contentType: "application/json"
				, url: url
				, data: params
				, dataType: 'json'
				, success: function (json) { 
					
				if(json.info) {
					
				}
					
				}, error: function (e) {  
					
				}
		});			
		
		
	},
	// 조회
	search : function() { 
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();	
	    $('#btnModify').hide();	
	},
	// 상세
	info : function(langType,commonGroupCd,commonCd) {
		
		var params = {};
		params['langType'] = langType; 
		params['commonGroupCd'] = commonGroupCd;
		params['commonCd'] = commonCd;
	    var url = '/management/code/detail';
		$.ajax({ type: "GET"
				, contentType: "application/json"
				, url: url
				, data: params
				, dataType: 'json'
				, success: function (json) { 
					
					if(json.info) {
						var datas = json.messageBody.data[0];
						$('#langType').val(datas.langType);
						$("#commonGroupCd option[value='" + datas.commonGroupCd + "']").attr("selected","selected");
						$("#commonCd option[value='" + datas.commonCd + "']").attr("selected","selected");
						$('#commonCd').val();	
						$('#commonCdNm').val(datas.commonCdNm);
						$('#codeDesc1').val(datas.codeDesc1);
						
					}
					
				}, error: function (e) {  
					
				}
		});			
	
	},
	// 수정
	modify : function() {

		var params = ntcsData(view$); 
		params['operatorId'] = 'updateAccount';
		params['codeDesc2'] = '';
		params['codeDesc3'] = '';
		params['useYn'] = 'Y';
		
		var messageData=[];
		messageData.push({"message:data":params});
		
		var reqParams = requestParams(messageData);
	
		var returnVal = ntcsValidator("frmcode");
    	if (!returnVal) return false;
	
		var url = '/management/code';	
		$.ajax({ type: "PUT"
				, contentType: "application/json"
				, url: url
				, data: reqParams
				, dataType: 'json'
				, success: function (json) { 
					alert('저장되었습니다.');
				}, error: function (e) {  
					alert('저장에 실패하였습니다.');
				}
		});		

	},
	// 공통코드 등록 팝업(Modal)
	addCommonCodeModal : function() {

		modalView$ = ntcsToObj($('#divModalCommonCode')); 
		
		// 언어
		var langTypeList = [{cd:'KOR', nm: '한국어'}];
		ntcsCombo($('#divModalCommonCode'), 'langType', null, langTypeList, '전체', 0);	

		$('.modal-header > h3').text('공통코드 등록');
		$('.modal-footer #btnModalConfirm').text('등록')

		$('#modalAddCommonCode').modal({backdrop: 'static', keyboard: false});	
	
		// 등록
		$('#btnModalConfirm').on('click', function(){
			
			var returnVal = ntcsValidator("frmModalCommonCode");
	    	if (!returnVal) return false;		
			
			// 저장 로직 추가해야 함.

			var params = ntcsData(modalView$); 

			params['operatorId'] = 'addCommonCode';
			params['useYn'] = 'Y';
			
			var messageData=[];
			messageData.push({"message:data":params});
			
			var reqParams = requestParams(messageData);
	
			console.log('공통코드 등록 ',reqParams);
	
			var url = '/management/code';	
			$.ajax({ type: "POST"
					, contentType: "application/json"
					, url: url
					, data: reqParams
					, dataType: 'json'
					, success: function (json) { 
						alert('저장되었습니다.');
					}, error: function (e) {  
						alert('저장에 실패하였습니다.');
						
					}
			});					
			
			ntcsReset($('#divModalCommonCode'));	
			ntcsValidationModalReset($('#divModalCommonCode'));
			ntcsUrl('/management/code');
			
			$('#modalAddCommonCode').modal('hide');
			
		});
		
		// 닫기 
		$('#btnModalClose').on('click', function(){
			ntcsReset($('#divModalCommonCode'));
			ntcsValidationModalReset($('#divModalCommonCode'));
		});	
		
	},
	// 공통코드 수정 팝업(Modal)
	modifyCommonCodeModal : function() {

		modalView$ = ntcsToObj($('#divModalCommonCode')); 
		
		// 공통코드 등록정보 value
		var params = ntcsData(view$); 
		$.each(params, function(key,value) {
           	$('.modal-body #'+key).val(value);
        });		
		
		// 언어
		var langTypeList = [{cd:'KOR', nm: '한국어'}];
		ntcsCombo($('#divModalCommonCode'), 'langType', null, langTypeList, '전체', 0);	

		$('.modal-header > h3').text('공통코드 수정');
		$('.modal-footer #btnModalConfirm').text('수정')

		$('#modalAddCommonCode').modal({backdrop: 'static', keyboard: false});	
	
		// 등록
		$('#btnModalConfirm').on('click', function(){
			
			var returnVal = ntcsValidator("frmModalCommonCode");
	    	if (!returnVal) return false;		
			
			// 저장 로직 추가해야 함.

			var params = ntcsData(modalView$); 

			params['operatorId'] = 'addCommonCode';
			params['useYn'] = 'Y';
			
			var messageData=[];
			messageData.push({"message:data":params});
			
			var reqParams = requestParams(messageData);
	
			
			var url = '/management/code';	
			$.ajax({ type: "POST"
					, contentType: "application/json"
					, url: url
					, data: reqParams
					, dataType: 'json'
					, success: function (json) { 
						alert('저장되었습니다.');
					}, error: function (e) {  
						alert('저장에 실패하였습니다.');
						
					}
			});					
			
			ntcsReset($('#divModalCommonCode'));	
			ntcsValidationModalReset($('#divModalCommonCode'));
			ntcsUrl('/management/code');
			
			$('#modalAddCommonCode').modal('hide');
			
		});
		
		// 닫기 
		$('#btnModalClose').on('click', function(){
			ntcsReset($('#divModalCommonCode'));
			ntcsValidationModalReset($('#divModalCommonCode'));
		});	
		
	}	
	
	
}