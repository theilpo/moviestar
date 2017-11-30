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
		                <td colspan="3"><input type="text" id="TITLE" value="${map.TITLE }" size="50"></td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <textarea class="ckeditor" id="RU_editor" name="RU_editor">${map.CONTENTS }</textarea>
		    <!-- my request detail end -->
		    
		    <!-- hidden -->
		    <input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
		    
		    <div class="btn_wrap">
				<input type="button" id="btn_change" class="btn_orange" value="수정">
				<input type="button" id="btn_delete" class="btn_gray" value="삭제">
			</div>
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn_change").click(function() {	//수정 버튼
				fn_myRequestUpdate();
			});
			
			$("#btn_delete").click(function() {	//삭제 버튼
				fn_myRequestDelete();
			});
	    });
		
		//나의문의 수정
		function fn_myRequestUpdate() {
			var param = {
					TITLE : $("#TITLE").val(),
					CONTENTS : CKEDITOR.instances.RU_editor.getData(),
					IDX : $("#IDX").val()
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/my/updateMyRequest.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openMyRequestDetail();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//나의문의 삭제
		function fn_myRequestDelete() {
			if(confirm("나의문의를 삭제하시겠습니까?") == true) {
				var param = {
						IDX : $("#IDX").val()
				};
				
				$.ajax({
		            type : "POST",
		            url : "<c:url value='/my/deleteMyRequest.do' />",
		            data : param,
		            success : function(result) {
		            	fn_openMypage();
		            },
		            error : function(errMsg){
		                alert("error : "+ errMsg);
		            }
		        });
			}
		}
		
		//나의문의 조회
		function fn_openMyRequestDetail() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/selectMyRequestDetail.do' />");
		    comSubmit.addParam("ANSWER_GB", "N");
		    comSubmit.addParam("IDX", $("#IDX").val());
		    comSubmit.submit();
		}
		
		//마이페이지 이동
		function fn_openMypage() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/openMypageForm.do' />");
		    comSubmit.submit();
		}
		
		//에디터 설정
		CKEDITOR.replace( 'RU_editor', {
			height : 200,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
			],
			enterMode : '2'	//엔터시 <br>
	    });
	</script>	
</body>
</html>