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
		
		<div class="title">고객센터</div>
		<div class="explain">${S_NAME_KO }(${S_ID })님이 문의하신 내용입니다.</div>
		<div class="etc"><span class="essential">* </span>답변완료 전까지 수정 가능합니다.</div>
		
		<hr style="clear: right;">
		
		<form id="frm" name="frm">
		
			<!-- my request detail start -->
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
		    <!-- my request detail end -->
		    
		    <!-- hidden -->
		    <input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
		    
		    <div class="btn_wrap">
				<input type="button" id="btn_change" class="btn_orange" value="수정">
			</div>
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn_change").click(function() {
				fn_openRequestUpdateForm();
			});
			
	    });
		
		//문의 수정화면 이동
		function fn_openRequestUpdateForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/openRequestUpdateForm.do' />");
		    comSubmit.addParam("IDX", $("#IDX").val());
		    comSubmit.submit();
		}
		
		//에디터 설정
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
	</script>	
</body>
</html>