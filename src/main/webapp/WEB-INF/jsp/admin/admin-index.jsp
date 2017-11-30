<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" href="<c:url value='/css/admin-style.css'/>" >
<link rel="stylesheet" href="<c:url value='/css/accordionmenu.css'/>" >
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.css'/>" >
<link rel="stylesheet" href="<c:url value='/css/selectivity-jquery.css'/>" >

<!-- javascript -->
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script> 
<script src="<c:url value='/js/jquery.min.js'/>" ></script>
<script src="<c:url value='/js/jquery-ui.js'/>" ></script>
<script src="<c:url value='/js/selectivity-jquery.js'/>" ></script>
<script src="<c:url value='/ckeditor/ckeditor.js'/>" ></script>

</head>
<body>
	<div class="wrapper">
		
		<!-- Header start -->
		<header>
			<ul>
		     	<li><a id="home" href="#">HOME</a></li>
		        <li><a href="#">메뉴</a>
				    <ul>
		               <li><a id="my" href="#">마이페이지</a></li>
					   <li><a id="logout" href="#">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</header>
		<!-- Header end -->
		
		
	    <div class="container">
	    	
	    	<!-- Navigator start -->
			<nav class="navigator">
				
				<ul class="accordion">
					<li>
						<a href="#">회원관리</a>
		
						<ul class="sub-menu">
							<li><a class="member" href="#"><em>01</em>회원목록</a></li>
						</ul>
					</li>
					
					<li>
						<a href="#">고객센터</a>
		
						<ul class="sub-menu">
							<li><a class="request" href="#"><em>01</em>문의내역 목록</a></li>
						</ul>
					</li>
					
					<li>
						<a href="#">영화관리</a>
		
						<ul class="sub-menu">
							<li><a class="reg_movie" href="#"><em>01</em>영화 등록</a></li>
							<li><a class="reg_theater" href="#"><em>02</em>영화관 등록</a></li>
							<li><a class="reg_hall" href="#"><em>03</em>상영관 등록</a></li>
							<li><a class="reg_time" href="#"><em>04</em>상영시간 등록</a></li>
						</ul>
					</li>
					
					<li>
						<a href="#">이벤트</a>
		
						<ul class="sub-menu">
							<li><a class="reg_event" href="#"><em>01</em>이벤트 등록</a></li>
						</ul>
					</li>
					
					<li>
						<a href="#">공지사항</a>
		
						<ul class="sub-menu">
							<li><a class="list_notice" href="#"><em>01</em>공지사항 목록</a></li>
							<li><a class="reg_notice" href="#"><em>02</em>공지사항 등록</a></li>
						</ul>
					</li>
				</ul>
			</nav>
	        <!-- Navigator end -->
	        
	        <!-- Contents start -->
	        <div class="content">
	        	<jsp:include page="${contentPage }" flush="false">
	        		<jsp:param name="list" value="${list }" />
	        	</jsp:include>
	        </div>
	        <!-- Contents end -->
	    </div>
	    
	</div>
	
	<!-- commonForm -->
	<form name="commonForm" id="commonForm"></form>
	
	<!-- java script -->
	<script type="text/javascript">
		$(document).ready(function() {
		  	
			var accordion_head = $('.accordion > li > a');
			var	accordion_body = $('.accordion li > .sub-menu');
			
			//클릭한 메뉴 펼침
			accordion_head.eq('${menuIdx}').addClass('active').next().slideDown('normal');
			
			accordion_head.on('click', function(e) {	//왼쪽메뉴 드랍다운
				e.preventDefault();

				if ($(this).attr('class') != 'active'){
					accordion_body.slideUp('normal');
					$(this).next().stop(true,true).slideToggle('normal');
					accordion_head.removeClass('active');
					$(this).addClass('active');
				}
			});
			
			/******************************  메뉴 분기 start  *******************************/
			
			$(".member").click(function(e) {		//회원관리
				e.preventDefault();
				fn_openAdminForm("HR");
			});
			
			$(".request").click(function(e) {		//1:1 문의 목록	
				e.preventDefault();
				fn_openAdminForm("RL");
			});
			
			$(".reg_movie").click(function(e) {		//영화 등록
				e.preventDefault();
				fn_openAdminForm("MI");
			});
			
			$(".reg_theater").click(function(e) {	//영화관 등록
				e.preventDefault();
				fn_openAdminForm("TI");
			});
			
			$(".reg_hall").click(function(e) {		//상영관 등록
				e.preventDefault();
				fn_openAdminForm("HI");
			});
			
			$(".reg_time").click(function(e) {		//상영시간 등록
				e.preventDefault();
				fn_openAdminForm("VTI");
			});
			
			$(".reg_event").click(function(e) {		//이벤트 등록
				e.preventDefault();
				fn_openAdminForm("EI");
			});
			
			$(".list_notice").click(function(e) {	//공지사항 목록
				e.preventDefault();
				fn_openAdminForm("NL");
			});
			
			$(".reg_notice").click(function(e) {	//공지사항 등록
				e.preventDefault();
				fn_openAdminForm("NI");
			});
			/******************************  메뉴 분기 end  *******************************/
			
			
			$("#home").click(function(e) {	//HOME 버튼
				e.preventDefault();
				fn_openMainForm();
			});
			
			$("#my").click(function(e) {	//메뉴 버튼
				e.preventDefault();
				fn_openMypage();
			});
			
			$("#logout").click(function(e) {	//로그아웃 버튼
				e.preventDefault();
				fn_logout();
			});
		});

		//관리자화면 메뉴 분기
		function fn_openAdminForm(MENU_GB) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", MENU_GB);
		    comSubmit.submit();
		}
		
		//메인화면 이동
		function fn_openMainForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/' />");
		    comSubmit.submit();
		}
		
		//마이페이지 이동
		function fn_openMypage() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/openMypageForm.do' />");
		    comSubmit.submit();
		}
		
		//로그아웃
		function fn_logout() {
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/common/logout.do' />",
	            success : function(result){
	            	window.location = "<c:url value='/' />";
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
	</script>
</body>
</html>