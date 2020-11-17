<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
  <title>Web Planner - Welcome</title>
  <meta charset="utf-8">
  <style>
    body{
      margin:0;
    }
    a{
      color:black;
      text-decoration : none;
    }
    h1{
      font-size : 45px;
      text-align: center;
      border-bottom : 1px solid gray;
      margin : 0;
      padding : 20px;
    }
    ol{
      border-right : 1px solid gray;
      width : 100px;
      height : 250%;
      margin : 0;
      padding : 50px;
    }
    li{
      padding-bottom :50px;
    }
    tr, td{
      border:1px solid black;
    }
    #calendar{
      border:1px solid black;
      text-align: center;
      width:80%;
      height : 600px;

    }
    #todo{
      text-align: center;
      width:15%;
      height:400px;
      padding-left: 2%;

    }

    #menu{
      display : grid;
      grid-template-columns : 150px 1fr;
    }
    #menu ol{
      padding-left : 33px;
    }
    #menu #article{
      padding-left : 50px;
    }
  </style>
  <script language="javascript">
    var today = new Date(); // 오늘 날짜
    var date = new Date();

    function beforem() //이전 달을 today에 값을 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }

    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }

    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력

        if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        before.innerHTML="12월";
        next.innerHTML=(today.getMonth()+2)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }


        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 2)
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;

        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++)
        {
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
                cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate())
            {
                cell.bgColor = "#99FFFF"; //오늘날짜배경색
            }
        }

    }

</script>
</head>
<body onload="build();">
  <h1><a href="home">Web Planner</a></h1>
  <div id="menu">
  <ol>
    <li><a href="attend">출석</a></li>
    <li><a href="task">과제</a></li>
    <li><a href="test">시험</a></li>
    <li><a href="grade">성적</a></li>
  </ol>
  <div id="article">
  <h2>Home</h2>
  <table align="left" id="calendar">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <tr>
            <td align="center"> <font color="#FF9090">일</font></td>
            <td align="center"> 월 </td>
            <td align="center"> 화 </td>
            <td align="center"> 수 </td>
            <td align="center"> 목 </td>
            <td align="center"> 금 </td>
            <td align="center"><font color=#7ED5E4>토</font></td>
        </tr>
    </table>
    <div id="todolist">
      <table align="rignt" id="todo">

        <tr>
          <th text-align="bottom">ToDoList</th>
        </tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
      </table>
    </div>
  </div>
  </div>
</body>
</html>