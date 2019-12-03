<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
<title>KH sports</title>
<style>

.outer{

	/* border: 2px solid black; */ 
	width : 90%;
	height : 500px;
	background : white;
	color : black;
	margin-left : 5%;
	margin-right : 5%;
	margin-top : 3%;
	position: relative;
}

.outer label, .outer td{
	color : black;
	
}
	
#joinForm{
	margin-top: 40px;
		
}
	
input{
	font-size: 20px;
	margin-top : 20px;
	width: 400px;
	height: 40px;
	margin-left: 20px;

}
	
#idCheck, #joinBtn, #searchAdd{
		margin-top: 2px;
		background : black;
		color : white;
		border-radius : 10px;
		width : 150px;
		height : 40px;
		text-align : center;
		border: none;
		padding: 10px 16px;
		font-size: 15px;
		cursor: pointer;
	    box-shadow: 0 5px #999;
}
#idCheck:hover, #joinBtn:hover, #searchAdd:hover{
		background-color: #f53f29; 
 	  	color: white;
     	border-radius: 16px;
		
}
#idCheck:active{
		color : white;
  		background-color: #f53f29; 
  		box-shadow: 0 3px #666;
  		transform: translateY(4px);
   		border-radius: 16px;
}
#joinBtn:active{
		color : white;
  		background-color: #f53f29; 
  		box-shadow: 0 3px #666;
  		transform: translateY(4px);
   		border-radius: 16px;
}

/* #searchAdd:actvie{
		color : white;
  		background-color: #f53f29; 
  		box-shadow: 0 3px #666;
  		transform: translateY(4px);
   		border-radius: 16px;
}
 */


#searchAdd{
	align-content: left;
}
	
td{
	margin-top: 20px;
	font-size: 22px;
	text-align : right;
	height: 50px;
	
}
.joinTd{
	width : 100px;

}
select{
	font-size: 20px;
	height: 40px;
	width: 400px;
	/* margin-left: 10px; */
	margin-top: 20px;
}

#joinForm tr{
	margin-bottom: 40px;
	
}
#postcodify_search_button {
	background-color: #f1f1f1;
	color: black;
	border-radius: 16px;
	width: 150px;
	height: 40px;
	text-align: center;
	border: 1px solid blue;
	border: none;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	box-shadow: 0 5px #999;
}

#goMain{
	background-color: #f1f1f1;
	color : black;
	border-radius : 16px;
	width : 150px;
	height : 40px;
	text-align : center;
	border: 1px solid black;
	border: none;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	box-shadow: 0 5px #999;		
}
	
#goMain:hover{
	background-color: #666;
	color: white;
	border-radius: 16px;
} 

#goMain:active {
	color : white;
  	background-color: #f53f29; 
  	box-shadow: 0 3px #666;
  	transform: translateY(4px);
   	border-radius: 16px;
}


#joinBtn, #goMain{
	display : inline-block;
}
	
.btns{
	margin: 50px;
	font-size: 20px;
	padding: auto;
}
	
#idCheckPop{
	width:	500px;
	height: 200px; 
	display: none;
	background: white;
	padding: 20px;
}

th{
	max-width: 200px;
	height: 20px;
	text-align: right;
	padding-left: 10px;
	vertical-align:middle;
	
}
#joinTdbirth{
	margin-right : 77px;
}

.scrollheader {
  	position: fixed;
  	top: 0;
  	z-index: 1;
  	width: 100%;
  	background-color: #f1f1f1;
  	font-size : 35px;
}

.scrollheader h2 {
  	text-align: center;
}

.progress-container {
  	width: 100%;
  	height: 8px;
  	background: #ccc;
}

.progress-bar {
  	height: 8px;
  	background: #f53f29;
  	width: 0%;
}
ㄴ
.memberjoinForm {
  	padding: 100px 0;
  	margin: 50px auto 0 auto;
  	width: 80%;
}
/* 개인정보 탭  */
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.person-content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
 /*  overflow : scroll; */
  background-color: #f1f1f1;
  overflow : scroll;
  height : 100px;
  font-size : 12px;
}

#personinfo{
	width : 490px;

}

#userinfo1{
	width : 20px;
	position: relative;
    top: 14px;
}
canvas
{
 width: 200px;
  height: 200px;
  border: 0.5px solid gray;
  margin-left:20px; 
}
</style>
</head>




<body>

	<div id="container" style="">
		<!-- container -->
		<div id="mainContent" style="">
			<!-- mainContent -->
			<div style="align: center">
				<img src="resources/images/fifalogo1.png" text-align="center">
			</div>

			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div></div>
			<div class="memberjoinForm" style = "border: 1px solid black;">
				<br>

				<form id="joinForm"
					action="join.me" method="post">
					<h2 align="center">
						<em>FIFAOFFLINE에 오신 것을 환영합니다.</em>
					</h2>
					
					
					<div style = "border: 2px solid red; width: 55%;  display: inline-block;">
					<table align="center"   >
						<tr>
							<th width="200px;">아이디</th>
							<td><input id="userId" type="text" maxlength="13"
								name="userId" requi#f53f29>
								<div id="checkId" class="checkInfo" style="font-size: 0.7em"></div></td>
							<!--requi#f53f29 미입력시 값을 입력하세요 문구뜸  -->
							<!-- <td width ="200px"><div id="idCheck" class = "btns"">중복확인</div></td> -->
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input id="userPwd" type="password" maxlength="20"
								name="userPwd" requi#f53f29>
								<div id="checkPwd" class="checkInfo" style="font-size: 0.7em"></div></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input id="userPwd2" type="password" maxlength="20"
								name="userPwd2" requi#f53f29>
								<div id="checkPwd2" class="checkInfo" style="font-size: 0.7em"></div></td>
						</tr>
						<tr>
							<th>  이름 </th>
							<td><input id = "userName" type = "text" maxlength="5" name="userName" requi#f53f29>
							<div id = "checkName" class = "checkInfo" style = "font-size : 0.7em"></div></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<div id="joinTdbirth">
									<input type="text" id="birthDay" maxlength="6" name="birthDay" placeholder="191129"
										style="width: 159px;margin-right:5px;" requi#f53f29>
										
									<input id="genderM" type="radio" name="gender" value="M"
										style="width: 18px; height: 18px;" requi#f53f29 checked>
									<label for="genderM">남</label> <input id="genderY"
										type="radio" name="gender" value="F"
										style="width: 18px; height: 18px; " requi#f53f29> <label
										for="genderY">여</label>
								</div>
								<div id="checkRRN" class="checkInfo" style="font-size: 0.7em"></div>
							</td>
						</tr>

						<tr>
							<th>연락처</th>
							<td><select id="tel0" class="phone" name="phone1"
								style="width: 90px; margin-left: 18px; height: 48px;">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="019">019</option>
							</select> <input id="tel1" class="phone" type="tel" maxlength="4"
								name="phone2" style="width: 130px; margin-left: 15px;">
								<input id="tel2" class="phone" type="tel" maxlength="4"
								name="phone3" style="width: 130px; margin-left: 15px;">

							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td id="emailPt"><input type="text" name="emailId"
								style="width: 141px; margin-right: 5px;"
								requi#f53f29="requi#f53f29"><em>@</em> <input
								type="text" name="email2" value="naver.com"
								style="width: 220px; margin-left: 0px;" ReadOnly="true"
								placeholder="naver.com"></td>
							<td><select id="selctEmail" name="selctEmail" class="info"
								style="width: 150px; margin-left: 0px; height: 40px;"
								onchange="SetEmailTail(selctEmail.options[this.selectedIndex].value)">
									<!-- <option value = "notSelected">====선택====</option> -->
									<option value="naver.com">naver.com</option>
									<option value="goole.com">google.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="yahoo.com">yahoo.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="etc">직접입력</option>
							</select></td>
						</tr>
						<tr>
							<th>주요활동지</th>
							<td><input type="text" name="address"
								class="postcodify_address" value="" readonly></td>
							<td>
								<button type="button" id="postcodify_search_button"
									style="size:">검색</button>
							</td>
						</tr>

						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
						
						
					</table>
					</div>
					
					
					
					<div style = "border: 2px solid red;  display: inline-block; width: 40%;">
					<table align="center"  border = "1"  style  = "width: 100%;"> 
						<tr>
							<td colspan="4" style="text-align : center;">프로필사진</td>
						</tr>
						<tr>
							<td class="profile" colspan="2">
						
						<script src = "https://www.dukelearntoprogram.com/course1/common/js/image/SimpleImage.js">
						</script>
						<canvas
							  id = "canvas">
						</canvas>
							</td>
							<td colspan="2">
							<input
							       id = "filup"
							       type = "file"
							       multiple = "false"
							       accept = "image/*"
							       onchange = "upload()" style = "width: 280px;">
							</td>
						</tr>
						<script>
						function upload()
						{
						  var Ican = document.getElementById ("canvas");
						  var proup = document.getElementById ("filup");
						  var ima1 = new SimpleImage (proup);
						  ima1.drawTo (Ican);
						}
						</script>
						<tr>
							<td colspan="4" style="text-align : center;">
								포지션
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" id="GK" name="position" value="GK" style = "width: 20px;">
								<label for="GK">골키퍼</label>
							</td>
							<td>
								<input type="checkbox" id="DF" name="position" value="DF" style = "width: 20px;">
								<label for="DF">수격수</label>
							</td>
							<td>
								<input type="checkbox" id="MF" name="position" value="MF" style = "width: 20px;">
								<label for="MF">미드필더</label>
							</td>
							<td>
								<input type="checkbox" id="FW" name="position" value="FW" style = "width: 20px;">
								<label for="FW">공격수</label>
							</td>
						</tr>
						
						<script>
function checkboxArr() {
    var checkArr = [];     // 배열 초기화
    $("input[name='position']:checked").each(function(i)){
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    }

    $.ajax({
        url: 'join.me'
        , type: 'post'
        , dataType: 'text'
        , data: {
            valueArrTest: checkArr
        }
    });
}

</script>
						
					</table>
					</div>
					
					<table id="personinfo" align="center">
						<tr>
							<td>
								<p>
									<span style="font-size: 18px;"> KHFIFAOFFLINE에 가입하시는 것에
										대해 동의합니다.</span><input type="checkbox" id="userinfo1">
								</p>

							</td>
						</tr>
					</table>
					
					<div align="center">
						<!-- submit 방법 1 (함수활용해서 submit하기 )(requi#f53f29동작 안함) -->
						<!-- <div class = "btns" id = "joinBtn" onclick = "insertMember();">가입하기</div> 함수방식은 requi#f53f29 적용이안됨 -->
						<input type="button" class="btns" id="joinBtn"
							onclick="insertMember()" value="가입하기">
						<!-- submit 방법 2 -->
						<!-- submit버튼으로 만들어서 실행해야 input태그들의 requi#f53f29이 발동함 -->

						<!-- InsertMemberServlet 만들러 감 -->
						<!-- <div class = "btns" id = "goMain" onclick = "goMain();">메인으로</div> -->
						<input type="button" class="btns" id="goMain" onclick="goMain()"
							value="메인으로">
					</div>
				</form>
			</div>



			<!-- 중복체크 팝업창 -->
			<div id="idCheckPop">
				<h1>test</h1>
			</div>
			<!-- container -->
		</div>
		<!-- mainContent -->
	</div>





	<script>
	
	function SetEmailTail(emailValue) {
		  var email = document.all("email")    // 사용자 입력
		  var emailTail = document.all("email2") // Select box
		  
		  if ( emailValue == "notSelected" )
		   return;
		  else if ( emailValue == "etc" ) {
		   emailTail.placeholder = "";
		   emailTail.readOnly = false;
		   emailTail.value = "";
		   emailTail.focus();
		  } else {
		   emailTail.readOnly = true;
		   emailTail.value = emailValue;
		  }
		 }


	////////////////////////////////////////////////// 유효성검사 /////////////////////////////////////////////
	
		
		idCheck = false;
		pwdCheck = false;
		pwdCheck2 = false;
		nameCheck = false;
		phoneCheck = false;
		rrnCheck = false;
		
		
		
		$("#userId").keyup(function() {
			var userId = $("#userId").val();
			var idRe = /^[a-z,A-z,0-9]{4,12}$/;

			$.ajax({
				url : "",
				data : {
					userId : userId
				},
				success : function(data) {
					if (userId == "") {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "2px solid #f53f29");
						$("#checkId").text("아이디를 입력하세요.");
						idCheck = false;
					} else if (!idRe.test(userId)) {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "2px solid #f53f29");
						$("#checkId").text("4-12의 영문자,숫자만 입력가능합니다.");
						idCheck = false;
					} else if (data > 0) {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "2px solid #f53f29");
						$("#checkId").text("중복된 아이디입니다.");
						idCheck = false;
					} else {
						$("#checkId").text("사용가능한 아이디입니다.");
						$("#checkId").css("color", "green");
						$("#userId").css("border", "2px solid blue");
						idCheck = true;
					}
				}
			});
		});

		$("#userPwd").keyup(function() {
			var userPwd = $("#userPwd").val();
			var pwdRe = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

			if (userPwd == "") {
				$("#checkPwd").css("color", "#f53f29");
				$("#userPwd").css("border", "2px solid #f53f29");
				$("#checkPwd").text("비밀번호를 입력하세요.");
				pwdCheck = false;
			} else if (!pwdRe.test(userPwd)) {
				$("#checkPwd").css("color", "#f53f29");
				$("#userPwd").css("border", "2px solid #f53f29");
				$("#checkPwd").text("문자,숫자,특수문자를 포함한 8-20자");
				pwdCheck = false;
			} else {
				$("#checkPwd").css("color", "blue");
				$("#userPwd").css("border", "2px solid blue");
				$("#checkPwd").text("사용가능한 비밀번호입니다.");
				pwdCheck = true;
			}
		});

		$("#userPwd2").keyup(function() {
			var userPwd2 = $("#userPwd2").val();

			if ($("#userPwd1") == "") {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "2px solid #f53f29");
				$("#checkPwd2").text("비밀번호를 먼저 입력하세요.");
				$("#userPwd2").val("");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if (pwdCheck == false) {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "2px solid #f53f29");
				$("#userPwd2").val("");
				$("#checkPwd2").text("비밀번호 조건을 먼저 만족시켜야합니다.");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if ($("#userPwd").val() != userPwd2) {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "2px solid #f53f29");
				$("#checkPwd2").text("비밀번호가 일치하지 않습니다.");
				pwdCheck2 = false;
			} else {
				$("#checkPwd2").css("color", "blue");
				$("#userPwd2").css("border", "2px solid blue");
				$("#checkPwd2").text("비밀번호가 일치합니다.");
				pwdCheck2 = true;
			}

		});

		$("#userName").keyup(function() {
			var nameRe = /^[가-힣]{2,6}$/;
			var userName = $("#userName").val();

			if (userName == "") {
				$("#checkName").css("color", "#f53f29");
				$("#userName").css("border", "2px solid #f53f29");
				$("#checkName").text("이름을 입력하세요.");
				nameCheck = false;
			} else if (!nameRe.test(userName)) {
				$("#checkName").css("color", "#f53f29");
				$("#userName").css("border", "2px solid #f53f29");
				$("#checkName").text("2~6자의 한글");
				nameCheck = false;
			} else {
				$("#checkName").css("color", "blue");
				$("#userName").css("border", "2px solid blue");
				$("#checkName").text("유효한 이름입니다.");
				nameCheck = true;
			}
		});

		$(".phone").keyup(function() {
			var phoneRe = /^[0-9]{3,4}$/;
			var tel1 = $("#tel1").val();
			var tel2 = $("#tel2").val();
			
			if (tel1 == ""  && tel2 == "" ) {
				$("#checkPhone").css("color", "#f53f29");
				$("#tel1").css("border", "2px solid #f53f29");
				$("#tel2").css("border", "2px solid #f53f29");
				$("#checkPhone").text("번호을 입력하세요.");
				phoneCheck = false;
			} else if (!phoneRe.test(tel1) || !phoneRe.test(tel2) ) {
				$("#checkPhone").css("color", "#f53f29");
				$("#tel1").css("border", "2px solid #f53f29");
				$("#tel2").css("border", "2px solid #f53f29");
				$("#checkPhone").text("3~4자의 숫자");
				phoneCheck = false;
			} else {
				$("#checkPhone").css("color", "blue");
				$("#tel0").css("border", "2px solid blue");
				$("#tel1").css("border", "2px solid blue");
				$("#tel2").css("border", "2px solid blue");
				$("#checkPhone").text("유효한 전화번호입니다.");
				phoneCheck = true;
			}
		});
		
		$("#birthDay").keyup(function() {
			var RRNre = /^([0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/
			var rrn = $("#birthDay").val();

			
			if (rrn == ""  ) {
				$("#checkRRN").css("color", "#f53f29");
				$("#birthDay").css("border", "2px solid #f53f29");
				$("#checkRRN").text("번호을 입력하세요.");
				rrnCheck  = false;
			} else if (!RRNre.test(rrn)) {
				$("#checkRRN").css("color", "#f53f29");
				$("#birthDay").css("border", "2px solid #f53f29");
				$("#checkRRN").text("정확한 생년월일 8자리");
				rrnCheck  = false;
			} else {
				$("#checkRRN").css("color", "blue");
				$("#birthDay").css("border", "2px solid blue");
				$("#checkRRN").text("유효한 생년월일입니다.");
				rrnCheck  = true;
			}
		});
		
		
		// 회원가입 하기 함수
		function insertMember(){
			if(idCheck == false){
				alert("아이디를 확인해주세요.");
				$("#userId").focus();
			}else if(pwdCheck  == false){
				alert("비밀번호를 확인해주세요.");
				$("#userPwd").focus();
			}else if(pwdCheck2  == false){
				alert("비밀번호 일치여부를 확인해주세요.");
				$("#userPwd2").focus();
			}else if(nameCheck  == false){
				alert("이름를 확인해주세요.");
				$("#name").focus();
			}else if(phoneCheck  == false){
				alert("전화번호를 확인해주세요.");
				$("#tel1").focus();
			}else if(rrnCheck  == false){
				alert("생년월일를 확인해주세요.");
				$("#birthDay").focus();
			}else if($("input:radio[name='gender']").is(":checked")==false){
				alert("성별을 선택해주세요.");
				$("input:radio[name='gender']").focus();
			}else if($("#emailId").val() == ""){
				alert("이메일을 입력해주세요.");
				$("#emailId").focus();
			}else{
				if(!confirm("정말로 회원가입하시겠습니까 ?")){
					return false;
				};
				$("#joinForm").submit();
			}	
		}
	
		
		
		
		
		
		
		
		
		
		// 메인으로 이동 함수
		function goMain() {
			location.href = "home.do";
		}
		
		
		
		$(".btns").hover(function() {
			  $(this).css({"cursor": "pointer"});
			}, function(){
			 //$(this).css({"background":"black"})
			});

		
		$(function() {
			var BPOPUP = '';
			$('#idCheck').on('click', function(e) {
				e.preventDefault();
				BPOPUP = $('#idCheckPop').bPopup({

				});
			});
		});
	</script>


</body>
</html>