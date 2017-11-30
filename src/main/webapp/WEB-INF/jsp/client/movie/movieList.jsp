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
	
		<div class="title">무비차트</div>
		<div class="explain">소중한 사람과 다양한 최신영화를 만나보세요.</div>
		<div class="etc">&nbsp;</div>
		
		<hr style="clear: right;">
		
		<!-- Start Movie -->
		<div class="movie_wrap">
			<ul class="movie_tab">
				<li data-tab="movie_tab1"><a href="#"><img src="<c:url value='/images/gray_newest_movie.png'/>"></a></li>
				<li data-tab="movie_tab2"><a href="#"><img src="<c:url value='/images/basic_schedule_movie.png'/>"></a></li>
			</ul>

			<!-- 최신개봉작 -->
			<div id="movie_tab1" class="movie_tabcontent current">
				<c:forEach var="movie" items="${list }" varStatus="s">
					<div class="movieDiv" title="${movie.MOVIE_NAME } 상세보기">
						<img src="<c:url value='/upload/${movie.STORED_FILE_NAME }'/>">
						<c:if test="${s.index < 5 }">
							<div class="movieRankDday">${movie.RNUM }</div>
						</c:if>
						<div class="movieTitle">
							<c:if test="${movie.GRADE == '12'}"><img src="<c:url value='/images/grade-12.png'/>"></c:if>
							<c:if test="${movie.GRADE == '15'}"><img src="<c:url value='/images/grade-15.png'/>"></c:if>
							<c:if test="${movie.GRADE == '전체'}"><img src="<c:url value='/images/grade-all.png'/>"></c:if>
							<c:if test="${movie.GRADE == '청불'}"><img src="<c:url value='/images/grade-19.png'/>"></c:if>
							&nbsp;${movie.MOVIE_NAME }
						</div>
						<div class="movieAvgPoint">관람평점 ${movie.AVG_STAR_POINT }</div>
						<input type="hidden" id="MOVIE_NO" name="MOVIE_NO" value="${movie.MOVIE_NO }">
					</div>
				</c:forEach>
			</div>
		
			<!-- 상영예정작 -->
			<div id="movie_tab2" class="movie_tabcontent"></div>
		</div>
		<!-- End Movie -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			//TAP 기능
			$('ul.movie_tab li').click(function(e) {
				
				e.preventDefault();
				
				//탭 변경 시 이미지 수정 
				var idx = $(this).index();
						
				if(idx == 0) {
					$("ul.movie_tab li:eq(0) img").attr("src", "<c:url value='/images/gray_newest_movie.png'/>");
					$("ul.movie_tab li:eq(1) img").attr("src", "<c:url value='/images/basic_schedule_movie.png'/>");
				} else if(idx == 1) {
					$("ul.movie_tab li:eq(0) img").attr("src", "<c:url value='/images/basic_newest_movie.png'/>");
					$("ul.movie_tab li:eq(1) img").attr("src", "<c:url value='/images/gray_schedule_movie.png'/>");
				}
				
				//클릭 한 탭 내용 보여주기
				var activeTab = $(this).attr('data-tab');
				$('.movie_tabcontent').removeClass('current');
				$('#' + activeTab).addClass('current');
				
				if(activeTab == 'movie_tab1') {			//최신개봉작
					fn_getMovieList("NEWEST", activeTab);
				}
				else if(activeTab == 'movie_tab2') {	//상영예정작
					fn_getMovieList("WILL", activeTab);
				}
			});
	    });
		
		//최신개봉작, 상영예정작 목록조회
		function fn_getMovieList(code, activeTab) {
			
			var param = {
					CODE : code	
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/movie/selectMovieList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("#" + activeTab).empty();
	            	
	            	if(list.length > 0) {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<div class='movieDiv' title='" + list[i].MOVIE_NAME + " 상세보기'>";
	            			html += "<img src='${pageContext.request.contextPath}/upload/" + list[i].STORED_FILE_NAME + "'>";
	            			
	            			if(code == 'NEWEST') {
	            				if(i < 5)		html += "<div class='movieRankDday'>" + list[i].RNUM + "</div>";
	            			}
	            			if(code == 'WILL')	html += "<div class='movieRankDday'>D-" + list[i].DDAY + "</div>";
	            			
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
	</script>	
</body>
</html>