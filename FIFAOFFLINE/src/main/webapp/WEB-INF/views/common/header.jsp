<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<title>메인 페이지 시작</title>
		<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/style-ama.css" />
		<link rel="stylesheet" href="resources/css/base.css">
  		<link rel="stylesheet" href="resources/css/main.css">  
		<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		  var $$ = jQuery.noConflict();
		</script>
		
		
		<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>		
		<script src="js/modernizr.custom.js"></script>
		<script src="js/modernizr.custom.js"></script>
		
		<style>	
		#loginModal input[type=text], #loginModal input[type=password] {
		 outline:none;
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  box-sizing: border-box;
		  font-size: 13px;
		}
		
		#id01 button {
		
		  background-color: black;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: 1px solid black;
		  cursor: pointer;
		  width: 100%;
		  margin-bottom: 10px;
		  font-size: 25px;
		}  
		 
		#id01 button:hover {
		 opacity: 0.8;
		  
		}
		 
		/* Extra styles for the cancel button */
		.cancelbtn {
		  width: auto;
		  padding: 10px 18px;
		  background-color: #f44336;
		}
		
		/* Center the image and position the close button */
		.imgcontainer {
		 position: relative;
		}

		.container {
		  padding: 40px;
		 
		}
		
		#login-logo:hover,#logout-logo:hover{
		 opacity: 0.1;
		 cursor: pointer;
		 
		}
		span.find {
		  float: right;
		  /* padding-top: 16px; */
		}
		span.join{
		float: right;
		}
		
		
		/* Add Zoom Animation */
		.animate {
		  -webkit-animation: animatezoom 0.6s;
		  animation: animatezoom 0.6s
		}
		
		@-webkit-keyframes animatezoom {
		  from {-webkit-transform: scale(0)} 
		  to {-webkit-transform: scale(1)}
		}
		  
		@keyframes animatezoom {
		  from {transform: scale(0)} 
		  to {transform: scale(1)}
		}
		
		/* Change styles for span and cancel button on extra small screens */
		@media screen and (max-width: 300px) {
		  span.find {
		     display: block;
		     float: none;
		  }
		  span.join{
		  display: block;
		  float :none;
		  }
		}
		
/* The Modal (background) */
		.modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 50; /* Sit on top */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.2); /* Black w/ opacity */
		  padding-top: 150px;
		 
		}
		
		/* Modal Content/Box */
		.modal-content {
		  background-color: #fefefe;
		  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
		  border: 1px solid darkgary;
		  width: 20%; /* Could be more or less, depending on screen size */
		}
		
		/* The Close Button (x) */
		.close {
		  position: absolute;
		  right: 25px;
		  top: 0;
		  color: #000;
		  font-size: 35px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: red;
		  cursor: pointer;
		}
		

		
		</style>	
	</head>
	<body>


			
		<header id="ha-header" class="ha-header ha-header-large" >
			<div class="ha-header-perspective">
				<div class="ha-header-front" style = "padding-bottom: 100px; background: whitesmoke;" >
					<span>
						<img id = "header-logo" src="resources/images/fifalogo1.png" width="280px;" height="70px;" onclick = "location.href='home.do'" style = "margin-top: 20px; cursor: pointer">
					</span>
					<nav class="menu menu--ama" style = "margin-bottom: 100px;">
						<!-- <a class="menu__item" href="nlist.do" style = "border: none;"> <span class="menu__item-name">공지    </span></a> -->
						<a class="menu__item" href="nlist.do" style = "border: none;"> <span class="menu__item-name">공지    </span></a>  
						<c:if test="${!empty sessionScope.loginUser }">
						<a class="menu__item" href="tlist.tm" id="teamMenu"> <span class="menu__item-name">팀       </span> </a>
						</c:if>
						<c:if test="${empty sessionScope.loginUser }">
						<a class="menu__item" onclick="document.getElementById('id01').style.display='block'" id= "teamMenu"> <span class="menu__item-name">팀       </span> </a>
						</c:if>
						<c:if test="${!empty sessionScope.loginUser }">
						<a class="menu__item" href="playMain.pl" id = "playerMenu" style = "border:none;"> <span class="menu__item-name">용병     </span> </a>
						</c:if> 
						<c:if test="${empty sessionScope.loginUser }">
						<a class="menu__item" onclick="document.getElementById('id01').style.display='block'" id = "playerMenu" style = "border:none;"> <span class="menu__item-name">용병     </span> </a>
						</c:if>
						<a class="menu__item" href="goMatch.ma" style = "border: none;"> <span class="menu__item-name">매칭     </span></a>

						<c:if test="${!empty sessionScope.loginUser }">
						<a class="menu__item" href="mypage.me" style = "border: none;"> <span class="menu__item-name">마이페이지   </span></a>
						</c:if>

						<span>
						<c:if test="${empty sessionScope.loginUser }">
						<img id = "login-logo" src="resources/images/login.png" width="30px;" height="30px;" onclick="document.getElementById('id01').style.display='block'">
						</c:if>
						<c:if test="${!empty sessionScope.loginUser }">
						<c:url var = "logout" value="logout.me"/>
						<label style="font-size : 24px;"> ${loginUser.userName } :) </label>
						<img id = "logout-logo" src="resources/images/logout.png" width="30px;" height="30px;" onclick="location.href='${logout}'" style="margin-left : 40px;">
						</c:if>
						</span> 
						
						

						
					</nav>
				</div>
			</div>	
		</header>



		

		<div id="id01" class="modal" >
		 
		  <form id = "loginForm"  action="login.me"   class="modal-content animate">
		<div class="imgcontainer">
     		 <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    	</div>
		
		    <div id = "loginModal"  class="container" >
		    <h2 style = "font-size: 35px; margin-top: 0px; text-align: center;">LOG-IN</h2>
		      <label for="id" style="font-size: 15px;"><b>ID</b></label>
		      <input type="text" class="id" placeholder="아이디를 입력해주세요." name="userId" required>
		
		      <label for="psw" style="font-size: 15px;"><b>Password</b></label>
		      <input type="password" class="pwd" placeholder="비밀번호를 입력해주세요." name="userPwd" required>
		      <div id = "loginInfo"></div>
		      <button id = "loginBtn" type="button">로그인</button>
		     
		      <div style="display: inline-block;">
		      <span class="join" style="font-size: 12px;">회원이아니신가요? <a href="goJoin.me">회원가입하러가기</a></span>
		     
		     
		      <span class="find" style="font-size: 12px;">아이디 혹은 비밀번호를 잊으셨나요? <a href="find.me">찾으러가기</a></span>
		    </div>
		    </div>
		
		
		    
		  </form>
		</div>
		
		<script>
		/* $$('#keywordBox').keydown(function(e){
			if(e.keyCode == 13){
				$$('#loginBtn').trigger('click');
			}
		}); */
		
	$$("#loginBtn").click(function(e) {
		
		var userId=$$(".id").val();
		var userPwd=$$(".pwd").val();
		 if(userId =="" || userPwd == ""){
			alert("아이디와 비밀번호를 입력하세요");
			return false;
		} 
		$$.ajax({
			url:"loginCheck.me",
			data:{
				userId:userId,
				userPwd:userPwd
			},
			success:function(data){
				if(data == "0"){
					$$("#loginInfo").css("color","red");
					$$("#loginInfo").html("일치하는 정보가 없습니다.");
				}else{

					$$("#loginForm").submit();
				}
			}
		});
	});
		
		var modal = document.getElementById('id01');
		
		
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		
		</script>
		
		

		<script src="resources/js/jquery-2.1.3.min.js"></script>
  		<script src="resources/js/plugins.js"></script>
 		<script src="resources/js/main.js"></script>
		<script src="resources/js/charming.min.js"></script>
		<script src="resources/js/anime.min.js"></script>
		<script src="resources/js/demo.js"></script>
		<script src="resources/js/demo-ama.js"></script>
		<script src="resources/js/waypoints.min.js"></script>
		<script src="resources/js/classie.js"></script>
		<script src="resources/js/sidebarEffects.js"></script>

	</body>
</html>
