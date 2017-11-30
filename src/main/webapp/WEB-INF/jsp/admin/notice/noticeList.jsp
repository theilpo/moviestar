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
	
		<div class="menu_title">공지사항 목록</div>
		
		<div class="del_notice_wrap">
			<input type="button" id="del_notice" class="btn_gray" value="선택삭제">
		</div>
		
		<table class="common_table">
			<thead>
				<tr>
					<th width="6%">
						<input type="checkbox" id="CHK_ALL" name="CHK_ALL">
					</th>
					<th width="8%">No</th>
					<th width="*">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
					<th width="8%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach var="notice" items="${list }">
							<tr>
								<td>
									<input type="checkbox" id="CHK" name="CHK">
								</td>
								<td id="IDX">${notice.IDX }</td>
								<td>
									<a class="notice_title" href="#">${notice.TITLE }</a>
								</td>
								<td>${notice.CREA_ID }</td>
								<td>${notice.CREA_DTM }</td>
								<td>${notice.HIT_CNT }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
	                        <td colspan="6" class="tcenter">조회된 결과가 없습니다.</td>
	                    </tr>
					</c:otherwise>
				</c:choose>
				
			</tbody>
		</table>
		
		<div id="pageNav"></div>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#CHK_ALL").click(function() {	//전체선택/해제 체크박스
				fn_allCheckbox($(this));
			});
			
			$(".notice_title").click(function(e) {	//제목 클릭
				e.preventDefault();
				openNoticeDetailForm($(this));
			});
			
			$("#del_notice").click(function() {	//선택삭제 버튼
				fn_deleteNotice();
			});
			
			//페이징 처리
			var page = gfn_paging("${page.totalCount}", "${page.countPerPage}", "${page.pageNavSize}", "${page.currPage}", "notice");
			$("#pageNav").empty().html(page);
	    });
		
		//페이지 이동
		function goPage_notice(pageNo) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NL");
		    comSubmit.addParam("pageNo", pageNo);
		    comSubmit.addParam("countPerPage", 10);
		    comSubmit.submit();
		}
		
		//공지사항 상세페이지 이동
		function openNoticeDetailForm(obj) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NS");	//공지사항 상세
		    comSubmit.addParam("HIT_GB", "A");
		    comSubmit.addParam("IDX", obj.parent().siblings("#IDX").text());
		    comSubmit.submit();
		}
		
		//공지삭제
		function fn_deleteNotice() {
			
			var chkCnt = 0;
			var chkParam = "";
			
			$("input:checkbox[name='CHK']:checked").each(function() {				
				chkCnt++;
				chkParam += $(this).parent().siblings("#IDX").text() + ",";
			});
			chkParam = chkParam.substr(0, chkParam.length -1);
			
			if(chkCnt == 0) {
				alert("삭제할 공지를 선택해주세요.");
				return false;
			}
			
			if(confirm("선택한 공지를 삭제하시겠습니까?") == true) {
				var param = {
						CHK_IDX : chkParam
				};

				$.ajax({
		            type : "POST",
		            url : "<c:url value='/notice/multiDeleteNotice.do' />",
		            data : param,
		            success : function(result) {
		            	fn_openNoticeListForm();
		            },
		            error : function(errMsg){
		                alert("error : "+ errMsg);
		            }
		        });
			}
		}
		
		//공지사항 목록 이동
		function fn_openNoticeListForm() {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "NL");
		    comSubmit.submit();
		}
	</script>	
</body>
</html>