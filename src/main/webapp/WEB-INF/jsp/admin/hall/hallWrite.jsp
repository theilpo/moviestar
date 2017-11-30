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
		
		<div class="menu_title">상영관 등록</div>
		
		<!-- hall write start -->
		<form id="frm" name="frm">
		
			<table class="write_common_table">
		        <colgroup>
		            <col width="15%"/>
		            <col width="20%"/>
		            <col width="*"/>
		        </colgroup>
		        <tbody>
		        	<tr>
		                <th class="tcenter">상영극장</th>
		                <td>
		                	<div class="comboTheater"></div>
		                	<input type="hidden" id="THEATER_NO" name="THEATER_NO">
	 	                </td>
	 	                <td></td>
	 	            </tr>
	 	           	<tr>
	 	                <th class="tcenter">현재 상영관</th>
		                <td colspan="2" style="padding: 15px 10px">
		                	<div class="hallDiv">상영극장을 선택하시면 선택한 극장에 등록된 상영관이 조회됩니다.</div>
	 	                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">상영관 이름</th>
		                <td>
		                	<input type="text" id="HALL_NAME" name="HALL_NAME" size="30">
	 	                </td>
	 	                <td></td>
	 	           	</tr>
	 	           	<tr>
	 	                <th class="tcenter">상영관 좌석수</th>
		                <td>
		                	<input type="text" id="SEAT_CNT" name="SEAT_CNT" size="30" maxlength="3">
	 	                </td>
	 	                <td></td>
		            </tr>
		        </tbody>
		    </table>
		    
			<div class="btn_wrap">
				<input type="button" id="btn_save" class="btn_orange" value="저장">
			</div>
		</form>
		<!-- hall write end -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			//상영극장 조회
			fn_getTheaterList();
			
			//선택한 상영극장의 상영관 조회
			$(".comboTheater").on("selectivity-selected", function(e) {
				var theaterNO = e.originalEvent.item.id;
				$("#THEATER_NO").val(theaterNO);
				
				fn_getHallList(theaterNO);
			});
			
			$("#btn_save").click(function() {	//저장 버튼
				fn_insertHall();
			});
			
			$("#SEAT_CNT").keyup(function() {	//좌석수 숫자만 입력
				this.value = this.value.replace(/[^0-9]/g, '');
			});
	    });
		
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
	            	
	            	if(list.length > 0) {
	            		var strHall = "";
	            		
            			for(var i=0; i<list.length; i++) {
            				strHall += list[i].HALL_NAME + "(" + list[i].SEAT_CNT + "), ";
            			}
            			strHall = strHall.substr(0, strHall.length -2);
            			$(".hallDiv").text(strHall);
	            	}
	            	else {
	            		$(".hallDiv").text("등록된 상영관이 없습니다.");
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//상영관 추가
		function fn_insertHall() {
			
			if(gfn_isNull($("#THEATER_NO").val())) {
				alert("상영극장을 선택해주세요.");
				$(".comboTheater").focus();
				return false;
			}
			if(gfn_isNull($("#HALL_NAME").val())) {
				alert("상영관 이름을 입력해주세요.");
				$("#HALL_NAME").focus();
				return false;
			}
			if(gfn_isNull($("#SEAT_CNT").val())) {
				alert("상영관 좌석수를 입력해주세요.");
				$("#SEAT_CNT").focus();
				return false;
			}
			if($("#SEAT_CNT").val() > 360) {
				alert("최대 좌석수는 360석 입니다.");
				$("#SEAT_CNT").val('').focus();
				return false;
			}
			
			var param = $("#frm").serialize();
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/hall/insertHall.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openHallForm();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//상영관 등록화면 새로고침
		function fn_openHallForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "HI");
		    comSubmit.submit();
		}
	</script>	
</body>
</html>