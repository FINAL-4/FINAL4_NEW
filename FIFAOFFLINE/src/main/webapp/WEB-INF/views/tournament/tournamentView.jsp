<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.FIFAOFFLINE.tournament.model.vo.Tournament"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Tournament> to = new ArrayList();

to.add(new Tournament(1,3,"테스트!!",3,0,0,"ba1.jpg"));
to.add(new Tournament(1,5,"df!!",4,0,0,"ba2.jpg"));
to.add(new Tournament(1,8,"테스asdf트!!",5,2,0,"ba3.jpg"));
to.add(new Tournament(1,15,"테스sadf트!!",6,3,0,"ba4.jpg"));
to.add(new Tournament(1,153,"sf!!",7,4,0,"degea.jpg"));
to.add(new Tournament(1,12,"sad!!",8,5,0,"dybala.jpg"));
to.add(new Tournament(1,155,"asdf!!",9,6,0,"juventus.jpg"));
to.add(new Tournament(1,115,"gssa!!",10,7,0,"login.png"));
to.add(new Tournament(1,23,"asdg!!",11,8,0,"man.jpg"));
to.add(new Tournament(1,251,"테스트sss!!",12,9,0,"marker.png"));
to.add(new Tournament(1,152,"dfd!!",13,10,0,"search.jpg"));
to.add(new Tournament(1,123,"sd!!",14,11,0,"son.png"));
to.add(new Tournament(1,415,"bsa!!",15,12,0,"tot.jpg"));
to.add(new Tournament(1,53,"sdf!!",16,13,0,"youri.jpg"));
to.add(new Tournament(1,67,"vsd!!",17,14,0,"leicester.jpg"));
to.add(new Tournament(1,12,"asd!!",18,15,0,"fifalogo1.png"));
to.add(new Tournament(1,4,"sa!!",19,16,0,""));
to.add(new Tournament(1,345,"sdf!!",20,17,0,""));
to.add(new Tournament(1,65,"sdf!!",21,18,0,""));
to.add(new Tournament(1,14,"bsd!!",22,19,0,""));
to.add(new Tournament(1,25,"sd!!",23,20,0,""));
to.add(new Tournament(1,65,"테스트asd!!",24,21,0,""));
to.add(new Tournament(1,45,"테스dd트!!",25,22,0,""));
to.add(new Tournament(1,124,"v!!",26,23,0,""));
to.add(new Tournament(1,135,"a!!",27,24,0,""));
to.add(new Tournament(1,13,"s!!",28,25,0,""));
to.add(new Tournament(1,537,"dfd!!",29,26,0,""));
to.add(new Tournament(1,1246,"d!!",30,27,0,""));
to.add(new Tournament(1,5135,"aad!!",31,28,0,""));
to.add(new Tournament(1,2145,"vd!!",32,29,0,""));


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
			container.append("미등록")
			return;
		case "empty-tbd":
			container.append("진행전")
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
									slotNum:i,
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
					matchMargin : 30, // number
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
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style = "height: 800px; width: 90%; background: white; margin: auto; margin-top: 300px;">
				
				
					<div id = "tTree"></div>
				
				
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