<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">회원정보수정</div>
		<div class="explain">${S_NAME_KO }(${S_ID })님, 즐거운 하루 되세요!</div>
		<div class="etc">&nbsp;</div>
		
		<hr style="clear: right;">
		
		<div class="write_ok_msg">
			<div>회원정보가 수정되었습니다.</div>
			<div>감사합니다.</div>
		</div>
		
		<!-- button start -->
		<div class="btn_wrap">
			<input type="button" id="go_mypage" class="btn_orange" value="마이페이지">
			<input type="button" id="go_main" class="btn_gray" value="메인">
		</div>
		<!-- button end -->
		
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#go_mypage").click(function() {	//마이페이지 버튼
				fn_openMypage();
	        });
	        
	        $("#go_main").click(function() {	//메인 버튼
	        	fn_main();
	        });
	    });
		
		//메인이동
		function fn_main() {
			window.location = "<c:url value='/' />";
		}
		
		//마이페이지 이동
		function fn_openMypage() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/openMypageForm.do' />");
		    comSubmit.submit();
		}
	</script>
</body>
</html>