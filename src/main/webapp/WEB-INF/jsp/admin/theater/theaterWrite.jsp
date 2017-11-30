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
		
		<div class="menu_title">영화관 등록</div>
		
		<form id="frm" name="frm" enctype="multipart/form-data">
		
			<!-- theater write start -->
			<table class="write_common_table">
		        <colgroup>
		            <col width="15%"/>
		            <col width="*"/>
		        </colgroup>
		        <tbody>
		        	<tr>
		                <th class="tcenter">지역선택</th>
		                <td>
		                	<select id="REGION" name="REGION" style="width: 290px;">
		                		<option value="서울">서울</option>
		                		<option value="경기">경기</option>
		                		<option value="인천">인천</option>
		                		<option value="대전/충청/세종">대전/충청/세종</option>
		                		<option value="부산/대구/경상">부산/대구/경상</option>
		                		<option value="광주/전라">광주/전라</option>
		                		<option value="강원">강원</option>
		                		<option value="제주">제주</option>
		                	</select>
		                </td>
		            </tr>
		        	<tr>
		                <th class="tcenter">영화관 이름</th>
		                <td>
		                	<input type="text" id="THEATER_NAME" name="THEATER_NAME" size="45">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">전화번호</th>
		                <td>
		                	<input type="text" id="TEL" name="TEL" size="45">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">영화관 사진</th>
		                <td>
		                	<input type="text" id="THEATER_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="THEATER_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('THEATER_FILE').value = this.value">
		                	</div>
		                </td>
		            </tr>
		            <tr>
		            	<th class="tcenter">위치</th>
		            	<td>
		            		<input id="pac-input" class="controls" type="text" placeholder="찾으시려는 장소를 검색해주세요.">
						    <div id="map"></div>
		            	</td>
		            </tr>
		            <tr>
		                <th class="tcenter">영화관 주소</th>
		                <td>
		                	<input type="text" id="ADDRESS" name="ADDRESS" size="80" readonly="readonly" placeholder="지도에서 검색하시면 자동으로 입력됩니다.">
		                	<input type="hidden" id="LAT" name="LAT">
		                	<input type="hidden" id="LNG" name="LNG">
		                </td>
		            </tr>
		            <tr>
		            	<th class="tcenter">상세내용</th>
		            	<td>
		            		<textarea class="ckeditor" id="TI_editor" name="TI_editor"></textarea>
		            	</td>
		            </tr>
		        </tbody>
		    </table>
		    <!-- theater write end -->
		    
			<div class="btn_wrap">
				<input type="button" id="btn_save" class="btn_orange" value="저장">
			</div>
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn_save").click(function() {	//저장 버튼
				if(fn_validate() == true) {
					fn_insertTheater();	
				}
			});
				
	    });
		
		//유효성 검사
		function fn_validate() {
			if(gfn_isNull($("#THEATER_NAME").val())) {
				alert("영화관 이름을 입력해주세요.");
				$("#THEATER_NAME").focus();
				return false;
			}
			if(gfn_isNull($("#TEL").val())) {
				alert("전화번호를 입력해주세요.");
				$("#TEL").focus();
				return false;
			}
			if(gfn_isNull($("#THEATER_FILE").val())) {
				alert("영화관 사진을 선택해주세요.");
				$("#THEATER_FILE").focus();
				return false;
			}
			if(gfn_isNull($("#ADDRESS").val())) {
				alert("주소를 검색해주세요.");
				$("#pac-input").focus();
				return false;
			}
			if(gfn_isNull(CKEDITOR.instances.TI_editor.getData())) {
				alert("내용을 입력해주세요.");
				CKEDITOR.instances.TI_editor.focus();
				return false;
			}
			return true;
		}
		
		//영화관 등록
		function fn_insertTheater() {
			var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/theater/insertTheater.do' />");
            comSubmit.addParam("CONTENTS", CKEDITOR.instances.TI_editor.getData());
            comSubmit.submit();
		}
		
		//장소검색
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
		    	center: {lat: 37.548925, lng: 126.994033}, 
		        zoom: 13
		   	});

		 	var input = document.getElementById('pac-input');

		 	var autocomplete = new google.maps.places.Autocomplete(input, {placeIdOnly: true});
		    autocomplete.bindTo('bounds', map);

		    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

		    var geocoder = new google.maps.Geocoder;
		    var marker = new google.maps.Marker({
		 		map: map
		    });
		  
			autocomplete.addListener('place_changed', function() {
		    	
		     	var place = autocomplete.getPlace();
				
		      	if (!place.place_id) {
		         	return;
		        }
		    	geocoder.geocode({'placeId': place.place_id}, function(results, status) {

			     	if (status !== 'OK') {
			         	window.alert('Geocoder failed due to: ' + status);
			           	return;
			       	}
			       	map.setZoom(15);
			    	map.setCenter(results[0].geometry.location);
			      	
			      	marker.setPlace({
			     	 	placeId: place.place_id,
			        	location: results[0].geometry.location
			      	});
			     	marker.setVisible(true);
			     	
			  		// place.name     : 이름
			        // place.place_id : 고유ID
			  		// results[0].formatted_address : 실주소
			  		// results[0].geometry.location : 위치 -> format : (위도, 경도)
			  		
			  		var strLoc = new String(results[0].geometry.location);
			  		var lastIdx = strLoc.indexOf(')');
		    		strLoc = strLoc.substring(1, lastIdx);
		    		var arrLoc = strLoc.split(', ');
		    		
		    		$('#LAT').val(arrLoc[0]);	//위도
			  		$('#LNG').val(arrLoc[1]);	//경도
			  		$('#ADDRESS').val(results[0].formatted_address);
		 		});
		 	});
		}
		
		//에디터 설정
		CKEDITOR.replace( 'TI_editor', {
			height : 300,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
		 	],
			enterMode : '2'	//엔터시 <br>
	    });
	</script>	
</body>
</html>