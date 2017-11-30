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
	
		<div class="menu_title">상영시간 등록</div>
		
		<!-- time write start -->
		<form id="frm" name="frm">
		
			<table class="write_common_table">
		        <colgroup>
		            <col width="15%"/>
		            <col width="25%"/>
		            <col width="*"/>
		        </colgroup>
		        <tbody>
		        	<tr>
		                <th class="tcenter">상영영화</th>
		                <td>
		                	<div class="comboMovie"></div>
		                	<input type="hidden" id="MOVIE_NO" name="MOVIE_NO">
		                </td>
		                <td></td>
		            </tr>
		        	<tr>
		                <th class="tcenter">상영극장</th>
		                <td>
		                	<div class="comboTheater"></div>
		                	<input type="hidden" id="THEATER_NO" name="THEATER_NO">
	 	                </td>
	 	                <td></td>
		            </tr>
		            <tr>
		                <th class="tcenter">상영관</th>
		                <td colspan="2" style="padding: 15px 10px">
		                	<div class="comboHall">상영극장을 선택하시면 선택한 극장에 등록된 상영관이 조회됩니다.</div>
		                	<input type="hidden" id="HALL_NO" name="HALL_NO">
		                	<input type="hidden" id="SEAT_CNT" name="SEAT_CNT">
	 	                </td>
		            </tr>
		            <tr>
		        		<th class="tcenter">상영일</th>
		        		<td>
		        			<input type="text" id="SHOW_DT" name="SHOW_DT" size="30">
		        		</td>
		        		<td></td>
		        	</tr>
		        	<tr>
		                <th class="tcenter">상영시간</th>
		                <td colspan="2">
		                	<input type="number" class="startTime" id="HOUR" min="0" max="23" maxlength="2" size="2" placeholder="00"> :
		                	<input type="number" class="startTime" id="MINUTE" min="0" max="59" maxlength="2" size="2" placeholder="00" step="5">
		                	<input type="button" id="btn_add" class="btn_gray" value="추가">
		                	<div class="startTimeWrap"></div>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		    
			<div class="btn_wrap">
				<input type="button" id="btn_save" class="btn_orange" value="저장">
			</div>
		</form>
		<!-- time write end -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		
		$(document).ready(function() {
			
			//상영영화 조회
			fn_getMovieList();
			
			//상영극장 조회
			fn_getTheaterList();
			
			//상영영화 선택 시 '영화번호' 세팅
			$(".comboMovie").on("selectivity-selected", function(e) {
				var movieNo = e.originalEvent.item.id;
				$("#MOVIE_NO").val(movieNo);
			});
			
			//상영극장 선택 시 '극장번호' 세팅 / 선택한 상영극장의 상영관 조회
			$(".comboTheater").on("selectivity-selected", function(e) {
				var theaterNO = e.originalEvent.item.id;
				$("#THEATER_NO").val(theaterNO);
				
				fn_getHallList(theaterNO);
			});
			
			//상영관 선택시 '상영관 번호', '좌석 수' 세팅
			$(".comboHall").on("selectivity-selected", function(e) {
				var hallNo = e.originalEvent.item.id;
				var seatCnt = e.originalEvent.item.cnt;
				$("#HALL_NO").val(hallNo);
				$("#SEAT_CNT").val(seatCnt);
			});
			
			//저장 버튼
			$("#btn_save").click(function() {	
				if(fn_validate() == true) {
					fn_insertTime();
				}
			});
	    });
		
		//상영시간 maxLength = '2'
		$(document).on('input', '.startTime', function(e) {
			var maxLength = $(this).attr('maxLength');
			if($(this).val().length > maxLength) {
				var hour = $(this).val().slice(0, maxLength);
				$(this).val(hour);
			}
		});
		
		//상영시간 포맷 = 'hh:mm'
		$(document).on('change', '.startTime', function(e) {
			if($(this).val().length == 1) {
				var hour = '0' + $(this).val();	//1자리면 앞에 '0' 붙임
				$(this).val(hour);
			} 
			else {
				var max = $(this).attr('max');	//max 보다 크면 max 값 세팅
				if($(this).val() > max) {
					$(this).val(max);
				}
			}
		});
		
		//상영시간 추가 버튼
		$("#btn_add").click(function() {
			if(gfn_isNull($("#HOUR").val())) {
				alert("시간을 입력해주세요.");
				$("#HOUR").focus();
				return false;
			}
			if(gfn_isNull($("#MINUTE").val())) {
				alert("분을 입력해주세요.");
				$("#MINUTE").focus();
				return false;
			}
			var startTime = $("#HOUR").val() + ":" + $("#MINUTE").val();
			if($(".startTimeDiv").text().indexOf(startTime) > -1) {
				alert("입력한 상영시간이 이미 추가되었습니다.");
				return false;
			}
			var html = '';
			html += "<div class='startTimeDiv'>";
			html += "<a href='#'><img src='${pageContext.request.contextPath}/images/close.png'></a> ";
			html += startTime;
			html += "</div>";
			$(".startTimeWrap").append(html);
			
			$("#HOUR").val('').focus();
			$("#MINUTE").val('');
		});
		
		//상영시간 삭제버튼
		$(document).on('click', '.startTimeDiv a', function() {
			$(this).parent().remove();
		});
		
		//상영영화 조회
		function fn_getMovieList() {
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/movie/selectAllMovieList.do' />",
	            success : function(result) {
	            	var list = result.list;
	            	
	            	if(list.length > 0) {
	            		
		            	var movieObj = new Object();
		            	var movieArr = new Array();
		            	
		            	for(var i=0; i<list.length; i++) {
		            		movieObj = {id : list[i].MOVIE_NO, text : list[i].MOVIE_NAME};
			            	movieArr.push(movieObj);
		            	}
		            	
		            	$(".comboMovie").selectivity({
		            	    allowClear: true,
		            	    items: movieArr,
		            	    placeholder: '영화를 선택하세요',
		            	    showSearchInputInDropdown: false
		            	});
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//영화관 조회
		function fn_getTheaterList() {
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/theater/selectAllTheaterList.do' />",
	            success : function(result) {
	            	var list = result.list;
	            	
	            	if(list.length > 0) {
            			var theaterArr = new Array();
	            		
            			setTheaterCombobox(list, "서울", theaterArr);
            			setTheaterCombobox(list, "경기", theaterArr);
            			setTheaterCombobox(list, "인천", theaterArr);
            			setTheaterCombobox(list, "대전/충청/세종", theaterArr);
            			setTheaterCombobox(list, "부산/대구/경상", theaterArr);
            			setTheaterCombobox(list, "광주/전라", theaterArr);
            			setTheaterCombobox(list, "강원", theaterArr);
	            		setTheaterCombobox(list, "제주", theaterArr);
	            		
	            		$(".comboTheater").selectivity({
		            	    allowClear: true,
		            	    items: theaterArr,
		            	    placeholder: '상영극장을 선택하세요',
		            	    showSearchInputInDropdown: false
		            	});
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//영화관 콤보박스 세팅
		function setTheaterCombobox(list, region, theaterArr) {
			
			var theaterObj = new Object();
			var subObj = new Object();
    		var subArr = new Array();
						
    		for(var i=0; i<list.length; i++) {
    			if(list[i].REGION == region) {
    				subObj = {id : list[i].THEATER_NO, text : list[i].THEATER_NAME};
        			subArr.push(subObj);
    			}
        	}
    		
    		theaterObj.id      = region;
			theaterObj.text    = region;
    		theaterObj.submenu = {
					items : subArr,
					showSearchInput: false
			}
			theaterArr.push(theaterObj);
		}
		
		//상영관 조회
		function fn_getHallList(theaterNO) {
			
			var param = {
					THEATER_NO : theaterNO
			};
		
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/hall/selectHallList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	$(".comboHall").selectivity("destroy");
	            	
	            	if(list.length > 0) {
	            		
	            		$(".comboHall").parent().removeAttr("colspan");
	            		
	            		var hallObj = new Object();
						var hallArr = new Array();
	            		
	            		for(var i=0; i<list.length; i++) {
	            			hallObj = {id : list[i].HALL_NO, text : list[i].HALL_NAME, cnt : list[i].SEAT_CNT};
	            			hallArr.push(hallObj);
	                	}
	            		
	            		$(".comboHall").selectivity({
		            	    allowClear: true,
		            	    items: hallArr,
		            	    placeholder: '상영관을 선택하세요',
		            	    showSearchInputInDropdown: false
		            	});
	            	}
	            	else {
	            		$(".comboHall").parent().attr("colspan", "2");
	            		$(".comboHall").text("등록된 상영관이 없습니다.");
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//유효성 검사
		function fn_validate() {
			if(gfn_isNull($("#MOVIE_NO").val())) {
				alert("상영영화를 선택해주세요.");
				$(".comboMovie").focus();
				return false;
			}
			if(gfn_isNull($("#THEATER_NO").val())) {
				alert("상영극장을 선택해주세요.");
				$(".comboTheater").focus();
				return false;
			}
			if(gfn_isNull($("#HALL_NO").val())) {
				alert("상영관을 선택해주세요.");
				$(".comboHall").focus();
				return false;
			}
			if(gfn_isNull($("#SHOW_DT").val())) {
				alert("상영일을 선택해주세요.");
				$("#SHOW_DT").focus();
				return false;
			}
			if($(".startTimeDiv").size() == 0) {
				alert("상영시간을 추가 해주세요.");
				$("#HOUR").val('').focus();
				$("#MINUTE").val('');
				return false;
			}
			return true;
		}
		
		//상영시간 저장
		function fn_insertTime() {
			
			var commaTime = "";
			
			$(".startTimeDiv").each(function() {
				var time = $.trim($(this).text());
				commaTime += time + ",";
			});
			
			commaTime = commaTime.substr(0, commaTime.length -1);
						
			var param = $("#frm").serializeArray();
			param.push({name : "START_TIME", value : commaTime});
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/time/insertTime.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openTimeForm();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//상영시간 등록화면 새로고침
		function fn_openTimeForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "VTI");
		    comSubmit.submit();
		}
		
		//상영일 달력
		$("#SHOW_DT").datepicker({
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
            maxDate: '+7d'
        });
	</script>	
</body>
</html>