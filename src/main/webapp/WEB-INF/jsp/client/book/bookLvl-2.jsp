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
		<div class="explain">예매 인원수 및 좌석을 선택해주세요.</div>
		<div class="etc"><span class="essential">* </span>영화 > 좌석 > 결제 3단계로 이루어져 있습니다.</div>
		
		<hr style="clear: right;">
		
		<!-- '인원/좌석 선택' start -->
		<div class="book_number_seat_wrap">
			<div class="book_number_seat_text">인원 / 좌석</div>
			
			<!-- 인원 선택 -->
			<div class="book_number_wrap">
			
				<!-- 일반 -->
				<div class="book_number_adult">			
					<div class="book_number_label">일반</div>
					<c:forEach var="i" begin="0" end="8">
						<div class="book_number_adult_${i } book_number_div">${i }</div>
					</c:forEach>
				</div>
				
				<!-- 청소년 -->
				<div class="book_number_teen">		
					<div class="book_number_label">청소년</div>
					<c:forEach var="i" begin="0" end="8">
						<div class="book_number_teen_${i } book_number_div">${i }</div>
					</c:forEach>
				</div>
				
				<!-- 우대 -->
				<div class="book_number_special">	
					<div class="book_number_label">우대</div>
					<c:forEach var="i" begin="0" end="8">
						<div class="book_number_special_${i } book_number_div">${i }</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 예매 정보 -->
			<div class="book_info_wrap">
				<div class="book_info_1">
					${list[0].THEATER_NAME }(${list[0].HALL_NAME }), 남은좌석 <span class="red_bold">${list[0].USEABLE_CNT }</span>/${list[0].SEAT_CNT }
				</div>
				<div class="book_info_2">
					${list[0].SHOW_DT } ${list[0].START_TIME } ~ ${list[0].END_TIME }
				</div>
			</div>
			
			<!-- 좌석 선택 -->
			<div class="book_seat_wrap">
				<div class="book_seat_left_wrap">
					<div class="book_seat_screen">SCREEN</div>
				
					<div class="book_seat_div">
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'A'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_economy seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'B'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_economy seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'C'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_economy seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'D'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_standard seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'E'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_standard seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'F'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_standard seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'G'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_standard seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'H'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_standard seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'I'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_prime seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'J'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_prime seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'K'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_prime seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'L'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_prime seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'M'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_prime seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'N'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_prime seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="seat_row">
							<c:forEach var="seat" items="${list }">
								<c:if test="${seat.SEAT_ROW == 'O'}">
									<c:if test="${seat.SEAT_COL == 1}"><div class="seat_row_name">${seat.SEAT_ROW }</div></c:if>
									<div class="seat_prime seat_common 
										<c:if test="${seat.USEABLE=='Y'}">seat_basic</c:if>
										<c:if test="${seat.USEABLE=='N'}">seat_finish</c:if>">${seat.SEAT_COL }</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="book_seat_right_wrap">
					<div class="seat_right_row">
						<div class="seat_choice seat_common">&nbsp;</div><div class="seat_label">선택</div>
					</div>
					<div class="seat_right_row">
						<div class="seat_finish seat_common">&nbsp;</div><div class="seat_label">예매완료</div>	
					</div>
					<div class="seat_right_row">
						<div class="seat_economy seat_common">&nbsp;</div><div class="seat_label">Economy Zone</div>
					</div>
					<div class="seat_right_row">
						<div class="seat_standard seat_common">&nbsp;</div><div class="seat_label">Standard Zone</div>
					</div>
					<div class="seat_right_row">
						<div class="seat_prime seat_common">&nbsp;</div><div class="seat_label">Prime Zone</div>
					</div>
				</div>
			</div>
			
			<!-- 예매 모든 정보 -->
			<div class="book_all_info_wrap">
				<div class="book_prev book_all_info">
					<a href="#"><img src="<c:url value='/images/book_prev.png'/>"></a>
				</div>
				<div class="book_movie_info book_all_info">
					<table>
						<tr><th>영화명</th><td>${list[0].MOVIE_NAME }</td></tr>
						<tr><th>등급</th><td>${list[0].GRADE }</td></tr>
					</table>
				</div>
				<div class="book_time_info book_all_info">
					<table>
						<tr><th>극장</th><td>${list[0].THEATER_NAME }</td></tr>
						<tr><th>일시</th><td>${list[0].SHOW_DT }&nbsp;${list[0].START_TIME }</td></tr>
						<tr><th>상영관</th><td>${list[0].HALL_NAME }</td></tr>
						<tr><th>인원</th><td>&nbsp;</td></tr>
					</table>
				</div>
				<div class="book_seat_info book_all_info">
					<table>
						<tr><th>좌석</th><td rowspan="4">&nbsp;</td></tr>
						<tr><th>&nbsp;</th><td>&nbsp;</td></tr>
						<tr><th>&nbsp;</th><td>&nbsp;</td></tr>
						<tr><th>&nbsp;</th><td>&nbsp;</td></tr>
					</table>
				</div>
				<div class="book_charge_info book_all_info">
					<table>
						<tr><th>일반</th><td>&nbsp;</td></tr>
						<tr><th>청소년</th><td>&nbsp;</td></tr>
						<tr><th>우대</th><td>&nbsp;</td></tr>
						<tr><th>총금액</th><td class="red_bold">&nbsp;</td></tr>
					</table>
				</div>
				<div class="book_next book_all_info">
					<a href="#"><img src="<c:url value='/images/book_next.png'/>"></a>
				</div>
			</div>
			
			<!-- hidden -->
			<input type="hidden" id="TIME_NO" name="TIME_NO" value="${list[0].TIME_NO }">
			<input type="hidden" id="MOVIE_NO" name="MOVIE_NO" value="${list[0].MOVIE_NO }">
			<input type="hidden" id="PEOPLE" name="PEOPLE">
			<input type="hidden" id="CHARGE" name="CHARGE">
		</div>
	</div>
	<!-- '인원/좌석 선택' end -->
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			//초기값 세팅
			fn_initForm();
			
			//인원수 선택
			$('.book_number_div').click(function() {
				
				var idx = $(this).text();

				var prevAdultCnt   = Number($('.book_number_adult > .current').text());
				var prevTeenCnt    = Number($('.book_number_teen > .current').text());
				var prevSpecialCnt = Number($('.book_number_special > .current').text());
				
				for(var i=0; i<=8; i++) {
					if($(this).parent().hasClass('book_number_adult'))
						$('.book_number_adult_'+i).removeClass('current');
					if($(this).parent().hasClass('book_number_teen'))
						$('.book_number_teen_'+i).removeClass('current');
					if($(this).parent().hasClass('book_number_special'))
						$('.book_number_special_'+i).removeClass('current');
					
					if(i == idx) {
						if($(this).parent().hasClass('book_number_adult'))							
							$('.book_number_adult_'+idx).addClass('current');
						if($(this).parent().hasClass('book_number_teen'))
							$('.book_number_teen_'+idx).addClass('current');
						if($(this).parent().hasClass('book_number_special'))
							$('.book_number_special_'+idx).addClass('current');
					}
				}
				
				var adultCnt   = Number($('.book_number_adult > .current').text());
				var teenCnt    = Number($('.book_number_teen > .current').text());
				var specialCnt = Number($('.book_number_special > .current').text());
				var totalCnt   = adultCnt + teenCnt + specialCnt;
				var chkCnt     = $('.seat_row .seat_common').parents().find('.chk').size();
				
				if(chkCnt > totalCnt) {
					for(var i=0; i<=8; i++) {
						if(i == idx) {
							if($(this).parent().hasClass('book_number_adult'))
								$('.book_number_adult_'+i).removeClass('current');
							if($(this).parent().hasClass('book_number_teen'))
								$('.book_number_teen_'+i).removeClass('current');
							if($(this).parent().hasClass('book_number_special'))
								$('.book_number_special_'+i).removeClass('current');
						}
						
						if($(this).parent().hasClass('book_number_adult'))							
							$('.book_number_adult_'+prevAdultCnt).addClass('current');
						if($(this).parent().hasClass('book_number_teen'))
							$('.book_number_teen_'+prevTeenCnt).addClass('current');
						if($(this).parent().hasClass('book_number_special'))
							$('.book_number_special_'+prevSpecialCnt).addClass('current');
					}
					alert("선택한 좌석이 관람 인원수 보다 많습니다.");
					return false;
				}
				
				if(chkCnt == totalCnt && chkCnt > 0)
					$('.book_next img').attr('src', "<c:url value='/images/book_next_on.png'/>");
				else
					$('.book_next img').attr('src', "<c:url value='/images/book_next.png'/>");
				
				if(totalCnt == 0) {
					$('.book_seat_wrap *').attr('disabled', true);
					$('.book_seat_wrap').addClass('disabled');
					
					$('.book_time_info td:eq(3)').empty();
				} else {
					$('.book_seat_wrap *').attr('disabled', false);
					$('.book_seat_wrap').removeClass('disabled');
					
					var str = "";
					if(adultCnt > 0)	str += "일반 " + adultCnt + "명, ";
					if(teenCnt > 0)		str += "청소년 " + teenCnt + "명, ";
					if(specialCnt > 0)	str += "우대 " + specialCnt + "명, ";
					str = str.substr(0, str.length -2);
					$('.book_time_info td:eq(3)').empty().append(str);
				}
			});
			
			//좌석 마우스 오버
			$('.seat_row .seat_common').mouseover(function() {
				if($('.book_seat_wrap').hasClass('disabled') == false) {	//인원수 선택한 경우만 마우스오버
					if($(this).hasClass('seat_basic')) {
						$(this).removeClass('seat_basic');
						$(this).addClass('seat_choice');
					}
				}
			});
			
			//좌석 마우스 아웃
			$('.seat_row .seat_common').mouseout(function() {
				if($(this).hasClass('seat_choice')) {
					if($(this).hasClass('chk') == false) {
						$(this).removeClass('seat_choice');
						$(this).addClass('seat_basic');
					}
				}
			});
			
			//좌석 선택
			$('.seat_row .seat_common').click(function() {
				
				if($('.book_seat_wrap').hasClass('disabled')) {	//인원수 선택안한 경우 선택막기
					return false;
				}
				
				//'예매완료' 아닌 경우만 선택/해제 가능
				if($(this).hasClass('seat_finish') == false) {
					if($(this).hasClass('chk'))
						$(this).removeClass('chk');
					else
						$(this).addClass('chk');
				}
				
				var adultCnt   = Number($('.book_number_adult > .current').text());
				var teenCnt    = Number($('.book_number_teen > .current').text());
				var specialCnt = Number($('.book_number_special > .current').text());
				var totalCnt   = adultCnt + teenCnt + specialCnt;
				var chkCnt     = $(this).parents().find('.chk').size();
				
				if(chkCnt > totalCnt) {
					$(this).removeClass('chk');
					alert("이미 좌석을 모두 선택하셨습니다.");
					return false;
				}
				
				//좌석 set
				var strCnt = "";
				for(var i=0; i<chkCnt; i++) {
					var col = $(this).parents().find('.chk').eq(i).text();
					var row = $(this).parents().find('.chk').eq(i).parent().find('.seat_row_name').text();
					strCnt += row + col + ", ";
				}
				strCnt = strCnt.substr(0, strCnt.length -2);
				$('.book_seat_info td:eq(0)').empty().append(strCnt);
				$('.book_seat_info td:eq(0)').css({'padding' : '5px 10px', 'line-height' : '1.5'});
				
				//금액 set
				fn_setCharge($(this), chkCnt, adultCnt, teenCnt, specialCnt);
				
				if(chkCnt == totalCnt)
					$('.book_next img').attr('src', "<c:url value='/images/book_next_on.png'/>");
				else
					$('.book_next img').attr('src', "<c:url value='/images/book_next.png'/>");
			});
			
			/**
			 * 금액 set
			 * 
			 * @param el         : 좌석 태그
			 *	 	  chkCnt     : 체크 한 좌석개수
			 *	      adultCnt   : 일반 인원수
			 *	      teenCnt    : 청소년 인원수
			 *	      specialCnt : 우대 인원수
			 */
			function fn_setCharge(el, chkCnt, adultCnt, teenCnt, specialCnt) {
				
				var adultCharge   = 10000;	//일반 - 프라임 금액
				var teenCharge    = 9000;	//청소년 - 프라임 금액
				var specialCharge = 4000;	//우대 금액
				var adultTotal    = 0;		//일반 총 금액
				var teenTotal 	  = 0;		//청소년 총 금액
				var specialTotal  = 0;		//우대 총 금액
				var total         = 0;		//전체 금액
				
				for(var i=chkCnt-1; i>=0; i--) {
					var row = el.parents().find('.chk').eq(i).parent().find('.seat_row_name').text();
					var ascii = row.charCodeAt(0);
					
					if(ascii >= 73 && ascii <= 79) {		//I ~ O (prime)
						if(adultCnt > 0) {
							adultTotal += adultCharge;
							adultCnt--;
							continue;
						}
						if(teenCnt > 0) {
							teenTotal += teenCharge;
							teenCnt--;
							continue;
						}
					}
					else if(ascii >= 68 && ascii <= 72) {	//D ~ H (standard)
						if(adultCnt > 0) {
							adultTotal += adultCharge - 1000;
							adultCnt--;
							continue;
						}
						if(teenCnt > 0) {
							teenTotal += teenCharge - 1000;
							teenCnt--;
							continue;
						}
					} 
					else if(ascii >= 65 && ascii <= 67) {	//A ~ C (economy)
						if(adultCnt > 0) {
							adultTotal += adultCharge - 2000;
							adultCnt--;
							continue;
						}
						if(teenCnt > 0) {
							teenTotal += teenCharge - 2000;
							teenCnt--;
							continue;
						}
					}
					
					if(specialCnt > 0) {
						specialTotal += specialCharge;
						specialCnt--;
					}
				}//for end
				
				total += adultTotal + teenTotal + specialTotal;
								
				$('.book_charge_info td:eq(0)').empty().append(gfn_setComma(adultTotal) + " 원");
				$('.book_charge_info td:eq(1)').empty().append(gfn_setComma(teenTotal) + " 원");
				$('.book_charge_info td:eq(2)').empty().append(gfn_setComma(specialTotal) + " 원");
				$('.book_charge_info td:eq(3)').empty().append(gfn_setComma(total) + " 원");
				$('.book_charge_info td').css({'text-align' : 'right', 'padding' : '0px 20px'});
				
				//결제금액 히든값 세팅
				$('#CHARGE').val(total);
			}
			
			//영화선택 버튼
			$('.book_prev').click(function(e) {	
				e.preventDefault();
				history.back();
			});
			
			//결제선택 버튼
			$('.book_next').click(function(e) {
				e.preventDefault();
				
				var adultCnt   = Number($('.book_number_adult > .current').text());
				var teenCnt    = Number($('.book_number_teen > .current').text());
				var specialCnt = Number($('.book_number_special > .current').text());
				var totalCnt   = adultCnt + teenCnt + specialCnt;
				var chkCnt     = $('.seat_row .seat_common').parents().find('.chk').size();
				
				if(totalCnt == 0) {
					alert("관람 인원수를 선택해주세요.");
					return false;
				}
				
				if(chkCnt != totalCnt) {
					alert("관람 인원과 선택 좌석수가 다릅니다.");
					return false;
				}
				
				var param = {
					TIME_NO  : $('#TIME_NO').val(),
					MOVIE_NO : $('#MOVIE_NO').val(),
					PEOPLE   : $('.book_time_info td:eq(3)').text(),
					SEATS_NO : $('.book_seat_info td:eq(0)').text(),
					CHARGE   : $('#CHARGE').val()
				};
								
				$.ajax({
					type : "POST",
					url : "<c:url value='/book/openBookPayForm.do' />",
					data : param,
					success : function(result) {
						fn_openBookPayForm();
					},
					error : function(xhr, textStatus, errMsg){
						if(xhr.status == 500) {
							gfn_openLoginForm();
						}
					}
				});
			});
	    });
		
		//결제선택 화면 이동
		function fn_openBookPayForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/book/openBookPayForm.do' />");
		    comSubmit.addParam("TIME_NO",    $('#TIME_NO').val());
		    comSubmit.addParam("MOVIE_NO",   $('#MOVIE_NO').val());
		    comSubmit.addParam("PEOPLE",     $('.book_time_info td:eq(3)').text());
		    comSubmit.addParam("SEATS_NO",   $('.book_seat_info td:eq(0)').text());
		    comSubmit.addParam("CHARGE", 	 $('#CHARGE').val());
		    comSubmit.submit();
		}
		
		//초기화
		function fn_initForm() {
			$('.book_number_adult_0').addClass('current');
			$('.book_number_teen_0').addClass('current');
			$('.book_number_special_0').addClass('current');
			
			$('.book_seat_wrap *').attr('disabled', true);
			$('.book_seat_wrap').addClass('disabled');
		}
		
	</script>	
</body>
</html>