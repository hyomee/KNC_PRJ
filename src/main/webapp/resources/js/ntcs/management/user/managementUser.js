var dataTableList;
var view$;
var modalView$;
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
		$('#btnModify').show();
     	event.stopPropagation();
  	});	
	 
});	 

var ntcsObj = {
	init : function() {
		gridWidth = $('.content').width();
		ntcsObj.grid();
		view$ = ntcsToObj($('#userDetail'));
		$('#btnModify').hide();
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
		        language : lang_kor,
		        responsive: true,
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
		        aoColumns: [
		        	{data: "userGroupId", name: "userGroupId", defaultContent: ""},
		        	{data: "userGroupNm", name: "userGroupNm", defaultContent: ""},
		        	{data: "userId", name: "userId", defaultContent: ""},
		        	{data: "password", name: "password", defaultContent: ""},
		        	{data: "userName", name: "userName", defaultContent: ""},
		        	{data: "mtelNo", name: "mtelNo", defaultContent: ""},
		        	{data: "eMail", name: "eMail", defaultContent: ""},
		        	{data: "useYn", name: "useYn", defaultContent: ""}
		        ],
				columnDefs: [
					{ targets: 0, width:(gridWidth*(0/100)), visible : false  }
										
				],
				drawCallback: function( settings ) {
				 	ntcsNoData(this.api());
			        var pageInfo = this.api().page.info();
			        var page = pageInfo.page;				 	
				}		
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		
	}
	// 검색
	, search : function() {
	
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();
	    $('#btnModify').hide();		
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
	
	},
	// 사용자 등록  등록 팝업(Modal)
	addUserModal : function() {
		
		modalView$ = ntcsToObj($('#divModalUser')); 
	
		$('.modal-header > h3').text('사용자 등록');
		$('.modal-footer #btnModalConfirm').text('등록')   	

		$('#modalAddUser').modal({backdrop: 'static', keyboard: false});	
	
		// 등록
		$('#btnModalConfirm').on('click', function(){
			
			console.log('등록');
			return false;

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
		
			ntcsReset($('#divModalUser'));	
			ntcsValidationModalReset($('#divModalUser'));
			ntcsUrl('/management/user');
			
			$('#modalAddUser').modal('hide');
			
		});
		
		// 닫기 
		$('#btnModalClose').on('click', function(){
					
			ntcsReset($('#divModalUser'));
			ntcsValidationModalReset($('#divModalUser'));
		});	
		
	},
	// 사용자 수정 팝업(Modal)
	modifyUserModal : function() {
		
		modalView$ = ntcsToObj($('#divModalUser')); 
		
		// 사용자 등록정보 value
		var params = ntcsData(view$); 
		$.each(params, function(key,value) {
           	$('.modal-body #'+key).val(value);
        });			
		
		// 언어

		$('.modal-header > h3').text('사용자 수정');
		$('.modal-footer #btnModalConfirm').text('수정');

		$('#modalAddUser').modal({backdrop: 'static', keyboard: false});	
	
		// 수정
		$('#btnModalConfirm').on('click', function(){
			
			console.log('수정');
			return false;

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
		
			ntcsReset($('#divModalUser'));	
			ntcsValidationModalReset($('#divModalUser'));
			ntcsUrl('/management/user');
			
			$('#modalAddUser').modal('hide');
			
		});
		
		// 닫기 
		$('#btnModalClose').on('click', function(){
					
			ntcsReset($('#divModalUser'));
			ntcsValidationModalReset($('#divModalUser'));
		});	
		
	},
		
	
	

}