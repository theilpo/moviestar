<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">마이페이지</div>
		<div class="explain">${S_NAME_KO }(${S_ID })님, 다양한 서비스를 이용해보세요.</div>
		<div class="etc">&nbsp;</div>
		
		<hr style="clear: right;">
		
		<!-- Start MyPage -->
		<div class="mypage_wrap">
				
			<ul class="my_tab">
				<li data-tab="my_tab1" class="current"><a href="#">예매확인/취소</a></li>
				<li data-tab="my_tab2"><a href="#">나의 포인트</a></li>
				<li data-tab="my_tab3"><a href="#">나의 문의내역</a></li>
				<li data-tab="my_tab4"><a href="#">나의 한줄평</a></li>
				<li data-tab="my_tab5"><a href="#">개인정보수정</a></li>
			</ul>
			
			<!-- 예매확인/취소 -->
			<div id="my_tab1" class="my_tabcontent current">
				<table class="common_table">
					<thead>
						<tr>
							<th width="1%"></th>
							<th width="17%">예매번호</th>
							<th width="*">영화명</th>
							<th width="16%">영화관 / 상영관</th>
							<th width="14%">상영일시</th>
							<th width="13%">좌석</th>
							<th width="10%">예매일</th>
							<th width="10%">예매상태</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div id="pageNav"></div>
			</div>
			
			<!-- 나의 포인트 -->
			<div id="my_tab2" class="my_tabcontent">
				<table class="common_table">
					<thead>
						<tr>
							<th width="5%"></th>
							<th width="15%">No</th>
							<th width="20%">일자</th>
							<th width="*">내역</th>
							<th width="15%">포인트</th>
							<th width="15%">총 포인트</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div id="pageNav"></div>
			</div>
			
			<!-- 나의 문의내역 -->
			<div id="my_tab3" class="my_tabcontent">
				<table class="common_table">
					<thead>
						<tr>
							<th width="5%"></th>
							<th width="15%">No</th>
							<th width="*">제목</th>
							<th width="15%">등록일</th>
							<th width="15%">답변상태</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div id="pageNav"></div>
			</div>
			
			<!-- 나의 한줄평 -->
			<div id="my_tab4" class="my_tabcontent">
				<table class="common_table">
					<thead>
						<tr>
							<th width="5%"></th>
							<th width="10%">No</th>
							<th width="20%">영화</th>
							<th width="*">내용</th>
							<th width="10%">작성일</th>
							<th width="5%"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div id="pageNav"></div>
			</div>
						
			<!-- 개인정보수정 -->
			<div id="my_tab5" class="my_tabcontent">
				<div class="logo"><img src="<c:url value='/images/logo.png'/>"></div>
				<div class="text">비밀번호를 입력해주세요.</div>
				<div><input type="password" id="PASSWORD" name="PASSWORD" size="35" placeholder="Password"></div>
				<div class="btn_wrap"><input type="button" id="member_update" class="btn_orange" value="개인정보수정"></div>
			</div>
		</div>
		<!-- End MyPage -->
		
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			fn_myBookList();
			
			//마이페이지 TAP 기능
			$('ul.my_tab li').click(function(e) {
				
				e.preventDefault();
				
				var activeTab = $(this).attr('data-tab');
				$('ul.my_tab li').removeClass('current');
				$('.my_tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
				
				if(activeTab == 'my_tab1') {		//나의 예매확인/취소 탭
					fn_myBookList();
				}
				else if(activeTab == 'my_tab2') {	//나의 포인트 탭
					fn_myPointList();
				}
				else if(activeTab == 'my_tab3') {	//나의 문의내역 탭
					fn_myRequestList();
				}
				else if(activeTab == 'my_tab4') {	//나의 한줄평 탭
					fn_myCommentList();
				}
			});
			
			$('#member_update').click(function(e) {	//개인정보수정 버튼
				e.preventDefault();
				fn_openMemberUpdateForm();
			});
			
			$('#my_tab5 #PASSWORD').keydown(function(e) {
				if(e.keyCode == 13) {
					fn_openMemberUpdateForm();
				}
			});
		});
		
		//나의 예매 조회
		function fn_myBookList(pageNo) {
			var param = {
					BOOK_ID     : "${S_ID}",
					pageNo       : pageNo,
					countPerPage : 4
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/my/selectMyBookList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("#my_tab1 tbody").empty();
	            	
	            	if(list == null) {
	            		html += "<tr><td class='tcenter' colspan='8'>조회된 결과가 없습니다.</td></tr>";
	            		$("#my_tab1 tbody").append(html);
	            	}
	            	else {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<tr>";
	            			html += "<td>";
	            			html += "<input type='hidden' id='BOOK_NO' name='BOOK_NO' value='" + list[i].BOOK_NO + "'>";
	            			html += "<input type='hidden' id='USE_POINT' name='USE_POINT' value='" + list[i].USE_POINT + "'>";
	            			html += "<input type='hidden' id='BOOK_ID' name='BOOK_ID' value='" + list[i].BOOK_ID + "'>";
	            			html += "<input type='hidden' id='TIME_NO' name='TIME_NO' value='" + list[i].TIME_NO + "'>";
	            			html += "<input type='hidden' id='SEATS_NO' name='SEATS_NO' value='" + list[i].SEATS_NO + "'>";
	            			html += "<input type='hidden' id='MOVIE_NO' name='MOVIE_NO' value='" + list[i].MOVIE_NO + "'>";
	            			html += "</td>";
	            			html += "<td>" + list[i].BOOK_NO + "</td>";
	            			html += "<td>" + list[i].MOVIE_NAME + "</td>";
	            			html += "<td>" + list[i].THEATER_NAME + " / " + list[i].HALL_NAME + "</td>";
	            			html += "<td>" + list[i].SHOW_DT + " " + list[i].START_TIME + "</td>";
	            			html += "<td>" + list[i].SEATS_NO + "</td>";
	            			html += "<td>" + list[i].BOOK_DT + "</td>";
	            			if(list[i].STATUS == 'R') {
	            				html += "<td><input type='button' class='book_cancle' value='예매취소'></td>";
	            			} else {
	            				html += "<td style='color:red; padding-left:30px'>취소</td>";
	            			}
	            			html += "</tr>";
		            	}
	            		$("#my_tab1 tbody").append(html);
	            		
	            		//페이징 처리
		            	var page = result.page;
		    			var strPage = gfn_paging(page.totalCount, page.countPerPage, page.pageNavSize, page.currPage, "myBook");
		            	$("#my_tab1 #pageNav").empty().html(strPage);
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//나의 예매 - 페이지 이동
		function goPage_myBook(pageNo) {
			fn_myBookList(pageNo);
		}
		
		//나의 예매 - 예매취소
		$(document).on('click', '.book_cancle', function(e) {
			e.preventDefault();
			
			if(confirm("예매를 취소하시겠습니까?")) {
				var param = {
						BOOK_NO   : $(this).parent().siblings('td:eq(0)').find('#BOOK_NO').val(),
						USE_POINT : $(this).parent().siblings('td:eq(0)').find('#USE_POINT').val(),
						BOOK_ID   : $(this).parent().siblings('td:eq(0)').find('#BOOK_ID').val(),
						TIME_NO   : $(this).parent().siblings('td:eq(0)').find('#TIME_NO').val(),
						SEATS_NO  : $(this).parent().siblings('td:eq(0)').find('#SEATS_NO').val(),
						MOVIE_NO  : $(this).parent().siblings('td:eq(0)').find('#MOVIE_NO').val(),
						BOOK_GB   : 'C' 	/* R : 예매, C : 예매취소 */
				};
				
				$.ajax({
		            type : "POST",
		            url : "<c:url value='/book/cancleBook.do' />",
		            data : param,
		            success : function(result) {
		            	fn_myBookList();
		            },
		            error : function(errMsg){
		                alert("error : "+ errMsg);
		            }
		        });
			}
		});
		
		//나의 포인트 조회
		function fn_myPointList(pageNo) {
			var param = {
					POINT_ID     : "${S_ID}",
					pageNo       : pageNo,
					countPerPage : 5
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/my/selectMyPointList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("#my_tab2 tbody").empty();
	            	
	            	if(list == null) {
	            		html += "<tr><td class='tcenter' colspan='6'>조회된 결과가 없습니다.</td></tr>";
	            		$("#my_tab2 tbody").append(html);
	            	}
	            	else {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<tr>";
	            			html += "<td></td>";
	            			html += "<td>" + list[i].POINT_NO + "</td>";
	            			html += "<td>" + list[i].POINT_DT + "</td>";
	            			html += "<td>" + list[i].DETAILS + "</td>";
	            			html += "<td>" + list[i].POINT + " P</td>";
	            			html += "<td style='color: red'>" + list[i].TOT_POINT + " P</td>";
	            			html += "</tr>";
		            	}
	            		$("#my_tab2 tbody").append(html);
	            		
	            		//페이징 처리
		            	var page = result.page;
		    			var strPage = gfn_paging(page.totalCount, page.countPerPage, page.pageNavSize, page.currPage, "myPoint");
		            	$("#my_tab2 #pageNav").empty().html(strPage);
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//나의 포인트 - 페이지 이동
		function goPage_myPoint(pageNo) {
			fn_myPointList(pageNo);
		}
		
		//나의 문의내역 조회
		function fn_myRequestList(pageNo) {
			var param = {
					REQ_ID : "${S_ID}",
					pageNo : pageNo,
					countPerPage : 5
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/my/selectMyRequestList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("#my_tab3 tbody").empty();
	            	
	            	if(list == null) {
	            		html += "<tr><td class='tcenter' colspan='5'>조회된 결과가 없습니다.</td></tr>";	
	            		$("#my_tab3 tbody").append(html);
	            	}
	            	else {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<tr>";
	            			html += "<td></td>";
	            			html += "<td id='IDX'>" + list[i].IDX + "</td>";
	            			html += "<td>";
	            			html += "<a class='request_title' href='#'>" + list[i].TITLE + "</a>";
	            			html += "<input type='hidden' id='ANSWER_GB' name='ANSWER_GB' value='" + list[i].ANSWER_GB + "'>";
	            			html += "</td>";
	            			html += "<td>" + list[i].REQ_DTM + "</td>";
	            			if(list[i].ANSWER_GB == 'N')
	            				html += "<td style='color:red'>답변대기중</td>";
	            			else
	            				html += "<td>답변완료</td>";
	            			html += "</tr>";
		            	}
	            		$("#my_tab3 tbody").append(html);
	            		
	            		//페이징 처리
		            	var page = result.page;
		    			var strPage = gfn_paging(page.totalCount, page.countPerPage, page.pageNavSize, page.currPage, "myRequest");
		            	$("#my_tab3 #pageNav").empty().html(strPage);
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//나의 문의내역 - 페이지 이동
		function goPage_myRequest(pageNo) {
			fn_myRequestList(pageNo);
		}
		
		//나의 문의내역 제목 클릭 - 문의내용 조회
		$(document).on('click', '.request_title', function(e) {
			e.preventDefault();
			
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/my/selectMyRequestDetail.do' />");
		    comSubmit.addParam("ANSWER_GB", $(this).next().val());
		    comSubmit.addParam("IDX", $(this).parent().siblings("#IDX").text());
		    comSubmit.submit();
		});
		
		//나의 한줄평 조회
		function fn_myCommentList(pageNo) {
			var param = {
					CREA_ID      : "${S_ID}",
					pageNo       : pageNo,
					countPerPage : 5
			};
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/my/selectMyCommentList.do' />",
	            data : param,
	            success : function(result) {
	            	var list = result.list;
	            	var html = "";
	            	
	            	$("#my_tab4 tbody").empty();
	            	
	            	if(list == null) {
	            		html += "<tr><td class='tcenter' colspan='6'>조회된 결과가 없습니다.</td></tr>";
	            		$("#my_tab4 tbody").append(html);
	            	}
	            	else {
	            		for(var i=0; i<list.length; i++) {
	            			html += "<tr>";
	            			html += "<td></td>";
	            			html += "<td>" + list[i].COMMENT_NO + "</td>";
	            			html += "<td>" + list[i].MOVIE_NAME + "</td>";
	            			html += "<td>" + list[i].CONTENTS + "</td>";
	            			html += "<td>" + list[i].CREA_DT + "</td>";
	            			html += "<td></td>";
	            			html += "</tr>";
		            	}
	            		$("#my_tab4 tbody").append(html);
	            		
	            		//페이징 처리
		            	var page = result.page;
		    			var strPage = gfn_paging(page.totalCount, page.countPerPage, page.pageNavSize, page.currPage, "myComment");
		            	$("#my_tab4 #pageNav").empty().html(strPage);
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//나의 한줄평 - 페이지 이동
		function goPage_myComment(pageNo) {
			fn_myCommentList(pageNo);
		}
		
		//개인정보수정 화면 이동
		function fn_openMemberUpdateForm() {
			var inputPW = $('#my_tab5 #PASSWORD').val();
			
			if(gfn_isNull(inputPW)) {
				alert("비밀번호를 입력해주세요.");
				$('#my_tab5 #PASSWORD').focus();
				return false;
			}
			//입력PW, 로그인PW 비교
			if(inputPW != "${S_PASSWORD}") {
				alert("비밀번호를 다시 확인해주세요.");
				$('#my_tab5 #PASSWORD').val("").focus();
				return false;
			} else {
				var comSubmit = new ComSubmit();
			    comSubmit.setUrl("<c:url value='/member/openMemberUpdateForm.do' />");
			    comSubmit.addParam("ID", "${S_ID}");
			    comSubmit.submit();
			}
		}
	</script>
</body>
</html>