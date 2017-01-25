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
<style>
#addList, .createList, .list {
	width: 150px;
	height: 150px;
	margin: 5px;
	border: 1px solid black;
	float: left;
}

.card, .addCard {
	width: 100%;
	border: 1px solid black;
	float: left;
}

#content {
	height: 100%;
}
</style>
<script>
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
				var id='list' + l_num;
				var div = document.createElement('div');
				div.id = 'list' + l_num;
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

						cardDiv.id = 'card' + c_num;
						cardDiv.className = 'card';

						var aCard = document.createElement('a');
						var createCardText = document.createTextNode('card'+c_num );

						aCard.setAttribute('href', '#');
						aCard.appendChild(createCardText);
						cardDiv.appendChild(aCard);
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
				id : 'test1',
				title : 'TestTitle',
				bnum : b_num

			}

		}).done(function(msg) {
				
			var arrList = JSON.parse(msg);
			var id='List' + arrList.l_num;
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

			document.getElementById('createList').appendChild(div);
		});
	}


	function addCard(l_num, id) {
		console.log(id)
		$.ajax({
			method : 'post',
			url : '/main/createCard',
			data : {
				id : 'test1',
				title : 'TestTitle',
				bnum : b_num,
				lnum : l_num

			}

		}).done(function(msg) {
			var cardArr = JSON.parse(msg);

			var newCard = document.createElement('div');
			var c_num = cardArr.c_num;

			newCard.id = 'card' + c_num;
			newCard.className = 'card';

			var aCard = document.createElement('a');
			var createCardText = document.createTextNode('card' + c_num);

			aCard.setAttribute('href', '#');
			aCard.appendChild(createCardText);
			newCard.appendChild(aCard);
			document.getElementById(id).appendChild(newCard);
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
			<div id="createList"></div>
			<div id="addList" onclick="addList();">Create</div>
		</div>

	</div>

	<div off-canvas="slidebar-2 right shift">
		<ul class="menu">
			<a class="menu-icon" href="#""><i class="icon-reorder"></i></a>
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

	<div id=myModal class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
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
			<span class="close">&times;</span>
		</div>
	</div>


</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/resources/js/slidebars.js"></script>
<script src="/resources/js/slidebars.atj.js"></script>
<script src="/resources/js/scripts.js"></script>

</html>