<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>List</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="/resources/css/slidebars.css">
<link rel="stylesheet" href="/resources/css/style.css">
<style>
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
	window.onload = function() {

		$.ajax({
			url : '/main/searchList',
			method : 'post'
		}).done(function(msg) {
			var jArr = JSON.parse(msg);
			$.each(jArr, function(i) {
				var b_num = i + 1;
				var div = document.createElement('div');
				var text = '';
				div.id = 'list' + l_num;
				div.className = 'list';

				var aTag = document.createElement('a');
				var createAText = document.createTextNode('리스트' + l_num);

				aTag.setAttribute('href', '#');
				aTag.appendChild(createAText);
				div.appendChild(aTag);

				document.getElementById('viewBoard').appendChild(div);

			});

		});

	};
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
	</div>

	<div off-canvas="slidebar-2 right shift">
		<ul class="menu">
			<a class="menu-icon" href="#""><i class="icon-reorder"></i></a>
			<ul class="side-menu">
				<h2 class="title">Menu</h2>
				<li class="link"><a href="#" class="link_tag1">Board</a></li>
				<li class="link"><a href="#" class="link_tag2" id="myBtn">History</a>
				</li>
				<li class="link"><a href="#" class="link_tag3">Chatting</a></li>
				<li class="link"><a href="#" class="link_tag4">File</a></li>
				<li class="link"><a href="#" class="link_tag5">Members</a></li>
			</ul>
		</ul>
	</div>

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


	<div class="content">
		<div id="viewList"></div>
		<div id="createList"></div>
		<div id="addList" onclick="addList();">Create</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="/resources/js/slidebars.js"></script>
	<script src="/resources/js/scripts.js"></script>
</body>
</html>