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
	
		<div class="menu_title">1:1 문의내역</div>
		
		<!-- request list start -->
		<table class="common_table">
			<thead>
				<tr>
					<th width="5%"></th>
					<th width="15%">No</th>
					<th width="*">제목</th>
					<th width="15%">작성자</th>
					<th width="15%">등록일</th>
					<th width="15%">답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="request" items="${list }">
							<tr>
								<td></td>
								<td id="IDX">${request.IDX }</td>
								<td>
									<a class="request_title" href="#">${request.TITLE }</a>
									<input type="hidden" id="ANSWER_GB" name="ANSWER_GB" value="${request.ANSWER_GB }">
								</td>
								<td>${request.REQ_ID }</td>
								<td>${request.REQ_DTM }</td>
								<td>
									<c:if test="${request.ANSWER_GB == 'N'}"><span style="color: red;">답변대기중</span></c:if>
									<c:if test="${request.ANSWER_GB == 'Y'}"><span>답변완료</span></c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
	                        <td class="tcenter" colspan="6">조회된 결과가 없습니다.</td>
	                    </tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<div id="pageNav"></div>
		<!-- request list end -->
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".request_title").click(function(e) {	//제목 클릭
				e.preventDefault();
				openRequestAnswerForm($(this));
			});
			
			//페이징 처리
			var page = gfn_paging("${page.totalCount}", "${page.countPerPage}", "${page.pageNavSize}", "${page.currPage}", "request");
			$("#pageNav").empty().html(page);
	    });
		
		//페이지 이동
		function goPage_request(pageNo) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", "RL");
		    comSubmit.addParam("pageNo", pageNo);
		    comSubmit.addParam("countPerPage", 10);
		    comSubmit.submit();
		}
		
		//문의 답변 폼 이동
		function openRequestAnswerForm(obj) {
			
			var answerGB = obj.next().val();
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("MENU_GB", answerGB == "N" ? "RI" : "RS");	//RI : 답변작성, RS : 답변상세
		    comSubmit.addParam("ANSWER_GB", answerGB);
		    comSubmit.addParam("IDX", obj.parent().siblings("#IDX").text());
		    comSubmit.submit();
		}
	</script>	
</body>
</html>