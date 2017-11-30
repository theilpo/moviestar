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
	
		<div class="title">공지사항</div>
		<div class="explain">'무비스타'에서 알려드리는 다양한 소식을 만나보세요.</div>
		<div class="etc">&nbsp;</div>
		
		<hr style="clear: right;">
		
		<!-- Start Notice -->
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
	                <th class="tcenter">작성일</th>
	                <td>${map.CREA_DTM }</td>
	            </tr>
	            <tr>
	            	<th class="tcenter">제목</th>
	                <td>${map.TITLE }</td>
	                <th class="tcenter">조회수</th>
	                <td>${map.HIT_CNT }</td>
	            </tr>
	        </tbody>
	    </table>
	    
	    <textarea class="ckeditor" id="NS_editor" name="NS_editor">${map.CONTENTS }</textarea>
	    <!-- End Notice -->
	    
	    
	    <div class="btn_wrap">
			<input type="button" id="btn_list" class="btn_orange" value="목록">
		</div>
		
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#btn_list").click(function() {
				fn_openNoticeList();
			});
	    });
		
		//공지사항 목록 이동
		function fn_openNoticeList() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/notice/selectNoticeList.do' />");
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