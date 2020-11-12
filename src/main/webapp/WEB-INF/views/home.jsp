<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    var today = new Date(); // ���� ��¥
    var date = new Date();

    function beforem() //���� ���� today�� ���� ����
    {
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //�����
    }

    function nextm()  //���� ���� today�� ����
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }

    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //������� ù° ��
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //���� ���� ������ ��
        var tbcal = document.getElementById("calendar"); // ���̺� �޷��� ���� ���̺�
        var yearmonth = document.getElementById("yearmonth"); //  �⵵�� �� ����Ұ�
        yearmonth.innerHTML = today.getFullYear() + "�� "+ (today.getMonth() + 1) + "��"; //�⵵�� �� ���

        if(today.getMonth()+1==12) //  ������ �� ���� �Ѿ�� ��
        {
            before.innerHTML=(today.getMonth())+"��";
            next.innerHTML="1��";
        }
        else if(today.getMonth()+1==1) //  1�� �� ��
        {
        before.innerHTML="12��";
        next.innerHTML=(today.getMonth()+2)+"��";
        }
        else //   12�� �� ��
        {
            before.innerHTML=(today.getMonth())+"��";
            next.innerHTML=(today.getMonth()+2)+"��";
        }


        // ���� ���̺� �� ����
        while (tbcal.rows.length > 2)
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;

        // 1�� ����ĭ ã��
        for (i = 0; i < nMonth.getDay(); i++)
        {
            cell = row.insertCell();
            cnt = cnt + 1;
        }

        // �޷� ���
        for (i = 1; i <= lastDate.getDate(); i++) // 1�Ϻ��� ������ �ϱ���
        {
            cell = row.insertCell();
            cell.innerHTML = i;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//�Ͽ��� ���
                cell.innerHTML = "<font color=#FF9090>" + i//�Ͽ��Ͽ� ��
            }
            if (cnt % 7 == 0) { // 1������ 7�� �̹Ƿ� ����� ���
                cell.innerHTML = "<font color=#7ED5E4>" + i//����Ͽ� ��
                row = calendar.insertRow();// �� �߰�
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate())
            {
                cell.bgColor = "#99FFFF"; //���ó�¥����
            }
        }

    }

</script>
</head>
<body onload="build();">
  <h1><a href="home">Web Planner</a></h1>
  <div id="menu">
  <ol>
    <li><a href="attend">�⼮</a></li>
    <li><a href="task">����</a></li>
    <li><a href="test">����</a></li>
    <li><a href="grade">����</a></li>
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
            <td align="center"> <font color="#FF9090">��</font></td>
            <td align="center"> �� </td>
            <td align="center"> ȭ </td>
            <td align="center"> �� </td>
            <td align="center"> �� </td>
            <td align="center"> �� </td>
            <td align="center"><font color=#7ED5E4>��</font></td>
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