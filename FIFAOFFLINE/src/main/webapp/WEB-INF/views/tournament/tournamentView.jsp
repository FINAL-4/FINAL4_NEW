<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.FIFAOFFLINE.tournament.model.vo.Tournament"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Tournament> to = (ArrayList)session.getAttribute("trList");
	
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
	.tools{
		width: 100%;
		height: 200px;
	}
	
	.match{
		font-size: 15px;
	}
</style>

<body>

<div id = "outer" style = "margin-top: 150px;">
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style = "height: 800px; width: 90%; background: white; margin: auto; margin-top: 200px;">
					<div id = title><h1 style = "font-size: 50px; margin-top: 0px; border-bottom: 3px solid lightgrey; padding-bottom: 10px;">토너먼트 대회</h1></div>
				
					<div id = "tTree" style = "height: 700px; width: 49.5%; position: absolute;  float: left; padding-left: 50px;"></div>
					<div id = "tSche" style = "/* border : 3px solid blue; */ height: 700px; width: 1000px; position: relative; ; float: left;">sdfsdffgfsdgdfgdfgdfgsdgdsgdsfgdgdgdf</div>
					<div id = "tInfo" style = "border-left:2px solid lightgrey; display: inline-block; height: 600px; width: 40%; padding-left: 5%; padding-top: 5%; margin-top: 50px; margin-bottom: 50px;">sfsagasdg</div>
				
				
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 0px; width: 90%; background: white; margin: auto; margin-bottom: -200px;">
			</div>
</div>







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