var dataTableList;
var view$;

$(document).ready(function() {	
	ntcsObj.init();
	
	// DNIS 등록정보
	$('#listTable tbody').on('click', 'tr', function (event) {
	 
    	dataTableList.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    
	 	var data = dataTableList.rows().data(); // 데이터 목록조회
    	var rowIdx = dataTableList.row(this).index(); // 상세조회 
		var datas = data[rowIdx];

        console.log(datas);
    	var dnis = datas.dnis;
    	// 데이터 연결되면 적용
       	// ntcsObj.info(dnis); 
		$("#dnis").val(datas.dnis);
		$("#areaNo").val(datas.areaNo);
		$("#fullTelNo").val(datas.fullTelNo);
		$("#prefixNo").val(datas.prefixNo);
		$("#lineNo").val(datas.lineNo);
		$('input:radio[name=dnisStatus]:input[value="'+datas.dnisStatus+'"]').prop("checked", true);
    	$('#btnModify').show();
        event.stopPropagation();
    });
	 
	
});	 

var ntcsObj = {
	init : function() {
		ntcsObj.grid();
		view$ = ntcsToObj($('#dnisInfo'));

		// 번호대역
		var srchDnisList = [{cd:'1000', nm: '1000'}, {cd:'2000', nm: '2000'}];
		ntcsCombo($('.input-group'), 'srchDnis', null, srchDnisList, '전체', 0);	
		
		// 사용여부
		var srchDnisStatusList = [{cd:'1', nm: '사용'}, {cd:'2', nm: '비사용'}];
		ntcsCombo($('.input-group'), 'srchDnisStatus', null, srchDnisStatusList, '전체', 0);			
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
		        processing: true, 
		        ordering: false,
		        serverSide: false,
		        searching: false,
		        language : lang_kor,
		        responsive: true,
		        ajax : {
		        	"url":"/resources/json/management/dnis/list.json",  
		            //"url":"/management/dnis/list",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['dnis'] = $('#srchDnis').val();
		            	d['dnisStatus'] = $('#srchDnisStatus').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		         },
		         aoColumns : [
		             {data: "dnis", name: "dnis", defaultContent: ""},
		             {data: "areaNo", name: "areaNo", defaultContent: ""},
		             {data: "prefixNo", name: "prefixNo", defaultContent: ""},
		             {data: "lineNo", name: "lineNo", defaultContent: ""},
		             {data: "fullTelNo", name: "fullTelNo", defaultContent: ""},
		             {data: "dnisStatus", name: "dnisStatus", defaultContent: ""},
		             {data: "dnisStatusNm", name: "dnisStatusNm", defaultContent: ""}
		         ],
				columnDefs: [
					{ targets : [5], visible : false}
				],
				drawCallback: function( settings ) {
				 	ntcsNoData(this.api());
			        var pageInfo = this.api().page.info();
			        var page = pageInfo.page;				 	
				}		
			};
			
			dataTableList = $('#listTable').DataTable(dataTableListOption);		
	},
	// 조회 
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();
	    $('#btnModify').hide();			
	}, 
	//상세
	info : function() {
		var params = {};
		
	    var url = '/management/dnis/detail';
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
	},
	// 등록
	add : function() {
	
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
	
	},
	// 수정
	modify : function() {
	
		var params = ntcsData(view$); 
		params['operatorId'] = 'updateUser';
		
		var messageData=[];
		messageData.push({"message:data":params});
		
		var reqParams = requestParams(messageData);
	
		var returnVal = ntcsValidator("frmDnis");
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
	// DNIS 등록 팝업(Modal)
	addDnisModal : function() {
		
		modalView$ = ntcsToObj($('#divModalDnis')); 

		$('.modal-header > h3').text('DNIS 등록');
		$('.modal-footer #btnModalConfirm').text('등록')    

		$('#modalAddDnis').modal({backdrop: 'static', keyboard: false});	
	
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
					
			ntcsReset($('#divModalDnis'));
			ntcsValidationModalReset($('#divModalDnis'));
		});	
		
	},
	// DNIS 수정 팝업(Modal)
	modifyDnisModal : function() {
		
		modalView$ = ntcsToObj($('#divModalDnis')); 

		// DNIS 등록정보 value
		var params = ntcsData(view$); 
		$.each(params, function(key,value) {
           	$('.modal-body #'+key).val(value);
        });
        
		$('.modal-header > h3').text('DNIS 수정');
		$('.modal-footer #btnModalConfirm').text('수정')        

		$('#modalAddDnis').modal({backdrop: 'static', keyboard: false});	
	
		// 등록
		$('#btnModalConfirm').on('click', function(){
			
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
					
			ntcsReset($('#divModalDnis'));
			ntcsValidationModalReset($('#divModalDnis'));
		});	
		
	}		
}