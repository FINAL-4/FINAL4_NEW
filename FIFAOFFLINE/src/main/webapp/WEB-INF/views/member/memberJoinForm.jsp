<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

.swal-button--danger {
    background-color: black;
}
.swal-button--danger:not([disabled]):hover {
    background-color: black;
}
.swal-button--confirm{
 
  background-color: black;

}.swal-button--confirm:not([disabled]):hover{
 
  background-color: black;

}

input:focus {
     outline: none;
   }
.outer {
   /* border: 2px solid black; */
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

.postcodify_controls input{
margin-top: 0;
margin-left: 0;
}


input {
   font-size: 18px;
   margin-top: 20px;
   width: 400px;
   height: 40px;
   margin-left: 20px;
}

label {
   font-size: 15px;
}

#idCheck, #joinBtn, #searchAdd {
   margin-top: 2px;
   background: black;
   color: white;
   border-radius: 10px;
   width: 150px;
   height: 40px;
   text-align: center;
   border: none;
   padding: 10px 16px;
   font-size: 15px;
   cursor: pointer;
   box-shadow: 0 5px #999;
}

#joinBtn:hover {
   background-color: #e9ecef;
   color: black;
}

#idCheck:active {
   color: white;
   background-color: #f53f29;
   box-shadow: 0 3px #666;
   transform: translateY(4px);
   border-radius: 16px;
}

#joinBtn:active {
   color: white;
   background-color: gray;
   box-shadow: 0 3px #666;
   transform: translateY(4px);
   border-radius: 16px;
}

#searchAdd {
   align-content: left;
}

td {
   margin-top: 15px;
   font-size: 22px;
   text-align: left;
   height: 50px;
}

select {
   font-size: 18px;
   height: 46px;
   width: 400px;
   
   margin-top: 20px;
}

#joinForm tr {
   margin-bottom: 30px;
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

#goMain {
   background-color: #f1f1f1;
   color: black;
   border-radius: 16px;
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
   border-radius: 4px;
}

#goMain:active {
   color: white;
   background-color: black;
   box-shadow: 0 3px #666;
   transform: translateY(4px);
   border-radius: 4px;
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
   padding-left: 10px;
   vertical-align: middle;
   font-size: 20px;
}

#joinTdbirth {
   margin-right: 80px;
}

.memberjoinForm {
   
   margin: 0 auto 0 auto;
   width: 80%;
   height: 700px;
}
/* 개인정보 탭  */
#userinfo1 {
   width: 20px;
   position: relative;
   top: 14px;
}

canvas {
   width: 300px;
   height: 300px;
   border: 1px solid gray;
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
   padding: 5px 16px 20px;
   color: white;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: black;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: 4px;
   width: 100px;
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
         <div style="align: center">
            
         </div>
   
         
         
         
         <div class="memberjoinForm" style = "padding-bottom:200px; ">
               <h2 align="center">
                  <em>FIFAOFFLINE에 오신 것을 환영합니다.</em>
               </h2>
               
            <br>

            <form id="joinForm" enctype="multipart/form-data"
               action="join.me" method="post">
               
               <div style = "width: 50%;  display: inline-block; float: left; border-right: 2px solid grey;">
               <table align="center">
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
                           <input type="text" id="birthDay" maxlength="6" name="birthDay" placeholder="ex)000930"
                              style="width: 35%;" requi#f53f29>
                              
                           <input id="genderM" type="radio" name="gender" value="M"
                              style="width: 18px; height: 18px;" requi#f53f29>
                           <label for="genderM">남</label> <input id="genderF"
                              type="radio" name="gender" value="F"
                              style="width: 18px; height: 18px; " requi#f53f29> <label
                              for="genderF">여</label>
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
                     <td id="emailPt">
                     <input type="text" name="emailId"
                        style="width: 20%;"
                        requi#f53f29>
                     <em>@</em>
                     <input
                        type="text" name="email2" value="naver.com"
                        style="width: 21%; margin-left: 4px;" ReadOnly>
                     
                     <select id="selctEmail" name="selctEmail" class="info"
                        style="width: 23%; margin-left: 0px;"
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
                  <tr>
                     <th>주소</th>
                     <td><input type="text" name="address1" id = "address1"
                        class="postcodify_address" value="" readonly>
                     
                        <button type="button" id="postcodify_search_button"><i class="fa fa-search"></i>검색</button>
                     </td>
                  </tr>
                  <tr>
                     <th>상세 주소</th>
                     <td><input id = "address2" type="text" name="address2" class="postcodify_extra_info" value=""></td>
                  </tr>

                  <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
            <script>
               
               $(function(){
                  $("#postcodify_search_button").postcodifyPopUp();
               });
            </script>
                  
                  
               </table>
               </div>
               
               <div class="filebox" style = " display: inline-block; width: 35%; margin-left: 10%;">
               <table> 
                  <tr>
                     <th colspan="4" style="text-align: left;" >프로필사진</th>
                  </tr>
                  <tr>
                     <td class="profile" colspan="2">
                  
                  <img id="contentImg" width="300" height="300">
                  
                  <!-- <canvas
                       id = "canvas">
                  </canvas> -->
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                     
                     <label for="uploadFile">사진선택</label>
                     <input 
                            id = "uploadFile"
                            name="uploadFile"
                            type = "file"
                           class="upload-hidden"
                            multiple = "false"
                            accept = "image/*"
                           
                            onchange = "upload()" style = "width: 280px;">
                     </td></tr>
                  
                  
                  
                  
                  
    </div>
    
   <div id="fileArea">
      <input type="file" id="uploadFile" multiple="multiple" name="uploadFile" onchange="LoadImg(this,1)">
   </div>
   
   <script>
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

      
   
      // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 부분(함수)
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
      

   </script>
                  
                  
                  
                  <!-- </script> -->
                  </table>
                  </div>
                  <div style = " display: inline-block; width: 35%; margin-left: 10%;"><table>
                  <tr>
                     <th colspan="4" style="text-align: left; padding-top: 50px;">
                        포지션
                     </th>
                  </tr>
                  <tr>
                  
                     <td style="width: 0px;">
                     <div style="width: 100px; margin: 0; display: inline-block;">
                        <input type="checkbox" id="GK" name="position" value="GK" style="width: 18px; height: 18px; margin:0;">
                        <label for="GK">골키퍼</label>
                     </div>
                     </td>
                     <td style="width: 0px;">
                     <div style="width: 100px; margin: 0; display: inline-block;">
                        <input type="checkbox" id="DF" name="position" value="DF" style="width: 18px; height: 18px; margin:0;">
                        <label for="DF">수비수</label>
                     </div>
                     </td>
                     <td style="width: 0px;">
                     <div style="width: 100px; margin: 0; display: inline-block;">
                        <input type="checkbox" id="MF" name="position" value="MF" style="width: 18px; height: 18px; margin:0; ">
                        <label for="MF">미드필더</label>
                     </div>
                     </td>
                     <td style="width: 0px;">
                     <div style="width: 100px; margin: 0; display: inline-block;">
                        <input type="checkbox" id="FW" name="position" value="FW" style="width: 18px; height: 18px; margin:0;">
                        <label for="FW">공격수</label>
                     </div>
                     </td>
                  
                  </tr>
               
               </table>
               </div>
               
               
            </form>
         </div>
            

               <div align="center">
               <input type="button" class="btns" id="joinBtn"
                     onclick="insertMember()" value="가입하기">

               <input type="button" class="btns" id="goMain" onclick="location.href='home.do'"
                     value="메인으로">
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
         var idRe = /^[a-z,A-Z,0-9]{4,12}$/;

         $.ajax({
            url : "Du.me",
            data : {
               id : userId
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
               } else if (data.Usable == false) {
                  $("#checkId").css("color", "#f53f29");
                  $("#userId").css("border", "2px solid #f53f29");
                  $("#checkId").text("중복된 아이디입니다.");
                  idCheck = false;
               } else {
                  $("#checkId").text("사용가능한 아이디입니다.");
                  $("#checkId").css("color", "green");
                  $("#userId").css("border", "2px solid green");
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
            $("#checkPwd").css("color", "green");
            $("#userPwd").css("border", "2px solid green");
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
            $("#checkPwd2").css("color", "green");
            $("#userPwd2").css("border", "2px solid green");
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
            $("#checkName").css("color", "green");
            $("#userName").css("border", "2px solid green");
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
            $("#checkPhone").css("color", "green");
            $("#tel0").css("border", "2px solid green");
            $("#tel1").css("border", "2px solid green");
            $("#tel2").css("border", "2px solid green");
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
            $("#checkRRN").css("color", "green");
            $("#birthDay").css("border", "2px solid green");
            $("#checkRRN").text("유효한 생년월일입니다.");
            rrnCheck  = true;
         }
      });
      
      
      // 회원가입 하기 함수
      function insertMember(){
         if(idCheck == false){
            swal("아이디를 확인해주세요");
            $("#userId").focus();
         }else if(pwdCheck  == false){
            swal("비밀번호를 확인해주세요");
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
         }else if($("input:radio[name='gender']").is(":checked")==false){
            swal("성별을 선택해주세요.");
            $("input:radio[name='gender']").focus();
         }else if($("#address1").val() == ""){
            swal("주소을 입력해주세요.");
            $("#adderess1").focus();
         }else if($("#address2").val() == ""){
            swal("상세 주소을 입력해주세요.");
            $("#adderess2").focus();
         }else if($("#emailId").val() == ""){
            swal("이이메일을 입력해주세요.");
            $("#emailId").focus();
         }else{
            swal({
                    title: "회원가입하시겠습니까?",
                    text: "저희는 회원 탈퇴가 없습니다.",
                    icon: "info",
                    buttons: true,
                    dangerMode: true,
                  })
                  .then((willDelete) => {
                    if (willDelete) {
                      swal("회원 가입 성공 하셨습니다.", {
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