<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.emailjs.com/sdk/2.3.2/email.min.js"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<title>Insert title here</title>

<style>
	
	.swal-button {
	  padding: 7px 19px;
	  border-radius: 2px;
	  background-color: black;
	  font-size: 12px;
	  border: 1px solid white;
	  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
	  border-radius: 4px;
	}
	
	#outer{
		/* border: 3px solid black; */
		width: 100%;
		margin-top: 100px;
	}
	
	#findId{
		border: 2px solid lightgrey;
		display: inline-block;
		width: 40%;
		height: 450px;
		margin: 4%;
		margin-left: 5%;
	/* 	margin: 5%; */
		margin-top: 40px; 

		padding: 20px;
		float: left;
	}

	#findPwd{
		border: 2px solid lightgrey; 
		display: inline-block;
		width: 40%;
	/* 	margin: 4%; */
		margin-top: 40px;
		height:450px;
		padding: 20px;
		float: left;
	}

	.btn{
	
		margin-top: 40px;
		margin-left: 45%;
		margin-right: 45%;
		
		width: 100px;
		height: 40px;
		color: white;
		background: black;
		font-size: 15px;
		border-radius: 4px;
	}
	
	.btn:hover{
		 opacity: 0.5;
		
		cursor: pointer;
	}
	
	.label{
		width: 200px;
		font-size: 17px;
		text-align: right;
		padding-right: 15px;
	}
	
	td, th{
		padding-top: 20px;
	}
	
	input, select{
		border: 0.5px solid lightgrey;
		font-size: 15px;
	}

/* #banner{
	text-align:center;
	width:10%;
	height:15%;
	

	margin-bottom: 30px;
} */

#banner img{
	width: 100%;
	height: 250px;
	
}


	
	
#saveId {

    TOP: 157PX;
}
</style>
</head>



<body>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
			<div id = "banner">	
			
				<!--  <a href="home.do"><img src="resources/images/fifalogo1.png" alt="image" border="0"></a> --> 				
			</div>
			<jsp:include page="../common/finder.jsp"></jsp:include>
			<div id = "outer">
			<div  id = "mainTitle" style="text-align: center; font-size:70px; "><b >아이디/비밀번호 찾기</b></div>
			
				<div id = "findId">
					<h2 style = "margin-left: 15px;">아이디 찾기</h2>
					<table id = "idTable" align = "center">
						<tr>
							<td class = "label">이름</td>
							<td><input type = "text" id = "nameI" style = "width: 100px; height: 30px;"></td>
						</tr>
						<tr>
							<td class = "label">이메일</td>
							<td><input type = "text" id = "emailPtI" name = "emailId" style="width: 100px; height: 30px; margin-right: 5px;" required="required"><em>@</em>
							<input type="text" id = "email2I" name="email2I" value="naver.com" style="width: 130px; height: 30px; margin-left: 0px;" ReadOnly="true" placeholder = "naver.com">
							</td>
							<th>
							<select id = "selctEmailI" name = "selctEmail" class = "info" style="width: 120px; margin-left: 3px; height: 30px;" onchange="SetEmailTailI(selctEmailI.options[this.selectedIndex].value)" >
								<!-- <option value = "notSelected">====선택====</option> -->
								<option value = "naver.com">naver.com</option> 
								<option value = "goole.com">google.com</option>
								<option value = "hanmail.net">hanmail.net</option>
								<option value = "yahoo.com">yahoo.com</option>
								<option value = "nate">nate.com</option>
								<option value = "hotmail.com">hotmail.com</option>
								<option value = "daum.net">daum.net</option>
								<option value = "etc">직접입력</option>
							</select>
							</th>
						</tr>
						<tr>
							<td></td>
							<td id = "infoI"></td>
						</tr>
					</table>
					<button id = "idBtn" class = "btn" onclick="sendEmail('id')">확인하기</button>
				</div>
				
				
				<div id = "findPwd">
					<h2 style = "margin-left: 15px;">비밀번호 찾기</h2>
					<table id = "pwdTable" align = "center" >
						<tr>
							<td class = "label">아이디</td>
							<td><input type = "text" id = "idP" style = "width: 100px; height: 30px;"></td>
						</tr>
						<tr>
							<td class = "label">이메일</td>
							<td><input type = "text" id = "emailPtP" name = "emailId" style="width: 100px; height: 30px; margin-right: 5px;" required="required"><em>@</em>
							<input type="text" id="email2P" name="email2P" value="naver.com" style="width: 120px; height: 30px; margin-left: 0px;" ReadOnly="true" placeholder = "naver.com">
							<select id = "selctEmailP" name = "selctEmail" class = "info" style="width: 110px; margin-left: 3px; height: 30px;" onchange="SetEmailTailP(selctEmailP.options[this.selectedIndex].value)" >
								<!-- <option value = "notSelected">====선택====</option> -->
								<option value = "naver.com">naver.com</option> 
								<option value = "goole.com">google.com</option>
								<option value = "hanmail.net">hanmail.net</option>
								<option value = "yahoo.com">yahoo.com</option>
								<option value = "nate.com">nate.com</option>
								<option value = "hotmail.com">hotmail.com</option>
								<option value = "daum.net">daum.net</option>
								<option value = "etc">직접입력</option>
							</select>
							</td>
						
						</tr>
						<tr>
							<td class = "label">전화번호</td>
							<td>
								<select id = "tel0" class = "phone" name = "phone1" style="width: 90px; margin-left: 0px; height: 30px;">
									<option value = "010">010</option>
									<option value = "011">011</option>
									<option value = "016">016</option>
									<option value = "019">019</option>
								</select>
								<input id = "tel1" class = "phone" type="tel" maxlength="4" name="phone2" style="width: 100px; height: 30px; margin-left: 5px;">
								<input id = "tel2" class = "phone" type="tel" maxlength="4" name="phone3" style="width: 100px; height: 30px;  margin-left: 5px;">
							</td>
						</tr>
						<tr>
							<td></td>
							<td id ="infoP"></td>
						</tr>
					</table>
					
					<button id = "pwdBtn" class = "btn" onclick="sendEmail('pwd')">확인하기</button>
				</div>
			</div>
			
	</div><!-- container -->
</div><!-- mainContent -->
<jsp:include page="../common/footer.jsp"/>
	
<script type="text/javascript">

function SetEmailTailI(emailValue) {
	  var email = document.all("email")    // 사용자 입력
	  var emailTail = document.all("email2I") // Select box
	  
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
function SetEmailTailP(emailValue) {
	  var email = document.all("email")    
	  var emailTail = document.all("email2P") 
	  
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

</script>
	
<script type="text/javascript">
id = null; 
pwd = null;

function sendEmail(idOrPwd){

	
	
	if(idOrPwd == "id"){
		$.ajax({
			url:"findId.me",
			data:{
				userName : $("#nameI").val(),
				userEmail : $("#emailPtI").val()+"@"+$("#email2I").val()
			},
			success : function(data) {
				if(data == null){
					$("#infoI").html("일치하는 정보가 없습니다.");
					$("#infoI").css("color", "red");
				}else{
					$("#infoI").html("아이디를 이메일로 전송하였습니다.");
					$("#infoI").css("color", "blue");
					id = data;
					(function() {
						if (idOrPwd == "id") {
							var emailC = {
								name : $("#nameI").val() +" 님 안녕하세요." ,
								contents : "찾으시는 아이디는 '" + id + "'입니다.",
								userEmail : $("#emailPtI").val() + "@"
										+ $("#email2I").val()
							}
						} else if (idOrPwd == "pwd") {
							var emailC = {
									name : $("#nameI").val() +"님 안녕하세요." ,
								contents : "임시비밀번호는 '" + pwd + "'입니다.",
								userEmail : $("#emailPtP").val() + "@"
										+ $("#email2P").val()
							}
						}
						emailjs.init("user_HlxjcXkwprYA6BotVhghI");
						emailjs.send("khoffline@gmail.com", "template_dlyBf4qf", emailC)/* pwd:academy!2 */
								.then(
										function(response) {
											console.log("SUCCESS. status=%d, text=%s",
													response.status, response.text);
					
											$.ajax({
												url : "newPwd.me",
												data : {
													userId : $("#idP").val(),
													userEmail : $("#emailPtP").val()+"@"+$("#email2P").val(),
													phone : $("#tel0").val()+"-"+$("#tel1").val()+"-"+$("#tel2").val(),
													newPwd : pwd
												},
												success : function(data) {
													swal("Success!", "Check your email", "success");
												}
											});
										}, function(err) {
											console.log("FAILED. error=", err);
										});
					})();
				}
			}
		});
	}
	
	
	if(idOrPwd == "pwd"){
		$.ajax({
			url : "findPwd.me",
			data : {
				userId : $("#idP").val(),
				userEmail : $("#emailPtP").val()+"@"+$("#email2P").val(),
				phone : $("#tel0").val()+"-"+$("#tel1").val()+"-"+$("#tel2").val()
			},
			success : function(data) {
				if(data == "0"){
					$("#infoP").html("일치하는 정보가 없습니다.");
					$("#infoP").css("color", "red");
				}else{
					$("#infoP").html("임시비밀번호를 이메일로 전송하였습니다.");
					$("#infoP").css("color", "blue");
					pwd = data;
					(function() {
						if (idOrPwd == "id") {
							var emailC = {
								contents : "찾으시는 아이디는 '" + id + "'입니다.",
								userEmail : $("#emailPtI").val() + "@"
										+ $("#email2I").val()
							}
						} else if (idOrPwd == "pwd") {
							var emailC = {
								contents : "임시비밀번호는 '" + pwd + "'입니다.",
								userEmail : $("#emailPtP").val() + "@"
										+ $("#email2P").val()
							}
						}
						emailjs.init("user_HlxjcXkwprYA6BotVhghI");
						emailjs.send("khoffline@gmail.com", "template_dlyBf4qf", emailC)/* pwd:academy!2 */
								.then(
										function(response) {
											console.log("SUCCESS. status=%d, text=%s",
													response.status, response.text);
					
											$.ajax({
												url : "newPwd.me",
												data : {
													userId : $("#idP").val(),
													userEmail : $("#emailPtP").val()+"@"+$("#email2P").val(),
													phone : $("#tel0").val()+"-"+$("#tel1").val()+"-"+$("#tel2").val(),
													newPwd : pwd
												},
												success : function(data) {
													swal("Success!", "Check your email", "success");
												}
											});
										}, function(err) {
											console.log("FAILED. error=", err);
										});
					})();
				}
			}
		});
	}

	}
</script>
</body>
</html>