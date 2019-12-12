<%@page import="com.kh.FIFAOFFLINE.tournament.model.vo.TournamentSche"%>
<%@page import="com.kh.FIFAOFFLINE.tournament.model.vo.TournamentInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.FIFAOFFLINE.tournament.model.vo.Tournament"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	TournamentInfo tInfo =(TournamentInfo)session.getAttribute("to");	
	ArrayList<Tournament> to = (ArrayList)session.getAttribute("trList");
	ArrayList<TournamentSche> tSche = (ArrayList)session.getAttribute("tsList");


	for(int i = 0 ; i < to.size() ; i++){
		if(to.get(i).getTeamName()==null){
			to.get(i).setTeamName("");
		}
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  var $$$ = jQuery.noConflict();
</script>
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<script src="resources/js/jquery.bracket.min.js"></script>
<link href="resources/css/jquery.bracket.min.css" rel="stylesheet">
<title>Insert title here</title>

<script type="text/javascript">
  
/* Custom data objects passed as teams */
var tData = {
    teams : [
      [{name:"<%=to.get(0).getTeamName()%>", flag:"<%=to.get(0).getTeamLogo()%>", num:<%=to.get(0).getTeamNo()%>}, {name:"<%=to.get(1).getTeamName()%>", flag:"<%=to.get(1).getTeamLogo()%>", num:<%=to.get(1).getTeamNo()%>}],
      [{name:"<%=to.get(2).getTeamName()%>", flag:"<%=to.get(2).getTeamLogo()%>", num:<%=to.get(2).getTeamNo()%>}, {name:"<%=to.get(3).getTeamName()%>", flag:"<%=to.get(3).getTeamLogo()%>", num:<%=to.get(3).getTeamNo()%>}],
      [{name:"<%=to.get(4).getTeamName()%>", flag:"<%=to.get(4).getTeamLogo()%>", num:<%=to.get(4).getTeamNo()%>}, {name:"<%=to.get(5).getTeamName()%>", flag:"<%=to.get(5).getTeamLogo()%>", num:<%=to.get(5).getTeamNo()%>}],
      [{name:"<%=to.get(6).getTeamName()%>", flag:"<%=to.get(6).getTeamLogo()%>", num:<%=to.get(6).getTeamNo()%>}, {name:"<%=to.get(7).getTeamName()%>", flag:"<%=to.get(7).getTeamLogo()%>", num:<%=to.get(7).getTeamNo()%>}],
      [{name:"<%=to.get(8).getTeamName()%>", flag:"<%=to.get(8).getTeamLogo()%>", num:<%=to.get(8).getTeamNo()%>}, {name:"<%=to.get(9).getTeamName()%>", flag:"<%=to.get(9).getTeamLogo()%>", num:<%=to.get(9).getTeamNo()%>}],
      [{name:"<%=to.get(10).getTeamName()%>", flag:"<%=to.get(10).getTeamLogo()%>", num:<%=to.get(10).getTeamNo()%>}, {name:"<%=to.get(11).getTeamName()%>", flag:"<%=to.get(11).getTeamLogo()%>", num:<%=to.get(11).getTeamNo()%>}],
      [{name:"<%=to.get(12).getTeamName()%>", flag:"<%=to.get(12).getTeamLogo()%>", num:<%=to.get(12).getTeamNo()%>}, {name:"<%=to.get(13).getTeamName()%>", flag:"<%=to.get(13).getTeamLogo()%>", num:<%=to.get(13).getTeamNo()%>}],
      [{name:"<%=to.get(14).getTeamName()%>", flag:"<%=to.get(14).getTeamLogo()%>", num:<%=to.get(14).getTeamNo()%>}, {name:"<%=to.get(15).getTeamName()%>", flag:"<%=to.get(15).getTeamLogo()%>", num:<%=to.get(15).getTeamNo()%>}]   
    ],
    results : [ /* WINNER BRACKET */
        [[<%=to.get(0).getScore()%>,<%=to.get(1).getScore()%>], [<%=to.get(2).getScore()%>,<%=to.get(3).getScore()%>], [<%=to.get(4).getScore()%>,<%=to.get(5).getScore()%>], [<%=to.get(6).getScore()%>,<%=to.get(7).getScore()%>], [<%=to.get(8).getScore()%>,<%=to.get(9).getScore()%>], [<%=to.get(10).getScore()%>,<%=to.get(11).getScore()%>], [<%=to.get(12).getScore()%>,<%=to.get(13).getScore()%>], [<%=to.get(14).getScore()%>,<%=to.get(15).getScore()%>]],
        [[<%=to.get(16).getScore()%>,<%=to.get(17).getScore()%>], [<%=to.get(18).getScore()%>,<%=to.get(19).getScore()%>], [<%=to.get(20).getScore()%>,<%=to.get(21).getScore()%>], [<%=to.get(22).getScore()%>,<%=to.get(23).getScore()%>]],
        [[<%=to.get(24).getScore()%>,<%=to.get(25).getScore()%>], [<%=to.get(26).getScore()%>,<%=to.get(27).getScore()%>]],
        [[<%=to.get(28).getScore()%>,<%=to.get(29).getScore()%>]]
      ]
  }
 
/* Edit function is called when team label is clicked */
function edit_fn(container, data, doneCb) {
  var input = $$$('<input type="text">')
  input.val(data ? data.flag + ':' + data.name : '')
  container.html(input)
  input.focus()
  input.blur(function() {
    var inputValue = input.val()
    if (inputValue.length === 0) {
      doneCb(null); // Drop the team and replace with BYE
    } else {
      var flagAndName = inputValue.split(':') // Expects correct input
      doneCb({flag: flagAndName[0], name: flagAndName[1]})
    }
  })
}
 

	function render_fn(container, data, score, state) {
		
		switch (state) {		
		case "empty-bye":
			container.append("")
			return;
		case "empty-tbd":
			container.append("")
			return;

		case "entry-no-score":
		case "entry-default-win":
		case "entry-complete":
			container.append('<img class = "num" src="resources/images/'+data.flag+'" style = "width:15px; height:15px;"/> ').append(data.name).append('<h1 style = "display:none;">'+data.num+'</h1>');
			return;
		}
		
	}

	$$$(function() {
		
		/* save: null, // called whenever bracket is modified
		userData: null, // custom user data
		onMatchClick: null, // callback
		onMatchHover: null, // callback
		decorator: null, // a function
		skipSecondaryFinal: false,
		skipGrandFinalComeback: false,
		skipConsolationRound: false,
		dir: 'rl', // "rl" or  "lr",
		disableToolbar: false,
		disableTeamEdit: false,
		teamWidth: '', // number
		scoreWidth: '', // number
		roundMargin: '', // number
		matchMargin: '', // number */
		$$$('#tTree').bracket(
				{
					init : tData,
					save : function(){
						var jbT = $$$('.label').get();
						var jbS = $$$('.score').get();
					    for(var i = 0 ; i < jbT.length ; i++){
					    	jbT[i].id = "team"+i;
					    	jbS[i].id = "score"+i;
						    $.ajax({
								url:"saveResult.to",
								data:{teamNo:$$$("#team"+i+" h1").text(),
									teamName:$$$("#team"+i).text(),
									rSlotNum:i,
									score:$$$("#score"+i).text()
								},
								success:function(data){
									
									
									
								},
								error:function(request, status, errorData){
									alert("error code: " + request.status + "\n"
											+"message: " + request.responseText
											+"error: " + errorData);
								}
							})
					    }
					},
					disableToolbar : true,
					disableTeamEdit : true,
					teamWidth : 150, // number
					scoreWidth : 40, // number
					roundMargin : 25, // number
					matchMargin : 40, // number
					skipConsolationRound: true,
					decorator : {
						edit : edit_fn,
						render : render_fn
					}
				})
	})
</script>


</head>
<jsp:include page = "../common/header.jsp"/>

<style>

	button:focus {
	  outline: none;
	}
	input:focus {
	  outline: none;
	}
	.tools{
		width: 100%;
		height: 200px;
	}
	
	.match{
		font-size: 15px;
	}
	
	#tScheTb td{
		padding: 0px;
		margin: 0px;
	}
	
	#tScheTb button{
		width: 100%;
		height: 20px;
		margin-left: 10%;
		border: none;
		padding:none;
		font-size: 12px;
		color: black;
		background: white;
		border: 1px solid black;
	}
	
	#tScheTb button:hover{
		color: white;
		background: black;
	}
	
	#tScheTb input{
		width: 200px;
		height: 20px;
		font-size: 15px;
		padding:none;
		margin-bottom: 50px;
		margin-left: 10px;
		text-align-last:center;
	}
	
	.sche{
		vertical-align: center;
	}
	
	#btns{
		width: 60%;
		margin-left: 40%;
		margin-top: 5%;
	}
	
	#btns button{
		width: 130px;
		height: 40px;
		background: black;
		color: white;
		border: 1px solid black;
		font-size: 15px;
	}
	
	#btns button:hover{
		background: white;
		color: black;
		border: 1px solid black;
	}
</style>

<body>


<div id = "outer" style = "margin-top: 150px;">
	
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style = "height: 800px; width: 90%; background: white; margin: auto; margin-top: 200px;">
				
					<div id = title><h1 style = "font-size: 50px; margin-top: 0px; border-bottom: 3px solid lightgrey; padding-bottom: 10px;">토너먼트 대회</h1></div>
				
					<div id = "tTree" style = "height: 700px; width: 49.5%; position: absolute;  float: left; padding-left: 50px;"></div>
					
					<div id = "tSche" style = "/* border : 3px solid blue; */ height: 700px; width: 1000px; position: relative; ; float: left; bottom: 15px;">
						<table id = "tScheTb" style = "width: 900px; height: 684px;">
							<tr>
								<td class = "app" style = "width: 52px; padding-top: 25px;" ></td>
								<td class = "sche" style = "width: 205px;" rowspan="2"></td>
								<td class = "sche" style = "width: 213px;" rowspan="4"></td>
								<td class = "sche" style = "width: 213px;" rowspan="8"></td>
								<td class = "sche" rowspan="16"></td>
							</tr>
							<tr>
								<td class = "app" ></td>
							</tr>
							<tr>
								<td class = "app" style = "padding-top: 25px;"></td>
								<td class = "sche"  rowspan="2"></td>
							</tr>
							<tr>
								<td class = "app"></td>
							</tr>
							<tr>
								<td class = "app" style = "padding-top: 25px;"></td>
								<td class = "sche"  rowspan="2"></td>
								<td class = "sche"  rowspan="4"></td>
							</tr>
							<tr>
								<td class = "app" ></td>
							</tr>
							<tr>
								<td class = "app" style = "padding-top: 25px;"></td>
								<td class = "sche"  rowspan="2"></td>
							</tr>
							<tr>
								<td class = "app"></td>
							</tr>
							<tr>
								<td class = "app" style = "padding-top: 25px;"></td>
								<td class = "sche"  rowspan="2"></td>
								<td class = "sche"  rowspan="4"></td>
								<td class = "sche" rowspan="8"></td>
							</tr>
							<tr>
								<td class = "app"></td>
							</tr>
							<tr>
								<td class = "app" style = "padding-top: 25px;"></td>
								<td class = "sche"  rowspan="2"></td>
							</tr>
							<tr>
								<td class = "app"></td>
							</tr>
							<tr>
								<td class = "app" style = "padding-top: 25px;"></td>
								<td class = "sche"  rowspan="2"></td>
								<td class = "sche"  rowspan="4"></td>
							</tr>
							<tr>
								<td class = "app"></td>
							</tr>
							<tr>
								<td class = "app" style = "padding-top: 25px;"></td>
								<td class = "sche" rowspan="2"></td>
							</tr>
							<tr>
								<td class = "app"></td>
							</tr>
						</table>
					</div>
				
				<div id = "tInfo" style = "border-left:2px solid lightgrey; display: inline-block; height: 600px; width: 40%; padding-left: 5%; padding-top: 2%; margin-top: 50px; margin-bottom: 50px;">
					<table id = "tInfoTb"  style = "width: 100%; height: 70%; text-align: left">
						<tr>
							<td colspan="2" style = "height: 150px;">
								<input class = "toInfo" type = "text" style = "width: 500px; height: 40px; font-size: 30px;" value = '${to.toName }' placeholder="제목을 입력하세요.">
							</td>
						</tr>
						<tr>
							<td style = "width: 20%;">
								<h2 style = "font-size:20px;">장소</h2>
							</td>
							<td>
								<input class = "toInfo" type = "text" style = "width: 400px; height: 30px; font-size: 20px;" value = ${to.toLocation }>
							</td>
						</tr>
						<tr>
							<td>
								<h2 style = "font-size:20px;">상금</h2>
							</td>
							<td>
								<input class = "toInfo" type = "text" style = "width: 400px; height: 30px; font-size: 20px;" value = ${to.toReward }>
							</td>
						</tr>
						<tr>
							<td>
								<h2 style = "font-size:20px;">내용</h2>
							</td>
							<td>
								<textarea class = "toInfo" style = "width: 400px; height: 100px; font-size: 15px; resize: none;">${to.toContent }</textarea>
							</td>
						</tr>
						<tr>
							<td>
								<h2 style = "font-size:15px;">등록일</h2>
							</td>
							<td>
								<input class = "toInfo" type = "text" style = "width: 200px; height: 30px; font-size: 15px;"value = ${to.createDate }>
							</td>
						</tr>
					</table>
					<div id = "btns">
						<c:if test="${sessionScope.loginUser.userId == 'admin'}">
						<button onclick = "saveInfoSche()" style = "margin-right: 4%;">저장하기</button>
						<button onclick = "location.href='home.do'">뒤로가기</button>
						</c:if>
						<c:if test="${sessionScope.loginUser.userId != 'admin'}">
						<button onclick = "location.href='home.do'" style = "margin-right: 4%; margin-left: 40%;">뒤로가기</button>.
						</c:if>
					</div>
				</div>
				
				
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 0px; width: 90%; background: white; margin: auto; margin-bottom: -200px;">
			</div>
</div>








<script type="text/javascript">
	$(function(){
		if('${sessionScope.loginUser}' != "" && '${loginUser.userId}'=='admin'){
			$(".sche").html('<input class ="scheInfo" type ="text"/>');
			
		}else{
			$(".sche").html('<input class ="scheInfo" type ="text"  style = "border:0px solid white;" readonly/>');
			$(".app").html('<button class = "appBtn"></button')
			$(".toInfo").css({"border":"0px solid white"});
			$(".toInfo").attr("readonly","readonly");
		}
		
		
		var btSche = $$$('.appBtn').get();
	    for(var i = 0 ; i < btSche.length ; i++){
	    	btSche[i].id = "app"+i;
	    	$$$("#app"+i).attr("onclick","appTo("+i+")");
	    	<%for(int i = 0 ; i < to.size() ; i++){%>
	    		if(<%=to.get(i).getrSlotNum()%> == i){
	    			if("<%=to.get(i).getTeamName()%>" == ''){
	    				$$$("#app"+i).html("등록");
	    			}else{
	    				$$$("#app"+i).html("마감");
	    				$$$("#app"+i).css({"cursor":"default"})
	    			}
	    		}
	    	<%}%>
	    }
		
	    var ipSche = $$$('.scheInfo').get();
	    for(var i = 0 ; i < ipSche.length ; i++){
	    	ipSche[i].id = "sche"+i;
	    	<%for(int i = 0 ; i < tSche.size() ; i++){%>
	    		if(<%=tSche.get(i).getsSlotNum()%> == i){
	    			$$$("#sche"+i).val('<%=tSche.get(i).getToTime()%>');
	    		}
	    	<%}%>
	    }
		
	})
	
	$$$(".appBtn").html("등록").hover(function(){
	    					$$$("#app"+i).css({"background":"black","color":"white"})
	    				},function(){
	    					$$$("#app"+i).css({"background":"white","color":"black"})
	    				})
	$$$(".appBtn").html("마감").hover(function(){
	    					$$$("#app"+i).css({"background":"black","color":"white"})
	    				},function(){
	    					$$$("#app"+i).css({"background":"black","color":"white"})
	    				})
	
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
			} );
		</script>


<jsp:include page = "../common/footer.jsp"/>
</body>
</html>