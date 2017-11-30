<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">고객센터</div>
		<div class="explain">사용문의나 불편하신 부분, 궁금한 사항을 남겨주세요.</div>
		<div class="etc"><span class="essential">* </span>문의주신 내용은 <b>마이페이지 - 나의 문의내역</b>에서 확인가능합니다.</div>
		
		<hr style="clear: right;">
		
		<form id="frm" name="frm">
		
			<!-- Start Request -->
			<table class="request_table">
		        <colgroup>
		            <col width="15%"/>
		            <col width="*"/>
		            <col width="15%"/>
		            <col width="15%"/>
		        </colgroup>
		        <tbody>
		            <tr>
		                <th class="tcenter">제목</th>
		                <td><input type="text" id="TITLE" name="TITLE" size="70"></td>
		                <th class="tcenter">작성자</th>
		                <td>${S_NAME_KO }</td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <textarea class="ckeditor" id="RI_editor" name="RI_editor"></textarea>
			<!-- End Request -->
			
			<div class="btn_wrap">
				<input type="button" id="btn_request" class="btn_orange" value="문의하기">
			</div>
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#btn_request").click(function() {	//문의하기 버튼
				fn_requestWrite();
			});
		});
		
		//문의 작성
		function fn_requestWrite() {
			
			if(gfn_isNull($("#TITLE").val())) {
				alert("제목을 입력해주세요.");
				$("#TITLE").focus();
				return false;
			}
			if(gfn_isNull(CKEDITOR.instances.RI_editor.getData())) {
				alert("문의 내용을 입력해주세요.");
				CKEDITOR.instances.RI_editor.focus();
				return false;
			}
			
			var comSubmit = new ComSubmit("frm");
		    comSubmit.setUrl("<c:url value='/request/insertRequest.do' />");
		    comSubmit.addParam("CONTENTS", CKEDITOR.instances.RI_editor.getData());
		    comSubmit.addParam("REQ_ID", "${S_ID}");
		    comSubmit.submit();
		}
		
		//에디터 설정
		CKEDITOR.replace( 'RI_editor', {
			height : 250,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
  			],
  			enterMode : '2'	//엔터시 <br>
	    });
	</script>
</body>
</html>