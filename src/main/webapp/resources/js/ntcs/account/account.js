var dataTableList;
var search$;
var view$;

$(document).ready(function() {	
	ntcsObj.init();
	
	 $("#listTable tbody").click( function( e ) { 
        if ( $(this).hasClass('row_selected') ) {
            $(this).removeClass('row_selected');
        } 
        else {
            historyTable.$('tr.row_selected').removeClass('row_selected');
            $(this).addClass('row_selected');
        }
    });
	
	view$ = ntcsToObj($('#accountDetail'));
});	 

var ntcsObj = {
	init : function() {
		ntcsObj.grid();
	},
	grid : function() {
		return false;
        // 목록조회
		var dataTableListOption = {
				pageLength: 100,
				autoWidth: true,
		        bPaginate: false,
		        select : false,
		        bLengthChange: true,
		     //   bAutoWidth: false,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        ajax : {
		            "url":"/account/list",  
		            "type":"GET",
		            "data": function (d) {
		            	d['accountType'] = $('#accountType option:selected').val();
		            	d['limit'] = 1;
		            }
		        },
		         columns : [ 
					{data : "accountId"},
					{data : "accountPassword"},
					{data : "accountType"},
					{data : "accountStat"},
					{data : "custId"},
					{data : "scrbDttm"},
					{data : "tmntDttm"},
					{data : "tmntResn"},
					{data : "joinId"},
					{data : "switchFlag"},
					{data : "switchManager"}
		         ],
				columnDefs: [
						{ orderable: true,	className: 'dt-text-left',		targets: '_all' }
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
	, search : function() { alert('조회');
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();		
	}
	// 상세
	, info : function(langType,commonGroupCd,commonCd) {
	
		var params = {};
		params['langType'] = langType; 
		params['commonGroupCd'] = commonGroupCd;
		params['commonCd'] = commonCd;
	
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
	// 수정
	, modify : function() {

		var params = ntcsData(view$); 
		params['langType'] = 'KOR';
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
					alert('성공');
				}, error: function (e) {  
					alert('실패');
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
	
		var url = '/account';	
		$.ajax({ type: "POST"
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