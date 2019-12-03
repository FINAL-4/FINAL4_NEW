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
		
		<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>		
		<script src="js/modernizr.custom.js"></script>
		<script src="js/modernizr.custom.js"></script>
		
		<style>	
		input[type=text], input[type=password] {
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  box-sizing: border-box;
		}
		
		button {
		  background-color: #4CAF50;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		}  
		 
		button:hover {
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
		  text-align: center;
		  margin: 24px 0 12px 0;
		  position: relative;
		}

		.container {
		  padding: 16px;
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
		  z-index: 51; /* Sit on top */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		  padding-top: 60px;
		}
		
		/* Modal Content/Box */
		.modal-content {
		  background-color: #fefefe;
		  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
		  border: 1px solid #888;
		  width: 80%; /* Could be more or less, depending on screen size */
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
						<a class="menu__item" href="tlist.tm" id="teamMenu"> <span class="menu__item-name">팀       </span> </a>
						<a class="menu__item" href="playMain.pl" id = "playerMenu" style = "border:none;"> <span class="menu__item-name">용병     </span> </a> 
						<a class="menu__item" href="goMatch.ma" id = "matchMenu" style = "border: none;"> <span class="menu__item-name">매칭     </span></a>

						<a class="menu__item" href="#" style = "border: none;"> <span class="menu__item-name">마이페이지     </span></a>
						<span><img id = "login-logo" src="resources/images/login-b.png" width="30px;" height="30px;" onclick="document.getElementById('id01').style.display='block'"></span> 

						
					</nav>
				</div>
			</div>	
		</header>



		

		<div id="id01" class="modal">
		  
		  <form class="modal-content animate" action="login.me" method="post">
		<div class="imgcontainer">
     		 <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      
    	</div>
		
		    <div class="container">
		      <label for="id"><b>Username</b></label>
		      <input type="text" placeholder="Enter Username" name="userId" required>
		
		      <label for="psw"><b>Password</b></label>
		      <input type="password" placeholder="Enter Password" name="userPwd" required>
		        
		      <button id = "loginBtn">Login</button>
		      <label>
		        <input type="checkbox" checked="checked" name="remember"> Remember me
		      </label>
		      <div>
		      <span class="join">회원이아니신가요? <a href="goJoin.me">회원가입하러가기</a></span>
		      
		      <span class="find">비밀번호를 잊으셨나요? <a href="find.me">비밀번호 찾으러가기</a></span>
		    </div>
		    </div>
		
		
		    
		  </form>
		</div>
		
		<script>
		// Get the modal
		
		var modal = document.getElementById('id01');
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		$(".close").click(function(){
			/* modal.style.display="none"; */
			alert("얍");
		});
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
