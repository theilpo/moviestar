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
	
		<div class="menu_title">공지사항 수정</div>
		
		<div class="list_notice_wrap">
			<input type="button" id="list_notice" class="btn_gray" value="목록">
		</div>
		
		<table class="common_table">
	        <colgroup>
	            <col width="15%"/>
	            <col width="35%"/>
	            <col width="15%"/>
	            <col width="35%"/>
	        </colgroup>
	        <tbody>
	            <tr>
	                <th class="tcenter">No</th>
	                <td>${map.IDX }</td>
	                <th class="tcenter">조회수</th>
	                <td>${map.HIT_CNT }</td>
	            </tr>
	            <tr>
	                <th class="tcenter">작성자</th>
	                <td>${map.CREA_ID }</td>
	                <th class="tcenter">작성일</th>
	                <td>${map.CREA_DTM }</td>
	            </tr>
	            <tr>
	                <th class="tcenter">제목</th>
	                <td colspan="3"><input type="text" id="TITLE" value="${map.TITLE }" size="50"></td>
	            </tr>
	        </tbody>
	    </table>
	    
	    <textarea class="ckeditor" id="NU_editor" name="NU_editor">${map.CONTENTS }</textarea>
	    
	    <input type="hidden" id="IDX" value="${map.IDX }">
	    
	    <!-- button start -->
		<div class="btn_wrap">
			<input type="button" id="btn_upt_notice" class="btn_orange" value="수정">
			<input type="button" id="btn_del_notice" class="btn_gray" value="삭제">
		</div>
		<!-- button end -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#list_notice").click(function() {	//목록 버튼
				fn_openNoticeListForm();
			});
			
			$("#btn_upt_notice").click(function() {	//수정 버튼
				
				if(CKEDITOR_byteCheck("NU_editor") > 4000) {
					alert("입력 가능 문자수를 초과하였습니다");
					CKEDITOR.instances.NU_editor.focus();
					return false;
				}else {
					fn_updateNotice();	
				}
			});
			
			$("#btn_del_notice").click(function() {	//삭제 버튼
				if(confirm("공지를 삭제하시겠습니까?") == true) {
					fn_deleteNotice();
				}
			});
	    });
		
		//공지사항 목록 이동
		function fn_openNoticeListForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NL");
		    comSubmit.submit();
		}
		
		//공지사항 수정
		function fn_updateNotice() {
			var param = {
					TITLE : $("#TITLE").val(),
					CONTENTS : CKEDITOR.instances.NU_editor.getData(),
					IDX : $("#IDX").val()
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/notice/updateNotice.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openNoticeDetailForm();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//상세화면 이동
		function fn_openNoticeDetailForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NS");
		    comSubmit.addParam("HIT_GB", "A");
		    comSubmit.addParam("IDX", $("#IDX").val());
		    comSubmit.submit();
		}
		
		//공지사항 삭제
		function fn_deleteNotice() {
			var param = {
					IDX : $("#IDX").val()
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/notice/deleteNotice.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openNoticeListForm();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//에디터 설정
		CKEDITOR.replace( 'NU_editor', {
			height : 300,
			enterMode : '2'	//엔터시 <br>
			//filebrowserImageUploadUrl : '/dev-guide/ckeditorImageUpload.do'
	    });
	</script>	
</body>
</html>