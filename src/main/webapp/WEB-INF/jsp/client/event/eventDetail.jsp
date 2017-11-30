<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">이벤트</div>
		<div class="explain">'무비스타'에서 진행하는 다양한 이벤트에 참여해보세요.</div>
		<div class="etc"><span class="essential">* </span>'참여하기' 버튼을 누르면 포인트가 적립됩니다.</div>
		
		<hr style="clear: right;">
		
		<!-- Start Event -->
		<div class="event_detail_title">${map.TITLE }</div>
		<div class="event_detail_Period">No.${map.IDX} | 이벤트 기간 : ${map.START_DT } ~ ${map.END_DT }</div>
		<div class="event_detail_img">
			<img src="<c:url value='/upload/${map.STORED_FILE_NAME }'/>">
		</div>
		
		<textarea class="ckeditor" id="ES_editor" name="ES_editor">${map.CONTENTS }</textarea>
		<input type="hidden" id="EVENT_NO" name="EVENT_NO" value="${map.IDX }">
		<input type="hidden" id="POINT" name="POINT" value="${map.POINT }">
		
		<div class="btn_wrap">
			<input type="button" id="btn_participate" class="btn_orange" value="참여하기">
			<input type="button" id="btn_list" class="btn_gray" value="목록">
		</div>
		<!-- End Event -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$("#btn_participate").click(function() {	//참여하기 버튼
				fn_participateEvent();
			});
			
			$("#btn_list").click(function() {	//목록 버튼
				fn_openEventList();
			});
	    });
		
		//참여하기
		function fn_participateEvent() {
			
			var param = {
					POINT    : $('#POINT').val(),
					EVENT_NO : $('#EVENT_NO').val(),
					POINT_ID : "${S_ID}"
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/point/insertPointByEvent.do' />",
	            data : param,
	            success : function(result) {
	            	if(result.cnt > 0) {
	            		alert("이벤트는 한번만 참여 가능합니다.");
	            	}else {
	            		alert("참여해주셔서 감사합니다.\n포인트 " + param.POINT + "점이 적립되었습니다.");
	            		fn_openEventList();
	            	}
	            },
	            error : function(xhr, textStatus, errMsg){
	            	if(xhr.status == 500) {
						gfn_openLoginForm();
						var url = "<c:url value='/event/selectEventDetail.do?IDX=" + $("#EVENT_NO").val() + "' />";
						$('#AFTER_LOGIN_URL').val(url);
					}
	            }
	        });
		}
		
		//이벤트 목록 
		function fn_openEventList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/event/selectEventList.do' />");
			comSubmit.submit();
		}
		
		//에디터 설정
		CKEDITOR.replace( 'ES_editor', {
			height : 250,
			readOnly: true, 
			removePlugins: 'elementspath',
			toolbarCanCollapse : true,
			toolbarStartupExpanded: false,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
		  	]
			//filebrowserImageUploadUrl : '/dev-guide/ckeditorImageUpload.do'
	    });
	</script>	
</body>
</html>