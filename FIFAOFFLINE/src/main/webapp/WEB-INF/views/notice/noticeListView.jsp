<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <%@ page session="false" %>  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
		
/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
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

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
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
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
  

</style>

</head>
	<jsp:include page="../common/header.jsp"/>	
<body>
	<!-- 각페이지 고정 start -->
	<div id = "outer" style = "margin-top: 180px;">
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; margin: auto;">
		<div style="height:100%; width:100%; border-bottom:3px solid red;">
			<div class="example">
			<br><br><br>
		</div>
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 1200px; width: 90%;  margin: auto;">
			<div align="center">
	<br><br>
	<!-- 각페이지 고정 end -->	
	<!-- <table align="center" width="600" border="1" cellspacing="0" style="clear:right;" id="td"> -->
	<table class="table table-bordered" style="text-align: center; border: 1px; solid #dddddd">
		<thead>
		<tr>
         <th style="background-color: #eeeeee; text-align: center;" width="100px">번 호</th>
         <th style="background-color: #eeeeee; text-align: center;" width="600px">제 목</th>
         <th style="background-color: #eeeeee; text-align: center;" width="150px">작성자</th>
         <th style="background-color: #eeeeee; text-align: center;" width="100px">조회수</th>
         <th style="background-color: #eeeeee; text-align: center;" width="180px">작성일</th>
         <th style="background-color: #eeeeee; text-align: center;" width= "100px">첨부</th>

       </tr>
	   </thead>
	   <tbody>
	   		<c:forEach var="n" items="${list }">
			<tr>
				<td align="center">${n.nId }</td>
				<td>
				 	<c:if test="${!empty loginUser }"> 
						<c:url var="ndetail" value="ndetail.do">
							<c:param name="nId" value="${n.nId }"/>
							<c:param name="page" value="${pi.currentPage }"/>	
						</c:url>
						<a href="${ndetail }">${n.nTitle }</a>
				 	</c:if> 
					 <c:if test="${empty loginUser }">
						${n.nTitle }
				 	</c:if> 
				</td>
				<td align="center">${n.nWriter }</td>
				<td align="center">${n.nCount }</td>
				<td align="center">${n.nCreateDate }</td>
				<td align="center">
					<c:if test="${!empty n.filePath }">
						★
					</c:if>
					<c:if test="${!empty n.filePath }">
						&nbsp;
					</c:if>

				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
  	  	 				<br>
		<!-- 페이징 부분 -->
 			<tr align="center" height="20">
 			<td colspan="6">
 				<!-- [이전] -->
 				<c:if test="${pi.currentPage == 1 }">
 					[이전]&nbsp;
 				</c:if>
 				
 				<c:if test="${pi.currentPage > 1 }">
 					<c:url var="nlistBack" value="nlist.do">
 						<c:param name="page" value="${pi.currentPage - 1 }"/>
 					</c:url>
 					<a href="${nlistBack }">[이전]</a>
 				</c:if>
 				
 				<!-- [번호들] -->
 				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
 					<c:if test="${p eq pi.currentPage }">
 						<font color="red" size="4"><b>[${p}]</b></font>&nbsp;&nbsp;&nbsp;
 					</c:if>
 					
 					<c:if test="${p ne pi.currentPage }">
 						<c:url var="nlistCheck" value="nlist.do">
  							<c:param name="page" value="${p }"/>&nbsp;&nbsp;&nbsp;
 						</c:url>
 						<a href="${nlistCheck }">${p }</a>&nbsp;&nbsp;&nbsp;
 					</c:if>
 				</c:forEach>
 				
 				<!-- [다음] -->
 				<c:if test="${pi.currentPage == pi.maxPage }">
 					&nbsp;[다음]
 				</c:if>
 				
 				<c:if test="${pi.currentPage < pi.maxPage }">
 					<c:url var="nlistEnd" value="nlist.do">
 						<c:param name="page" value="${pi.currentPage + 1 }"/>
 					</c:url>
 					<a href="${nlistEnd }">&nbsp;[다음]</a>
 				</c:if>
 				</td>
 			</tr>
 			<br><br>
	
 		</div class="in-line">
  			   		<span><img id = "search-logo" src="resources/images/search.jpg" width="30px;" height="30px;" onclick="document.getElementById('id02').style.display='block'"></span> 
 				   <input type="button" name="name" value="글쓰기"  style = "float:right; height:30px; width:60px;" onclick="location.href='nWriterView.do'">
 		</div>
 		</div>

 
	</div>


<div id="id02" class="modal">
  
  <form class="modal-content animate"  action="serach.me" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label for="uname"><b>옵션</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>

      <label for="psw"><b>단어</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
        
      <button type="submit">찾기</button>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
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
<script>
	function tdetail(id){
		alert($(".hiddenTno"+id).val());
	}
</script>
<script>
	$(document).ready( function() {
		$(".addressB").click(function(){
			$(this).toggleClass('clicked');
		});
	});
</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


    <jsp:include page="../common/footer.jsp"/>
</body>
</html>