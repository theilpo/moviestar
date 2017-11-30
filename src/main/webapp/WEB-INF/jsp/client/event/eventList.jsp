<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">이벤트</div>
		<div class="explain">'무비스타'에서 진행하는 다양한 이벤트에 참여해보세요.</div>
		<div class="etc"><span class="essential">* </span>'참여하기' 버튼을 누르면 포인트가 적립됩니다.</div>
		
		<hr style="clear: right;">
		
		<!-- Start Event -->
		<div class="event_container">
			<c:forEach var="event" items="${list }">
				<div class="eventDiv" title="${event.TITLE } 상세보기">
					<img src="<c:url value='/upload/${event.STORED_FILE_NAME }'/>">
					<div class="eventTitle">${event.TITLE }</div>
					<div class="eventPeriod">${event.START_DT } ~ ${event.END_DT }</div>
					<input type="hidden" id="IDX" name="IDX" value="${event.IDX }">
				</div>
			</c:forEach>
		</div>
		<!-- End Event -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$(".eventDiv").click(function() {	//이벤트 상세보기
				fn_openEventDetail($(this));
			});
	    });
		
		//이벤트 상세보기
		function fn_openEventDetail(obj) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/event/selectEventDetail.do' />");
		    comSubmit.addParam("IDX", obj.find("#IDX").val());
		    comSubmit.submit();
		}
	</script>	
</body>
</html>