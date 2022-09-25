		$(document).ready(function(){
			/*
				아이디저장 로직
				쿠키에서 아이디 저장 체크 확인
				체크 되어 있다면 쿠키에 저장된 아이디 표시
			*/
			var isChecked = $.cookie('isChecked');

			if(isChecked){
				$("#logid").val($.cookie('usrid'));
				$("#chkid").attr("checked", true);
				$("#pwd").focus();
			}else{
				$("#chkid").attr("checked", false);
				$("#logid").focus();
			}
		});

		function login(){
			if($("input[name=USER_ID]").val() == '') {
					alert("아이디를 입력하여 주십시요.");
					return;
			}
			if($("input[name=USER_PW]").val() == '') {
				alert("패스워드를 입력하여 주십시요.");
				return;
			}
			if($("input[name=USER_NAME]").val() == '') {
				alert("이름을 입력하여 주십시요.");
				return;
			}
}
//			var tempForm = $('<form>');
//			var idInput = $('<input>', {name: "userEmail"});
//			idInput.val($("input[name=userEmail]").val());
//			var passInput = $('<input>', {name: "passWd"});
//			passInput.val(sha256($("input[name=passWd]").val()));
//			var extensionNumInput = $('<input>', {name: "extensionNum"});
//			extensionNumInput.val($("input[name=extensionNum]").val());
//			tempForm.append(idInput);
//			tempForm.append(passInput);
//			tempForm.append(extensionNumInput);
//			
//			$.ajax({
//				type : 'post',
//				url : '/nms/login/logincheck.json',
//				dataType : 'json',
//				data : tempForm.serialize(),
//				success : function(data) { // .... 서버와 통신 성공 시, 데이터 가공. 아래 참조
//					$('#loginMsg').empty();
//					if(data.result == 200){
//						if(data.workYn == "Y"){
//							//쿠키 저장
//							if($("#chkid").is(":checked")){
//								$.cookie('isChecked', true,{expires:30, path:'/'});
//								$.cookie('usrid',$("#logid").val(),{expires:30, path:'/'});
//							}else{
//								// 아이디 저장 미체크시 쿠키 초기화
//								$.cookie('isChecked', true,{expires:-1, path:'/'});
//								$.cookie('usrid',$("#logid").val(),{expires:-1, path:'/'});
//							}
//							if(data.expiRemainDay < 8){
//								alert("해당 아이디의 사용 만료일이 "+data.expiRemainDay + " 일 남았습니다.");
//							}
//							if(data.userEmail == "bw_company" || data.userEmail == "sb_company"){
//								location.href = "/nms/receipt/disusedCar/disusedCarListView.neo";
//							}else{
//								location.href = "/nms/main/main.neo";
//							}
//
//						}else{
//							var msg = "만료된 계정 입니다.";
//							alert(msg);
//							return false;
//						}
//
//					}else if(data.result == 400){
//							alert("회원정보가 정확하지 않습니다.!");
//							return false;
//					}else if(data.result == 100){
//							alert("서비스가 삭제되어 이용하실 수 없습니다.");
//							return false;
//					}else {
//						alert("로그인에 실패 하였습니다. 관리자에게 문의 하세요!");
//					}
//				},
//				error : function(request, status, error) {
////					console.log( error);
//				}
//			});
//	    }