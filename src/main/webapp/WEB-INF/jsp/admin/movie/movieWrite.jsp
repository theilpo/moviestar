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
	
		<div class="menu_title">영화 등록</div>
		
		<form id="frm" name="frm" enctype="multipart/form-data">
		
			<!-- movie write start -->
			<table class="write_common_table">
		        <colgroup>
		            <col width="15%"/>
		            <col width="35%"/>
		            <col width="15%"/>
		            <col width="35%"/>
		        </colgroup>
		        <tbody>
		        	<tr>
		                <th class="tcenter">영화명</th>
		                <td colspan="3">
		                	<input type="text" id="MOVIE_NAME" name="MOVIE_NAME" size="70">
		                </td>
		            </tr>
		        	<tr>
		                <th class="tcenter">장르</th>
		                <td colspan="3">
							<div class="genreDiv"></div>
		                </td>
		            </tr>
		        	<tr>
		        		<th class="tcenter">개봉일</th>
		        		<td colspan="3">
		        			<input type="text" id="PLAY_DT" name="PLAY_DT" size="45">
		        		</td>
		        	</tr>
		            <tr>
		                <th class="tcenter">감독</th>
		                <td colspan="3">
		                	<input type="text" id="DIRECTOR" name="DIRECTOR" size="70">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">출연진</th>
		                <td colspan="3">
		                	<input type="text" id="ACTOR" name="ACTOR" size="70">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">등급</th>
		                <td colspan="3">
		                	<select id="GRADE" name="GRADE" style="width: 290px;">
		                		<option value="12">12</option>
		                		<option value="15">15</option>
		                		<option value="청불">청불</option>
		                		<option value="전체">전체</option>
		                	</select>
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">상영시간</th>
		                <td colspan="3">
		                	<input type="text" id="RUN_TIME" name="RUN_TIME" size="45" maxlength="3">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">동영상 URL</th>
		                <td colspan="3">
		                	<input type="text" id="PREVIEW_URL" name="PREVIEW_URL" size="70">
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">영화 포스터 사진</th>
		                <td colspan="3">
		                	<input type="text" id="MOVIE_MAIN_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="MOVIE_MAIN_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('MOVIE_MAIN_FILE').value = this.value">
		                	</div>
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">사진 [1]</th>
		                <td>
		                	<input type="text" id="MOVIE_SUB1_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="MOVIE_SUB1_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('MOVIE_SUB1_FILE').value = this.value">
		                	</div>
		                </td>
		                <th class="tcenter">사진 [2]</th>
		                <td>
		                	<input type="text" id="MOVIE_SUB2_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="MOVIE_SUB2_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('MOVIE_SUB2_FILE').value = this.value">
		                	</div>
		                </td>
		            </tr>
		            <tr>
		                <th class="tcenter">사진 [3]</th>
		                <td>
		                	<input type="text" id="MOVIE_SUB3_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="MOVIE_SUB3_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('MOVIE_SUB3_FILE').value = this.value">
		                	</div>
		                </td>
		                <th class="tcenter">사진 [4]</th>
		                <td>
		                	<input type="text" id="MOVIE_SUB4_FILE" class="file_input_textbox" readonly="readonly" size="45">
		                	
		                	<div class="file_input_div">
		                		<input type="button" class="file_input_button" value="FIND FILE">
		                		<input type="file" name="MOVIE_SUB4_FILE" class="file_input_hidden" onchange="javascript: document.getElementById('MOVIE_SUB4_FILE').value = this.value">
		                	</div>
		                </td>
		            </tr>
		            <tr>
		            	<th class="tcenter">줄거리</th>
		            	<td colspan="3">
		            		<textarea class="ckeditor" id="MI_editor" name="MI_editor"></textarea>
		            	</td>
		            </tr>
		        </tbody>
		    </table>
		    <!-- movie write end -->
		    
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
					fn_insertMovie();
				}
			});
			
			$("#RUN_TIME").keyup(function() {	//상영시간 숫자만 입력
				this.value = this.value.replace(/[^0-9]/g, '');
			});
	    });
		
		//영화 등록
		function fn_insertMovie() {

			var selectedGenre = $(".genreDiv").text();
			var commaGenre    = "";
			
			if(selectedGenre.indexOf("SF") > -1)		commaGenre += "SF, ";
			if(selectedGenre.indexOf("드라마") > -1)		commaGenre += "드라마, ";
			if(selectedGenre.indexOf("멜로/로맨스") > -1)	commaGenre += "멜로/로맨스, "; 
			if(selectedGenre.indexOf("코미디") > -1) 		commaGenre += "코미디, ";
			if(selectedGenre.indexOf("스릴러") > -1)  	commaGenre += "스릴러, ";
			if(selectedGenre.indexOf("애니메이션") > -1) 	commaGenre += "애니메이션, ";
			if(selectedGenre.indexOf("스포츠") > -1)  	commaGenre += "스포츠, ";
			if(selectedGenre.indexOf("액션") > -1)  		commaGenre += "액션, ";
			
			commaGenre = commaGenre.substr(0, commaGenre.length -2);

			var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/movie/insertMovie.do' />");
            comSubmit.addParam("GENRE", commaGenre);
            comSubmit.addParam("CONTENTS", CKEDITOR.instances.MI_editor.getData());
            comSubmit.submit();
		}
		
		//유효성 검사
		function fn_validate() {
			if(gfn_isNull($("#MOVIE_NAME").val())) {
				alert("영화명을 입력해주세요.");
				$("#MOVIE_NAME").focus();
				return false;
			}
			if(gfn_isNull($(".genreDiv").text())) {
				alert("장르를 선택해주세요.");
				$(".genreDiv").focus();
				return false;
			}
			if(gfn_isNull($("#PLAY_DT").val())) {
				alert("개봉일을 선택해주세요.");
				$("#PLAY_DT").focus();
				return false;
			}
			if(gfn_isNull($("#DIRECTOR").val())) {
				alert("감독을 입력해주세요.");
				$("#DIRECTOR").focus();
				return false;
			}
			if(gfn_isNull($("#ACTOR").val())) {
				alert("출연진을 입력해주세요.");
				$("#ACTOR").focus();
				return false;
			}
			if(gfn_isNull($("#RUN_TIME").val())) {
				alert("상영시간을 입력해주세요.");
				$("#RUN_TIME").focus();
				return false;
			}
			if(gfn_isNull($("#PREVIEW_URL").val())) {
				alert("동영상 URL을 입력해주세요.");
				$("#PREVIEW_URL").focus();
				return false;
			}
			if(gfn_isNull($("#MOVIE_MAIN_FILE").val())) {
				alert("영화 포스터 사진을 선택해주세요.");
				$("#MOVIE_MAIN_FILE").focus();
				return false;
			}
			if(gfn_isNull($("#MOVIE_SUB1_FILE").val())) {
				alert("사진 [1]을 선택해주세요.");
				$("#MOVIE_SUB1_FILE").focus();
				return false;
			}
			if(gfn_isNull($("#MOVIE_SUB2_FILE").val())) {
				alert("사진 [2]를 선택해주세요.");
				$("#MOVIE_SUB2_FILE").focus();
				return false;
			}
			if(gfn_isNull($("#MOVIE_SUB3_FILE").val())) {
				alert("사진 [3]을 선택해주세요.");
				$("#MOVIE_SUB3_FILE").focus();
				return false;
			}
			if(gfn_isNull($("#MOVIE_SUB4_FILE").val())) {
				alert("사진 [4]를 선택해주세요.");
				$("#MOVIE_SUB4_FILE").focus();
				return false;
			}
			if(gfn_isNull(CKEDITOR.instances.MI_editor.getData())) {
				alert("줄거리/상세내용을 입력해주세요.");
				CKEDITOR.instances.MI_editor.focus();
				return false;
			}
			return true;
		}
		
		//장르 콤보박스
		$('.genreDiv').selectivity({		
		    items: ['SF', '드라마', '멜로/로맨스', '코미디', '스릴러', '애니메이션', '스포츠', '액션'],
		    multiple: true,
		    placeholder: '장르를 선택해주세요.'
		});
		
		//개봉일 달력
		$("#PLAY_DT").datepicker({
			showOn: "both",
			buttonImage: "<c:url value='/images/calendar.gif'/>",
			buttonImageOnly: true,
            dateFormat: "yy-mm-dd",
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true,
            changeYear: true,
            minDate: gfn_getToday(),
            maxDate: '+14d'
        });
		
		//에디터 설정
		CKEDITOR.replace( 'MI_editor', {
			height : 300,
			toolbar : [
				['Bold', 'Underline', 'TextColor', 'HorizontalRule']
		  	],
			enterMode : '2'	//엔터시 <br>
	    });
	</script>	
</body>
</html>