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
		
		<!-- Start movie detail -->
		<div class="movie_wrap">
			<c:forEach var="movie" items="${list }">
				<c:if test="${movie.FILE_ORDER == '1'}">
					<div class="movieDetailMainImg">
						<img src="<c:url value='/upload/${movie.STORED_FILE_NAME }'/>">
					</div>
					<div class="movieDetailDiv">
						<div class="movieDetailTitle">
							<c:if test="${movie.GRADE == '12'}"><img src="<c:url value='/images/grade-12.png'/>"></c:if>
							<c:if test="${movie.GRADE == '15'}"><img src="<c:url value='/images/grade-15.png'/>"></c:if>
							<c:if test="${movie.GRADE == '전체'}"><img src="<c:url value='/images/grade-all.png'/>"></c:if>
							<c:if test="${movie.GRADE == '청불'}"><img src="<c:url value='/images/grade-19.png'/>"></c:if>
							&nbsp;${movie.MOVIE_NAME }
						</div>
						<div class="movieDetailEtc">
							<span><b>개봉일</b> : ${movie.PLAY_DT }</span><br>
							<span><b>감  독</b> : ${movie.DIRECTOR }</span><br>
							<span><b>출연진</b> : ${movie.ACTOR }</span><br>
							<span><b>장  르</b> : ${movie.GENRE } / ${movie.RUN_TIME }분</span>
						</div>
					</div>
					
					<div class="pointer">줄거리</div>
					<textarea class="ckeditor" id="MS_editor" name="MS_editor">${movie.CONTENTS }</textarea>
					
					<input type="hidden" id="MOVIE_NO" value="${movie.MOVIE_NO }">
					<input type="hidden" id="GUBUN" value="${movie.GUBUN }">
				
					<div class="pointer">스틸컷 / 예고편 
						<a class="youtube" href="${movie.PREVIEW_URL }" title="${movie.MOVIE_NAME } 예고편 보기">
							<img src="<c:url value='/images/video-player.png'/>">
						</a>
					</div>
				</c:if>
			</c:forEach>
			
			<!-- 스틸컷 -->
			<div class="movieDetailSubImg">
			  	<div id="carousel" class="flexslider">
				  	<ul class="slides">
					    <c:forEach var="movie" items="${list }">
					    	<c:if test="${movie.FILE_ORDER != '1'}">
								<li><img src="<c:url value='/upload/${movie.STORED_FILE_NAME }'/>"></li>
							</c:if>
						</c:forEach>
				  	</ul>
				</div>
				<div id="slider" class="flexslider">
					<ul class="slides">
					    <c:forEach var="movie" items="${list }">
					    	<c:if test="${movie.FILE_ORDER != '1'}">
								<li><img src="<c:url value='/upload/${movie.STORED_FILE_NAME }'/>"></li>
							</c:if>
						</c:forEach>
				  	</ul>
				</div>
			</div>
			
			<!-- 한줄평 -->
			<div class="comment_wrap"> 
				<div class="pointer">한줄평</div>
				<div class="comment_textCnt">0 / 200</div>
				<table class="commentFormTable">
					<colgroup>
			            <col width="20%"/>
			            <col width="*"/>
			            <col width="10%"/>
			        </colgroup>
			        <tbody>
			        	<tr>
			        		<td>
			        			<div class="starDiv">
			        				<div>
			        					<img id="image1" onmouseover="showStar('1')" onclick="markStar('1')" onmouseout="selectedCheck()" src="<c:url value='/images/empty-star.png'/>">
			        					<img id="image2" onmouseover="showStar('2')" onclick="markStar('2')" onmouseout="selectedCheck()" src="<c:url value='/images/empty-star.png'/>">
			        					<img id="image3" onmouseover="showStar('3')" onclick="markStar('3')" onmouseout="selectedCheck()" src="<c:url value='/images/empty-star.png'/>">
			        					<img id="image4" onmouseover="showStar('4')" onclick="markStar('4')" onmouseout="selectedCheck()" src="<c:url value='/images/empty-star.png'/>">
			        					<img id="image5" onmouseover="showStar('5')" onclick="markStar('5')" onmouseout="selectedCheck()" src="<c:url value='/images/empty-star.png'/>">
			        				</div>
			        				<div id="starText">평점을 입력해주세요</div>
			        				<input type="hidden" id="STAR_POINT" name="STAR_POINT">
			        			</div>
			        		</td>
			        		<td>
		        				<c:choose>
									<c:when test="${empty S_ID }">
										<textarea id="CONTENTS" name="CONTENTS" rows="3" cols="109" placeholder="로그인 후 이용가능한 서비스입니다." readonly="readonly"></textarea>
									</c:when>
									<c:otherwise>
										<textarea id="CONTENTS" name="CONTENTS" rows="3" cols="109" oninput="commentLimitSize()"></textarea>
									</c:otherwise>
								</c:choose>
			        		</td>
			        		<td>
			        			<input type="button" class="btn_comment" value="등록">
			        		</td>
			        	</tr>
			        </tbody>
				</table>
				
				<table class="commentListTable"></table>
				<div id="pageNav"></div>
			</div>
		</div>
		<!-- End movie detail -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		
		$(document).ready(function() {
			
			//이미지 슬라이더
			$('#carousel').flexslider({
			    animation: "slide",
			    controlNav: false,
			    animationLoop: false,
			    slideshow: false,
			    itemWidth: 200,
			    itemMargin: 10,
			    asNavFor: "#slider"
			});
			
			$('#slider').flexslider({
			    animation: "slide",
			    controlNav: false,
			    animationLoop: false,
			    slideshow: false,
			    sync: "#carousel"
 			});
			
			//한줄평 : 개봉 이후 가능
			if($('#GUBUN').val() == 'WILL') {	//PAST : 개봉, WILL : 개봉예정
				$('.comment_wrap').hide();
			}
			else {
				fn_selectCommentList();			//한줄평 조회
			}
		
			//예고편 보기
			$("a.youtube").YouTubePopup({ width : 930,
										  height : 530,
									      autoplay : 1, 			//1 : 자동실행, 0 : 자동실행X
									      hideTitleBar : true,		//타이틀바 숨김
										  clickOutsideClose : true	//팝업바깥 클릭시 종료
			});
			
			$(".btn_comment").click(function() {	//등록 버튼
				duplecationCheck();
			});
	    });
		
		//한줄평 중복작성 체크
		function duplecationCheck() {
			
			if(!gfn_isNull("${S_ID}")) {
				if(gfn_isNull($("#STAR_POINT").val())) {
					alert("평점을 입력해주세요.");
					return false;
				}
				if(gfn_isNull($("#CONTENTS").val())) {
					alert("한줄평을 입력해주세요.");
					$("#CONTENTS").focus();
					return false;
				}
			}
			
			var param = {
					MOVIE_NO : $("#MOVIE_NO").val(),
					CREA_ID : "${S_ID}"
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/comment/selectMyCommentCnt.do' />",
	            data : param,
	            success : function(result) {
	            	if(result.cnt == 0) {
	            		fn_insertComment();
	            	}else {
	            		alert("한줄평/평점은 한번만 작성 가능합니다.");
	            	}
	            },
	            error : function(xhr, textStatus, errMsg){
	            	if(xhr.status == 500) {
						gfn_openLoginForm();
						var url = "<c:url value='/movie/selectMovieDetail.do?MOVIE_NO=" + $("#MOVIE_NO").val() + "' />";
						$('#AFTER_LOGIN_URL').val(url);
					}
	            }
	        });
		}
		
		//한줄평 등록
		function fn_insertComment() {
			var param = {
					MOVIE_NO : $("#MOVIE_NO").val(),
					STAR_POINT : $("#STAR_POINT").val(),
					CONTENTS : $("#CONTENTS").val(),
					CREA_ID : "${S_ID}"
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/comment/insertComment.do' />",
	            data : param,
	            success : function(result) {
	            	fn_selectCommentList();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//한줄평 목록조회
		function fn_selectCommentList(pageNo) {
			var param = {
					MOVIE_NO     : $("#MOVIE_NO").val(),
					pageNo       : pageNo
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/comment/selectCommentList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$(".commentListTable").empty();

	            	if(list != null) {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<tr>";
	            			html += "<td>";
	            			html += "<div><b>" + list[i].CREA_ID + "</b>&nbsp;" + list[i].CREA_DT + "&nbsp;";
	            			
	            			for(var j=1; j<=5; j++) {
	            				if(j <= list[i].STAR_POINT / 2) {
	            					html += "<img src='${pageContext.request.contextPath}/images/fill-star.png'>";
	            				}else {
	            					html += "<img src='${pageContext.request.contextPath}/images/empty-star.png'>";
	            				}
	            			}
	            				
	            			html += "</div>";
	            			html += "<div>" + list[i].CONTENTS + "</div>";
	            			html += "</td>";
	            			html += "</tr>";
	            		}
	            	}
	            	$(".commentListTable").append(html);
	            	
	            	//페이징 처리
	            	var page = result.page;
	            	if(page != null) {
	            		var strPage = gfn_paging(page.totalCount, page.countPerPage, page.pageNavSize, page.currPage, "comment");
		            	$("#pageNav").empty().html(strPage);
	            	}
	    			
	            	//한줄평 입력 값 초기화
	            	for(var i=1; i<=5; i++) {
	    				image = $("#image"+i);
	    				image.attr("src", "<c:url value='/images/empty-star.png'/>");
	    			}
	            	$("#starText").text("평점을 입력해주세요");	            	
	            	$("#STAR_POINT").val("");
	            	$("#CONTENTS").val("");
	            	$(".comment_textCnt").text("0 / 100");
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//페이지 이동
		function goPage_comment(pageNo) {
			fn_selectCommentList(pageNo);
		}
		
		//글자수 제한
		function commentLimitSize() {
			
			var textLen = $("#CONTENTS").val().length; 
			$(".comment_textCnt").text(textLen + " / 100");
			
			if(textLen > 100) {
				alert("입력 가능한 글자수를 초과하였습니다.");
				var comment = $("#CONTENTS").val();
				$("#CONTENTS").val(comment.substr(0, 100));
				$(".comment_textCnt").text("100 / 100");
			}
		}
		
		//별 아이콘 : 마우스 오버
		function showStar(starIdx) {
			var image, starText;
			
			for(var i=1; i<=5; i++) {
				image = $("#image"+i);
				image.attr("src", "<c:url value='/images/empty-star.png'/>");
			}
			
			for(var i=1; i<=starIdx; i++) {
				image = $("#image"+i);
				image.attr("src", "<c:url value='/images/fill-star.png'/>");
			}
			
			switch(starIdx) {
				case '1':
					starText = "괜히봤어요";
					break;
				case '2':
					starText = "기대하진 말아요";
					break;
				case '3':
					starText = "무난했어요";
					break;
				case '4':
					starText = "기대해도 좋아요!";
					break;
				case '5':
					starText = "너무 멋진 영화였어요!";
					break;
			}
			$("#starText").text(starText);
		}
		
		//별 아이콘 : 마우스 클릭
		function markStar(starPoint) {
			$("#STAR_POINT").val(starPoint * 2);
		}
		
		//별 아이콘 : 마우스 아웃
		function selectedCheck() {
			
			var starPoint = $("#STAR_POINT").val();
			
			if(gfn_isNull(starPoint)) {
				for(var i=1; i<=5; i++) {
					var image = $("#image"+i);
					image.attr("src", "<c:url value='/images/empty-star.png'/>");
				}
				$("#starText").text("평점을 입력해주세요");
			}
			else {
				var sp = starPoint / 2;
				sp = sp.toString();
				showStar(sp);
			}
		}
		
		//에디터 설정
		CKEDITOR.replace( 'MS_editor', {
			height : 250,
			readOnly: true, 
			removePlugins: 'elementspath',
			toolbarCanCollapse : true,
			toolbarStartupExpanded: false,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
		  	]
	    });
	</script>	
</body>
</html>