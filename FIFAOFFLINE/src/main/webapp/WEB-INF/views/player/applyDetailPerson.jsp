<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

  #playerMenu .menu__item-name::after,
#playerMenu .menu__item-name::before{
	background: red;
	color: red;
}

#playerMenu.menu__item::after,
#playerMenu.menu__item::before{
   	color: red;
}

#playerMenu .menu__item-name{
	color: red;
}
#title{
   font-size: 40px; 
   margin-top: 120px; 
   border-bottom: 5px solid grey;
}
#playContent{
   width: 20%;
   margin-left:3%;
   margin-right:2%;
   font-size:2.4em;
   font-weight: bold;
   margin-top : 3%;
   display: inline-block;
}
#playContent button{
   font-size:15px;
   margin:auto;
   width:100%;
   height:5%;
   padding-top:5px;
   padding-bottom:5px;
}
#picture{
   width:700px; 
   height:300px;  
   padding-right: 400px;
}
#detailContentDiv1{
   width: 40%;
   margin-right:2%;
   margin-left:2%;
   display: inline-block;
   margin-top : 3%;
}
#detailContent1{
   font-size:2em;
   border-collapse: separate;
   border-spacing: 0 30px;
   letter-spacing: 6px;
   font-weight: bold;
}
#locationDiv{
   width: 25%;
   margin-right:3%;
   margin-left:2%;
   display: inline-block;
   margin-top : 3%;
}
#btn{
   margin-top: 2%;
}
#recruitBtn, #applyBtn {
   margin-left:30px;
   width:250px;
   height: 40px;
   font-size: 1.5em;
   font-weight: bold;
   background: black;
   border: 1px solid black;
   color:white;
}
#applyBtn{
   margin-left:980px;
}
#deleteBtn{
   background:black;
   border:1px solid black;
   color:white;
   width: 45%; 
   height: 40px; 
   padding: 0px; 
   margin-right: 5%; 
   font-size: 15px;
}
#modifyBtn{
   background:black;
   border:1px solid black;
   color:white;
   width: 45%; 
   height: 40px; 
   padding: 0px; 
   font-size: 15px; 
}
#recruitBtn:hover, #applyBtn:hover, #deleteBtn:hover, #modifyBtn:hover{
   color:black;
   background: white;
}
#applyDetail{
   margin-top:50px;
   margin-left:30px;
}
#applyDetailTable{
   width:320px;
   border-collapse: separate;
   border-spacing: 10px 25px;
} 
.agreeBtn, .cancelBtn{
   width:35px;
   height:30px;
   font-weight: bold; 
   font-size:1.5em;
}
#agreeBtn:hover, #cancelBtn:hover, #closeBtn:hover{
   cursor: pointer;
}
#closeBtn{
   background: white;
   border: 1px solid white;
}
#detailContent1 td{
   width:400px;
   margin-left: 15px;
   border-bottom: 3px solid lightgrey;
}
h6{
   margin-top:0px;
   margin-bottom:10px;
   font-size:35px;
   
}   

</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 50px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
<div id = "title"> 
   <h4 style="font-size:45px; margin-bottom: 10px; margin-top: 0px; width: 85%; display: inline-block;">${pEnroll.eTitle }</h4>
   <div style = "width: 14%; display: inline-block;">
      <c:url var="pplDelete" value="personPlayListDelete.pl">
         <c:param name="eNum" value="${pEnroll.eNum }"/>
      </c:url>
      <c:url var="pplModify" value="personPlayListModifyView.pl">
         <c:param name="eNum" value="${pEnroll.eNum }"/>
      </c:url>                
      <c:if test="${loginUser.userNo == pEnroll.userNo}">
         <input type = button id = deleteBtn value = "글 삭제하기" onclick = "deleteBtn()">
         <input type = button id = modifyBtn value = "글 수정하기" onclick = "modifyBtn()" class="addressB"> 
      </c:if>
   </div>
</div>
   <div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 850px; width: 90%; border: black; margin: auto;">
                                                                                       <!-- 730 --> 
      <div id = playContent style = "float:left">                                                               
      <table align = center>
         <tr>
            <img id = "picture" src="resources/proFiles/${pEnroll.proFile }">
         </tr>
         <tr>
            <td colspan = 2 style = "width: 100%; text-align: center;"> ${pEnroll.userName } </td> 
         </tr>
      </table>
      </div>
      
      <div id = "detailContentDiv1">
      <h6> 용병 정보 </h6>
      <table id = detailContent1> 
         <tr>
            <td>매너</td> 
            <td>${pEnroll.eManner } </td>
         </tr>
         <tr>
            <td>실력</td>
            <td>${pEnroll.eSkill } </td>
         </tr>
         <tr>
            <td>가능 포지션</td>
            <td>${pEnroll.position }</td>
         </tr>
         <tr>
            <td>성별 </td>
            <td>${pEnroll.gender }</td>
         </tr>
         <tr>
            <td>가능 경기장</td>
            <td>${pEnroll.ePlace }
         </tr>
         <tr>
            <td>가능 경기 날짜 </td>
            <td>${pEnroll.eDay }</td>
         </tr>
         <tr>
            <td>가능 경기 시간</td>
            <td>${pEnroll.esHour } 시 ~ ${pEnroll.efHour } 시 </td>
         </tr>
         <tr>
            <td> 참고내용 </td>
         </tr>
         <tr>
            <td colspan=2> &nbsp;&nbsp;&nbsp;${pEnroll.eContent } <br><br> 
            ${pEnroll.phone } 번호로 연락주세요 ! </td>
         </tr>
      </table>
      </div>
      
      <div id = locationDiv>
         <h6 style = "margin-bottom: 5px;">상세위치 </h6>
         <div id = "map" style = "width: 420px; height: 400px; float: left; border: 2px solid grey;"></div>
      </div>
      <div id = btn>
      <c:if test="${loginUser.userNo != pEnroll.userNo}">
         <c:url var="psa" value="personApply.pl">
            <c:param name="userNo" value="${pEnroll.userNo }"/>
         </c:url>
            <input type = button id = applyBtn value = "신청하기" onclick = "applyBtn()">
      </c:if>
            <input type = button id = recruitBtn value = "모집 리스트 보기" onclick = "location.href='playMain.pl'">
      </div>
   </div>   
</div>
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f9f6250199748b3a23d7b3d7d88dde&libraries=services"></script>
<script type="text/javascript">
   var X = Number("${pEnroll.ePlaceX }");
   var Y = Number("${pEnroll.ePlaceY }");
   var N = "${pEnroll.ePlace}";
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
       center: new kakao.maps.LatLng(Y, X), // 지도의 중심좌표
       level: 4 // 지도의 확대 레벨
   };  
   
   //지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption); 
   
   //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
   var mapTypeControl = new kakao.maps.MapTypeControl();
   
   //지도에 컨트롤을 추가해야 지도위에 표시됩니다
   //kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
   map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
   
   //지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
   var zoomControl = new kakao.maps.ZoomControl();
   map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


   // 마커가 표시될 위치입니다 
   var markerPosition  = new kakao.maps.LatLng(Y, X); 

   var imageSrc = 'resources/images/marker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(80, 80), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(38, 80)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
   
   
   // 마커를 생성합니다
   var marker = new kakao.maps.Marker({
       position: markerPosition,
       image: markerImage
   });

   // 마커가 지도 위에 표시되도록 설정합니다
   marker.setMap(map);

   var iwContent = '<div style="padding:0px; font-size: 13px;">'+N+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
       iwPosition = new kakao.maps.LatLng(Y, X); //인포윈도우 표시 위치입니다

   // 인포윈도우를 생성합니다
   var infowindow = new kakao.maps.InfoWindow({
       position : iwPosition, 
       content : iwContent 
   });
     
   // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
   infowindow.open(map, marker); 

</script>

<script>
   var $head = $( '#ha-header' );
   $( '.ha-waypoint' ).each( function(i) {
      var $el = $( this ),
         animClassDown = $el.data( 'animateDown' ),
         animClassUp = $el.data( 'animateUp' );

      $el.waypoint( function( direction ) {
         if( direction === 'down' && animClassDown ) {
            $head.attr('class', 'ha-header ' + animClassDown);
         }
         else if( direction === 'up' && animClassUp ){
            $head.attr('class', 'ha-header ' + animClassUp);
         }
      }, { offset: '100%' } );
   });
</script>

<script type="text/javascript">
   function applyBtn(){
      var playerFlag = false;
      var userNo = ${loginUser.userNo};
      var userNo1 = ${pEnroll.userNo};
      var eNum = ${pEnroll.eNum};
      
      if(!playerFlag){
         $.ajax({
            url:"ajaxApplyPerson.pl",
            data:{userNo:userNo, eNum:eNum, userNo1:userNo1},
            success:function(data){
               if(data == 1){
                  swal("신청을 이미 했습니다!", "", "error");
               } else {
                  swal({
                       title: "정말로 신청하시겠습니까 ? ",
                       text: "해당 번호로 문자메세지가 전송됩니다.",
                       buttons: true,
                       dangerMode: true,
                     })
                     .then((willDelete) => {
                       if (willDelete) {
                         location.href="personApply.pl?userNo="+userNo+"&eNum="+eNum;
                         swal("신청이 완료되었습니다!", {
                           icon: "success",
                         });
                       } else {
                         swal("신청을 취소했습니다!");
                       }
                     });
                  /*var confirmFlag = confirm("정말로 신청하시겠습니까 ? \n해당 번호로 문자메세지가 전송됩니다.");
                   if(confirmFlag){
                     location.href="personApply.pl?userNo="+userNo+"&eNum="+eNum;
                     swal("신청이 완료되었습니다!", "", "success");
                  } else {
                     swal("신청을 취소했습니다!", "", "success");
                  } */
               }
            },
            error:function(request, status, errorData){
               alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
            }
         });
      } else {
         swal("신청이 불가합니다!", "", "error");
      }
   }
   
   
   function deleteBtn(){
      swal({
           title: "정말로 삭제하시겠습니까 ? ",
           buttons: true,
           dangerMode: true,
         })
         .then((willDelete) => {
           if (willDelete) {
            location.href='${pplDelete}'
            swal("삭제가 완료되었습니다!", {
               icon: "success",
             });
           } else {
             swal("삭제를 취소했습니다!");
           }
         });
      
      /* var deleteBtn = confirm("정말로 삭제하시겠습니까 ?");
      if(deleteBtn){
         location.href='${pplDelete}'
      }else{
         return false;
      } */
   }
   function modifyBtn(){
      swal({
           title: "정말로 수정하시겠습니까 ? ",
           buttons: true,
           dangerMode: true,
         })
         .then((willDelete) => {
           if (willDelete) {
            location.href='${pplModify}'
             swal("수정 화면으로 넘어가겠습니다!", {
               icon: "success",
             });
           } else {
             swal("수정을 취소했습니다!");
           }
         });
   /* var modifyBtn = confirm("정말로 수정하시겠습니까 ?");
      if(modifyBtn){
         location.href='${pplModify}'
      } else {
         return false;
      } */
   }
</script>

<jsp:include page = "../common/footer.jsp"/>
</body>
</html>