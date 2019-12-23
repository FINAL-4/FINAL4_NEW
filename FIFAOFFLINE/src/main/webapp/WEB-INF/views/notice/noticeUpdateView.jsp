<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <%@ page session="false" %>  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.kh.FIFAOFFLINE.notice.model.vo.*,com.kh.FIFAOFFLINE.member.model.vo.Member, java.util.ArrayList"%>
    
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>  
<%
	Member m =(Member)session.getAttribute("loginUser");
%>    
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd:hh:mm:ss");
	 String today = formatter.format(new java.util.Date());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdn.ckeditor.com/4.7.0/standard-all/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
<title>Insert title here</title>
</head>
	<jsp:include page="../common/header.jsp"/>
<body>


<c:set var="mem" value="<%=m%>"/>
<div id = "outer" style = "margin-top: 180px;">
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; height: 1000px; margin: auto;">
		<div id="container" style="overflow: auto;"><!-- container -->
		   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
		
				<div class="titleDiv1"><div class= "titleDiv2"><b>게&nbsp;시&nbsp;글&nbsp;수&nbsp;정&nbsp;</b></div></div>
		
						<form id= updateForm action = "nupdate.do"  method="post" encType="multipart/form-data">
						<input type="hidden" name="nId"  value = "${notice.nId }"/>
						<input type="hidden" name="nWriter" value = "${notice.nWriter }"/>
						<input type="hidden" name="filePath" value="${notice.filePath }"/>
						<input type="hidden" name="profile" value="${notice.profile }"/>
		
						<br><br><br><br>
						   <br>
						   <div id = "tableDiv">
						      <table align="center" id="listArea">
						         <tr>
						            <td class= "titleTd tableTd"><b>제목</b></td>
						            <td class ="tableTd" style = "font-size: 15px;"><input id = "nTitle" type="text" name= "nTitle" class="inputTd" value="${notice.nTitle}" >&nbsp;&nbsp;
						         </tr>
						         <tr>
						            <td class= "titleTd tableTd"><b>작성자</b></td>
						            <td  class ="tableTd"><img src ="resources/proFiles/${notice.profile }" width= "25px" height= "25px" style = "float: left; margin-left: 10px; margin-right: 5px;"><span style="font-size: 16px;"><input id="nWriter" name="nWriter" value="${notice.nWriter }" readonly style = "border: 0px solid white;"></span></td>
						         <tr>
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
						            <td  class ="tableTd"><span name= "nModifyDate" style="padding-left: 17px; font-size: 16px;" ><%=today%></span></td>
						         </tr>
						      </table>
						      	<div id="textareaDiv">
								<textarea id="nContent" name="nContent"> ${notice.nContent}</textarea>
								<script>
								    CKEDITOR.replace( 'nContent', {
								    //filebrowserImageUploadUrl : '/dev-guide/ckeditorImageUpload.do'
								    } );
								</script>
								</div>
							<div style = "margin-left: 25px;">
							<table id = "attachTable">
							<tr>
								<td>첨부파일</td>
									<td>
									<input type="file" name="reloadFile">
									<c:if test="${!empty notice.filePath }">
										<br>현재 업로드한 파일:
										<img src="${contextPath }/resources/nuploadFiles/${notice.filePath}">
										<a href="${contextPath }/resources/nuploadFiles/${notice.filePath }" download>
										</a>
									</c:if>
								<br>			
							</td>
							</tr>
							</table>
							</div>
							<br><br>
							<div class= btnDiv>
									<button type='button'id=listBtn onclick="location.href = 'nlist.do'"><b>목록</b></button>&nbsp;&nbsp;
									<button id=insertBtn type="button" onclick="insertSubmit();"><b>수정</b></button>
							</div>
						</div>
					</form>				      
			</div><!-- container -->
		</div><!-- mainContent -->
	</div>
	<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 100px; width: 90%;  margin: auto;">
	
	</div>
</div>

<script>
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
  	  title: "글을 수정하시겠습니까?",
  	  icon: "info",
  	  buttons: true,
  	  dangerMode: false,
  	})
  	.then((willDelete) => {
  	  if (willDelete) {
  		swal("", "글이 수정되었습니다.", "success");
  		setTimeout(function() {$("#updateForm").submit(); }, 1000);		
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
<jsp:include page="../common/footer.jsp"/>	
</body>
</html>