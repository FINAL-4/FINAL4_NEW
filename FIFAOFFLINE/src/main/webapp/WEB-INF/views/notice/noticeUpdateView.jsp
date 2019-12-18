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
 </style> 
<title>Insert title here</title>
</head>
	<jsp:include page="../common/header.jsp"/>
<body>
<%=m %>
<c:set var="mem" value="<%=m%>"/>
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
	
	<h1 align="center">공지글 수정 페이지</h1>

<br><br>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->

				<form id= updateForm action = "nupdate.do"  method="post" encType="multipart/form-data">
				<input type="hidden" name="nId"  value = "${notice.nId }"/>
				<input type="hidden" name="nWriter" value = "${notice.nWriter }"/>
				<input type="hidden" name="filePath" value="${notice.filePath }"/>



				
				<div id="outer">
				<br><br><br><br>
				   <br>
				   <div id = "tableDiv">
				      <table align="center" id="listArea">
				         <tr>
				            <td class= "titleTd tableTd"><b>제목</b></td>
				            <td class ="tableTd"><input type="text" name= "nTitle" class="inputTd" value="${notice.nTitle}" >&nbsp;&nbsp;
				         </tr>
				         <tr>
				            <td class= "titleTd tableTd"><b>작성자</b></td>
				            <td  class ="tableTd"><span name= "nWriter" style="padding-left: 17px; font-size: 16px;">${notice.nWriter }</span></td>
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
					<br><br>
					<div class= btnDiv>
							<button type='button'id=listBtn onclick="nlist.do"><b>목록</b></button>&nbsp;&nbsp;
							<button id=insertBtn type="button" onclick="insertSubmit();"><b>등록</b></button>
					</div>
				</div>
			</form>				      

				
				<br><br><br><br><br><br>
	</div><!-- container -->
</div><!-- mainContent -->
	
<%-- <form action="nupdate.do" method="post" enctype="Multipart/form-data">
	<!-- 첨부파일도 수정할 수 있으니깐 form태그에 enctype은 multipart로 하자 -->
		
		<!-- 화면에 뿌려줄 필요 x, 사용자가 입력할 필요는 x지만 쿼리에서 필요한 것들 -->
		<input type="hidden" name="nId" value="${notice.nId }"/>
		<!-- 파일을 수정했다면 기존 파일은 지우기 위해 기존 파일명도 넘기자-->
		<input type="hidden" name="filePath" value="${notice.filePath }"/>
		
		
		<table align="center" border="1" cellspacing="0" width="400">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="50" name="nTitle" value="${notice.nTitle }">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
				<input type="text" size="50" name="nWriter" value="${notice.nWriter }">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<input type="text" size="50" name="nContent" value="${notice.nContent }">
				</td>
			</tr>
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
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form> --%>

<script>
 function insertSubmit(){
	$("#updateForm").submit();	
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