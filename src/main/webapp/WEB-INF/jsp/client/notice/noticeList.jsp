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
			<thead>
				<tr>
					<th width="5%"></th>
					<th width="15%">No</th>
					<th width="*">제목</th>
					<th width="20%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach var="notice" items="${list }">
							<tr>
								<td></td>
								<td id="IDX">${notice.IDX }</td>
								<td>
									<a class="notice_title" href="#">${notice.TITLE }</a>
								</td>
								<td>${notice.CREA_DTM }</td>
								<td>${notice.HIT_CNT }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
	                        <td colspan="5" class="tcenter">조회된 결과가 없습니다.</td>
	                    </tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<!-- End Notice -->
		
		<div id="pageNav"></div>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$(".notice_title").click(function(e) {	//제목 클릭
				e.preventDefault();
				openNoticeDetailForm($(this));
			});
			
			//페이징 처리
			var page = gfn_paging("${page.totalCount}", "${page.countPerPage}", "${page.pageNavSize}", "${page.currPage}", "notice");
			$("#pageNav").empty().html(page);
	    });
		
		//페이지 이동
		function goPage_notice(pageNo) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/notice/selectNoticeList.do' />");
		    comSubmit.addParam("pageNo", pageNo);
		    comSubmit.addParam("countPerPage", 10);
		    comSubmit.submit();
		}
		
		//공지사항 상세페이지 이동
		function openNoticeDetailForm(obj) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/notice/selectNoticeDetail.do' />");
		    comSubmit.addParam("IDX", obj.parent().siblings("#IDX").text());
		    comSubmit.addParam("HIT_GB", "C");
		    comSubmit.submit();
		}
	</script>	
</body>
</html>