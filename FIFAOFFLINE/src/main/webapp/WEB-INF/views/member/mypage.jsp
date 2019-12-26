<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.kh.FIFAOFFLINE.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

   Member m =(Member)session.getAttribute("loginUser");


%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js'></script>
<script
   src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>

<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<title>KH sports</title>
<style>
.swal-button--confirm{
 
  background-color: black;

}
.swal-button--confirm:not([disabled]):hover{
 
  background-color: black;

}
.postcodify_controls input{
margin-top: 0;
margin-left: 0;
}

input:focus {
     outline: none;
   }
.outer {
   
   width: 90%;
   height: 500px;
   background: white;
   color: black;
   margin-left: 5%;
   margin-right: 5%;
   margin-top: 3%;
   position: relative;
}

.outer label, .outer td {
   color: black;
}

#joinForm {
   margin-top: 40px;
}

input {
   font-size: 20px;
   margin-top: 20px;
   width: 400px;
   height: 40px;
   margin-left: 20px;
}

#idCheck, #joinBtn, #searchAdd {
   margin-top: 2px;
   background: black;
   color: white;
   border-radius: 4px;
   width: 150px;
   height: 40px;
   text-align: center;
   border: none;
   padding: 10px 16px;
   font-size: 15px;
   cursor: pointer;
   box-shadow: 0 5px #999;
}

#idCheck:hover, #joinBtn:hover, #searchAdd:hover {
   background-color: #f1f1f1;
   color: #002aff;
   
}

#idCheck:active {
   color: white;
   background-color: gray;
   box-shadow: 0 3px #666;
   transform: translateY(4px);
   border-radius: 4px;
}

#joinBtn:active {
   color: white;
   background-color: gray;
   box-shadow: 0 3px #666;
   transform: translateY(4px);
   border-radius: 16px;
}
.swal-button--danger {
    background-color: black;
}
.swal-button--danger:not([disabled]):hover {
    background-color: black;
}

#searchAdd {
   align-content: left;
}

td {
   margin-top: 20px;
   font-size: 22px;
   text-align: left;
   height: 50px;
}

.joinTd {
   width: 100px;
}

select {
   font-size: 20px;
   height: 46px;
   width: 350px;
   margin-top: 20px;
}

#joinForm tr {
   margin-bottom: 40px;
}

#postcodify_search_button {
   background-color: lightgery;
   color: black;
   border-radius: 4px;
   height: 43px;
   text-align: left;
   border: none;
   padding: 0px 16px;
   font-size: 16px;
   cursor: pointer;
   
}
#postcodify_search_button:hover {

}

#goMain {
   background-color: #f1f1f1;
   color: black;
   border-radius: 4px;
   width: 150px;
   height: 40px;
   text-align: center;
   border: 1px solid black;
   border: none;
   padding: 10px 16px;
   font-size: 15px;
   cursor: pointer;
   box-shadow: 0 5px #999;
}

#goMain:hover {
   background-color: #666;
   color: white;
   
}

#goMain:active {
   color: white;
   background-color: black;
   box-shadow: 0 3px #666;
   transform: translateY(4px);
   
}

#joinBtn, #goMain {
   display: inline-block;
}

.btns {
   margin: 50px;
   font-size: 20px;
   padding: auto;
}

#idCheckPop {
   width: 500px;
   height: 200px;
   display: none;
   background: white;
   padding: 20px;
}

th {
   max-width: 200px;
   height: 20px;
   text-align: right;
   font-size:20px;
   vertical-align: middle;
}

#joinTdbirth {
   margin-right: 80px;
}

.scrollheader {
   position: fixed;
   top: 0;
   z-index: 1;
   width: 100%;
   background-color: #f1f1f1;
   font-size: 35px;
   
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


.memberjoinForm {
   padding: 50px 0 250px 0;
   margin: 0 auto 0 auto;
   width: 100%;
   height: 700px;
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
   overflow: scroll;
   height: 100px;
   font-size: 12px;
}

#personinfo {
   width: 490px;
}

#userinfo1 {
   width: 20px;
   position: relative;
   top: 14px;
}

canvas {
   width: 300px;
   height: 300px;

   
}
.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

.filebox label {
   display: inline-block;
   padding: 2px 16px 20px;
   color: white;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: black;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: 4px;
   width: 25%;
   height: 20px;
   
} /* named upload */
.filebox .upload-name {
   display: inline-block;
/*    padding: .5em .75em; */ /* label의 패딩값과 일치 */
   font-size: inherit;
   font-family: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #f5f5f5;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: 4px;
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   -moz-appearance: none;
   appearance: none;
   width:60%;
   margin: 0;
}
</style>
</head>




<body>


   <div id="container" style="">
      <!-- container -->
      <div id="mainContent" style="">
         <!-- mainContent -->
         
         
      
         <div class="memberjoinForm">
               <h1 align="center"style="font-size: 50px;">
                  회원정보수정
               </h1>
            <br>

            <form id="joinForm" enctype="multipart/form-data" action="mupdate.me"
               method="post">
                  <input type="hidden" name = "userNo" value="${loginUser.userNo }">
                   <input type="hidden" name = "status" value="${loginUser.status }">
                   <input type="hidden" name = "aCount" value="${loginUser.aCount }">
                  <input type="hidden" name = "joinDate" value="${loginUser.joinDate }"> 

               <div style="width: 50%; display: inline-block; float: left; border-right: 2px solid grey;">
                  <table align="center">
                     <tr>
                        <th width="200px;">아이디</th>
                        <td><input id="userId" type="text" maxlength="13" 
                           value="${loginUser.userId }" readonly name="userId" requi#f53f29>
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
                        <th>이름</th>
                        <td><input id="userName" type="text" maxlength="5"
                           name="userName" value="${loginUser.userName }" requi#f53f29>
                           <div id="checkName" class="checkInfo" style="font-size: 0.7em"></div></td>
                     </tr>
                     <tr>
                        <th>생년월일</th>
                        <td>
                           <div id="joinTdbirth">
                              <input type="text" id="birthDay" maxlength="6" name="birthDay"
                                 value="${loginUser.birthDay }" placeholder="ex)191129"
                                 style="width: 40%;" requi#f53f29>

                              <c:if test="${loginUser.gender eq 'M'}">
                                 <input id="genderM" type="radio" name="gender" value="M" checked
                                     style="width: 18px; height: 18px;" >
                                 <label for="genderM">남</label>
                                 <input id="genderF" type="radio" name="gender" value="F"
                                    style="width: 18px; height: 18px;" disabled >
                                 <label for="genderF">여</label>
                              </c:if>
                              <c:if test="${loginUser.gender eq 'F'}">
                                 <input id="genderM" type="radio" name="gender" value="M"
                                    style="width: 18px; height: 18px;" disabled  >
                                 <label for="genderM">남</label>
                                 <input id="genderF" type="radio" name="gender" value="F" checked
                                  style="width: 18px; height: 18px;" >
                                 <label for="genderF">여</label>
                              </c:if>
                           </div>
                           <div id="checkRRN" class="checkInfo" style="font-size: 0.7em"></div>
                        </td>
                     </tr>

                     <tr>
                        <th>연락처</th>
                        <c:forTokens var="tal" items="${loginUser.phone}" delims="-"
                        varStatus="status">
                        <c:if test="${status.index eq 0}">
                        <td>
                        <select id="tel0" class="phone" name="phone1" value="${tal}"
                           style="width: 19%; margin-left: 18px; height: 48px;">
                              <option value="010">010</option>
                              <option value="011">011</option>
                              <option value="016">016</option>
                              <option value="019">019</option>
                        </select>
                        </c:if>
                        <c:if test="${status.index eq 1}">
                        <input id="tel1" class="phone" type="tel" maxlength="4" value="${tal}"
                           name="phone2" style="width: 22%; margin-left: 15px;">
                        </c:if>
                        <c:if test="${status.index eq 2}">
                        <input id="tel2" class="phone" type="tel" maxlength="4"   value="${tal}"
                           name="phone3" style="width: 22%; margin-left: 15px;">
                        </c:if>
                        
                        </c:forTokens>
                     </tr>
                        <tr>
                           <th>이메일</th>
                           <td id="emailPt" width="60%">
                     <c:forTokens var="mail" items="${loginUser.userEmail}" delims="@"
                        varStatus="status">
                           <c:if test="${status.index eq 0}">
                              <input type="text" name="emailId" value="${mail }"
                                 style="width: 18%;" requi#f53f29>
                                 <em>@</em>
                              </c:if>
                              <c:if test="${status.index eq 1}">   
                              
                              <input type="text" name="email2" value="${mail }"
                                 style="width: 21%; margin-left: 4px;" ReadOnly
                                 placeholder="naver.com">
                              
                           </c:if>
                        </c:forTokens>
                              
                              
                              <select id="selctEmail" name="selctEmail"
                                 class="info" style="width: 23%; margin-left: 0px;"
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
                              </select>
                              </td>                              
                        </tr>
                     
                     <c:forTokens var="addr" items="${loginUser.address}" delims=","   varStatus="status">
                           <c:if test="${status.index eq 0}">
                        <tr>
                              <th>주소</th>
                              <td><input type="text" name="address1"
                                 class="postcodify_address" value="${addr}" readonly>
                              <button type="button" id="postcodify_search_button"><i class="fa fa-search"></i>검색</button>
                              
                           </td>
                        </tr>
                           </c:if>
                        
                           <c:if test="${status.index eq 1}">
                        <tr>
                              <th>상세 주소</th>
                              <td><input type="text" name="address2"
                                 class="postcodify_extra_info" value="${addr}"></td>
                        </tr>
                        </c:if>
                     </c:forTokens>

                  <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
            <script>
               $(function(){
                  $("#postcodify_search_button").postcodifyPopUp();
               });
            </script>

                  </table>
               </div>



               <div class="filebox" style= " display: inline-block; width: 35%; margin-left: 10%;">
                  <table>
                     <tr>
                        <th colspan="4" style="text-align: left;">프로필사진</th>
                     </tr>
                        
                     
                        
               <tr>
                  <td class="profile" colspan="2">
                  <script   src="https://www.dukelearntoprogram.com/course1/common/js/image/SimpleImage.js">
                  </script>
                     <div id = "img">
                        <img id ="contentImg" src ="resources/proFiles/${loginUser.profile }" style = "width: 300px; height: 300px;">
                     </div>

                  </td>   
               </tr>
               <tr>
                        
                        <td colspan="2">
                        <input class="upload-name" value="${loginUser.profile }" disabled="disabled">
                        <label for="uploadFile">사진선택</label>
                        <input
                         id="uploadFile"
                         name="uploadFile"
                         class="upload-hidden"
                         type="file"
                         multiple="false"
                         accept="image/*" 
                         onchange="LoadImg(this,1)" style="width: 280px;">
                           
            
                        </td>
                        </tr>
                        <script>
                        function LoadImg(value, num){
			if(value.files[0] != undefined){	
				// value는 함수를 발동시킨 객체(file타입 input태그)이고
				// value.files[0]은 input태그로 파일을 선택했으면 undefined가 아니고 선택안했으면 undefined다.
				var reader = new FileReader();
				
				reader.onload = function(e){
					switch(num){
					case 1:
						
						$("#contentImg").attr("src", e.target.result);
						break;
				}
			}
				reader.readAsDataURL(value.files[0]);
			}
		}
                 
                  
                     
                  function upload()
                  {
                  
                     $("#img").css("display","none");
                     $("#canvas").css("display","inline-block");
                    var Ican = document.getElementById ("canvas");
                    var proup = document.getElementById ("uploadFile");
                    var ima1 = new SimpleImage (proup);
                    ima1.drawTo (Ican);
                  }
                  $(document).ready(function(){
                     var fileTarget = $('.filebox .upload-hidden');
                     fileTarget.on('change', function(){ // 값이 변경되면 
                     if(window.FileReader){ // modern browser 
                     var filename = $(this)[0].files[0].name; } else { // old IE 
                     var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
                     } // 추출한 파일명 삽입
                     $(this).siblings('.upload-name').val(filename); 
                     });
                     });
                  </script>
                  </table>
                  </div>
                  
                  <div style= " display: inline-block; width: 35%; margin-left: 10%;">
                  <table>
                     <tr>
                        <th colspan="4" style="text-align: left;">포지션</th>
                     </tr>
                      <c:forTokens var="pos" items="${loginUser.position}" delims="," varStatus="status"> 
                         <c:if test="${pos == 'GK' }">
                         <c:set var="GK" value="CHECKED"/>
                       </c:if>
                       <c:if test="${pos == 'DF' }">
                         <c:set var="DF" value="CHECKED"/>
                      </c:if>
                      <c:if test="${pos == 'MF' }">
                         <c:set var="MF" value="CHECKED"/>
                      </c:if>
                      <c:if test="${pos == 'FW' }">
                         <c:set var="FW" value="CHECKED"/>
                      </c:if>
                      </c:forTokens> 
                        <tr>
                        
                        <td>
                         <input type="checkbox" id="GK" name="position"  
                           value="GK" ${GK} style="width: 18px; height: 18px; "> <label for="GK">골키퍼</label>
                        </td>
                        
                        <td>
                        <input type="checkbox" id="DF" name="position" 
                           value="DF" ${DF} style="width: 18px; height: 18px; "> <label for="DF">수비수</label>
                        </td>
                        
                        <td>
                        <input type="checkbox" id="MF" name="position"
                           value="MF" ${MF} style="width: 18px; height: 18px; "> <label for="MF">미드필더</label>
                        </td>
                        
                        <td>
                        <input type="checkbox" id="FW" name="position" 
                           value="FW" ${FW} style="width: 18px; height: 18px; "> <label for="FW">공격수</label>
                        </td>
                     </tr>
                  </table>
               </div>

               

            </form>
         </div>
               <div align="center">
                  <input type="button" class="btns" id="joinBtn"
                     onclick="insertMember()" value="수정하기">

                  <input type="button" class="btns" id="goMain"
                     onclick="location.href='home.do'" value="메인으로">
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
   
      
      idCheck = true;
      pwdCheck = true;
      pwdCheck2 = true;
      nameCheck = true;
      phoneCheck = true;
      rrnCheck = true;
      
      
      
      

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
            $("#checkRRN").text("정확한 생년월일 6자리");
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
         if(pwdCheck  == false){
        	 swal("비밀번호를 확인해주세요.");
            $("#userPwd").focus();
         }else if(pwdCheck2  == false){
        	 swal("비밀번호 일치여부를 확인해주세요.");
            $("#userPwd2").focus();
         }else if(nameCheck  == false){
        	 swal("이름를 확인해주세요.");
            $("#name").focus();
         }else if(phoneCheck  == false){
        	 swal("전화번호를 확인해주세요.");
            $("#tel1").focus();
         }else if(rrnCheck  == false){
        	 swal("생년월일를 확인해주세요.");
            $("#birthDay").focus();
         }else if($("#emailId").val() == ""){
        	 swal("이메일을 입력해주세요.");
            $("#emailId").focus();
         }else{
           
            swal({
            	  title: "정보를수정하시겠습니까?",
            	  text: "정확하게 수정하셧는지 확인하셨나요?",
            	  icon: "info",
            	  buttons: true,
            	  dangerMode: true,
            	})
            	.then((willDelete) => {
            	  if (willDelete) {
            	    swal("회원정보를 수정하엿습니다.", {
            	      icon: "success",
            	    });
          		  $("#joinForm").submit();
            	  } else {
            		  return false;
            	  }
            	});
         }   
      }
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   </script>


</body>
</html>