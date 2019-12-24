<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.FIFAOFFLINE.notice.model.vo.*, java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>    



<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd");
	 String today = formatter.format(new java.util.Date());
%>
  
<!DOCTYPE html>
<html>
<head>
<script src="http://cdn.ckeditor.com/4.7.0/standard-all/ckeditor.js"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<meta charset="UTF-8">
 <style>
    #outer{
  		position: relative;
       width: 100%;
       padding: 0px;
   	   border:none;
  	} 
   
    #tableDiv{
      position: relative;
      width: 1300px;
      padding:10px;
      margin: auto;
      border:none;
    }
    
  	.titleDiv1{
		border:none;
		border-bottom: 1px solid darkgray;
		position: relative;	
		width:1230px;
		height:100px;
		margin-left:auto;
		margin-right:auto;
		align: center;
	}

	.titleDiv2{
		position: relative;
		width: 240px;	
		font-size: 45px;
		margin-left:auto;
		margin-right:auto;
	}
    
    #listArea{
    	width: 1230px;
    	border-spacing:0px;
   		border-top:2px solid black;
    }
    
    .tableTd{
    	border-bottom:1px solid  #dbdbdb;
    	border-right: 1px solid  #dbdbdb;
    	
    }
    
    .titleTd{
    	width: 180px;
    	height: 50px;
    	background: #f3f3f3 ;
    	text-align: center;
    	font-size: 16px;
    	border-left: 1px solid  #dbdbdb;
    }
    
    .inputTd{
    	width: 800px;
    	height: 30px; 
    	margin-left: 10px;
    }
    
    textrea{
    	border-left: 1px solid  #dbdbdb;
    	overflow-y:scroll;
		resize:none;
		width: 1229px;
    }
    #textareaDiv{
    	position: relative;
    	margin:auto;
    	width: 1230px;
    }
    
    .attachTd{
		padding: none; 
		padding-left: 15px;
		padding-bottom: 12px;
	
    }
    

    #attachCount{    
    	width: 50px;
    	height: 40px;
    }

	#attachTable{
		border: 1px solid #dbdbdb;
		width: 1230px;
	}   
	
	.attachTd input{
		height: 40px;
		padding-left:10px;
		font-size: 15px;
		width: 400px;
	} 
	
	.attachBtn{
		outline: none;
		border: none; 
		background: black;
		color: white;
		font-size: 15px;
		width: 100px;
		height: 40px;		
	}
	
	.attachBtn:hover{
	   background-color: darkgray;
	   color: white;
	}
	
	
	#listBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 90px;
	}
	
	#listBtn:hover{
	   background-color: darkgray;
	   color: white;
	}
	
	#insertBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 90px;
	}
	
	#insertBtn:hover{
	   background-color: #f53f29; 
	   color: white;
	}
	
	.btnDiv{
		border-top: 1px solid darkgray;
		height: 80px;
		text-align: center;
		padding-top: 30px;
	}
	

	#resetBtn{
		outline: none;
		border: none; 
		background: black;
		color: white;
		font-size: 15px;
		width: 100px;
		height: 40px;	
		margin-left: 183px; 
	}
	
	#resetBtn:hover{
	   background-color: #f53f29; ;
	   color: white;
	}
	
	
	
	#superCheck{
		width: 23px; 
		height: 23px;
		position: absolute; 
		background-color: white;
		border: 1px solid black;
		outline: none;
	}
	
	#checkLabel{
		font-size: 16px;
		margin-left: 30px;
	}
	
	#boardImg1{
	position: relative;	
	width:100%;
	height:300px;
	margin-left:auto;
	margin-right:auto;
	align: center;
	text-align: center;
	background: black;
}
	
		.modal-dialog {
	    width: 600px;
	    margin: 30px auto;
	    margin-top: 300px;
	}
	
	#cke_1_bottom{
		display: none;
	}
	

	
	#cke_1_contents{
		height: 500px !important;
	}
	
	.cke_wysiwyg_frame{
		height: 500px !important;
	}
 </style> 
</head>


<jsp:include page="../common/header.jsp"/>
<body>
<!-- 각페이지별 고정  start-->
	<div id = "outer" style = "margin-top: 180px;">
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; height:1000px; margin: auto;">
			<div id="container" style="overflow: auto;"><!-- container -->
   			<div id="mainContent" style="overflow: auto;"><!-- mainContent -->
			<c:out value="${loginUser }"></c:out>
			<form id= insertForm action = "<%=request.getContextPath()%>/ninsert.do" method="post" encType="multipart/form-data">

				<input type="hidden" name = "userNo" value = "${loginUser.userNo }"/>
				<input type="hidden" name = "profile" value = "${loginUser.profile }"/>

				<div class="titleDiv1"><div class= "titleDiv2"><b>게&nbsp;시&nbsp;글&nbsp;등&nbsp;록&nbsp;</b></div></div>
				<br>
				<div id = "tableDiv">
					<table align="center" id="listArea">
						<tr>
							<td class= "titleTd tableTd"><b>제목</b></td>
							<td class ="tableTd" style = "font-size: 15px;"><input id = "nTitle" type="text" name= "nTitle" class="inputTd">
							</td> 
						</tr>
						<tr>
							<td class= "titleTd tableTd"><b>작성자</b></td>
							<td  class ="tableTd"><img src ="resources/proFiles/${loginUser.profile }" width= "25px" height= "25px" style = "float: left; margin-left: 10px; margin-right: 5px;"><span style="font-size: 16px;"><input id="nWriter" name="nWriter" value="${loginUser.userId }" readonly style = "border: 0px solid white;"></span></td>
						</tr>
						<tr>
							<td class= "titleTd tableTd"><b>분류</b></td>
							<td class ="tableTd">
								<span style="padding-left: 10px; font-size: 16px;">
									<select id="nCate" name="cId" value="${loginUser.userId }" readonly style = "width: 150px; height: 30px;">
										<c:if test="${loginUser.userId == 'admin' }">
										<option value="${cList[0].cId }">${cList[0].cName }</option>
										</c:if>
										<c:forEach var="c" items="${cList }" begin="1">
										<option value="${c.cId }">${c.cName }</option>
										</c:forEach>
									</select>
								</span>
							</td>
						</tr>
						<tr>
							<td class= "titleTd tableTd"><b>작성일</b></td>
							<td class ="tableTd"><span style="padding-left: 17px; font-size: 16px;" id="nCreateDate" name="nCreateDate" ><%=today%></span></td>
						</tr>
					</table>
						<div id="textareaDiv">
						<textarea id="nContent" name="nContent" ></textarea>
						<script>
						    CKEDITOR.replace( 'nContent', {
						    //filebrowserImageUploadUrl : '/dev-guide/ckeditorImageUpload.do'
						    } );
						</script>
						</div>
					<br>
					<div style = "margin-left: 25px;">
					<table id = "attachTable">
						<tr class= attachTr align="left">
							<td>
								<input type="file" name="uploadFile">
							</td>
						</tr>
					</table>
					<br><br>
					<div class= btnDiv>
							<button type='button'id=listBtn onclick="Nlist()"><b>목록</b></button>&nbsp;&nbsp;
							<button id=insertBtn type="button" onclick="insertSubmit();"><b>등록</b></button>
					</div>
					</div>
				</div>
			</form>
		</div><!-- container -->
</div><!-- mainContent -->
			</div>
		
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 100px; width: 90%;  margin: auto;">
			</div>
	</div>

	


</body>


<script>

function Nlist(){
	$("#nlist.do");
}


 function insertSubmit(){

	 if($("#nTitle").val() == ""){
		 swal("제목을 입력해주세요.");
		 return false;
	 }
	 
	/*  if($("#nContent").text() == ""){
		 swal("내용을 입력해주세요.");
		 return false;
	 } */
	 
	 swal({
   	  title: "글을 등록하시겠습니까?",
   	  icon: "info",
   	  buttons: true,
   	  dangerMode: false,
   	})
   	.then((willDelete) => {
   	  if (willDelete) {
   	 	$("#insertForm").submit();	
   	  } else {
   		  return false;
   	  }
   	});
	 
	
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
</body>
<jsp:include page="../common/footer.jsp"/>

</html>