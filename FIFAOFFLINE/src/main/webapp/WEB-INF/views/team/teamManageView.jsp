<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.FIFAOFFLINE.member.model.vo.Member, java.util.ArrayList"%>
    
<%
	ArrayList<Member> mList =(ArrayList<Member>)request.getAttribute("mList");
%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/style.css" /> -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/076ff59e02.js" crossorigin="anonymous"></script>
<link async href="https://fonts.googleapis.com/css?family=Antic" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>       


<style>
* { box-sizing: border-box; }

body { font-family: sans-serif; }

.carousel{
	padding-bottom:25px;
}

.carousel-cell {
  width:360px;
  height:450px;
  margin-right:10px;
  border-radius:5px;
}

.carousel-cell1 {
  width:360px;
  height:450px;
  margin-right:10px;
  border-radius:5px;
  margin-top:5%;
  width:25%;
  height:65%;
  margin-left:72px;
  margin-right:70px;
  float:left;
}



/* cell number */
.carousel-cell:before {
  display: block;
  line-height: 200px;
  font-size: 80px;

}

/*the container must be positioned relative:*/
  .autocomplete {
  position: relative;
  display: inline-block;
  width:30%;
  float:left;
}

#myInput {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 24px;
  width:100%;
  border:1px solid black;
}

 .autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4;
  font-size:24px;
} */

/*when hovering an item:*/
.autocomplete-items div:hover {
  background:black;
  color:white; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
#myUL {
  margin: 0;
  padding: 0;
}


#myUL li {
  cursor: pointer;
  position: relative;
  padding: 12px 8px 12px 40px;
  background: #eee;
  font-size: 24px;
  transition: 0.2s;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


#myUL li:nth-child(odd) {
  background: #f9f9f9;
}


#myUL li:hover {
  background: #ddd;
}


#myUL li.checked {
  background: #888;
  color: #fff;
  text-decoration: line-through;
}


#myUL li.checked::before {
  content: '';
  position: absolute;
  border-color: #fff;
  border-style: solid;
  border-width: 0 2px 2px 0;
  top: 10px;
  left: 16px;
  transform: rotate(45deg);
  height: 15px;
  width: 7px;
}

/* Style the close button */
.close {
  position: absolute;
  right: 0;
  top: 0;
  padding: 12px 16px 12px 16px;
}

.close:hover {
  background-color: #f44336;
  color: white;
}

/* /* Style the header */
.header {
  background-color: #f44336;
  padding: 30px 40px;
  color: white;
  text-align: center;
}

/* Clear floats after the header */
.header:after {
  content: "";
  display: table;
  clear: both;
} */

/* Style the input */
#myInput {
  margin: 0;
  border: none;
  border-radius: 0;
  width: 75%;
  padding: 10px;
  font-size: 24px;
}

/* Style the "Add" button */
.addBtn {
  padding: 10px;
  width: 10%;
  text-align: center;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s;
  border-radius: 0;
  float:left;
  background:black;
  color:white;
  border:1px solid black;
  height:52px;
}

.addBtn:hover {
  background:white;
  color:black;
}

/* flip the pane when clicked */
 .flip-container .flipper.flip {
  transform: rotateY(180deg);
}

/* flip speed */
.flipper {
  transition: 0.8s;
  transform-style: preserve-3d;
  position: relative;
}

/* hide back of pane during swap */
.front, .back {
  backface-visibility: hidden;
  position: absolute;
  top: 0;
  left: 0;
  border:1px solid black;
  perspective:1200px;
  width: 100%;
  height: 100%;
  text-align: center;
  padding: 5px;
}

/* front pane, placed above back */
.front {
  z-index: 2;
  transform: rotateY(0deg);
}

/* back, initially hidden pane */
.back {
  transform: rotateY(180deg);
  background-color: #fff;
}

div[id^="test"]{ 
  position:relative;
  width:100%;
  height:100%;
  transform-style: preserve-3d;
  perspective:1200px;
}

.selectedMember{
	width:40%;
	border:1px solid black;
	margin-top:30px;
}

.chip {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 18px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #f1f1f1;
  margin-top:20px;
  margin-bottom:20px;
}

.chip img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}

.closebtn {
  padding-left: 10px;
  color: #888;
  font-weight: bold;
  float: right;
  font-size: 20px;
  cursor: pointer;
}

.closebtn:hover {
  color: #000;
}

.card {
  display: flex;
  max-width: 100%;
  flex-direction: column;
}

.card-header {
  background-color: #fff;
  position: relative;
}

.card-header .card-header-btn {
  position: absolute;
  left: 0;
  bottom: 0;
  margin: 20px;
  color: #fff;
  background-color: #2b436d;
  padding: 6px;
  letter-spacing: .5px;
  font-size: 11px;
  font-weight: 800;
}

.card-body {
  background-color: #fff;
  padding: 0 20px 20px 20px;
  overflow:auto;
}

.category {
  margin: 0;
  color: #888;
  font-size: 15px;
  margin-top: 12px;
}

.description {
  color: #444;
  font-size: 15px;
  text-align: left;
}

.card-body h1 {
  font-size: 30px;
  color: #444;
  margin: 8px 0;
}

.card-footer {
  padding: 0 20px;
  border-top: 1px solid #eee;
  background-color: #fff;
  font-weight: 600;
  color: #888;
}

 .card .card-header img {
  width: 100%;
} 

.modalUp:hover{
	color:red;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-contentM {
  background-color: #fefefe;
/*   z-index:50001; */
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 600px;
}

/* The Close Button */
.closeM {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.closeM:hover,
.closeM:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.imgcontainerM {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatarM {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}
.animateM {
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

.createTeam{
	float:right;
	background:black;
	color:white;
	width:15%;
	font-size:1.7em;
	border:1px solid black;
	transition: all 0.5s;
	margin-right:20px;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
}
.createTeam:hover{
	background:red;
	color:white;
	cursor:pointer;
	border:1px solid red;
}
.updateTeam{
	float:right;
	background:black;
	color:white;
	width:15%;
	font-size:1.7em;
	border:1px solid black;
	transition: all 0.5s;
	margin-right:20px;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
}
.updateTeam:hover{
	background:red;
	color:white;
	cursor:pointer;
	border:1px solid red;
}

.spaceDiv{
	height:18%;
}

div[id^="test"]:hover{
	cursor:pointer;
}



</style>
</head>
<body>
<jsp:include page = "../common/header.jsp"/>
<div id = "outer" style = "margin-top: 180px;">
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style = "height: 1200px; width: 90%; margin: auto;">
				<div class="spaceDiv"></div>
				<div class="post">
       				<ul class="tags">
        				<li><a href="#">나의 팀</a></li>
            			<li><a href="#">팀원 초대</a></li>
            			<li><a href="#">전체 팀 조회</a></li>
        			</ul>
    			</div> 
				<h1 style="font-size:48px;">나의 팀</h1>
				<hr style="border:1px solid black">
				<button class="createTeam" onclick="beforeCreateTeam()">팀 생성</button>
				<button class="updateTeam" onclick="location.href='updateTeamView.tm'">팀 정보 수정</button>
				<div class="myTeam" style="display:inline-block; height:800px; width:100%;">
				<c:if test="${!empty myTeam }">
				<c:forEach var="myTeam" items="${myTeam}" varStatus="status">
					<div class="carousel-cell1 flip-container">
  							<div id = "test${status.index}" class= "flipper" style="width:100%; height:100%;">
  							<input type="hidden" value="${myTeam.teamNo }" class="hTeamNo">
  								<div class="front card" style="width:100%; height:100%">
  									<div class="card-header"  style="height:210px;">
                						<div class="card-header-btn">전적</div>
                						<img src="resources/images/team/${myTeam.teamImage }" style="width:100%; height:100%;"/>
            						</div>
            							<div class="card-body">
               			 					<p class="category" style="font-size:1.8em;">팀장 : ${myTeam.userName }</p>
                							<h1 style="font-size:38px;">${myTeam.teamName }</h1>
                							<p class="description" style="text-align:center;">${myTeam.teamIntro }${myTeam.teamIntro }${myTeam.teamIntro }</p>
            							</div>
            							<div class="card-footer" style="padding-top:10px; padding-bottom:0px;">
                							<p style="font-size:16px;">활동 지역 : ${myTeam.teamArea }</p>
           								</div>
  								</div>
  								<div class="back" style="width:100%; height:100%">
  								뒷면임
  								</div>
							</div>
  						</div>
				</c:forEach>
				</c:if>
				<c:if test="${empty myTeam }">
					<h1 style="font-size:48px;">가입하거나 생성한 팀이 없습니다.</h1>
				</c:if>
				</div>
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 1200px; width: 90%; margin:auto;">
				<div class="contents" style="width:100%; padding-top:75px;" >
				<h1 style="font-size:48px;">팀원 초대</h1>
				<hr style="border:1px solid black;">
					<form autocomplete="off" action="/action_page.php" style="padding-bottom:20px; padding-top:20px;">
						<select style="float:left; font-size:18px;">
							<option selected>-- 팀을 선택하세요 --</option>
							<c:forEach var="leader" items="${teamLeader}" varStatus="status">
							<option value="${leader.teamNo}">${leader.teamName}</option>
							</c:forEach>
						</select>
						<br><br><br>
						<div class="autocomplete">
    						<input id="myInput" type="text" name="myCountry" placeholder="회원 이름을 검색하세요.">
  						</div>
  						<button onclick="newElement()" class="addBtn" type="button"><i class="fas fa-search"></i>Search</button>
  						<br>
					</form>
					<br>
					<div class="selectedMember">
						<!-- <div class="chip">
  							<img src="resources/images/team/testMimg7.png" alt="Person" width="96" height="96">
  							<input type="hidden" class="hUserNo"> 
  							선택된 멤버&emsp;&emsp;&emsp;MF/GK
  							<span class="closebtn" onclick="this.parentElement.style.display='none'">&times;</span>
						</div>
						<br>
						<div class="chip">
  							<img src="resources/images/team/testMimg7.png" alt="Person" width="96" height="96">
  							<input type="hidden" class="hUserNo">
  							선택된 멤버&emsp;&emsp;&emsp;MF/GK
  							<span class="closebtn" onclick="this.parentElement.style.display='none'">&times;</span>
						</div>
						<br>
						<div class="chip">
  							<img src="resources/images/team/testMimg7.png" alt="Person" width="96" height="96">
  							<input type="hidden" class="hUserNo">
  							선택된 멤버&emsp;&emsp;&emsp;MF/GK
  							<span class="closebtn" onclick="this.parentElement.style.display='none'">&times;</span>
						</div>
						<br>
						<div class="chip">
  							<img src="resources/images/team/testMimg7.png" alt="Person" width="96" height="96">
  							<input type="hidden" class="hUserNo">
  							선택된 멤버&emsp;&emsp;&emsp;MF/GK
  							<span class="closebtn" onclick="this.parentElement.style.display='none'">&times;</span>
						</div>
						<br>
						<div class="chip">
  							<img src="resources/images/team/testMimg7.png" alt="Person" width="96" height="96">
  							<input type="hidden" class="hUserNo">
  							선택된 멤버&emsp;&emsp;&emsp;MF/GK
  							<span class="closebtn" onclick="this.parentElement.style.display='none'">&times;</span>
						</div> -->
						<br>
						<br>
  					</div>
				</div>
				<h1 style="font-size:48px;">전체팀 조회</h1>
				<hr style="border:1px solid black">
				<div class="carousel" data-flickity='{ "groupCells": true }'>
					<c:forEach var="tList" items="${tList}" varStatus="status">
  						<div class="carousel-cell flip-container">
  							<div id="test${status.index }" class="flipper">
  								<input type="hidden" value="${tList.teamNo }" class="hTeamNo">
  								<div class="front card">
  									<div class="card-header"  style="width:100%; height:210px;">
                						<div class="card-header-btn">전적</div>
                						<img src="resources/images/team/${tList.teamImage }" style="width:100%; height:100%;"/>
            						</div>
            							<div class="card-body">
               			 				<p class="category">팀장 : ${tList.userName }</p>
                						<h1>${tList.teamName }</h1>
                						<p class="description">${tList.teamIntro }</p>
            							</div>
            							<div class="card-footer" style="padding-top:10px; padding-bottom:0px;">
                							<p>활동 지역 : ${tList.teamArea }</p>
           								</div>
  								</div>
  								<div class="back">
  								뒷면임
  								</div>
							</div>
  						</div>
					</c:forEach>
				</div>
			</div>
			<div id="myModal" class="modal">
  				<div class="modal-contentM animateM">
  					<span class="closeM" onclick="closeM()">&times;</span>
	  					<div class="imgcontainerM">
	     					<img alt="Avatar" class="avatarM">
    					</div>
   			 			<div class="container" align="center">
      						<label><b>유저 이름</b></label>
     				 		<p class="mUserName"></p>
      						<label><b>성별</b></label>
      						<p class="mGender"></p>
      		
     						<label><b>이메일</b></label>
      						<p class="mEmail"></p>
      
      						<label><b>주소</b></label>
      						<p class="mAddress"></p>
    					</div>
  					</div>
				</div>
			
</div> 
		
  
  

<jsp:include page = "../common/footer.jsp"/>
<script>

	var selectedNo = 0;
	var selectedArr = [];

	$('.flipper').click(function(){
		var teamNo = $(this).children('.hTeamNo').val();
		$div = $(this).children('.back');
		$.ajax({
			url:"moreTeamMember.tm",
			data:{teamNo:teamNo},
			success:function(data){
				
				var appendStr = "<h1 style='font-size:24px;'>팀 원</h1>";
				for(var i=0; i<data.length; i++){
					appendStr += "<div class='chip'>";
					appendStr += "<img src='resources/proFiles/"+data[i].profile+"' width='96' height='96'>";
					appendStr += "<input type='hidden' class='hUserNo' value='"+data[i].userNo+"'>";
					appendStr += data[i].userName+"&emsp;&emsp;"+data[i].position;
					appendStr += "<span class='closebtn'>&times</span>";
					appendStr += "</div>";
					appendStr += "<br>";
				} 
				$div.html("");
				$div.append(appendStr);
				console.log(data.length);
				
			}
		});
		
		$(this).toggleClass("flip");
	});


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
	
	

function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].userName.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          b.className = "searchMember";
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].userName.substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].userName.substr(val.length) + "<span class='modalUp'><i class='fas fa-search' style='float:right; padding-top:8px;'></span>";
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' class='hUserNo' value='" + arr[i].userNo + "'>";
          b.innerHTML += "<input type='hidden' class='hUserName' value='" + arr[i].userName + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              /* inp.value = this.getElementsByTagName("input")[0].value; */
              inp.value = this.getElementsByClassName("hUserName")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var userInfo = new Array();

var userName = [];
var userNo = [];
var position = [];

<%for(int i=0; i<mList.size(); i++){%>
	userName[<%=i%>] = "<%=mList.get(i).getUserName()%>";
	userNo[<%=i%>] = <%=mList.get(i).getUserNo()%>;
	position[<%=i%>] = "<%=mList.get(i).getPosition()%>";
<%}%>

for(var i=0; i<${mList.size()}; i++){
	var data = new Object();
	
	data.userName = userName[i];
	data.userNo = userNo[i];
	data.position = position[i];
	
	userInfo.push(data);
}

/* var jsonData = JSON.stringify(userName) ; */


/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), userInfo);

$(document).on("click",".searchMember",function(){
	var selUserNo = $(this).children('.hUserNo').val();
	selectedNo = selUserNo;
});

function newElement(){
	if(selectedNo != 0){
	$div = $('.selectedMember');
	appendStr = "";
	$.ajax({
		url:"drawMember.tm",
		data:{userNo:selectedNo},
		success:function(data){
			if(data!=null){
			
			appendStr += "<div class='chip'>";
			appendStr += "<img src='resources/proFiles/"+data.profile+"' width='96' height='96'>";
			appendStr += "<input type='hidden' class='hUserNo' value='"+data.userNo+"'>";
			appendStr += data.userName+"&emsp;&emsp;"+data.position;
			appendStr += "<span class='closebtn'>&times</span>";
			appendStr += "</div>";
			appendStr += "<br>";
			
			$div.append(appendStr);
			}else{
				alert("해당하는 회원이 없습니다.");
			}
		}
			
		});
	}else{
		alert("추가할 회원을 먼저 검색하세요");
	}
	
	selectedArr.push(selectedNo);
	console.log(selectedArr);
	selectedNo = 0;
}

$(document).on("click",".closebtn",function(){
	this.parentElement.style.display='none'
});

$(document).on("mouseover",".modalUp",function(){
	var userNo = $(this).parent().children('.hUserNo').val();
	
	$.ajax({
		url:"modal.tm",
		data:{userNo:userNo},
		dataType:"json",
		success:function(data){
			
			$(".mUserName").text(data.userName);
			$(".mGender").text(data.gender);
			$(".mEmail").text(data.userEmail);
			$(".mAddress").text(data.address);
			$(".avatarM").attr('src',"resources/proFiles/"+data.profile)
			
			var modal = document.getElementById("myModal");
			
			modal.style.display="block";
		}
	});
});
var modal = document.getElementById("myModal");

function closeM(){
	
	
	modal.style.display="none";
}

window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}


function beforeCreateTeam(){
	   if(${myTeam.size()}==3){
	      alert("3개 이상의 팀을 가입하거나 생성할 수 없습니다.");
	   }else{
	      location.href='createTeamView.tm';
	   }
	   
	}
/* function myTeamList(){
	$.ajax({
		url:"myTeamList",
		success:function(data){
			
		}
	});
} */



/* $(function(){
	myTeamList();
	
	setInterval(function(){
		topList();
	},1000);
}); */



</script>
</body>
</html>