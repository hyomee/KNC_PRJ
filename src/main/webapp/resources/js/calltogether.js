/**
 * 해당 영역의 모든 값을 초기화 한다
 */
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

/**
 * 해당 영역(area)의 값을 반환한다
 */
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
	
// form validate 체크..
ntcsValidator = function (p_form_id) {

	var returnVal = false;
	returnVal = $("#"+p_form_id).validate().form();
	return returnVal;
}	

// UUID
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

// 윈도우 사이즈 출력
 getDocHeight= function() {
	 var myWidth = 0, myHeight = 0;
	 if( typeof( window.innerWidth ) == 'number' ) {
	   //Non-IE
	   myWidth = window.innerWidth;
	   myHeight = window.innerHeight;
	 } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
	   //IE 6+ in 'standards compliant mode'
	   myWidth = document.documentElement.clientWidth;
	   myHeight = document.documentElement.clientHeight;
	 } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
	   //IE 4 compatible
	   myWidth = document.body.clientWidth;
	   myHeight = document.body.clientHeight;
	 }
	 //window.alert( 'Width = ' + myWidth );
	 //window.alert( 'Height = ' + myHeight );
	 return myHeight;
}
	 	
 resizeHeight = function(id) {
    var the_height = document.getElementById(id).contentWindow.document.body.scrollHeight;
   document.getElementById(id).height = getDocHeight() - 35;
}

// url 이동
ntcsUrl = function(url) {
	location.href = url;
}

// url 이동
ntcsUrlTest = function(url) {

}
