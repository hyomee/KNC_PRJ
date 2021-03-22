
// 모든 값을 초기화
ntcsReset = function(area) {
	var this$ = area.find('input[type=text], input[type=hidden], input[type=password], textarea, select');
	this$.val('');

	this$ = area.find('input[type=checkbox], input[type=radio]');
	this$.prop('checked', false);
},

// 오늘
today = function() {
	var d = new Date()
	return getDateStr(d) 
}

// 개월 전 및 후 조회 (1개월 전 : -1, 1개월 후 : 1)
nMonth = function(iMonth) {
	var d = new Date()
	var monthOfYear = d.getMonth()
	d.setMonth(monthOfYear - iMonth) 
	return getDateStr(d)
}


// 1개월 전
lastMonth = function() {

	var d = new Date()
	var monthOfYear = d.getMonth()
	d.setMonth(monthOfYear - 1)
	return getDateStr(d)
}

// 3개월 전
last3Month = function() {
	
	var d = new Date()
	var monthOfYear = d.getMonth()
	d.setMonth(monthOfYear - 3)
	return getDateStr(d)
}

// 날짜 객체 받아서 문자열로 리턴
getDateStr = function(myDate) {
	return (myDate.getFullYear() + '-' + ("00"+(myDate.getMonth() + 1).toString()).slice(-2) + '-' +("00"+(myDate.getDate()).toString()).slice(-2))
}	


// 해당 영역(obj)의 객체를 반환
ntcsToObj = function(obj) {
	var area = obj;
	$.extend(area, {
		get : function(key) {
			return $(this).find('[name=' + key + ']').val();
		},
		nvl: function (key, defaultVal) {
			if (!defaultVal) defaultVal = '';
			return ($(this).find('[name=' + key + ']').val() == '') ? defaultVal : this.box[key];
		},
		put: function (key, value) {
			$(this).find('[name=' + key + ']').val(value);
		}
	});
	return area;
}

// 해당 영역의 값을 반환
ntcsData = function(area, pageUnit, arry, nullYn) {
	var data = {};
	area.find('input, textarea, select').each(function() {
		var this$ = $(this);
		if (!(nullYn == 'Y' && this$.val() =='')){
			if (this.tagName == 'TEXTAREA') {
				if (this.name) {
					data[this.name] = this$.val();
				} else if (this.id) {
					data[this.id] = this$.val();
				}
			} else if (this.tagName == 'SELECT') {
				if (this.name) {
					if (arry) { //배열로 반환
						data[this.name] = this$.val();
					} else { //(*default)문자열 구분자로 반환 - 예) '111','222'
						if(Array.isArray(this$.val())) {
							data[this.name] = this$.val().join(',');
						} else {
							data[this.name] = this$.val();
						}
					}
				}
			} else {
				var thisType = this.type;
				if (thisType == 'text' || thisType == 'hidden' || thisType == 'password' || thisType == 'number') {	//일반 input박스.
					if (this.name) {
						if (typeof $(this).attr('tel') !== 'undefined' && $(this).attr('tel') == '') {
							data[this.name] = cmn.unValMask(this$.val(), 'tel');
						} else if (typeof $(this).attr('num') !== 'undefined' && $(this).attr('num') == '') {
							data[this.name] = cmn.unValNum(this$.val());
						} else {
							data[this.name] = this$.val();
						}
						if (thisType == 'text' && (this.className.indexOf('calendar') > -1 || this.className.indexOf('monthPicker') > -1)) {
							data[this.name] = this$.val().replaceAll('-', '');
						}
					} else if (this.id) {
						if (typeof $(this).attr('tel') !== 'undefined' && $(this).attr('tel') == '') {
							data[this.name] = cmn.unValMask(this$.val(), 'tel');
						} else if (typeof $(this).attr('num') !== 'undefined' && $(this).attr('num') == '') {
							data[this.name] = cmn.unValNum(this$.val());
						} else {
							data[this.name] = this$.val();
						}
					}
				} else if (thisType == 'radio') { //radio
					//radio는 하나만 체크.
					if (this.name) {
						if (this$.prop('checked')) {
							data[this.name] = this$.val();
						}
					}
				} else if (thisType == 'checkbox') { //checkbox
					if (this.name) {
						if (arry) { //배열로 반환
							if (typeof data[this.name] === 'undefined') {
								data[this.name] = [];
							}
							if (this$.val()) {
								if (this$.prop('checked')) {
									data[this.name].push(this$.val());
								}
							}
						} else { //(*default)문자열 구분자로 반환 - 예) '111','222'

							if (typeof data[this.name] === 'undefined' && nullYn != 'Y') {
									data[this.name] = '';
							}
							if (this$.val()) {
								if (this$.prop('checked')) {
									data[this.name] = (data[this.name] ? data[this.name] + ',' : '') + this$.val();
								}
							}
						}
					}
				} else {
					;
				}
			}
		}
	});
	if (pageUnit) {
		data['pageUnit'] = pageUnit;
	}
	data['creationDate'] = currentTime();
	data['updateDate'] = currentTime();
	
	return data;
}

// 저장, 수정, 삭제 데이터 Return
requestParams = function(requestData) {

	var params = {};
	params['transId'] = uuid();
	params['transTimeStamp'] = currentTime();
	params['messageBody'] = requestData;
	
	return params;
}

// 유효성 체크 검사
checkValue = function(target$,msg) {
	checkVal = target$.val();
	if (isEmpty(checkVal)) {
		alert(msg);
		target$.focus();
		return true;
	}
	return false;
}

// null 체크
isEmpty = function(data) {
    if(typeof(data) === 'object'){
        if(JSON.stringify(data) === '{}' || JSON.stringify(data) === '[]'){
            return true;
        }else if(!data){
            return true;
        }
        return false;
    }else if(typeof(data) === 'string'){
        if(!data.trim()){
            return true;
        }
        return false;
    }else if(typeof(data) === 'undefined'){
        return true;
    }else{
        return false;
    }
}	
	
// form validate 체크
ntcsValidator = function (p_form_id) {

	var returnVal = false;
	returnVal = $("#"+p_form_id).validate().form();
	return returnVal;
}	

// UUID 리턴
uuid = function() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 3 | 8);
    return v.toString(16);
  });
}

// 현재시간 리턴
currentTime = function() {
	var date = new Date();
	return moment(date).format('yyyyMMDDHHmmss');
}
 
// url 이동
ntcsUrl = function(url) { 

	$.ajax({ 
		type : "get",
		url : url,
		dataType : "html",
		success : function(data) {
		
			var contentData = $(data).children('.main-panel');
			$(".content").empty();
			$(".content").html(contentData.html());
		}
	});
	
}

// select box 
// area: 영역, nm: 개체명, val: 설정될 값, obj: combo 쿼리id or combo object, allNm: 전체유무및 명칭, width: 가로사이즈(고정시)
ntcsCombo = function(area, nm, val, obj, allNm, width){
	var this$ = area.find('[name=' + nm + ']');

	if (typeof obj === 'undefined') { //obj가 없을 경우(이미 display되었다고 가정함)
		ntcsComboDp(area, this$, val, obj);
	} else if (typeof obj === 'object' && Array.isArray(obj)) { //obj가 combo list일 경우
		ntcsComboDp(area, this$, val, obj, allNm, width);
	}
},
 
// combobox 출력
ntcsComboDp = function(area, sel$, val, list, allNm, width) {
	if (typeof list === 'undefined') { //콤보가 이미 display 되어있음
		if (typeof val === 'string') {
			var opt = sel$.children('option');
			var valArry = [];
			for (var idx = 0; idx < opt.length; idx++) {
				for (var jdx = 0; jdx < val.split(',').length; jdx++) {
					if (opt[idx].value == val.split(',')[jdx]) {
						valArry.push(val.split(',')[jdx]);
					}
				}
			}
			if (valArry.length != 0) {
				sel$.val(valArry);
			}
		}
	} else {  //list를 가지고 combo를 display
		sel$.html('');
		var html = '';
		var sel;
		if (typeof allNm === 'string') {
			html += '<option value="">' + allNm + '</option>';
		}
	
		for (var idx = 0; idx < list.length; idx++) {
			sel = '';
			if (typeof val === 'string') {
				for (var jdx = 0; jdx < val.split(',').length; jdx++) {
					if (list[idx].cd == val.split(',')[jdx]) {
						sel = 'selected';
					}
				}
			}
			html += '<option value="' + list[idx].cd + '"' + sel + '>' + list[idx].nm + '</option>';
		}
		sel$.html(html);
	}
	
	/*var minWidth = 100;*/
	if (width && width > 0) {
		sel$.css('width', width + 'px');
	} /*else if (sel$.css('width').replaceAll('px', '') < minWidth) {
		sel$.css('width', minWidth + 'px');
	}*/	
}

// validation 필수입력 해제 (Modal)
ntcsValidationModalReset = function(area) {

	area.find('input[type=text], input[type=hidden], input[type=password], textarea, select radio checkbox').each(function() {
		$('.modal-body #' + $(this).attr('id')).removeClass('has-error');
		$('.modal-body #' + $(this).attr('id') +'-error').remove(); 	
	}); 
}

// datatable no data 
ntcsNoData = function(api) {

	if(api.rows().data().length == 0) {
 		var tableId = api.tables().nodes().to$().attr('id');
 		$('#'+tableId +' > tbody > tr > td').addClass('no-data-cell');
 	}	
}

// 고객정보
var custNameDataTable;
custNameModalPopup = function(custId) {
	
    // 목록조회
	var custNameDataTableOption = {
		pageLength: 100,
		destroy: true,
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
        ajax : {
            "url":"/resources/json/modal/custNameModal.json",  // backend URL로 추후 변경
            "type":"GET",
            "dataSrc" : function(res) {	
            	return res.messageBody.data;
            },
            "data": function (d) {
            	d['custName'] = $('.modal_body #srchCustName').val();
            	d['X-AUTH-TOKEN'] = '';
            }
        },
        aoColumns : [ 
			{data: "custId", name: "custId", defaultContent: ""},
			{data: "custName", name: "custId", defaultContent: ""}
         ],
		columnDefs: [
			
		],
		drawCallback: function( settings ) {
		 	ntcsNoData(this.api());
		}
	};

	custNameDataTable = $('#listCustNameTable').DataTable(custNameDataTableOption);		

	$('#custNameModal').modal({backdrop: 'static', keyboard: false});
		
	// 회의이력 링크 클릭
  	$('#listCustNameTable tbody').on('click', 'tr', function (event) {
 	
    	custNameDataTable.$('tr.selected').removeClass('selected');
    	$(this).addClass('selected');
    
	 	var data = custNameDataTable.rows().data(); // 데이터 목록조회
    	var rowIdx = custNameDataTable.row(this).index(); // 상세조회 

    	var datas = data[rowIdx];
    
     	event.stopPropagation();
  	});	
  	
	// 적용 
	$('#btnCustNmModalConfirm').on('click', function(){
	
		var datas = $('#listCustNameTable').DataTable().rows('.selected').data();
		if(datas == undefined) return false;
		
		var params = {};
		params['custId'] = datas[0].custId;
		params['custName'] = datas[0].custName;
		custNmCallback(params);
	});
	
	// 조회
	$('#btnCustNameSearch').on('click', function(){
	
		 $('#listCustNameTable').DataTable().clear();
    	 $('#listCustNameTable').DataTable().ajax.reload()	
	});
	
	// 닫기 
	$('#btnCustNmModalClose').on('click', function(){

	});  	
		 
}


// 고객ID, 고객명 return
custNmCallback = function(params) { 
	$('#srchCustId').val(params.custId);
	$('#srchCustName').val(params.custName);
}

