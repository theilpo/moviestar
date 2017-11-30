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
		<div class="explain">예매가 완료되었습니다.</div>
		<div class="etc"><span class="essential">* </span>마이페이지에서 예매취소 가능합니다.</div>
		
		<hr style="clear: right;">
		
		<!-- '결제완료' start -->
		<div class="bookOK_info_wrap">
			<div class="bookOK_info_text">예매완료</div>
			
			<table class="bookOK_info_table">
		        <colgroup>
		            <col width="20%"/>
		            <col width="*"/>
		        </colgroup>
		        <tbody>
		            <tr><th>예매번호</th><td class="red_bold">${map.BOOK_NO }</td></tr>
		            <tr><th>예매영화</th><td><b>${map.MOVIE_NAME }</b></td></tr> 
		            <tr><th>상영극장</th><td><b>${map.THEATER_NAME } / ${map.HALL_NAME }</b></td></tr> 
		            <tr><th>상영일시</th><td><b>${map.SHOW_DT } ${map.START_TIME } ~ ${map.END_TIME }</b></td></tr> 
		            <tr><th>상영인원</th><td>${map.PEOPLE }</td></tr> 
		            <tr><th>선택좌석</th><td><b>${map.SEATS_NO }</b></td></tr>
		            <tr><th>결제금액</th><td style="color: red"></td></tr>   
		        </tbody>
		    </table>
		    
		    <input type="hidden" id="CHARGE" name="CHARGE" value="${map.CHARGE }">
		</div>
		
		<div class="btn_wrap">
			<input type="button" id="btn_mypage" class="btn_orange" value="마이페이지">
			<input type="button" id="btn_main" class="btn_gray" value="메인">
		</div>	    
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {	
			
			//금액 콤마세팅
			var commaCharge = gfn_setComma($('#CHARGE').val());
			$('.bookOK_info_table td:eq(6)').text(commaCharge + " 원");
			
			//마이페이지 이동
			$('#btn_mypage').click(function() {
				fn_openMypage();
			});
			
			//메인화면 이동
			$('#btn_main').click(function() {
				fn_openMainForm();
			});
	    });
		
		//마이페이지 이동
		function fn_openMypage() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/openMypageForm.do' />");
		    comSubmit.submit();
		}
		
		//메인화면 이동
		function fn_openMainForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/' />");
		    comSubmit.submit();
		}
		
	</script>	
</body>
</html>