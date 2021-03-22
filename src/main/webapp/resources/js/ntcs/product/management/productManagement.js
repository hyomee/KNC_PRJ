var dataTableList;
var view1$;
var view2$;
	

$(document).ready(function() {	
	 ntcsObj.init(); 
	 view2$ = ntcsToObj($('#divModalProdConfigInfo'));
	 $("#listTable tbody").click( function( e ) { 

    	dataTableList.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    	e.stopPropagation();
    	
	 	var data=dataTableList.rows().data(); // 데이터 목록조회
    	var rowIdx = dataTableList.row(this).index(); // 상세조회     	

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
		        	"url":"/resources/json/product/management/list.json",  
		            //"url":"/management/user/list",  
		            "type":"GET",
		            "dataSrc" : function(res) {
		            	return res.messageBody.data;
		            },
		            "data": function (d) {
		            	d['prodKdCd'] = $('#srchProdKdCd').val();
		            	d['svcDomain'] = $('#srchSvcDomain').val();
		            	d['X-AUTH-TOKEN'] = '';
		            }
		        },
		        aoColumns: [
		        	{data: "prodCd", name: "prodCd", defaultContent: ""}, 
		        	{data: "prodName", name: "prodName", defaultContent: ""},
		        	{data: "prodKdCd", name: "prodKdCd", defaultContent: ""},
		        	{data: "prodKdNm", name: "prodKdNm", defaultContent: ""},
		        	{data: "prodDvCd", name: "prodDvCd", defaultContent: ""},
		        	{data: "prodDvNm", name: "prodDvNm", defaultContent: ""},
		        	{data: "chargingDvCd", name: "chargingDvCd", defaultContent: ""},
		        	{data: "chargingDvNm", name: "chargingDvNm", defaultContent: ""},
		        	{data: "valdStrtDttm", name: "valdStrtDttm", defaultContent: ""}, 
		        	{data: "valdEndDttm", name: "valdEndDttm", defaultContent: ""}
		        	
		        ],
				columnDefs: [
					{ targets: [2,4,6], visible : false  }
										
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
	
	},
	// 검색
	search : function() {
	 	$('#listTable').DataTable().clear();
	    $('#listTable').DataTable().ajax.reload();			
	},
	// 상품 구성정보 등록 팝업
	prodConfigInfoModal : function() {
	
		ntcsObj.prodConfigInfoDataTable();
		
		// validation 제거
		$('.modal-body #prodName').removeClass('has-error'); 
		$('#prodName-error').remove(); 
		  
		$('#modalProdConfigInfo').modal({backdrop: 'static', keyboard: false});
	},
	// 상품 구성정보 Datatable 2개
	prodConfigInfoDataTable : function() {
	
		// 판매채널, 서비스도메인, 서비스그룹 comobox 로직 추가해야함.
		// datatable column명 변경. backend 나오면.

		//console.log("resultStatus: ", resultStatus);
		var pars = {};
		pars.resultStatus = 0;
		
		// 왼쪽
		var optionSource = {
			autoWidth: false,
	        bInfo: false,
	        paging: false,             
	        bPaginate: false,
	        bLengthChange: true,
	        processing: true, 
	        ordering: false,
	        serverSide: false,
	        searching: false,
	        language : lang_kor,
			ajax: {
				"url": "/resources/json/product/management/listSource.json",
				"data": pars,
				"type":"GET",
				//"contentType": "application/json; charset=UTF-8",
				"dataSrc": function(res){
					return res.messageBody.data;
				}
			},
			aoColumns: [ 
				{"data": "etc1"},
				{"data": "etc2"},
				{"data": "etc3", "class" : "text-center"},
				{"data": "etc4", "class" : "text-center"},
				{"data": "etc5", "class" : "text-right"}
			],
			columnDefs: [
												
			],			
			drawCallback: function( settings ) {
				var apii = this.api();
				var pageInfo = apii.page.info();

			},
			language : lang_kor
			
		};
	
		var resultSourceTable = $('#prodMgtInfoSourceDt').DataTable(optionSource);

		// 왼쪽 구성항목코드 CELL CLICK
	  	$('#prodMgtInfoSourceDt tbody').on('click', 'tr', function (event) {
	 		
	    	resultSourceTable.$('tr.selected').removeClass('selected');
	    	$(this).addClass('selected');
	    
	     	event.stopPropagation();
	  	});			
		
		// 오른쪽
		//console.log("resultStatus: ", resultStatus);
		var pars = {};
		pars.resultStatus = 0;
	
		var optionTarget = {
			autoWidth: false,
	        bInfo: false,
	        paging: false,             
	        bPaginate: false,
	        bLengthChange: true,
	        processing: true, 
	        ordering: false,
	        serverSide: false,
	        searching: false,
	        language : lang_kor,
			ajax: {
				"url": "/resources/json/product/management/listTarget.json",
				"data": pars,
				"type":"GET",
				//"contentType": "application/json; charset=UTF-8",
				"dataSrc": function(res){
					return res.messageBody.data;
				}
			},
			aoColumns: [ 
				{"data": "etc1"},
				{"data": "etc2"},
				{"data": "etc3", "class" : "text-center"},
				{"data": "etc4", "class" : "text-center"},
				{"data": "etc5", "class" : "text-right"}
			], 
			columnDefs: [
				{ targets: [2,3,4], visible : false  }
									
			],			
			drawCallback: function( settings ) {
				
				var api = this.api();
				var pageInfo = api.page.info();
				
			},
			language : lang_kor
			
		};
	
		var resultTargetTable = $('#prodMgtInfoTargetDt').DataTable(optionTarget);		

		// 오른쪽 구성항목코드 CELL 클릭
	  	$('#prodMgtInfoTargetDt tbody').on('click', 'tr', function (event) {
	 		
	    	resultTargetTable.$('tr.selected').removeClass('selected');
	    	$(this).addClass('selected');
	    
	     	event.stopPropagation();
	  	});						 
			 	 
		// 적용 
		$('#btnModalConfirm').on('click', function(){

			var params = ntcsData(view2$); 

			var returnVal = ntcsValidator("frmModalProdConfigInfo");
	    	if (!returnVal) return false;		
				
			resultSourceTable.destroy();	
			resultTargetTable.destroy();
			
			ntcsReset($('#divModalProdConfigInfo'));	
			ntcsValidationModalReset($('#divModalProdConfigInfo'));
				
			$('#modalProdConfigInfo').modal('hide');

		});
		
		// 닫기 
		$('#btnModalClose').on('click', function(){
		
			// 초기화 및 reset
			ntcsReset($('#divModalProdConfigInfo'));	
			ntcsValidationModalReset($('#divModalProdConfigInfo'));
						
			//$('.modal-body #prodName').removeClass('has-error'); 
			//$('#prodName-error').remove(); 
		  		
			resultSourceTable.destroy();	
			resultTargetTable.destroy();
		});
	
	},
	// 왼쪽 화살표 클릭 
	prodConfigLeftArrow : function() {
	
		var tdata = $('#prodMgtInfoTargetDt').DataTable().rows('.selected').data();	
		var sdata = $('#prodMgtInfoSourceDt').DataTable();
		
		if(!tdata) return false;
		try {
			sdata.row.add( {
		        "etc1":  tdata[0].etc1,
		        "etc2":  tdata[0].etc2,
		        "etc3":  tdata[0].etc3,
		        "etc4":  tdata[0].etc4,
		        "etc5":  tdata[0].etc5
		    } ).draw();	
		    		
			$('#prodMgtInfoTargetDt').DataTable().rows('.selected').remove().draw(true);		
		} catch(e) {}

		
	},
	// 오른쪽 화살표 클릭 
	prodConfigRightArrow : function() {
		
		var sdata = $('#prodMgtInfoSourceDt').DataTable().rows('.selected').data();
		var tdata = $('#prodMgtInfoTargetDt').DataTable();
			
		if(!sdata) return false;
		
		try {
			tdata.row.add( {
		        "etc1":  sdata[0].etc1,
		        "etc2":  sdata[0].etc2,
		        "etc3":  sdata[0].etc3,
		        "etc4":  sdata[0].etc4,
		        "etc5":  sdata[0].etc5
		    } ).draw();	
			
			$('#prodMgtInfoSourceDt').DataTable().rows('.selected').remove().draw(true);
		} catch(e) {}

	}
}