<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>List</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="/resources/css/slidebars.css">
<link rel="stylesheet" href="/resources/css/slidebars.atj.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/style.css">
<!-- <link rel="stylesheet" href="/resources/css/jquery-ui.css"> -->
<style>
#addList, .createList, .list {
	width: 150px;
	height: 150px;
	margin: 5px;
	border: 1px solid black;
	float: left;
}

.list-card, .addCard {
	width: 100%;
	border: 1px solid black;
	float: left;
}

#content {
	height: 100%;
}
</style>
<script>


	document.onkeydown = refl;
	
	function refl() {
		if(event.keyCode == 116){
			location.href='/main/board';
			return false;
		}
	}
	
	var webSocket = new WebSocket('ws://211.183.8.14/socket');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)

	};
	webSocket.onmessage = function(event) {
		onMessage(event)

	}; 
	
	


	var b_num = '${b_num}';
	
	
	window.onload = function() {
		$('#viewList').sortable({
			update : function() {
				var result = $('#viewList').sortable('toArray');
				console.log('value: ' + result);
 				console.log(result.length);
 			
 				
 				var moveData=new Object();
 				var msg= '';
 				for(var i = 0 ; i < result.length; i++){
 					if(i<(result.length-1)){ 
						msg+= result[i]+',';
					}else{
						msg+= result[i];
					}
 					
 				}
 				
 				console.log(msg);
 				moveData = result;
 				
 				console.log(JSON.stringify(moveData));
 				var data = JSON.stringify(moveData);
 				$.ajax({
 					url : '/main/moveList',
 					method : 'post',
 					data : {
 						data : msg,
 						length : result.length,
 						bnum : b_num
 					}
 					
 				}).done();
 				
			}

		});
		
		$.ajax({
			url : '/main/searchList',
			method : 'post',
			data : {
				bnum : b_num
			}
		}).done(function(msg) {
			var listArr = JSON.parse(msg);
			$.each(listArr, function(i) {

				var l_num = listArr[i].l_num;
				var id = listArr[i].seq;
				var div = document.createElement('div');
				div.id = id;
				div.className = 'list';
			
				$.ajax({
					url : '/main/searchCard',
					method : 'post',
					data : {
						bnum : b_num,
						lnum : l_num
					}
				}).done(function(msg) {
					var cardArr = JSON.parse(msg);
					
					$.each(cardArr, function(i) {
						var cardDiv = document.createElement('div');
						var c_num= cardArr[i].c_num;
						
						cardDiv.className = 'list-card';
						cardDiv.onclick =function() {
							cardView(b_num,l_num,c_num)
						};
						
						var createCardText = document.createTextNode('card'+c_num );
						
						
						cardDiv.appendChild(createCardText);
						div.appendChild(cardDiv);
						
						

					});

				});
				
				var addCardDiv = document.createElement('div');
				addCardDiv.className = 'addCard';
			 
				var aTag = document.createElement('a');
				var createAText = document.createTextNode('addCard');
				
				aTag.setAttribute('href', '#');
				aTag.setAttribute('className', 'aaaa');
				aTag.setAttribute('onClick', 'addCard(' + l_num
						+ ',\'' + id + '\')');
				aTag.appendChild(createAText);
				
				addCardDiv.appendChild(aTag); 
				div.appendChild(addCardDiv); 

				document.getElementById('viewList').appendChild(div);

			});

		});
	};
	

	function addList() {
		$.ajax({
			method : 'post',
			url : '/main/createList',
			data : {
				id : '${sessionScope.id}',
				title : 'TestTitle',
				bnum : b_num

			}

		}).done(function(msg) {
				
			var arrList = JSON.parse(msg);
			var id = arrList.seq;
			var div = document.createElement('div');
			div.id = id;
			div.className = 'list';

			var aTag = document.createElement('a');
			var createAText = document.createTextNode('addCard');
			aTag.setAttribute('href', '#');
			aTag.setAttribute('className', 'aaaa');
			aTag.setAttribute('onClick', 'addCard(' + arrList.l_num
					+ ',\'' + id + '\')');

			aTag.appendChild(createAText);
			div.appendChild(aTag);

			document.getElementById('viewList').appendChild(div);
		});
	}






	function addCard(l_num, id) {
		$.ajax({
			method : 'post',
			url : '/main/createCard',
			data : {
				id : '${sessionScope.id}',
				title : 'TestTitle',
				bnum : b_num,
				lnum : l_num

			}

		}).done(function(msg) {
			var cardArr = JSON.parse(msg);

			var newCard = document.createElement('div');
			var c_num = cardArr.c_num;

			/* newCard.id = 'card' + c_num; */
			newCard.className = 'list-card';
			newCard.onclick = function() {
				cardView(b_num,l_num,c_num)
			};
			var createCardText = document.createTextNode('card' + c_num);


			newCard.appendChild(createCardText);
		
			document.getElementById(id).appendChild(newCard);
		});
		
	}

	function cardView(b_num, l_num, c_num) {
		$.ajax({
			method : 'post',
			url : '/main/selectCardDetail',
			data : {
				bnum : b_num,
				lnum : l_num,
				cnum : c_num
			}
		}).done(function(msg) {

			console.log(msg);
			cardModal.style.display = "block";
		});

	}

	
</script>
</head>
<body>
	<nav>
		<div align="center" class="nav">
			<img src="/resources/images/logo.JPG" alt="Main" class="main_img">
		</div>
	</nav>
	<div canvas="container" align="right">
		<p>
			<a href="#" class="js-toggle-right-slidebar">☰</a>
		</p>
		<div class="content">
			<div id="viewList"></div>
			<div id="addList" onclick="addList();">Create</div>
		</div>

	</div>

	<div off-canvas="slidebar-2 right shift">
		<ul class="menu">
			<a class="menu-icon" href="#"><i class="icon-reorder"></i></a>
			<ul class="side-menu">
				<h2 class="title">Menu</h2>
				<li class="link"><a href="#" class="link_tag1">Board</a></li>
				<li class="link"><a href="#" class="link_tag2" id="myBtn">History</a>
				</li>
				<li class="link"><a href="#" onclick="openChat();" class="link_tag3 js-close-right-slidebar">Chatting</a></li>
				<li class="link"><a href="#" class="link_tag4">File</a></li>
				<li class="link"><a href="#" class="link_tag5">Members</a></li>
			</ul>
		</ul>
	</div>

	<%-- <div id="mySidenavChat" class="sidenav-chat">
		<a href="javascript:void(0)" class="closebtn" onclick="closeChat()">&times;</a>
		<jsp:include page="websocket.jsp"></jsp:include>
	</div> --%>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span id="hisClose" class="close">&times;</span>
			<p>
				Minsik Kim added slide menu study to to do listJan 16 at 3:59 PM<br>
				<br> MKMinsik Kim added menu view study to to do listJan 16 at
				3:42 PM<br> <br> MKMinsik Kim added event hadling study to
				to do listJan 16 at 3:42 PM<br> <br> MKMinsik Kim added to
				do list to this boardJan 16 at 3:42 PM<br> <br> MKMinsik
				Kim added ++ to listJan 16 at 3:23 PM<br> <br> MKMinsik
				Kim added list to this boardJan 16 at 10:38 AM<br> <br>
				MKMinsik Kim created this boardJan 16 at 10:37 AM<br> <br>
				Minsik Kim added slide menu study to to do listJan 16 at 3:59 PM<br>
				<br> MKMinsik Kim added menu view study to to do listJan 16 at
				3:42 PM<br> <br> MKMinsik Kim added event hadling study to
				to do listJan 16 at 3:42 PM<br> <br> MKMinsik Kim added to
				do list to this boardJan 16 at 3:42 PM<br> <br> MKMinsik
				Kim added ++ to listJan 16 at 3:23 PM<br> <br> MKMinsik
				Kim added list to this boardJan 16 at 10:38 AM<br> <br>
				MKMinsik Kim created this boardJan 16 at 10:37 AM<br> <br>
				Minsik Kim added slide menu study to to do listJan 16 at 3:59 PM<br>
				<br> MKMinsik Kim added menu view study to to do listJan 16 at
				3:42 PM<br> <br> MKMinsik Kim added event hadling study to
				to do listJan 16 at 3:42 PM<br> <br> MKMinsik Kim added to
				do list to this boardJan 16 at 3:42 PM<br> <br> MKMinsik
				Kim added ++ to listJan 16 at 3:23 PM<br> <br> MKMinsik
				Kim added list to this boardJan 16 at 10:38 AM<br> <br>
				MKMinsik Kim created this boardJan 16 at 10:37 AM<br> <br>
				Minsik Kim added slide menu study to to do listJan 16 at 3:59 PM<br>
				<br> MKMinsik Kim added menu view study to to do listJan 16 at
				3:42 PM<br> <br> MKMinsik Kim added event hadling study to
				to do listJan 16 at 3:42 PM<br> <br> MKMinsik Kim added to
				do list to this boardJan 16 at 3:42 PM<br> <br> MKMinsik
				Kim added ++ to listJan 16 at 3:23 PM<br> <br> MKMinsik
				Kim added list to this boardJan 16 at 10:38 AM<br> <br>
				MKMinsik Kim created this boardJan 16 at 10:37 AM<br> <br>
				Minsik Kim added slide menu study to to do listJan 16 at 3:59 PM<br>
				<br> MKMinsik Kim added menu view study to to do listJan 16 at
				3:42 PM<br> <br> MKMinsik Kim added event hadling study to
				to do listJan 16 at 3:42 PM<br> <br> MKMinsik Kim added to
				do list to this boardJan 16 at 3:42 PM<br> <br> MKMinsik
				Kim added ++ to listJan 16 at 3:23 PM<br> <br> MKMinsik
				Kim added list to this boardJan 16 at 10:38 AM<br> <br>
				MKMinsik Kim created this boardJan 16 at 10:37 AM<br> <br>
			</p>
		</div>
	</div>
	<div id="mySidenavChat" class="sidenav-chat">
		<a href="javascript:void(0)" class="closebtn" onclick="closeChat()">&times;</a>
		<jsp:include page="websocket.jsp"></jsp:include>
	</div>
	<div id="cardModal" class="modal">
		<div class="modal-content">
			<p>
				<span id="cardClose" class="close">&times;</span>
			</p>
	
			<div id="cardView">
				<div id="card-header"></div>
				<p>add Comment</p>
				<div id="card-comment">
					<textarea cols="25" rows="5"></textarea>

				</div>
				<p>댓글</p>
				<div id="card-repl"></div>
			</div>
		</div> 
	</div>


</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/resources/js/jquery-ui.js"></script>
<script src="/resources/js/slidebars.js"></script>
<script src="/resources/js/slidebars.atj.js"></script>
<script src="/resources/js/scripts.js"></script>

</html>