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
	
		<div class="menu_title">1:1 문의답변</div>
		
		<div class="list_request_wrap">
			<input type="button" id="list_request" class="btn_gray" value="목록">
		</div>
		
		<form id="frm" name="frm">
		
			<!-- request start -->
			<table class="common_table">
		        <colgroup>
		            <col width="15%"/>
		            <col width="35%"/>
		            <col width="15%"/>
		            <col width="35%"/>
		        </colgroup>
		        <tbody>
		            <tr>
		                <th class="tcenter">신청자</th>
		                <td>${map.REQ_ID }</td>
		                <th class="tcenter">신청일</th>
		                <td>${map.REQ_DTM }</td>
		            </tr>
		            <tr>
		                <th class="tcenter">제목</th>
		                <td colspan="3">${map.TITLE }</td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <textarea class="ckeditor" id="RS_editor" name="RS_editor">${map.CONTENTS }</textarea>
		    
		    
		    
		    <table class="common_table">
		        <colgroup>
		            <col width="15%"/>
		            <col width="35%"/>
		            <col width="15%"/>
		            <col width="35%"/>
		        </colgroup>
		        <tbody>
		            <tr>
		                <th class="tcenter">답변자</th>
		                <td>${map.ANSWER_ID }</td>
		                <th class="tcenter">답변일</th>
		                <td>${map.ANSWER_DTM }</td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <textarea class="ckeditor" id="RI_editor" name="RI_editor">${map.A_CONTENTS }</textarea>
		    <!-- request end -->
		    
		</form>	
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#list_request").click(function() {	//목록 버튼
				fn_openRequestList();
			});
			
	    });
		
		//문의목록 이동
		function fn_openRequestList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "RL");	//문의목록
		    comSubmit.submit();
		}
		
		//client - 에디터 설정
		CKEDITOR.replace( 'RS_editor', {
			height : 170,
			readOnly: true, 
			removePlugins: 'elementspath',
			toolbarCanCollapse : true,
			toolbarStartupExpanded: false,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
			]
	    });
		
		//admin - 에디터 설정
		CKEDITOR.replace( 'RI_editor', {
			height : 170,
			readOnly: true, 
			removePlugins: 'elementspath',
			toolbarCanCollapse : true,
			toolbarStartupExpanded: false,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
 			]
	    });
	</script>	
</body>
</html>