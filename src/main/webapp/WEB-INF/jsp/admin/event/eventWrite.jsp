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
	
		<div class="menu_title">이벤트 등록</div>
		
		<form id="frm" name="frm" enctype="multipart/form-data">
		
			<!-- event write start -->
			<table class="write_common_table">
		        <colgroup>
		            <col width="20%"/>
		            <col width="30%"/>
		            <col width="20%"/>
		            <col width="30%"/>
		        </colgroup>
		        <tbody>
		        	<tr>
		                <th class="tcenter">이벤트 제목</th>
		                <td colspan="3">
		                	<input type="text" id="TITLE" name="TITLE" size="50">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">이벤트 시작일</th>
		                <td>
		                	<input type="text" id="START_DT" name="START_DT" size="30">
		                </td>
		                <th class="tcenter">이벤트 종료일</th>
		                <td>
		                	<input type="text" id="END_DT" name="END_DT" size="30">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">적립금</th>
		                <td colspan="3">
		                	<select id="POINT" name="POINT" style="width: 200px;">
		                		<option value="500">500</option>
		                		<option value="1000">1000</option>
		                		<option value="1500">1500</option>
		                		<option value="2000">2000</option>
		                	</select>
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">이벤트 메인 사진</th>
		                <td colspan="3">
		                	<input type="text" id="MAIN_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="MAIN_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('MAIN_FILE').value = this.value">
		                	</div>
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">이벤트 상세 사진</th>
		                <td colspan="3">
		                	<input type="text" id="SUB_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="SUB_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('SUB_FILE').value = this.value">
		                	</div>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <textarea class="ckeditor" id="EI_editor" name="EI_editor"></textarea>
		    <!-- event write end -->
		    
			<div class="btn_wrap">
				<input type="button" id="btn_save" class="btn_orange" value="저장">
			</div>
		</form>	
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$("#btn_save").click(function() {	//저장 버튼
				if(fn_validate() == true) {
					fn_insertEvent();	
				}
			});
			
	    });
		
		//이벤트 등록
		function fn_insertEvent() {
			var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/event/insertEvent.do' />");
            comSubmit.addParam("CONTENTS", CKEDITOR.instances.EI_editor.getData());
            comSubmit.submit();
		}
		
		//유효성 검사
		function fn_validate() {
			if(gfn_isNull($("#TITLE").val())) {
				alert("이벤트 제목을 입력해주세요.");
				$("#TITLE").focus();
				return false;
			}
			if(gfn_isNull($("#START_DT").val())) {
				alert("이벤트 시작일을 선택해주세요.");
				$("#START_DT").focus();
				return false;
			}
			if(gfn_isNull($("#END_DT").val())) {
				alert("이벤트 종료일을 선택해주세요.");
				$("#END_DT").focus();
				return false;
			}
			if(gfn_isNull($("#MAIN_FILE").val())) {
				alert("이벤트 메인사진을 선택해주세요.");
				$("#MAIN_FILE").focus();
				return false;
			}
			if(gfn_isNull($("#SUB_FILE").val())) {
				alert("이벤트 상세사진을 선택해주세요.");
				$("#SUB_FILE").focus();
				return false;
			}
			if(gfn_isNull(CKEDITOR.instances.EI_editor.getData())) {
				alert("내용을 입력해주세요.");
				CKEDITOR.instances.EI_editor.focus();
				return false;
			}
			return true;
		}
		
		// 시작일 설정 시 종료일의 min Date 지정
        $("#START_DT").datepicker({
        	showOn: "both",
			buttonImage: "<c:url value='/images/calendar.gif'/>",
            dateFormat: "yy-mm-dd",
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true ,
            changeYear: true,
            onClose: function( selectedDate ) {
                $("#END_DT").datepicker("option", "minDate", selectedDate );
            }
        });
		
        //종료일 설정 시 시작일 max Date 지정
        $("#END_DT").datepicker({
        	showOn: "both",
			buttonImage: "<c:url value='/images/calendar.gif'/>",
            dateFormat: "yy-mm-dd",
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true ,
            changeYear: true,
            onClose: function(selectedDate) {
                $("#START_DT").datepicker("option", "maxDate", selectedDate );
            }
        });
        
		//에디터 설정
		CKEDITOR.replace( 'EI_editor', {
			height : 300,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
		  	],
			enterMode : '2'	//엔터시 <br>
			//filebrowserImageUploadUrl : '/dev-guide/ckeditorImageUpload.do'
	    });
	</script>	
</body>
</html>