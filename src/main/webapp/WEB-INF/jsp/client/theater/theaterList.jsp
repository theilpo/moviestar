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
	
		<div class="title">영화관</div>
		<div class="explain">내집 같은 편안함, 만남과 소통의 즐거움이 가득한 공간</div>
		<div class="etc">&nbsp;</div>
		
		<hr style="clear: right;">
		
		<!-- Start theater list -->
		<div class="theater_wrap">
			
			<img class="theater_bg" src="<c:url value='/images/theater_background.jpg' />">
				
			<ul class="theater_tab">
				<li data-tab="theater_tab1" class="current"><a href="#">서울</a></li>
				<li data-tab="theater_tab2"><a href="#">경기</a></li>
				<li data-tab="theater_tab3"><a href="#">인천</a></li>
				<li data-tab="theater_tab4"><a href="#">대전/충청/세종</a></li>
				<li data-tab="theater_tab5"><a href="#">부산/대구/경상</a></li>
				<li data-tab="theater_tab6"><a href="#">광주/전라</a></li>
				<li data-tab="theater_tab7"><a href="#">강원</a></li>
				<li data-tab="theater_tab8"><a href="#">제주</a></li>
			</ul>
			
			<!-- 서울 -->
			<div id="theater_tab1" class="theater_tabcontent current">
				<c:forEach var="theater" items="${list }">
					<div class="theaterDiv" title="${theater.THEATER_NAME } 상세보기">
						<img src="<c:url value='/upload/${theater.STORED_FILE_NAME }'/>">
						<div class="theaterName">${theater.THEATER_NAME }</div>
						<input type="hidden" id="THEATER_NO" name="THEATER_NO" value="${theater.THEATER_NO }">
					</div>
				</c:forEach>
			</div>
			
			<!-- 경기 -->
			<div id="theater_tab2" class="theater_tabcontent"></div>
			
			<!-- 인천 -->
			<div id="theater_tab3" class="theater_tabcontent"></div>
			
			<!-- 대전/충청/세종 -->
			<div id="theater_tab4" class="theater_tabcontent"></div>
			
			<!-- 부산/대구/경상 -->
			<div id="theater_tab5" class="theater_tabcontent"></div>
			
			<!-- 광주/전라 -->
			<div id="theater_tab6" class="theater_tabcontent"></div>
			
			<!-- 강원 -->
			<div id="theater_tab7" class="theater_tabcontent"></div>
			
			<!-- 제주 -->
			<div id="theater_tab8" class="theater_tabcontent"></div>
		</div>
		<!-- End theater list -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			//TAP 기능
			$('ul.theater_tab li').click(function(e) {
				
				e.preventDefault();
				
				var activeTab = $(this).attr('data-tab');
				$('ul.theater_tab li').removeClass('current');
				$('.theater_tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
				
				if(activeTab == 'theater_tab1') {		//서울
					fn_getTheaterList("서울", activeTab);
				}
				else if(activeTab == 'theater_tab2') {	//경기
					fn_getTheaterList("경기", activeTab);
				}
				else if(activeTab == 'theater_tab3') {	//인천
					fn_getTheaterList("인천", activeTab);
				}
				else if(activeTab == 'theater_tab4') {	//대전/충청/세종
					fn_getTheaterList("대전/충청/세종", activeTab);
				}
				else if(activeTab == 'theater_tab5') {	//부산/대구/경상
					fn_getTheaterList("부산/대구/경상", activeTab);
				}
				else if(activeTab == 'theater_tab6') {	//광주/전라
					fn_getTheaterList("광주/전라", activeTab);
				}
				else if(activeTab == 'theater_tab7') {	//강원
					fn_getTheaterList("강원", activeTab);
				}
				else if(activeTab == 'theater_tab8') {	//제주
					fn_getTheaterList("제주", activeTab);
				}
			});
			
	    });
		
		//지역별 영화관 목록조회
		function fn_getTheaterList(region, activeTab) {
			var param = {
					REGION : region	
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/theater/selectTheaterList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("#" + activeTab).empty();
	            	
	            	if(list.length > 0) {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<div class='theaterDiv' title='" + list[i].THEATER_NAME + " 상세보기'>";
	            			html += "<img src='${pageContext.request.contextPath}/upload/" + list[i].STORED_FILE_NAME + "'>";
	            			html += "<div class='theaterName'>" + list[i].THEATER_NAME + "</div>";
	            			html += "<input type='hidden' id='THEATER_NO' name='THEATER_NO' value='" + list[i].THEATER_NO + "'>";
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
		
		//영화관 상세보기
		$(document).on('click', '.theaterDiv', function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/theater/selectTheaterDetail.do' />");
			comSubmit.addParam("THEATER_NO", $(this).find("#THEATER_NO").val());
			comSubmit.submit();
		});
	</script>	
</body>
</html>