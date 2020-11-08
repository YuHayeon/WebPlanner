
<html>
<head>
    <title>회원가입 정보</title>
    <style>
        #wrap{
            width:400px;
            margin-left:auto;
            margin-right:auto;
            text-align:center;
        }

        table{
            border:5px solid #6495ED;
        }

        td{
            border:3px solid #6495ED;
        }

        #title{
            background-color:#6495ED;
        }
    </style>
</head>
<body>
    <!-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. -->
    <%
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("euc-kr");

        // getParameter()를 이용해 넘겨진 파라미터 값을 얻어올 수 있다.
        // 파라미터 값을 얻을때 name= 에 지정해둔 값과 동일한 값을 인자로 지정해야 된다.
        String id = request.getParameter("userId");
        String password = request.getParameter("userPw");
        String name = request.getParameter("userName");

        String email1 = request.getParameter("email01");

        // 이메일의 경우 <select>로 되어 있는데 파라미터 값을 받을 시 배열형태로 넘겨 받는다.
        String[] email2 = request.getParameterValues("email02");

    %>

    <div id="wrap">
        <br><br>
        <b><font size="5">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color=#6495ED><%=name %></font>님 가입을 축하드립니다.
        <br><br>

        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=user %></td>
            </tr>

            <tr>
                <td id="title">비밀번호</td>
                <td><%=password %></td>
            </tr>

            <tr>
                <td id="title">이름</td>
                <td><%=name %></td>
            </tr>

            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=email1 %>
                    <%
                    // 배열로 넘겨받은 값을 처리하기 위해 for문 이용
                    for(String e : email2){
                        out.println("@"+e);
                    }
                    %>
                </td>
            </tr>
        </table>

        <br>
        <input type="button" value="확인">
    </div>
</body>
</html>
