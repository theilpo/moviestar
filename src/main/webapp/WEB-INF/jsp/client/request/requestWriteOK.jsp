<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">고객센터</div>
		<div class="explain">최대한 빠른 시간 안에 답변 드리겠습니다.</div>
		<div class="etc"><span class="essential">* </span>문의주신 내용은 <b>마이페이지 - 나의 문의내역</b>에서 확인가능합니다.</div>
		
		<hr style="clear: right;">
		
		<div class="write_ok_msg">
			<div>문의 접수가 완료되었습니다.</div>
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
				fn_openMypageForm();
	        });
	        
	        $("#go_main").click(function() {	//메인 버튼
	        	fn_main();
	        });
	    });
		
		//마이페이지 화면 이동
		function fn_openMypageForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/openMypageForm.do' />");
		    comSubmit.submit();
		}
		
		//메인이동
		function fn_main() {
			window.location = "<c:url value='/' />";
		}
	</script>
</body>
</html>