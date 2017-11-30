<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">회원정보수정</div>
		<div class="explain">필요한 정보를 수정해주세요.</div>
		<div class="etc"><span class="essential">*</span>는 필수입력 항목입니다.</div>
		
		<hr style="clear: right;">
		
		<form id="frm" name="frm">
			
			<!-- write info start -->
			<div class="pointer">정보입력</div>
			
			<table class="member_table">
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>성명 <span class="essential">*</span></th>
						<td><input type="text" id="NAME_KO" name="NAME_KO" value="${map.NAME_KO }" size="60" readonly="readonly"></td>
					</tr>
					<tr>
						<th>성명(영문)</th>
						<td><input type="text" id="NAME_EN" name="NAME_EN" value="${map.NAME_EN }" size="60"></td>
					</tr>
					<tr>
						<th>아이디 <span class="essential">*</span></th>
						<td>
							<input type="text" id="ID" name="ID" value="${map.ID }" size="60" maxlength="12" readonly="readonly"><br>
							<div class="caution">영문(대소문자 구별)/숫자 혼용 6~12자리 이내로 가능합니다.</div>
							<div class="caution">특수문자는 사용 하실 수 없습니다.</div>
						</td>
					</tr>
					<tr>
						<th>생년월일 <span class="essential">*</span></th>
						<td><input type="text" id="BIRTH_DT" name="BIRTH_DT" value="${map.BIRTH_DT }" size="60" maxlength="8" placeholder="ex) 19890125"></td>
					</tr>
					<tr>
						<th>성별 <span class="essential">*</span></th>
						<td>
							<input type="radio" name="GENDER" value="M" <c:if test="${map.GENDER=='M'}">checked</c:if>>남
							<input type="radio" name="GENDER" value="F" <c:if test="${map.GENDER=='F'}">checked</c:if>>여
						</td>
					</tr>
					<tr>
						<th>이메일 <span class="essential">*</span></th>
						<td>
							<input type="email" id="EMAIL" name="EMAIL" value="${map.EMAIL }" size="60" placeholder="ex) test@gmail.com"><br>
							<div class="caution">비밀번호 분실시 재발급에 필요합니다. 정확한 이메일 주소를 입력해 주시기 바랍니다.</div>
						</td>
					</tr>
					<tr>
						<th> 자택 전화번호</th>
						<td>
							<c:set var="telArr" value="${fn:split(map.TEL,'-') }"/>
							<c:forEach var="tel" items="${telArr }" varStatus="s">
								<c:if test="${s.count==1}"><c:set var="tel1" value="${tel }"/></c:if>
								<c:if test="${s.count==2}"><c:set var="tel2" value="${tel }"/></c:if>
								<c:if test="${s.count==3}"><c:set var="tel3" value="${tel }"/></c:if>
							</c:forEach>
							<select id="TEL1" name="TEL1" style="width: 100px;">
								<option value="02" <c:if test="${tel1=='02'}">selected</c:if>>02</option>
								<option value="051" <c:if test="${tel1=='051'}">selected</c:if>>051</option>
								<option value="053" <c:if test="${tel1=='053'}">selected</c:if>>053</option>
								<option value="032" <c:if test="${tel1=='032'}">selected</c:if>>032</option>
								<option value="062" <c:if test="${tel1=='062'}">selected</c:if>>062</option>
								<option value="042" <c:if test="${tel1=='042'}">selected</c:if>>042</option>
								<option value="052" <c:if test="${tel1=='052'}">selected</c:if>>052</option>
								<option value="044" <c:if test="${tel1=='044'}">selected</c:if>>044</option>
								<option value="031" <c:if test="${tel1=='031'}">selected</c:if>>031</option>
								<option value="033" <c:if test="${tel1=='033'}">selected</c:if>>033</option>
								<option value="043" <c:if test="${tel1=='043'}">selected</c:if>>043</option>
								<option value="041" <c:if test="${tel1=='041'}">selected</c:if>>041</option>
								<option value="063" <c:if test="${tel1=='063'}">selected</c:if>>063</option>
								<option value="061" <c:if test="${tel1=='061'}">selected</c:if>>061</option>
								<option value="054" <c:if test="${tel1=='054'}">selected</c:if>>054</option>
								<option value="055" <c:if test="${tel1=='055'}">selected</c:if>>055</option>
								<option value="064" <c:if test="${tel1=='064'}">selected</c:if>>064</option>
							</select>
							<input type="tel" id="TEL2" name="TEL2" value="${tel2 }" size="20" maxlength="3">
							<input type="tel" id="TEL3" name="TEL3" value="${tel3 }" size="20" maxlength="4">
						</td>
					</tr>
					<tr>
						<th>휴대 전화번호 <span class="essential">*</span></th>
						<td>
							<c:set var="phoneArr" value="${fn:split(map.PHONE,'-') }"/>
							<c:forEach var="phone" items="${phoneArr }" varStatus="s">
								<c:if test="${s.count==1}"><c:set var="phone1" value="${phone }"/></c:if>
								<c:if test="${s.count==2}"><c:set var="phone2" value="${phone }"/></c:if>
								<c:if test="${s.count==3}"><c:set var="phone3" value="${phone }"/></c:if>
							</c:forEach>
							<select id="PHONE1" name="PHONE1" style="width: 100px;">
								<option value="010" <c:if test="${phone1=='010'}">selected</c:if>>010</option>
								<option value="011" <c:if test="${phone1=='011'}">selected</c:if>>011</option>
								<option value="016" <c:if test="${phone1=='016'}">selected</c:if>>016</option>
								<option value="017" <c:if test="${phone1=='017'}">selected</c:if>>017</option>
								<option value="018" <c:if test="${phone1=='018'}">selected</c:if>>018</option>
								<option value="019" <c:if test="${phone1=='019'}">selected</c:if>>019</option>
							</select>
							<input type="tel" id="PHONE2" name="PHONE2" value="${phone2 }" size="20" maxlength="4">
							<input type="tel" id="PHONE3" name="PHONE3" value="${phone3 }" size="20" maxlength="4">
						</td>
					</tr>
				</tbody>
			</table>
			<!-- write info end -->
			
			<!-- prefer genre start -->
			<div class="pointer">선호장르</div>
			
			<table class="genre_table">
				<tr>
					<td><input type="checkbox" name="GENRE" value="SF" <c:if test="${fn:contains(map.GENRE,'SF')}">checked</c:if>>SF</td>
					<td><input type="checkbox" name="GENRE" value="드라마" <c:if test="${fn:contains(map.GENRE,'드라마')}">checked</c:if>>드라마</td>
					<td><input type="checkbox" name="GENRE" value="멜로/로맨스" <c:if test="${fn:contains(map.GENRE,'멜로/로맨스')}">checked</c:if>>멜로/로맨스</td>
					<td><input type="checkbox" name="GENRE" value="코미디" <c:if test="${fn:contains(map.GENRE,'코미디')}">checked</c:if>>코미디</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="GENRE" value="스릴러" <c:if test="${fn:contains(map.GENRE,'스릴러')}">checked</c:if>>스릴러</td>
					<td><input type="checkbox" name="GENRE" value="애니메이션" <c:if test="${fn:contains(map.GENRE,'애니메이션')}">checked</c:if>>애니메이션</td>
					<td><input type="checkbox" name="GENRE" value="스포츠" <c:if test="${fn:contains(map.GENRE,'스포츠')}">checked</c:if>>스포츠</td>
					<td><input type="checkbox" name="GENRE" value="액션" <c:if test="${fn:contains(map.GENRE,'액션')}">checked</c:if>>액션</td>
				</tr>
			</table>
			<!-- prefer genre end -->
		
			<div class="btn_wrap">
				<input type="button" id="member_update" class="btn_orange" value="정보수정">
				<input type="button" id="member_delete" class="btn_gray" value="회원탈퇴">
			</div>
			
			<!-- change password start -->
			<div class="pointer">비밀번호 변경</div>
			
			<table class="password_table">
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>기존 비밀번호 <span class="essential">*</span></th>
						<td>
							<input type="password" id="ORG_PW" name="ORG_PW" size="60"><br>
						</td>
					</tr>
					<tr>
						<th>신규 비밀번호 <span class="essential">*</span></th>
						<td>
							<input type="password" id="NEW_PW" name="NEW_PW" size="60"><br>
							<div class="caution">8~12자의 영문(대소문자 구별),숫자를 혼합하여야 합니다.</div>
							<div class="caution">특수문자는 사용 하실 수 없습니다.</div>
						</td>
					</tr>
					<tr>
						<th>신규 비밀번호 확인 <span class="essential">*</span></th>
						<td>
							<input type="password" id="NEW_PW2" name="NEW_PW2" size="60">
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="btn_wrap">
				<input type="button" id="pw_change" class="btn_orange" value="비밀번호 변경">
			</div>
			<!-- change password end -->
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
	        $("#member_update").click(function() {	//정보수정 버튼
	        	if(fn_validityCheck() == true) {
	        		fn_memberUpdate();
	        	}
	        });
	        
	        $("#member_delete").click(function() {	//회원탈퇴 버튼
	        	if(confirm("회원탈퇴 하시겠습니까?\n동일 아이디로 다시 회원가입 불가합니다.")) {
	        		fn_memberDelete();	
	        	}
	        });
	        
	        $("#pw_change").click(function() {		//비밀번호 변경
	        	if(fn_PWvalidityCheck() == true) {
	        		fn_chahgePW();
	        	}
	        });
	    });
		
		//회원정보수정 유효성 검사
		function fn_validityCheck() {
			
			if(gfn_isNull($("#BIRTH_DT").val())) {
				alert("생년월일을 입력해주세요.");
				$("#BIRTH_DT").focus();
				return false;
			}
			if(gfn_isNull($("#EMAIL").val())) {
				alert("이메일을 입력해주세요.");
				$("#EMAIL").focus();
				return false;
			}
			var regEMAIL = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!regEMAIL.test($("#EMAIL").val())) {
				alert('이메일 형식이 맞지 않습니다.');
				$("#EMAIL").val("").focus();
				return false;
			}
			if(gfn_isNull($("#PHONE2").val())) {
				alert("휴대 전화번호를 입력해주세요.");
				$("#PHONE2").focus();
				return false;
			}
			if(gfn_isNull($("#PHONE3").val())) {
				alert("휴대 전화번호를 입력해주세요.");
				$("#PHONE3").focus();
				return false;
			}
			if($("input[name='GENRE']").is(":checked") == false) {
				alert("선호하는 장르를 한 개 이상 선택해주세요.");
				return false;
			}			
			return true;
		}
		
		//회원정보수정
		function fn_memberUpdate() {
			
			var chk_genre = "";
			$("input[name='GENRE']:checked").each(function() {
				chk_genre += $(this).val() + ",";				
			});
			chk_genre = chk_genre.substr(0, chk_genre.length -1);
			
			var comSubmit = new ComSubmit("frm");
		    comSubmit.setUrl("<c:url value='/member/updateMember.do' />");
		    comSubmit.addParam("CHK_GENRE", chk_genre);
		    comSubmit.submit();
		}
		
		//회원탈퇴
		function fn_memberDelete() {
			var param = { ID : "${S_ID}" };
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/member/deleteMember.do' />",
	            data : param,
	            success : function(result){
	            	alert("정상적으로 회원탈퇴 되었습니다.");
	            	fn_logout();
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//로그아웃
		function fn_logout() {
		    $.ajax({
	            type : "POST",
	            url : "<c:url value='/common/logout.do' />",
	            success : function(result){
	            	window.location = "<c:url value='/' />";
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//비밀번호 변경 유효성 검사
		function fn_PWvalidityCheck() {
			if(gfn_isNull($("#ORG_PW").val())) {
				alert("기존 비밀번호를 입력해주세요.");
				$("#ORG_PW").focus();
				return false;
			}
			if(gfn_isNull($("#NEW_PW").val())) {
				alert("신규 비밀번호를 입력해주세요.");
				$("#NEW_PW").focus();
				return false;
			}
			var regPW= /^[A-Za-z0-9]{8,12}$/;
			if(!regPW.test($("#NEW_PW").val())) {
				alert('비밀번호를 영문과 숫자 8~12자 이내로 입력하세요.\n특수문자는 사용 하실 수 없습니다.');
				$("#NEW_PW").val("").focus();
				return false;
			}
			if(gfn_isNull($("#NEW_PW2").val())) {
				alert("신규 비밀번호 확인을 입력해주세요.");
				$("#NEW_PW2").focus();
				return false;
			}
			if($("#NEW_PW").val() != $("#NEW_PW2").val()) {
				alert("입력한 신규 비밀번호가 서로 다릅니다.");
				$("#NEW_PW2").val("").focus();
				return false;
			}
			//기존PW, 로그인PW 비교
			if($("#ORG_PW").val() != "${S_PASSWORD}") {
				alert("기존 비밀번호를 정확히 입력해주세요.");
				$('#ORG_PW').val("").focus();
				return false;
			}
			return true;
		}
		
		//비밀번호 변경
		function fn_chahgePW() {
			var param = {
		    		ID : "${S_ID}",
		    		PASSWORD : $('#NEW_PW').val()
		    };
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/member/changePW.do' />",
	            data : param,
	            success : function(result){
	            	alert("비밀번호가 정상적으로 변경되었습니다.");
	            	window.location = "<c:url value='/' />";
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
	</script>	
</body>
</html>