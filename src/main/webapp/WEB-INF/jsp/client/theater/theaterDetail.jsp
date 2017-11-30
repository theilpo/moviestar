<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDyLPQCglTh_FA2zF-mzaF4GvwRqXYZKTU&libraries=places&callback=initMap" async defer></script>
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">영화관</div>
		<div class="explain">내집 같은 편안함, 만남과 소통의 즐거움이 가득한 공간</div>
		<div class="etc">&nbsp;</div>
		
		<hr style="clear: right;">
		
		<!-- Start theater detail -->
		<div class="theater_wrap">
			
			<div class="theaterSubDiv">
				<div class="theaterSubName">${map.NAME }</div>
				<div class="theaterSubAddr">${map.ADDRESS }</div>
			</div>
			
			<div id="map"></div>
			
			<textarea class="ckeditor" id="TS_editor" name="TS_editor">${map.CONTENTS }</textarea>
			
			<div class="btn_wrap">
				<input type="button" id="btn_list" class="btn_orange" value="목록">
			</div>
		</div>
		<!-- End theater detail -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$("#btn_list").click(function() {	//목록 버튼
				fn_openTheaterList();
			});
	    });
		
		//영화관 목록 이동
		function fn_openTheaterList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/theater/openTheaterList.do' />");
			comSubmit.submit();
		}
		
		//지도 가져오기
		function initMap() {
			var position = { lat: Number('${map.LAT}'), lng: Number('${map.LNG}') };
			var map = new google.maps.Map(document.getElementById('map'), {
		    	center: position, 
		        zoom: 16
		   	});

		    var marker = new google.maps.Marker({
		    	position: position,
		    	map: map
		    });
		}
		
		//에디터 설정
		CKEDITOR.replace( 'TS_editor', {
			height : 300,
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