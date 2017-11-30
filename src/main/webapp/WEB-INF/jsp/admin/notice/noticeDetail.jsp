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
	
		<div class="menu_title">공지사항 상세</div>
		
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
	                <td colspan="3">${map.TITLE }</td>
	            </tr>
	        </tbody>
	    </table>
	    
	    <textarea class="ckeditor" id="NS_editor" name="NS_editor" readonly="readonly">${map.CONTENTS }</textarea>
	    
	    <input type="hidden" id="IDX" value="${map.IDX }">
	    
	    <!-- button start -->
		<div class="btn_wrap">
			<input type="button" id="btn_upt_notice" class="btn_orange" value="수정">
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
				fn_openNoticeUpdateForm();
			});
	    });
		
		//공지사항 목록 이동
		function fn_openNoticeListForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NL");
		    comSubmit.submit();
		}
		
		//공지사항 수정화면 이동
		function fn_openNoticeUpdateForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NU");
		    comSubmit.addParam("HIT_GB", "A");
		    comSubmit.addParam("IDX", $("#IDX").val());
		    comSubmit.submit();
		}
		
		//에디터 설정
		CKEDITOR.replace( 'NS_editor', {
			height : 300,
			readOnly: true, 
			removePlugins: 'elementspath',
			toolbarCanCollapse : true,
			toolbarStartupExpanded: false,
			toolbar : [
				[ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ],
				[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ],				
				[ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ],
				[ 'Link', 'Unlink', 'Anchor' ],
				[ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ],
				'/',
				[ 'Styles', 'Format', 'Font', 'FontSize' ],
				['TextColor', 'BGColor' ]
			]
			//filebrowserImageUploadUrl : '/dev-guide/ckeditorImageUpload.do'
	    });
	</script>	
</body>
</html>