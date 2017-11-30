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
	
		<div class="menu_title">공지사항 등록</div>
		
		<form id="frm" name="frm">
			
			<!-- notice start -->
			<table class="write_common_table">
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="tcenter">제목</th>
						<td>
							<input type="text" id="TITLE" name="TITLE" size="70" placeholder="[공지] MOVIESTAR 오픈">
						</td>
					</tr>
				</tbody>
			</table>
			
			<textarea class="ckeditor" id="NI_editor" name="NI_editor"></textarea>
			<!-- notice end -->
			
			
			<!-- button start -->
			<div class="btn_wrap">
				<input type="button" id="notice_save" class="btn_orange" value="저장">
			</div>
			<!-- button end -->
			
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#notice_save").click(function() {	//저장 버튼
				
				if(CKEDITOR_byteCheck("NI_editor") > 4000) {
					alert("입력 가능 문자수를 초과하였습니다");
					CKEDITOR.instances.NI_editor.focus();
					return false;
				}else {
					fn_saveNotice();	
				}
			});
			
	    });
		
		//저장
		function fn_saveNotice() {
			var param = {
					TITLE : $("#TITLE").val(),
					CONTENTS : CKEDITOR.instances.NI_editor.getData(),
					CREA_ID : "${S_ID}"
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/notice/insertNotice.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openNoticeList();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//공지사항 목록 이동
		function fn_openNoticeList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NL");
		    comSubmit.submit();
		}
		
		//에디터 설정
		CKEDITOR.replace( 'NI_editor', {
			height : 300,
			enterMode : '2'	//엔터시 <br>
			//filebrowserImageUploadUrl : '/dev-guide/ckeditorImageUpload.do'
	    });
		
	</script>	
</body>
</html>