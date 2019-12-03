<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page session="false" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #outer{
       width: 100%;
       position: relative;
       padding:0px;
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
		width: 290px;	
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
    	width:98%;
    	
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
	   width: 70px;
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
	   width: 70px;
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
</head>


	<jsp:include page="../common/header.jsp"/>
<body>

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
	

	<form action="ninsert.do" method="post" enctype="Multipart/form-data">
		<table align="center" border="1" cellspacing="0" width="400">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="50" name="nTitle">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="nWriter" readonly value="${loginUser.id }">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="7" cols="50" name="nContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="uploadFile">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록 허가"> &nbsp;
					<input type="reset" value="등록 취소">					
				</td>
			</tr>			
		</table>
	</form>
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