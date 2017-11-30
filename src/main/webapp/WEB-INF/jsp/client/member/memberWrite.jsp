<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div class="content_wrap">
	
		<div class="title">회원가입</div>
		<div class="explain">회원가입에 필요한 정보를 입력해주세요.</div>
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
						<td><input type="text" id="NAME_KO" name="NAME_KO" size="60"></td>
					</tr>
					<tr>
						<th>성명(영문)</th>
						<td><input type="text" id="NAME_EN" name="NAME_EN" size="60"></td>
					</tr>
					<tr>
						<th>아이디 <span class="essential">*</span></th>
						<td>
							<input type="text" id="ID" name="ID" size="60" maxlength="12"><span class="essential"></span>
							<div class="caution">영문(대소문자 구별)/숫자 혼용 6~12자리 이내로 가능합니다.</div>
							<div class="caution">특수문자는 사용 하실 수 없습니다.</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 <span class="essential">*</span></th>
						<td>
							<input type="password" id="PASSWORD" name="PASSWORD" size="60"><br>
							<div class="caution">8~12자의 영문(대소문자 구별),숫자를 혼합하여야 합니다.</div>
							<div class="caution">특수문자는 사용 하실 수 없습니다.</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인 <span class="essential">*</span></th>
						<td><input type="password" id="PASSWORD2" name="PASSWORD2" size="60"></td>
					</tr>
					<tr>
						<th>생년월일 <span class="essential">*</span></th>
						<td><input type="text" id="BIRTH_DT" name="BIRTH_DT" size="60" maxlength="8" placeholder="ex) 19890125"></td>
					</tr>
					<tr>
						<th>성별 <span class="essential">*</span></th>
						<td>
							<input type="radio" name="GENDER" value="M" checked="checked">남
							<input type="radio" name="GENDER" value="F">여
						</td>
					</tr>
					<tr>
						<th>이메일 <span class="essential">*</span></th>
						<td>
							<input type="email" id="EMAIL" name="EMAIL" size="60" placeholder="ex) test@gmail.com"><br>
							<div class="caution">비밀번호 분실시 재발급에 필요합니다. 정확한 이메일 주소를 입력해 주시기 바랍니다.</div>
						</td>
					</tr>
					<tr>
						<th> 자택 전화번호</th>
						<td>
							<select id="TEL1" name="TEL1" style="width: 100px;">
								<option value="02">02</option>
								<option value="051">051</option>
								<option value="053">053</option>
								<option value="032">032</option>
								<option value="062">062</option>
								<option value="042">042</option>
								<option value="052">052</option>
								<option value="044">044</option>
								<option value="031">031</option>
								<option value="033">033</option>
								<option value="043">043</option>
								<option value="041">041</option>
								<option value="063">063</option>
								<option value="061">061</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="064">064</option>
							</select>
							<input type="tel" id="TEL2" name="TEL2" size="20" maxlength="3">
							<input type="tel" id="TEL3" name="TEL3" size="20" maxlength="4">
						</td>
					</tr>
					<tr>
						<th>휴대 전화번호 <span class="essential">*</span></th>
						<td>
							<select id="PHONE1" name="PHONE1" style="width: 100px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input type="tel" id="PHONE2" name="PHONE2" size="20" maxlength="4">
							<input type="tel" id="PHONE3" name="PHONE3" size="20" maxlength="4">
						</td>
					</tr>
				</tbody>
			</table>
			<!-- write info end -->
			
			<!-- prefer genre start -->
			<div class="pointer">선호장르</div>
			
			<table class="genre_table">
				<tr>
					<td><input type="checkbox" name="GENRE" value="SF">SF</td>
					<td><input type="checkbox" name="GENRE" value="드라마">드라마</td>
					<td><input type="checkbox" name="GENRE" value="멜로/로맨스">멜로/로맨스</td>
					<td><input type="checkbox" name="GENRE" value="코미디">코미디</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="GENRE" value="스릴러">스릴러</td>
					<td><input type="checkbox" name="GENRE" value="애니메이션">애니메이션</td>
					<td><input type="checkbox" name="GENRE" value="스포츠">스포츠</td>
					<td><input type="checkbox" name="GENRE" value="액션">액션</td>
				</tr>
			</table>
			<!-- prefer genre end -->
		
			<!-- button start -->
			<div class="btn_wrap">
				<input type="button" id="member_join" class="btn_orange" value="회원가입">
			</div>
			<!-- button end -->
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#ID").blur(function() {				//ID 중복체크
				fn_duplicateCheck();
			});
			
	        $("#member_join").click(function() {	//회원가입 버튼
	        	if(fn_validityCheck() == true) {
	        		fn_join();
	        	}
	        });
	        
	    });
		
		//ID 중복체크
		function fn_duplicateCheck() {
			
			if(!gfn_isNull($("#ID").val())) {
				var regID = /^[A-Za-z0-9]{6,12}$/;
				if(!regID.test($("#ID").val())) {
					$("#ID").next().text("");
					$("#ID").siblings(".caution").css({'color' : 'red'});
					$("#ID").val("").focus();
					return false;
				}else {
					$("#ID").siblings(".caution").css({'color' : '#666'});
				}
			}
			
			var param = {
		    		ID : $("#ID").val()
		    };
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/member/selectDuplicateIdCnt.do' />",
	            data : param,
	            success : function(result){
	            	if(result.cnt > 0) {
	            		$("#ID").next().text(" 이미 사용중이거나 탈퇴한 아이디입니다.");
	            		$("#ID").val("").focus();
	            	} else {
	            		$("#ID").next().text("");
	            	}
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//회원가입 유효성 검사
		function fn_validityCheck() { 
			
			if(gfn_isNull($("#NAME_KO").val())) {
				alert("성명을 입력해주세요.");
				$("#NAME_KO").focus();
				return false;
			}
			if(gfn_isNull($("#ID").val())) {
				alert("아이디를 입력해주세요.");
				$("#ID").focus();
				return false;
			}
			var regID = /^[A-Za-z0-9]{6,12}$/;
			if(!regID.test($("#ID").val())) {
				alert('아이디를 영문과 숫자 6~12자 이내로 입력하세요.\n특수문자는 사용 하실 수 없습니다.');
				$("#ID").val("").focus();
				return false;
			}
			if(gfn_isNull($("#PASSWORD").val())) {
				alert("비밀번호를 입력해주세요.");
				$("#PASSWORD").focus();
				return false;
			}
			var regPW= /^[A-Za-z0-9]{8,12}$/;
			if(!regPW.test($("#PASSWORD").val())) {
				alert('비밀번호를 영문과 숫자 8~12자 이내로 입력하세요.\n특수문자는 사용 하실 수 없습니다.');
				$("#PASSWORD").val("").focus();
				return false;
			}
			if(gfn_isNull($("#PASSWORD2").val())) {
				alert("비밀번호 확인을 입력해주세요.");
				$("#PASSWORD2").focus();
				return false;
			}
			if($("#PASSWORD").val() != $("#PASSWORD2").val()) {
				alert("입력한 비밀번호가 서로 다릅니다.");
				$("#PASSWORD2").val("").focus();
				return false;
			}
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
		
		//회원가입
		function fn_join() {
			
			var chk_genre = "";
			$("input[name='GENRE']:checked").each(function() {
				chk_genre += $(this).val() + ",";				
			});
			chk_genre = chk_genre.substr(0, chk_genre.length -1);
			
			var comSubmit = new ComSubmit("frm");
		    comSubmit.setUrl("<c:url value='/member/insertMember.do' />");
		    comSubmit.addParam("CHK_GENRE", chk_genre);
		    comSubmit.submit();
		}
	</script>	
</body>
</html>