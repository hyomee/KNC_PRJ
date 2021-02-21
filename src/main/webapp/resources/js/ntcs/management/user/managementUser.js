var dataTableList;
var view$;
var gridWidth = 0;

$(document).ready(function() {	
	ntcsObj.init();
	
	// 사용자 등록정보 클릭시 상세조회
  	$('#listTable tbody').on('click', 'tr', function (event) {
 
    	dataTableList.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    
	 	var data = dataTableList.rows().data(); // 데이터 목록조회
    	var rowIdx = dataTableList.row(this).index(); // 상세조회 

    	var datas = data[rowIdx];
    
    	// 데이터 연결되면 적용
       	// ntcsObj.info(langType, commonGroupCd, commonCd);
		
		// 데이터 연결되면 삭제 예정
		$("#userGroupId option[value='" + datas.userGroupId + "']").attr("selected","selected");
		$('#userId').val(datas.userId);
		$('#password').val(datas.password);
		$('#userName').val(datas.userName);
		$('#mtelNo').val(datas.mtelNo);
		$('#eMail').val(datas.eMail);
		$("#useYn option[value='" + datas.useYn + "']").attr("selected","selected");		
		
     	event.stopPropagation();
  	});	
	
});	 

var ntcsObj = {
	init : function() {
		gridWidth = $('.content').width();
		ntcsObj.grid();
		view$ = ntcsToObj($('#userDetail'));
		
	},
	grid : function() {
	
        // 목록조회
		var dataTableListOption = {
				pageLength: 100,
	            bInfo: false,
	            paging: false,             
	            bPaginate: false,
		        bLengthChange: true,
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        fixedColumns: true,
		        ajax : {
		        	"url":"/resources/json/management/user/list.json",  
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
		         columns : [
		             {data: "userGroupId"},
		             {data: "userId"},
		             {data: "password"},
		             {data: "userName"},
		             {data: "mtelNo"},
		             {data: "eMail"},
		             {data: "useYn"}
		         ],
				columnDefs: [
					{ targets: 0, width:(gridWidth*(10/100)) },
					{ targets: 1, width:(gridWidth*(15/100)) },  
					{ targets: 2, width:(gridWidth*(15/100)) }, 
					{ targets: 3, width:(gridWidth*(15/100)) }, 
					{ targets: 4, width:(gridWidth*(15/100)) },
					{ targets: 5, width:(gridWidth*(20/100)) },
					{ targets: 6, width:(gridWidth*(9/100)) },
					
					
				],
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		
	}
	// 검색
	, search : function() {
	
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload()		
	} 
	// 상세
	, info : function() {
		var params = {};
		
	    var url = '/management/user/detail';
		$.ajax({ type: "GET"
				, contentType: "application/json"
				, url: url
				, data: params
				, dataType: 'json'
				, success: function (json) { 
					
					if(json.info) {
						var datas = json.messageBody.data[0];
						$("#userGroupId option[value='" + datas.userGroupId + "']").attr("selected","selected");
						$('#userId').val(datas.userId);
						$('#userName').val(datas.userName);
						$('#mtelNo').val(datas.mtelNo);	
						$('#eMail').val(datas.eMail);
						$("#useYn option[value='" + datas.useYn + "']").attr("selected","selected");
						
					}
					
				}, error: function (e) {  
					
				}
		});				
	}
	// 등록
	, add : function() {
	
		var params = ntcsData(view$); 
		params['operatorId'] = 'addUsers';
		params['passwordChangePeriod'] = 0;
		params['loginFailCount'] = 0;
		
		var messageData=[];
		messageData.push({"message:data":params});
		
		var reqParams = requestParams(messageData);
	
		var returnVal = ntcsValidator("frmUser");
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
	// 수정
	, modify : function() {
	
		var params = ntcsData(view$); 
		params['operatorId'] = 'updateUser';
		
		var messageData=[];
		messageData.push({"message:data":params});
		
		var reqParams = requestParams(messageData);
	
		var returnVal = ntcsValidator("frmUser");
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