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
		    
		    <!-- hidden -->
		    <input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
		    <input type="hidden" id="TITLE" name="TITLE" value="${map.TITLE }">
		    
		    
		    <textarea class="ckeditor" id="RS_editor" name="RS_editor">${map.CONTENTS }</textarea>
		    <textarea class="ckeditor" id="RI_editor" name="RI_editor">${map.A_CONTENTS }</textarea>
		    <!-- request end -->
		    
		    
		    <!-- button start -->
			<div class="btn_wrap">
				<input type="button" id="btn_save" class="btn_orange" value="저장">
			</div>
			<!-- button end -->
			
		</form>	
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#list_request").click(function() {	//목록 버튼
				fn_openRequestList();
			});
			
			$("#btn_save").click(function() {	//저장 버튼
				fn_insertRequestAnswer();
			});
			
	    });
		
		//문의목록 이동
		function fn_openRequestList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "RL");	//문의목록
		    comSubmit.submit();
		}
		
		//문의 답변 저장
		function fn_insertRequestAnswer() {
			
			var answer = CKEDITOR.instances.RI_editor.getData();
			
			if(gfn_isNull(answer) == true) {
				alert("문의에 대한 답변을 입력해주세요.");
				CKEDITOR.instances.RI_editor.focus();
				return false;
			}
			
			var param = {
					IDX : $("#IDX").val(),
					TITLE : $("#TITLE").val(),
					CONTENTS : answer,
					ANSWER_ID : "${S_ID}"
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/request/insertRequestAnswer.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openRequestList();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
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
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
 			],
 			enterMode : '2'	//엔터시 <br>
	    });
	</script>	
</body>
</html>