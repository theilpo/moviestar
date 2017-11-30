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
	
		<div class="menu_title">회원목록</div>
		
		<div class="member_gb">
			<span><img src="<c:url value='/images/admin.png'/>">관리자</span>
			<span><img src="<c:url value='/images/member.png'/>">회원</span>
		</div>
		
		<!-- member list start -->
		<table class="common_table">
			<thead>
				<tr>
					<th width="6%">No</th>
					<th width="6%">회원</th>
					<th width="12%">아이디</th>
					<th width="12%">이름</th>
					<th width="12%">생년월일</th>
					<th width="20%">이메일</th>
					<th width="26%">선호장르</th>
					<th width="6%"></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="member" items="${list }">
							<tr>
								<td>&nbsp;</td>
								<td>
									<c:if test="${member.MEM_GB == 'M' }">
										<img src="<c:url value='/images/member.png'/>">
									</c:if>
									<c:if test="${member.MEM_GB == 'A' }">
										<img src="<c:url value='/images/admin.png'/>">
									</c:if>
								</td>
								<td>${member.ID }</td>
								<td>${member.NAME_KO }</td>
								<td>${member.BIRTH_DT }</td>
								<td>${member.EMAIL }</td>
								<td>${member.GENRE }</td>
								<td>
									<a class="more" href="#">
										<img src="<c:url value='/images/more.png'/>">
										
										<!-- hidden -->
										<input type="hidden" id="MEM_GB" value="${member.MEM_GB }">
										<input type="hidden" id="ID" value="${member.ID }">
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
	                        <td class="tcenter" colspan="8">조회된 결과가 없습니다.</td>
	                    </tr>
					</c:otherwise>
				</c:choose>
				
			</tbody>
		</table>
		
		<div id="pageNav"></div>
		<!-- member list end -->
		
		<!-- ... more start -->
		<div class="more_hidden">
			<div class="more_close">
				<a href="#"><img src="<c:url value='/images/close.png'/>"></a>
			</div>
			<ul>
	        	<li><a class="changeGB" href="#">관리자로 변경</a></li>
	        	<li><a class="deleteMB" href="#">회원삭제</a></li>
	      	</ul>
	      	<!-- hidden -->
	      	<input type="hidden" id="CLK_MEM_GB">	<!-- 클릭한 행의 회원구분 -->
			<input type="hidden" id="CLK_ID">		<!-- 클릭한 행의 아이디 -->
		</div>
		<!-- ... more end -->	
	</div>	
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {

			$(".more").click(function(e) {		//... 버튼
				e.preventDefault();
				
				var MEM_GB = $(this).find("#MEM_GB").val();
				var MEM_ID = $(this).find("#ID").val();
				
				$("#CLK_MEM_GB").val(MEM_GB);
				$("#CLK_ID").val(MEM_ID);
				
				//... text 변경
				if(MEM_GB == "M")	
					$(".changeGB").text("관리자로 변경");
				else 				
					$(".changeGB").text("회원으로 변경");
				
				//... 드랍다운
				var top = e.clientY - 82;
				var left = e.clientX - 390;
				$(".more_hidden").css({"top" : top, "left" : left, "position" : "absolute"}).show();
			});

			$(".more_close").click(function(e) {	//close 버튼
				e.preventDefault();
				$(".more_hidden").css("display", "none");
			});
			
			$(".changeGB").click(function(e) {	//회원 <-> 관리자 변경 버튼
				e.preventDefault();
				fn_changeMemberGB();
			});
			
			$(".deleteMB").click(function(e) {	//회원삭제 버튼
				e.preventDefault();
				fn_deleteMember();
			});
			
			//페이징 처리
			var page = gfn_paging("${page.totalCount}", "${page.countPerPage}", "${page.pageNavSize}", "${page.currPage}", "member");
			$("#pageNav").empty().html(page);
	    });
		
		//페이지 이동
		function goPage_member(pageNo) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/common/admin.do' />");
		    comSubmit.addParam("pageNo", pageNo);
		    comSubmit.addParam("countPerPage", 10);
		    comSubmit.submit();
		}
		
		//회원 <-> 관리자 변경
		function fn_changeMemberGB() {			
			var param = {
					ID : $("#CLK_ID").val(),
					MEM_GB : $("#CLK_MEM_GB").val()
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/member/updateMemberGB.do' />",
	            data : param,
	            success : function(result){
	            	window.location = "<c:url value='/common/admin.do' />";
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//회원삭제
		function fn_deleteMember() {
			var param = {
					ID : $("#CLK_ID").val()
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/member/deleteMember.do' />",
	            data : param,
	            success : function(result){
	            	window.location = "<c:url value='/common/admin.do' />";
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
	</script>	
</body>
</html>