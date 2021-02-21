var dataTableList;
var search$;
var view$;
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
		$("#commonGroupCd option[value='1']").attr("selected","selected");
		//$("#commonGroupCd option[value='" + commonGroupCd + "']").attr("selected","selected");
		$("#commonCd option[value='" + commonCd + "']").attr("selected","selected");
		$('#commonCd').val();	
		$('#commonCdNm').val(data[rowIdx].commonCdNm);
		$('#codeDesc1').val(data[rowIdx].codeDesc1);		       
      
     	event.stopPropagation();
  	});		
	
	view$ = ntcsToObj($('#codeDetail'));
	search$ = ntcsToObj($('.searchArea'));
});	
 

var ntcsObj = {
	init : function() {
		gridWidth = $('.content').width();
		ntcsObj.grid();
		dataTableList.columns([4]).header().to$().removeClass("text-left");
	},
	grid : function() {
		
        // 목록조회
		var dataTableListOption = {
				pageLength: 100,
	            bInfo: false,
	            paging: false,             
	            bPaginate: false,
		        bLengthChange: true,
		     //   bAutoWidth: false,
		        processing: true, 
		        ordering: false,
		        serverSide: true, 
		        searching: false,
		        fixedColumns: true,
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
		         columns : [ 
		         	{data : "langType", hidden : true},
					{data : "commonGroupCd"},
					{data : "commonCd"},
					{data : "commonCdNm"},
					{data : "codeDesc1"}
		         ],
				columnDefs: [
					{ targets: 0, visible : false  },
					{ width:(gridWidth*(15/100)), targets: 1  },
					{ width:(gridWidth*(15/100)), targets: 2 },
					{ width:(gridWidth*(30/100)), targets: 3 },
					{ width:(gridWidth*(60/100)), targets: 4, className: 'text-left' }
				//	{ orderable: true,	className: 'dt-text-left',		targets: '_all' }
				],
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		
	}
	// 코드그룹(combobox)
	, codeGroup : function() {
		
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
		
		
	}
	// 조회
	, search : function() { 
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();		
	}
	// 상세
	, info : function(langType,commonGroupCd,commonCd) {
		
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
	
	}
	// 수정
	, modify : function() {

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

	}
	, // 등록
	add : function() {
		var params = ntcsData(view$); 
		params['langType'] = 'KOR';
		params['operatorId'] = 'addCommonCode';
		params['codeDesc2'] = '';
		params['codeDesc3'] = '';
		params['useYn'] = 'Y';
		
		var messageData=[];
		messageData.push({"message:data":params});
		
		var reqParams = requestParams(messageData);

		var returnVal = ntcsValidator("frmcode");
    	if (!returnVal) return false;
	
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
	}
	
}