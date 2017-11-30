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
		
		<div class="title">영화예매</div>
		<div class="explain">보고싶은 영화를 선택해주세요.</div>
		<div class="etc"><span class="essential">* </span>영화 > 좌석 > 결제 3단계로 이루어져 있습니다.</div>
		
		<hr style="clear: right;">
		
		<div class="book_time_wrap">
			<ul class="book_time_tab">
				<li data-tab="book_time_tab1" class="current"><a href="#">예매하기</a></li>
				<li data-tab="book_time_tab2"><a href="#">상영시간표</a></li>
			</ul>
		</div>
		
		<!-- '예매하기' tab start -->
		<div id="book_time_tab1" class="book_time_tabcontent current">
			
			<!-- 날짜 -->
			<input type="text" id="BOOK_SHOW_DT" name="BOOK_SHOW_DT" size="30">
			
			<div class="bookDiv1">
			
				<!-- 영화관 -->
				<div class="bookDiv1_theater">
					<div class="sub_title">영화관</div>
					
					<ul class="book_theater_tab">
						<li data-tab="book_theater_tab1" class="current"><a href="#">서울</a></li>
						<li data-tab="book_theater_tab2"><a href="#">경기</a></li>
						<li data-tab="book_theater_tab3"><a href="#">인천</a></li>
						<li data-tab="book_theater_tab4"><a href="#">대전/충청/세종</a></li>
						<li data-tab="book_theater_tab5"><a href="#">부산/대구/경상</a></li>
						<li data-tab="book_theater_tab6"><a href="#">광주/전라</a></li>
						<li data-tab="book_theater_tab7"><a href="#">강원</a></li>
						<li data-tab="book_theater_tab8"><a href="#">제주</a></li>
					</ul>
					
					<div id="book_theater_tab1" class="book_theater_tabcontent current"></div>	<!-- 서울 -->
					<div id="book_theater_tab2" class="book_theater_tabcontent"></div>			<!-- 경기 -->
					<div id="book_theater_tab3" class="book_theater_tabcontent"></div>			<!-- 인천 -->
					<div id="book_theater_tab4" class="book_theater_tabcontent"></div>	<!-- 대전/충청/세종 -->
					<div id="book_theater_tab5" class="book_theater_tabcontent"></div>	<!-- 부산/대구/경상 -->
					<div id="book_theater_tab6" class="book_theater_tabcontent"></div>		<!-- 광주/전라 -->
					<div id="book_theater_tab7" class="book_theater_tabcontent"></div>			<!-- 강원 -->
					<div id="book_theater_tab8" class="book_theater_tabcontent"></div>			<!-- 제주 -->
				</div>
				
				<!-- 영화 -->
				<div class="bookDiv1_movie">
					<div class="sub_title">영화</div>
					<div class="book_movie"></div>
				</div>
			</div>
			
			<!-- 선택한 예약정보 -->
			<div class="bookDiv1_info">
				<table class="bookDiv1_info_table">
					<thead>
						<tr>
							<th width="10%"></th><td width="15%"></td>
							<th width="10%"></th><td width="20%"></td>
							<th width="10%"></th><td width="*"></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="tcenter">상영일</th><td class="date_info"></td>
							<th class="tcenter">영화관</th><td class="theater_info">영화관을 선택하세요.</td>
							<th class="tcenter">영화</th><td class="movie_info">영화를 선택하세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- 상영시간 -->
			<div class="bookDiv2">
				
				<div class="bookDiv2_time">
					<div class="sub_title">상영시간</div>
					<div class="book_time">
						<div class='bookTimeNoSelectDiv'>
							<img src="<c:url value='/images/exclamation-mark-big.png'/>"> 
							상영시간이 조회되지 않았습니다. 영화관 및 영화를 선택해주세요.
	            		</div>
					</div>
				</div>
			</div>
		</div>
		<!-- '예매하기' tab end -->
		
		
		<!-- '상영시간표' tab start -->
		<div id="book_time_tab2" class="book_time_tabcontent">
			
			<!-- 날짜 -->
			<input type="text" id="TIME_SHOW_DT" name="TIME_SHOW_DT" size="30">
			
			<div class="timeDiv1">
			
				<!-- 영화관 -->
				<div class="timeDiv1_theater">
					<div class="sub_title">영화관</div>
					
					<ul class="time_theater_tab">
						<li data-tab="time_theater_tab1" class="current"><a href="#">서울</a></li>
						<li data-tab="time_theater_tab2"><a href="#">경기</a></li>
						<li data-tab="time_theater_tab3"><a href="#">인천</a></li>
						<li data-tab="time_theater_tab4"><a href="#">대전/충청/세종</a></li>
						<li data-tab="time_theater_tab5"><a href="#">부산/대구/경상</a></li>
						<li data-tab="time_theater_tab6"><a href="#">광주/전라</a></li>
						<li data-tab="time_theater_tab7"><a href="#">강원</a></li>
						<li data-tab="time_theater_tab8"><a href="#">제주</a></li>
					</ul>
					
					<div id="time_theater_tab1" class="time_theater_tabcontent current"></div>	<!-- 서울 -->
					<div id="time_theater_tab2" class="time_theater_tabcontent"></div>			<!-- 경기 -->
					<div id="time_theater_tab3" class="time_theater_tabcontent"></div>			<!-- 인천 -->
					<div id="time_theater_tab4" class="time_theater_tabcontent"></div>	<!-- 대전/충청/세종 -->
					<div id="time_theater_tab5" class="time_theater_tabcontent"></div>	<!-- 부산/대구/경상 -->
					<div id="time_theater_tab6" class="time_theater_tabcontent"></div>		<!-- 광주/전라 -->
					<div id="time_theater_tab7" class="time_theater_tabcontent"></div>			<!-- 강원 -->
					<div id="time_theater_tab8" class="time_theater_tabcontent"></div>			<!-- 제주 -->
				</div>
			</div>
			
			<!-- 상영시간 -->
			<div class="timeDiv2">
				<div class="timeDiv2_time">
					<div class="sub_title">상영시간</div>
					<div class="time_time">
						<div class='bookTimeNoSelectDiv'>
							<img src="<c:url value='/images/exclamation-mark-big.png'/>"> 
							상영시간이 조회되지 않았습니다. 영화관을 선택해주세요.
	            		</div>
					</div>
				</div>
			</div>
		</div>
		<!-- '상영시간표' tab end -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			//상영일 - 오늘날짜 초기화
			setToday();
			
			//예매하기 - 영화관 조회
			fn_getTheaterList_book("서울", 		  'book_theater_tab1');	
			fn_getTheaterList_book("경기", 		  'book_theater_tab2');
			fn_getTheaterList_book("인천", 		  'book_theater_tab3');
			fn_getTheaterList_book("대전/충청/세종", 'book_theater_tab4');
			fn_getTheaterList_book("부산/대구/경상", 'book_theater_tab5');
			fn_getTheaterList_book("광주/전라", 	  'book_theater_tab6');
			fn_getTheaterList_book("강원", 	      'book_theater_tab7');
			fn_getTheaterList_book("제주", 	  	  'book_theater_tab8');
			
			//예매하기 - 영화조회
			fn_getMovieList_book();
			
			//상영시간표 - 영화관 조회
			fn_getTheaterList_time("서울", 		  'time_theater_tab1');	
			fn_getTheaterList_time("경기", 		  'time_theater_tab2');
			fn_getTheaterList_time("인천", 		  'time_theater_tab3');
			fn_getTheaterList_time("대전/충청/세종", 'time_theater_tab4');
			fn_getTheaterList_time("부산/대구/경상", 'time_theater_tab5');
			fn_getTheaterList_time("광주/전라", 	  'time_theater_tab6');
			fn_getTheaterList_time("강원", 	      'time_theater_tab7');
			fn_getTheaterList_time("제주", 	  	  'time_theater_tab8');
			
			//예매하기/상영시간표 TAP 기능
			$('ul.book_time_tab li').click(function(e) {
				
				e.preventDefault();
				
				//클릭 한 탭 내용 보여주기
				var activeTab = $(this).attr('data-tab');
				$('ul.book_time_tab li').removeClass('current');
				$('.book_time_tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			});
			
			//예매하기 - 영화관 TAP 기능
			$('ul.book_theater_tab li').click(function(e) {
				
				e.preventDefault();
				
				var activeTab = $(this).attr('data-tab');
				$('ul.book_theater_tab li').removeClass('current');
				$('.book_theater_tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			});
			
			//상영시간표 - 영화관 TAP 기능
			$('ul.time_theater_tab li').click(function(e) {
				
				e.preventDefault();
				
				var activeTab = $(this).attr('data-tab');
				$('ul.time_theater_tab li').removeClass('current');
				$('.time_theater_tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			});
	    });
		
		//예매하기 - 지역별 영화관 목록조회
		function fn_getTheaterList_book(region, activeTab) {
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
	            			html += "<div class='bookTheaterDiv'>";
	            			html += "<div class='bookTheaterName'>" + list[i].THEATER_NAME + "</div>";
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
		
		//예매하기 - 영화관 클릭
		$(document).on('click', '.bookTheaterDiv', function() {
			
			var theaterNo = $(this).find('#THEATER_NO').val();
			var theaterNm = $(this).find('.bookTheaterName').text();
			
			if($(this).hasClass('current') == false) {
				$('.bookTheaterDiv').removeClass('current');
				$(this).addClass('current');
				$('.theater_info').text(theaterNm);
				
				//상영시간 조회
				if($('.bookMovieDiv').hasClass('current') == true) {
					var movieNo = $('.bookMovieDiv.current').find('#MOVIE_NO').val();
					fn_getTimeList(theaterNo, movieNo, "book_time");
				}
				else {
					fn_getTimeList(theaterNo, null, "book_time");
				}				
			} 
			else {
				$(this).removeClass('current');
				$('.theater_info').text('영화관을 선택하세요.');
				
				//상영시간 메시지
				fn_setTimeMessage('book_time', '상영시간이 조회되지 않았습니다. 영화관을 선택해주세요.');
			}
		});
		
		//상영시간표 - 지역별 영화관 목록조회
		function fn_getTheaterList_time(region, activeTab) {
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
	            			html += "<div class='timeTheaterDiv'>";
	            			html += "<div class='timeTheaterName'>" + list[i].THEATER_NAME + "</div>";
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
		
		//상영시간표 - 영화관 클릭
		$(document).on('click', '.timeTheaterDiv', function() {
			
			var theaterNo = $(this).find('#THEATER_NO').val();
			var theaterNm = $(this).find('.timeTheaterName').text();
			
			if($(this).hasClass('current') == false) {
				$('.timeTheaterDiv').removeClass('current');
				$(this).addClass('current');
				
				fn_getTimeList(theaterNo, null, "time_time");				
			} 
			else {
				$(this).removeClass('current');
				
				//상영시간 메시지
				fn_setTimeMessage('time_time', '상영시간이 조회되지 않았습니다. 영화관을 선택해주세요.');
			}
		});
		
		//예매하기 - 상영영화 조회
		function fn_getMovieList_book() {
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/movie/selectAllMovieList.do' />",
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	if(list.length > 0) {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<div class='bookMovieDiv'>";
	            			
		            		if(list[i].GRADE == '12')	html += "<img src='${pageContext.request.contextPath}/images/grade-12.png'>";
	            			if(list[i].GRADE == '15')	html += "<img src='${pageContext.request.contextPath}/images/grade-15.png'>";
	            			if(list[i].GRADE == '전체')	html += "<img src='${pageContext.request.contextPath}/images/grade-all.png'>";
	            			if(list[i].GRADE == '청불')	html += "<img src='${pageContext.request.contextPath}/images/grade-19.png'>";
	            			
	            			html += "&nbsp;<span>" + list[i].MOVIE_NAME + "</span>";
	            			html += "<input type='hidden' id='MOVIE_NO' name='MOVIE_NO' value='" + list[i].MOVIE_NO + "'>";
	            			html += "</div>";
	            		}
	            	}
	            	$(".book_movie").append(html);
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//예매하기 - 영화 클릭
		$(document).on('click', '.bookMovieDiv', function() {
			
			var movieNo   = $(this).find('#MOVIE_NO').val();
			var movieNm   = $(this).find('span').text();
			var theaterNo = '';
			
			if($('.bookTheaterDiv').hasClass('current') == true) {
				theaterNo = $('.bookTheaterDiv.current').find('#THEATER_NO').val();
			}
			
			if($(this).hasClass('current') == false) {
				$('.bookMovieDiv').removeClass('current');	
				$(this).addClass('current');
				$('.movie_info').text(movieNm);
				
				//상영시간 조회
				if(theaterNo != ''){
					fn_getTimeList(theaterNo, movieNo, "book_time");	
				}
				else {
					//상영시간 메시지
					fn_setTimeMessage('book_time', '상영시간이 조회되지 않았습니다. 영화관을 선택해주세요.');
				}
			}
			else {
				$(this).removeClass('current');
				$('.movie_info').text('영화를 선택하세요.');
				
				//상영시간 조회
				if(theaterNo != ''){
					fn_getTimeList(theaterNo, null, "book_time");	
				}
				else {
					//상영시간 메시지
					fn_setTimeMessage('book_time', '상영시간이 조회되지 않았습니다. 영화관 및 영화를 선택해주세요.');
				}
			}
		});
		
		//상영시간 조회
		function fn_getTimeList(theaterNo, movieNo, el) {
			
			var param = {
					THEATER_NO : theaterNo,
					MOVIE_NO : movieNo,
					SHOW_DT : $('ul.book_time_tab li:eq(0)').hasClass('current') == true ? $('#BOOK_SHOW_DT').val() : $('#TIME_SHOW_DT').val() 
					//예매하기 탭 활성화 시 - 예매하기(상영일), 상영시간표 탭 활성화 시 - 상영시간표(상영일)
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/time/selectTimeList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("." + el).empty();
	            	
	            	if(list.length > 0) {
	            		for(var i=0; i<list.length; i++) {
	            			if(list[i].RN == 1) {
	            				html += "<div class='bookTimeDiv'>";
		            			html += "<div class='bookTimeDivTitle'>";
		            			if(list[i].GRADE == '12')	html += "<img src='${pageContext.request.contextPath}/images/grade-12.png'>";
		            			if(list[i].GRADE == '15')	html += "<img src='${pageContext.request.contextPath}/images/grade-15.png'>";
		            			if(list[i].GRADE == '전체')	html += "<img src='${pageContext.request.contextPath}/images/grade-all.png'>";
		            			if(list[i].GRADE == '청불')	html += "<img src='${pageContext.request.contextPath}/images/grade-19.png'>";
		            			html += "&nbsp;<span>" + list[i].MOVIE_NAME + "</span>";
		            			html += "&nbsp;&nbsp;" + list[i].GENRE + "/" + list[i].RUN_TIME + "분/" + list[i].PLAY_DT + " 개봉";
		            			html += "</div>";
	            			}
	            			
	            			html += "<div class='bookTimeDivTimeInfo'>";
	            			html += "<div class='bookTimeDivHall'>";
	            			html += list[i].HALL_NAME;
	            			html += "</div>";
	            			html += "<div class='bookTimeDivTime'>";
	            			html += list[i].START_TIME;
	            			html += "</div>";
	            			html += "<div class='bookTimeDivSeat'>";
	            			html += list[i].USEABLE_CNT + "석 / " + list[i].SEAT_CNT + "석";
	            			html += "</div>";
	            			html += "<input type='hidden' id='MOVIE_NO' name='MOVIE_NO' value='" + list[i].MOVIE_NO + "'>";
	            			html += "<input type='hidden' id='THEATER_NO' name='THEATER_NO' value='" + list[i].THEATER_NO + "'>";
	            			html += "<input type='hidden' id='HALL_NO' name='HALL_NO' value='" + list[i].HALL_NO + "'>";
	            			html += "<input type='hidden' id='SHOW_DT' name='SHOW_DT' value='" + list[i].SHOW_DT + "'>";
        					html += "<input type='hidden' id='START_TIME' name='START_TIME' value='" + list[i].START_TIME + "'>";
        					html += "<input type='hidden' id='END_TIME' name='END_TIME' value='" + list[i].END_TIME + "'>";
	            			html += "</div>";
	            			        					
	            			if((i+1) < list.length) {
	            				if(list[i+1].RN == 1) {
	    	            			html += "</div>";
	            				}	
	            			}
	            		}
	            	} else {
	            		html += "<div class='bookTimeNoDataDiv'>";
	            		html += "<img src='${pageContext.request.contextPath}/images/exclamation-mark-big.png'>";
	            		html += " 상영시간이 조회되지 않았습니다.";
	            		html += "</div>";
	            	}
	            	$("." + el).append(html);
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//상영시간 : 클릭 - 좌석선택 화면 이동
		$(document).on('click', '.bookTimeDivTimeInfo', function() {		
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/book/openBookSeatForm.do' />");
		    comSubmit.addParam("MOVIE_NO",   $(this).find('#MOVIE_NO').val());
		    comSubmit.addParam("THEATER_NO", $(this).find('#THEATER_NO').val());
		    comSubmit.addParam("HALL_NO",    $(this).find('#HALL_NO').val());
		    comSubmit.addParam("SHOW_DT",    $(this).find('#SHOW_DT').val());
		    comSubmit.addParam("START_TIME", $(this).find('#START_TIME').val());
		    comSubmit.submit();
		});
		
		//상영시간 : 마우스오버
		$(document).on('mouseover', '.bookTimeDivTimeInfo', function() {
			var startTime = $(this).find('#START_TIME').val();
			var endTime   = $(this).find('#END_TIME').val();
			$(this).find('.bookTimeDivTime').text(startTime + ' ~ ' + endTime);
			$(this).addClass('current');
		});
		
		//상영시간 : 마우스아웃
		$(document).on('mouseout', '.bookTimeDivTimeInfo', function() {
			var startTime = $(this).find('#START_TIME').val();
			$(this).find('.bookTimeDivTime').text(startTime);
			$(this).removeClass('current');
		});
		
		//상영시간 메시지
		function fn_setTimeMessage(el, msg) {
			var html = "";
			html += "<div class='bookTimeNoSelectDiv'>";
    		html += "<img src='${pageContext.request.contextPath}/images/exclamation-mark-big.png'>";
    		html += " " + msg;
    		html += "</div>";
    		$('.'+el).empty().append(html);
		}
		
		//상영일 - 오늘날짜 초기화
		function setToday() {
			var today = gfn_getToday();
			$("#BOOK_SHOW_DT").val(today);	//예매하기 - 상영일	
			$("#TIME_SHOW_DT").val(today);	//상영시간표 - 상영일
			$(".date_info").text(today);	//예매하기 - 선택한 상영일
		}
		
		//예매하기 - 상영일 달력
		$("#BOOK_SHOW_DT").datepicker({
			showOn: "both",
			buttonImage: "<c:url value='/images/calendar.gif'/>",
            dateFormat: "yy-mm-dd",
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true,
            changeYear: true,
            minDate: gfn_getToday(),
            maxDate: '+7d',
            onSelect: function(dateText, instance) {
            	$(".date_info").text(dateText);
            	
    			if($('.bookTheaterDiv').hasClass('current') == true) {
    				var theaterNo = $('.bookTheaterDiv.current').find('#THEATER_NO').val();
    				fn_getTimeList(theaterNo, null, "book_time");
    			}
            }
        });
		
		//상영시간표 - 상영일 달력
		$("#TIME_SHOW_DT").datepicker({
			showOn: "both",
			buttonImage: "<c:url value='/images/calendar.gif'/>",
            dateFormat: "yy-mm-dd",
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true,
            changeYear: true,
            minDate: gfn_getToday(),
            maxDate: '+7d',
            onSelect: function(dateText, instance) {
    			if($('.timeTheaterDiv').hasClass('current') == true) {
    				var theaterNo = $('.timeTheaterDiv.current').find('#THEATER_NO').val();
    				fn_getTimeList(theaterNo, null, "time_time");
    			}
            }
        });
	</script>	
</body>
</html>