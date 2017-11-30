/**
 * 널 체크
 * 
 * @param str : null 체크할 문자열
 * @returns {Boolean}
 */
function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}

/**
 * 파라미터 전송  
 * 
 * @param opt_formId : 전송할 폼ID
 */
function ComSubmit(opt_formId) {
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.url = "";
    
    if(this.formId == "commonForm"){
        $("#commonForm")[0].reset();
    }
        
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.addParam = function addParam(key, value){
        $("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
    };
     
    this.submit = function submit(){
        var frm = $("#"+this.formId)[0];
        frm.action = this.url;
        frm.method = "post";
        frm.submit();  
    };
}

/**
 * 바이트수 반환  
 * 
 * @param id : tag jquery object
 * @returns {Number}
 */
function byteCheck(id) {
    var codeByte = 0;
    for (var idx = 0; idx < id.val().length; idx++) {
        var oneChar = escape(id.val().charAt(idx));
        if ( oneChar.length == 1 ) {
            codeByte ++;
        } else if (oneChar.indexOf("%u") != -1) {
            codeByte += 2;
        } else if (oneChar.indexOf("%") != -1) {
            codeByte ++;
        }
    }
    return codeByte;
}

/**
 * CKEDITOR 바이트수 반환  
 * 
 * @param editorID : CKEDITOR ID
 * @returns {Number}
 */
function CKEDITOR_byteCheck(editorID) {
	var obj = CKEDITOR.instances[editorID];
	var data = obj.getData();
    var codeByte = 0;
    
    for (var idx = 0; idx < data.length; idx++) {
        var oneChar = escape(data.charAt(idx));
        if ( oneChar.length == 1 ) {
            codeByte ++;
        } else if (oneChar.indexOf("%u") != -1) {
            codeByte += 2;
        } else if (oneChar.indexOf("%") != -1) {
            codeByte ++;
        }
    }
    return codeByte;
}

/**
 * 체크박스 전체선택/해제
 * 
 * @param header : 헤더 체크박스
 */
function fn_allCheckbox(header) {
	$("input:checkbox[name='CHK']").each(function() {
		if(header.is(":checked") == true) {
			$(this).prop("checked", true);
		}else {
			$(this).prop("checked", false);
		}
	});
}

/**
 * 금액 세자리 콤마
 * 
 * @param num : 숫자
 * @returns {String}
 */
function gfn_setComma(num) {
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**
 * 페이징 처리  
 * 
 * @param totalCnt     : 전체 건수 
 * 		  countPerPage : 페이지당 건수
 *  	  pageNavSize  : 페이지 네비게이션 크기
 *  	  pageNo       : 현재 페이지
 *  	  token	       : 
 */
function gfn_paging(totalCnt, countPerPage, pageNavSize, pageNo, token) {
	
	var totalCnt     = parseInt(totalCnt);
	var countPerPage = parseInt(countPerPage);  
	var pageNavSize  = parseInt(pageNavSize);   
	var pageNo       = parseInt(pageNo);      
	  
	var html = new Array();
	
	if(totalCnt == 0) {
		return "";
	}
	  
	//총 페이지 수
	var totalPage = totalCnt % countPerPage; 
	
	if(totalPage == 0) {
		totalPage = parseInt(totalCnt / countPerPage);
	}
	else {
		totalPage = parseInt(totalCnt / countPerPage) + 1;
	}
	    
	var pRCnt = parseInt(pageNo / pageNavSize);
		
	if(pageNo % pageNavSize == 0) {
		pRCnt = parseInt(pageNo / pageNavSize) - 1;
	}
	
	// [이전]
	if(pageNo > pageNavSize) {
		var s2;
		if(pageNo % pageNavSize == 0) {
			s2 = pageNo - pageNavSize;
		}
		else {
			s2 = pageNo - pageNo % pageNavSize;
		}
		html.push('<a href=javascript:goPage_' + token + '("');
		html.push(s2);
		html.push('");>');
		html.push('[이전] ');
		html.push("</a>");
	}
	else {
		html.push('<a href="#">\n');
	  	html.push('[이전] ');
	  	html.push('</a>');
	}
  
	// Paging bar
	for(var index = (pRCnt*pageNavSize)+1; index < (pRCnt+1)*pageNavSize + 1; index++) {
		if(index == pageNo) {
			html.push('<strong>');
			html.push('[' + index + ']');
			html.push('</strong>');
		}
		else {
			html.push('<a href=javascript:goPage_' + token + '("');
			html.push(index);
			html.push('");>');
			html.push('[' + index + ']');
			html.push('</a>');
		}
		
		if(index == totalPage){
			break;
		}else {
			html.push(' ');
		}
   }
	
   // [다음]
   if(totalPage > (pRCnt + 1) * pageNavSize){
	   html.push('<a href=javascript:goPage_' + token + '("');
	   html.push((pRCnt + 1)*pageNavSize+1);
	   html.push('");>');
	   html.push(' [다음]');
	   html.push('</a>');
   }
   else {
	   html.push('<a href="#">');
	   html.push(' [다음]');
	   html.push('</a>');
   }
   
   return html.join("");
}

/**
 * 오늘 날짜 조회
 * 
 * @returns : Date(yyyy-mm-dd)
 */
function gfn_getToday() {
	var today = new Date();
	var yyyy  = today.getFullYear();
	var mm    = today.getMonth() + 1;
	var dd    = today.getDate();
	
	if(dd < 10)
		dd = '0' + dd;
	
	if(mm < 10) 
		mm = '0' + mm;
	
	today = yyyy + '-' + mm + '-' + dd;
	return today;
}

/*********************************** start  L O G I N   *********************************/
//창크기 변경 시 로그인창 가운데 정렬
function gfn_resize() {
	var maskHeight = $(document).height();
 	var maskWidth = $(window).width();

 	$('.mask').css({'width':maskWidth,'height':maskHeight});

 	var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
 	var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );

 	$('.window').css({'left':left,'top':top, 'position':'absolute'});
}
//로그인 팝업 오픈
function gfn_openLoginForm() {
	gfn_resize();	
	
	$('.mask').fadeTo("fast", 0.7);
	$('.window').show();
}
/*************************************  end  L O G I N   *********************************/
