<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<link rel="canonical"
	href="https://getbootstrap.com/docs/3.3/examples/theme/">

<title>Home - Web Planner</title>


<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="../resources/css/bootstrap-theme.min.css" rel="stylesheet">
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../resources/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="../resources/css/home.css" rel="stylesheet">

<script language="javascript">
	var today = new Date(); // 오늘 날짜
	var date = new Date();

	function beforem() //이전 달을 today에 값을 저장
	{
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		build(); //만들기
	}

	function nextm() //다음 달을 today에 저장
	{
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		build();
	}

	function build() {
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
		var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
		var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
		yearmonth.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월"; //년도와 월 출력

		if (today.getMonth() + 1 == 12) //  눌렀을 때 월이 넘어가는 곳
		{
			before.innerHTML = (today.getMonth()) + "월";
			next.innerHTML = "1월";
		} else if (today.getMonth() + 1 == 1) //  1월 일 때
		{
			before.innerHTML = "12월";
			next.innerHTML = (today.getMonth() + 2) + "월";
		} else //   12월 일 때
		{
			before.innerHTML = (today.getMonth()) + "월";
			next.innerHTML = (today.getMonth() + 2) + "월";
		}

		// 남은 테이블 줄 삭제
		while (tbcal.rows.length > 2) {
			tbcal.deleteRow(tbcal.rows.length - 1);
		}
		var row = null;
		row = tbcal.insertRow();
		var cnt = 0;

		// 1일 시작칸 찾기
		for (i = 0; i < nMonth.getDay(); i++) {
			cell = row.insertCell();
			cnt = cnt + 1;
		}

		// 달력 출력
		for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
		{
			cell = row.insertCell();
			cell.innerHTML = i;
			cnt = cnt + 1;
			if (cnt % 7 == 1) {//일요일 계산
				cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
			}
			if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
				cell.innerHTML = "<font color=#0066FF>" + i//토요일에 색
				row = calendar.insertRow();// 줄 추가
			}
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				cell.bgColor = "#6b9be3"; //오늘날짜배경색
			}
		}

	}

	// 회원가입 버튼 클릭시 회원가입 화면으로 이동
	function goRegister() {
		location.href = "register";
	}

	// 로그아웃
	function goLogout() {
		location.href = "logout";
	}
</script>
</head>

<body onload="build();">
	<div>
		<div id="title">
			<a href="home">Web Planner</a>
			<div align="right" id="sign">
				<form name='homeForm' method="post" action="/login">
					<c:if test="${member == null}">
						<div>
							<button type="submit" class="label label-primary">로그인</button>
							<button type="button" class="label label-primary" onclick="goRegister()">회원가입</button>
						</div>
					</c:if>
					<c:if test="${member != null }">
						<div>
							<p>${member.userId}님환영합니다.</p>
							<button type="button" onclick="goLogout()">로그아웃</button>
						</div>
					</c:if>
				</form>
			</div>
		</div>

		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand">Web Planner</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/home">홈</a></li>
						<li><a href="/attend">출석</a></li>
						<li><a href="/task">과제</a></li>
						<li><a href="/test">시험</a></li>
						<li><a href="/grade">성적</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div id="menu">
			<ol>

			</ol>
			<div id="article">
				<h2>Home</h2>
				<table align="left" id="calendar">
					<tr>
						<td><font size=1%; color="#B3B6B3"><label
								onclick="beforem()" id="before"></label></font></td>
						<td colspan="5" align="center" id="yearmonth"></td>
						<td><font size=1%; color="#B3B6B3"><label
								onclick="nextm()" id="next"></label></font></td>
					</tr>
					<tr>
						<td align="center"><font color="#FF9090">일</font></td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color=#0066FF>토</font></td>
					</tr>
				</table>
				<div id="todolist">
					<table align="rignt" id="todo">

						<tr>
							<th text-align="bottom">ToDoList</th>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../resources/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>