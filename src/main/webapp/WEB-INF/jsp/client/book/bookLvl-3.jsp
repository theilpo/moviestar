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
		
		<div class="title">영화예매</div>
		<div class="explain">포인트 사용시 결제금액에서 할인됩니다.</div>
		<div class="etc"><span class="essential">* </span>영화 > 좌석 > 결제 3단계로 이루어져 있습니다.</div>
		
		<hr style="clear: right;">
		
		<!-- '결제하기' start -->
		<form id="frm" name="frm">
		
			<div class="book_pay_wrap">
				<div class="book_pay_text">결제하기</div>
				
				<div class="pointer">포인트 사용</div>
				
				<table class="pay_point_table">
			        <colgroup>
			            <col width="15%"/>
			            <col width="35%"/>
			            <col width="15%"/>
			            <col width="35%"/>
			        </colgroup>
			        <tbody>
			            <tr>
			                <th class="tcenter">보유한 포인트</th>
			                <td>0 P</td>
			                <th class="tcenter">사용할 포인트</th>
			                <td><input type="text" id="USE_POINT" name="USE_POINT" value="0"> P</td>
			            </tr>
			        </tbody>
			    </table>
			    
				<div class="pointer">결제금액</div>
				
				<div class="chargeCommon">
					<div class="payChargeText">결제하실 금액</div>
					<div class="payCharge">&nbsp;</div>
				</div>
				
				<div class="chargeCommon">
					<div class="discntChargeText">할인 금액</div>
					<div class="discntCharge">&nbsp;</div>
				</div>
				
				<div class="chargeCommon">
					<div class="finalChargeText">남은 결제금액</div>
					<div class="finalCharge">&nbsp;</div>
				</div>
			</div>
			<!-- '결제하기' end -->
			
			<div class="btn_wrap">
				<input type="button" id="btn_pay" class="btn_orange" value="결제완료">
			</div>
			
			<!-- hidden -->
			<input type="hidden" id="TIME_NO" name="TIME_NO" value="${map.TIME_NO }">
			<input type="hidden" id="MOVIE_NO" name="MOVIE_NO" value="${map.MOVIE_NO }">
			<input type="hidden" id="PEOPLE" name="PEOPLE" value="${map.PEOPLE }">
			<input type="hidden" id="SEATS_NO" name="SEATS_NO" value="${map.SEATS_NO }">
			<input type="hidden" id="CHARGE" name="CHARGE" value="${map.CHARGE }">
			<input type="hidden" id="DISCNT_CHARGE" name="DISCNT_CHARGE" value="0">
			<input type="hidden" id="FINAL_CHARGE" name="FINAL_CHARGE" value="${map.CHARGE }">
			<input type="hidden" id="MY_POINT" name="MY_POINT">
		</form>
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			fn_getMyPoint();
			fn_initCharge();
			
			//사용 포인트 입력
			$('#USE_POINT').bind({
				keyup : function() {	//숫자만 입력가능
					this.value = this.value.replace(/[^0-9]/g, '');
				},
				blur : function() {		//금액계산
					if(Number($('#MY_POINT').val()) < Number($(this).val())) {
						alert("보유한 포인트가 모자랍니다.");
						$(this).focus().val($('#MY_POINT').val());
					} 
					
					$('#DISCNT_CHARGE').val($(this).val());
					var finalCharge = $('#CHARGE').val() - $('#DISCNT_CHARGE').val();
					$('#FINAL_CHARGE').val(finalCharge);
					
					$('.discntCharge').text(gfn_setComma($('#DISCNT_CHARGE').val()) + " 원");
					$('.finalCharge').text(gfn_setComma($('#FINAL_CHARGE').val()) + " 원");
				}
			});
			
			//결제완료 버튼
			$("#btn_pay").click(function() {
				fn_insertBook();
			});
	    });
		
		//결제하기
		function fn_insertBook() {
			var param = $("#frm").serializeArray();
			param.push(
					{name : "ID", value : "${S_ID}"},
					{name : "BOOK_GB", value : 'R'}		/* R : 예매, C : 예매취소 */
			);
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/book/insertBook.do' />",
	            data : param,
	            success : function(result) {
	            	fn_openBookCompleteForm(result.BOOK_NO);
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//결제완료 화면이동
		function fn_openBookCompleteForm(BOOK_NO) {
			var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/book/openBookCompleteForm.do' />");
		    comSubmit.addParam("BOOK_NO", BOOK_NO);
		    comSubmit.submit();
		}
		
		//나의 가용 포인트 조회
		function fn_getMyPoint() {
			var param = { ID : "${S_ID}" };
			
			$.ajax({
	            type : "POST",
	            url : "<c:url value='/point/selectMyPoint.do' />",
	            data : param,
	            success : function(result) {
	            	var point = result.point;
	            	$('#MY_POINT').val(point);
	            	$('.pay_point_table td:eq(0)').empty().append(point + " P");
	            },
	            error : function(errMsg){
	                alert("error : "+ errMsg);
	            }
	        });
		}
		
		//초기값 세팅
		function fn_initCharge() {
			$('.payCharge').text(gfn_setComma($('#CHARGE').val()) + " 원");
			$('.discntCharge').text("0 원");
			$('.finalCharge').text(gfn_setComma($('#CHARGE').val()) + " 원");
		}
	</script>	
</body>
</html>