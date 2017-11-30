<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">회원가입완료</div>
		<div class="explain">'MOVIESTAR'에 오신걸 환영합니다.</div>
		<div class="etc">&nbsp;</div>
		
		<hr style="clear: right;">
		
		<div class="write_ok_msg">
			<div>포인트 1000점이 적립되었습니다.</div>
			<div>감사합니다.</div>
		</div>
		
		<!-- button start -->
		<div class="btn_wrap">
			<input type="button" id="go_login" class="btn_orange" value="로그인">
			<input type="button" id="go_main" class="btn_gray" value="메인">
		</div>
		<!-- button end -->
		
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#go_login").click(function(e) {	//로그인 버튼
				e.preventDefault();
				gfn_openLoginForm();
	        });
	        
	        $("#go_main").click(function() {	//메인 버튼
	        	fn_main();
	        });
	    });
		
		//메인이동
		function fn_main() {
			window.location = "<c:url value='/' />";
		}
	</script>
</body>
</html>