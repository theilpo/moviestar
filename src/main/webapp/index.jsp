<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" href="<c:url value='/css/client-style.css'/>">
<link rel="stylesheet" href="<c:url value='/css/flexslider.css'/>">

<!-- javascript -->
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/jquery.flexslider.js'/>"></script>
<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>

<title>Movie Star</title>
</head>
<body>
	
	<!-- Start Header  -->
	<div class="top_menu_wrap">
		<div class="top_menu">
			<c:choose>
				<c:when test="${empty S_ID }">
					<a id="login">로그인</a>&nbsp;
					<a id="join">회원가입</a>
				</c:when>
				<c:otherwise>
					<a id="logout">로그아웃</a>&nbsp;
					<a id="my">마이페이지</a>
				</c:otherwise>
			</c:choose>	
		</div>	
	</div>
	
	<header>
		<div class="menu_logo">
			<a href="#"><img src="<c:url value='/images/logo.png'/>"></a>
		</div>
		<div class="menu_wrap">
			<ul class="menu_list">		
				<li><a id="book" href="#">예매</a></li>
				<li><a id="movie" href="#">영화</a></li>
				<li><a id="theater" href="#">영화관</a></li>
				<li><a id="event" href="#">이벤트</a></li>
				<li><a id="notice" href="#">공지사항</a></li>
				<li><a id="request" href="#">고객센터</a></li>
			</ul>
		</div>
	</header>
	<!-- End Header -->
	
	
	<!-- Start Main Slider  -->
	<div class="flexslider">
		<ul class="slides">
			<li><img src="<c:url value='/images/main_visual_1.jpg'/>" />
				<div class="flex-caption">택시운전사<br>─────────────────────<br>송강호 / 유해진 / 류준열이 그리는 1980년 5월의 광주</div></li>
			<li><img src="<c:url value='/images/main_visual_2.jpg'/>" />
				<div class="flex-caption">슈퍼배드3<br>─────────────────────<br>악당을 악당답게!</div></li>
			<li><img src="<c:url value='/images/main_visual_3.jpg'/>" />
				<div class="flex-caption">군함도<br>─────────────────────<br>1945년, 지옥섬 군함도! 그곳에 조선인들이 있었다</div></li>
			<li><img src="<c:url value='/images/main_visual_4.jpg'/>" />
				<div class="flex-caption">캐리비안의 해적: 죽은 자는 말이 없다<br>─────────────────────<br>지상 최고의 액션 어드벤처가 온다</div></li>
			<li><img src="<c:url value='/images/main_visual_5.jpg'/>" />
				<div class="flex-caption">대립군<br>─────────────────────<br>1592년 임진왜란, 왕이 나라를 버렸다!</div></li>
		</ul>
	</div>
	<!-- End Main Slider -->
	
	
	<!-- Start Movie Info -->
	<div class="movie_info_wrap">
			
		<ul class="main_tab">
			<li data-tab="main_tab1"><a href="#"><img src="<c:url value='/images/gray_newest_movie.png'/>"></a></li>
			<li data-tab="main_tab2"><a href="#"><img src="<c:url value='/images/basic_schedule_movie.png'/>"></a></li>
		</ul>
		
		<div id="main_tab1" class="main_tabcontent current"></div>
		<div id="main_tab2" class="main_tabcontent"></div>
	</div>
	<!-- End Movie Info -->
	
	
	<!-- Start Community -->
	<div class="pointer">커뮤니티</div>
	<div class="community_info_wrap">
		<div class="community_notice_wrap">
			<span class="community_title">공지사항</span>
			<span class="community_more"><a href="#">more</a></span>
			<table class="community_notice_table">
				<thead>
					<tr>
						<th width="*"></th>
						<th width="20%"></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div class="community_event_wrap">
			<span class="community_title">이벤트</span>
			<span class="community_more"><a href="#">more</a></span>
			<table class="community_event_table">
				<thead>
					<tr>
						<th width="*"></th>
						<th width="40%"></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>		
	</div>
	<!-- End Event Info -->
	
	
	<!-- Start Footer -->
	<footer>
		<div class="footer_wrap">
			<div class="footer_link">
				회사소개 | 채용정보 | 이용약관 | 개인정보 처리방침 | 이메일무단수집거부<br><br>
				MOVIESTAR, 2017, Son Byeong Yeon<br/>
				상업용이 아닌 포트폴리오 입니다.
			</div>
			<div class="footer_sns">
				<ul>
					<li><img src="<c:url value='/images/footer_twitter.png'/>"></li>
					<li><img src="<c:url value='/images/footer_facebook.png'/>"></li>
					<li><img src="<c:url value='/images/footer_instagram.png'/>"></li>
				</ul><br><br><br>
				<div class="footer_copy">
					COPYRIGHTⓒ 메가박스 롯데시네마 CGV. All RIGHTS RESERVED
				</div>
			</div>
			
		</div>		
	</footer>
	<!-- End Footer -->
	
	<!-- commonForm -->
	<form name="commonForm" id="commonForm"></form>
	
	<!-- loginForm -->
	<div class="login_wrap">
	 
	    <div class="mask"></div>
	    
	    <div class="window">
			<div class="login_close"><a href="#"><img src="<c:url value='/images/close.png'/>"></a></div>
			<div class="login_logo"><img src="<c:url value='/images/logo.png'/>"></div>
			
			<div class="login_input">
				<input type="text" id="ID" name="ID" maxlength="12" size="35" placeholder="ID"><br>
				<input type="password" id="PASSWORD" name="PASSWORD" size="35" placeholder="Password">
			</div>
			
			<div class="btn_wrap">
				<input type="button" id="real_login" class="btn_orange" value="로그인">
			</div>
	    </div>
	</div>
	
	<!-- TOP -->
	<a class="top" href="#"><img src="<c:url value='/images/back_to_top.png'/>"></a>
	
	<!-- ADMIN -->
	<c:if test="${S_MEM_GB == 'A'}">
		<a class="admin" href="#"><img src="<c:url value='/images/settings.png'/>"></a>
	</c:if>
	
	<!-- hidden -->
	<input type="hidden" id="AFTER_LOGIN_URL" name="AFTER_LOGIN_URL"> <!-- 로그인 후 호출할 URL -->
	
	<!-- javascript -->
	<script type="text/javascript">
		
		$(document).ready(function() {
			
			//영화 이미지 슬라이더
			$('.flexslider').flexslider({
				animation : "slide"			
			});
			
			fn_getMovieList("NEWEST", "main_tab1");	//최신개봉작 조회
			fn_getLatestNoticeList();			 	//최신 공지 조회
			fn_getLatestEventList();			 	//최신 이벤트 조회
			
			//영화정보 TAP 기능
			$('ul.main_tab li').click(function(e) {
				
				e.preventDefault();
				
				//탭 변경 시 이미지 수정 
				var idx = $(this).index();
						
				if(idx == 0) {
					$("ul.main_tab li:eq(0) img").attr("src", "<c:url value='/images/gray_newest_movie.png'/>");
					$("ul.main_tab li:eq(1) img").attr("src", "<c:url value='/images/basic_schedule_movie.png'/>");
				} else if(idx == 1) {
					$("ul.main_tab li:eq(0) img").attr("src", "<c:url value='/images/basic_newest_movie.png'/>");
					$("ul.main_tab li:eq(1) img").attr("src", "<c:url value='/images/gray_schedule_movie.png'/>");
				}
				
				//클릭 한 탭 내용 보여주기
				var activeTab = $(this).attr('data-tab');
				$('.main_tabcontent').removeClass('current');
				$('#' + activeTab).addClass('current');
				
				if(activeTab == 'main_tab1') {			//최신개봉작
					fn_getMovieList("NEWEST", activeTab);
				}
				else if(activeTab == 'main_tab2') {		//상영예정작
					fn_getMovieList("WILL", activeTab);
				}
			});
			
			//메인로고 버튼
			$('.menu_logo img').click(function(e) {
				e.preventDefault();
				fn_openMainForm();
			});
			
			//회원가입 버튼
			$("#join").click(function(e) {
				e.preventDefault();
				fn_openMemberForm();
			});
			
			//LOGIN 버튼(팝업열기)
			$("#login").click(function(e) {
				e.preventDefault();
				gfn_openLoginForm();
			});
	        
			//로그인 닫기 버튼
	        $('.login_close').click(function(e) {
	        	e.preventDefault();
	            $('.mask, .window').hide();
	        });
			
			//로그인 버튼
			$("#real_login").click(function(e) {
				e.preventDefault();
				fn_login();
			});
			
			//LOGOUT 버튼
			$('#logout').click(function(e) {
				e.preventDefault();
				fn_logout();
			});
			
			//MY 버튼
			$('#my').click(function(e) {
				e.preventDefault();
				fn_openMypage();
			});
			
			//TOP 버튼
			$('.top').click(function() {
				$('html, body').animate({scrollTop:0}, 'slow');
				return false;
			});
			
			//관리자 버튼
			$('.admin').click(function(e) {
				e.preventDefault();
				fn_openAdminForm();
			});
			
			//예매 버튼
			$("#book").click(function(e) {
				e.preventDefault();
				fn_openBookForm();
			});
			
			//영화 버튼
			$("#movie").click(function(e) {
				e.preventDefault();
				fn_openMovieList();
			});
			
			//영화관 버튼
			$("#theater").click(function(e) {
				e.preventDefault();
				fn_openTheaterList();
			});
			
			//이벤트 버튼
			$("#event").click(function(e) {
				e.preventDefault();
				fn_openEventList();
			});
			
			//공지사항 버튼
			$("#notice").click(function(e) {
				e.preventDefault();
				fn_openNoticeList();
			});
			
			//고객센터 버튼
			$("#request").click(function(e) {
				e.preventDefault();
				fn_openRequestForm();
			});
			
			//공지사항 more 버튼
			$(".community_notice_wrap .community_more a").click(function(e) {
				e.preventDefault();
				fn_openNoticeList();
			});
			
			//이벤트 more 버튼
			$(".community_event_wrap .community_more a").click(function(e) {
				e.preventDefault();
				fn_openEventList();
			});
			
			//비밀번호 엔터시 로그인
			$(".window #PASSWORD").keydown(function(e) {
				if(e.keyCode == 13) {
					fn_login();
				}
			});
		});	
		
		//로그인 팝업 - 창크기의 가운데 정렬
		$(window).resize(function() {
			gfn_resize();
		});
		
		//메인화면 이동
		function fn_openMainForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/' />");
		    comSubmit.submit();
		}
		
		//회원가입 화면 이동
		function fn_openMemberForm() {
		    var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/member/openMemberForm.do' />");
		    comSubmit.submit();
		}
		
		//로그인
		function fn_login() {
			
			if(gfn_isNull($(".window #ID").val())) {
				alert("아이디를 입력해주세요.");
				$(".window #ID").focus();
				return false;
			}
			if(gfn_isNull($(".window #PASSWORD").val())) {
				alert("비밀번호를 입력해주세요.");
				$(".window #PASSWORD").focus();
				return false;
			}
			
		    var param = {
		    		ID : $('.window #ID').val(),
		    		PASSWORD : $('.window #PASSWORD').val()
		    };
		    
		    $.ajax({
	            type : "POST",
	            url : "<c:url value='/common/login.do' />",
	            data : param,
	            success : function(result){
	            	//CODE : 0 (정상), 1 (패스워드틀림), 2(없는계정)
	               	if(result.CODE == 0) {
	               		window.location = $('#AFTER_LOGIN_URL').val();
	               	}
	               	else if(result.CODE == 1) {
	               		alert("비밀번호를 다시 확인하세요.");
	               		$(".window #PASSWORD").val("").focus();
	               	}
	               	else if(result.CODE == 2) {
	               		alert("아이디를 다시 확인하세요.");
	               		$(".window #ID").val("").focus();
	               		$(".window #PASSWORD").val("");
	               	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
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
		
		//마이페이지 이동
		function fn_openMypage() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/openMypageForm.do' />");
		    comSubmit.submit();
		}
		
		//관리자화면 이동
		function fn_openAdminForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.submit();
		}
		
		//예매 화면 이동
		function fn_openBookForm() {
			var url = "<c:url value='/book/openBookForm.do' />";
			
			$.ajax({
				type : "POST",
				url : url,
				success : function(result) {
					var comSubmit = new ComSubmit();
				    comSubmit.setUrl(url);
				    comSubmit.submit();
				},
				error : function(xhr, textStatus, errMsg){
					if(xhr.status == 500) {
						gfn_openLoginForm();
						$('#AFTER_LOGIN_URL').val(url);
					}
				}
			});
		}
		
		//영화 목록 조회
		function fn_openMovieList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/movie/openMovieList.do' />");
		    comSubmit.addParam("CODE", "NEWEST");
		    comSubmit.submit();
		}
		
		//영화관 목록 조회
		function fn_openTheaterList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/theater/openTheaterList.do' />");
		    comSubmit.submit();
		}
		
		//이벤트 목록 조회
		function fn_openEventList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/event/selectEventList.do' />");
		    comSubmit.submit();
		}
		
		//공지사항 목록 조회
		function fn_openNoticeList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/notice/selectNoticeList.do' />");
		    comSubmit.submit();
		}
		
		//고객센터 이동
		function fn_openRequestForm() {
			var url = "<c:url value='/request/openRequestForm.do' />";
			
			$.ajax({
				type : "POST",
				url : url,
				success : function(result) {
					var comSubmit = new ComSubmit();
				    comSubmit.setUrl(url);
				    comSubmit.submit();
				},
				error : function(xhr, textStatus, errMsg){
					if(xhr.status == 500) {
						gfn_openLoginForm();
						$('#AFTER_LOGIN_URL').val(url);
					}
				}
			});
		}
		
		//최신개봉작, 상영예정작 목록조회
		function fn_getMovieList(code, activeTab) {
			
			var param = {
					CODE : code	
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/common/selectMovieList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("#" + activeTab).empty();
	            	
	            	if(list.length > 0) {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<div class='movieDiv' title='" + list[i].MOVIE_NAME + " 상세보기'>";
	            			html += "<img src='${pageContext.request.contextPath}/upload/" + list[i].STORED_FILE_NAME + "'>";
	            			
	            			if(code == 'NEWEST') 	html += "<div class='movieRankDday'>" + list[i].RNUM + "</div>";
	            			if(code == 'WILL')		html += "<div class='movieRankDday'>D-" + list[i].DDAY + "</div>";
	            				
	            			html += "<div class='movieTitle'>";
	            			if(list[i].GRADE == '12')	html += "<img src='${pageContext.request.contextPath}/images/grade-12.png'>";
	            			if(list[i].GRADE == '15')	html += "<img src='${pageContext.request.contextPath}/images/grade-15.png'>";
	            			if(list[i].GRADE == '전체')	html += "<img src='${pageContext.request.contextPath}/images/grade-all.png'>";
	            			if(list[i].GRADE == '청불')	html += "<img src='${pageContext.request.contextPath}/images/grade-19.png'>";
	            			html += "&nbsp;" + list[i].MOVIE_NAME;
	            			html += "</div>";
	            			
	            			html += "<div class='movieAvgPoint'>";
	            			if(code == 'NEWEST')	html += "관람평점 " + list[i].AVG_STAR_POINT;
	            			if(code == 'WILL')		html += list[i].PLAY_DT + " 개봉";
	            			html += "</div>";
	            			
	            			html += "<input type='hidden' id='MOVIE_NO' name='MOVIE_NO' value='" + list[i].MOVIE_NO + "'>";
	            			html += "</div>";
		            	}
	            	}
	            	$("#" + activeTab).append(html);
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//영화 상세보기
		$(document).on('click', '.movieDiv', function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/movie/selectMovieDetail.do'/>");
			comSubmit.addParam("MOVIE_NO", $(this).find("#MOVIE_NO").val());
			comSubmit.submit();
		});
		
		//최신공지 조회
		function fn_getLatestNoticeList() {			
		    $.ajax({
	            type : "POST",
	            url : "<c:url value='/common/selectLatestNoticeList.do' />",
	            success : function(result){
	            	var list = result.list;
	            	var html = "";
	            	
					$(".community_notice_table tbody").empty();
	            				
	            	if(list.length > 0) {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<tr>";
	            			html += "<td>";
	            			html += "<a href='#'>" + list[i].TITLE + "</a>";
	            			html += "<input type='hidden' value='" + list[i].IDX + "'>";
	            			html += "</td>";
	            			html += "<td style='float:right'>" + list[i].CREA_DTM + "</td>";	            			
	            			html += "</tr>";
		            	}
	            	}
	            	$(".community_notice_table tbody").append(html);
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//최신공지 상세조회
		$(document).on('click', '.community_notice_table tbody a', function(e) {
			e.preventDefault();
			
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/notice/selectNoticeDetail.do' />");
		    comSubmit.addParam("IDX", $(this).next().val());
		    comSubmit.addParam("HIT_GB", "C");
		    comSubmit.submit();
		});
		
		//최신이벤트 조회
		function fn_getLatestEventList() {			
		    $.ajax({
	            type : "POST",
	            url : "<c:url value='/common/selectLatestEventList.do' />",
	            success : function(result){
	            	var list = result.list;
	            	var html = "";
	            	
					$(".community_event_table tbody").empty();
	            				
	            	if(list.length > 0) {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<tr>";
	            			html += "<td>"; 
	            			html += "<a href='#'>" + list[i].TITLE + "</a>";
	            			html += "<input type='hidden' value='" + list[i].IDX + "'>";
	            			html += "</td>";
	            			html += "<td style='float:right'>" + list[i].START_DT + " ~ " + list[i].END_DT + "</td>";
	            			html += "</tr>";
		            	}
	            	}
	            	$(".community_event_table tbody").append(html);
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//최신이벤트 상세조회
		$(document).on('click', '.community_event_table tbody a', function(e) {
			e.preventDefault();
			
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/event/selectEventDetail.do' />");
		    comSubmit.addParam("IDX", $(this).next().val());
		    comSubmit.submit();
		});
	</script>
</body>
</html>