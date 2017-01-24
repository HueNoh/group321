<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>데이터베이스 테스트 페이지</title>
<script src="/resources/js/jquery-3.1.1.js"></script>
<script>
function loginChk(){
	var id= $('#loginChk_id').val();
	var pw= $('#loginChk_pw').val();
	console.log(id+' '+pw);
	var arr = {id, pw};
	console.log(arr);
	var jsonStr = JSON.stringify(arr);
	console.log(jsonStr);
	var url = '/hstest/loginChk';

	doAjax(jsonStr, url);
};

function doAjax(jsonStr, url) {
	$.ajax({
		type : 'POST',
		url : url,
		data : {
			jsonStr : jsonStr
		},
		dataType : 'json'
	//contentType: 'application/json; charset=utf-8'
	}).done(function(msg) {
		$('#display').html(msg);
	});
};
</script>
</head>
<body>
<h1>DB Test</h1>
return: <span id="display"></span>${string}<br>
<input type="text" name="id" id="loginChk_id">
<input type="password" name="pw" id="loginChk_pw">
<input type="button" onclick="loginChk()" value="loginChk"><br>
<hr>
<input type="text" name="id" id="insertBoard_id">
<input type="text" name="title" id="insertBoard_title">
<input type="button" onclick="insertBoard()" value="insertBoard"><br>
<hr>




</body>
</html>