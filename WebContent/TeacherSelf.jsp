<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="myservlet.control.*" %>
<html lang="zh-cmn-Hans-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教师页面</title>
    <link rel="stylesheet" href="style.css">
</head>
<h1>修改个人信息</h1>

<br>
<br>
<br>
<body>
<%
    String choice = (String)session.getAttribute("choice");
    if(choice==null||choice.length()==0||choice.equals("Teacher")==false){
        response.sendRedirect("Login.jsp?nowid=control_teacher_teacher.jsp");
    }
%>
<%
    request.setCharacterEncoding("UTF-8");
    String tno = (String)session.getAttribute("id");
    String tname = null;
    String password  = null;
    String cname = null;
    Teacher tea = SSDBoperate.selectInfo(tno);

            tname = tea.getTname();
            password = tea.getTpasswd();
            cname = tea.getCourse();

    if(tname==null)
        tname = "";
    if(password==null)
        password = "111111";
    if(cname==null)
        cname="";
    if(tno==null||tno.length()==0) {
        response.sendRedirect("Login.jsp?nowid=control_teacher_teacher.jsp");
    }
%>
<div class="login">

<form   action="MainServlet?choice=modifyT" method= "post">
                        <div class="login-inp">
                            <label>教工号:</label><input type="text" disabled="disabled"  value=<%=tno%> placeholder="请输入教工号长度(1-10)(必填)">
                        </div>
                        <div class="login-inp">
                           <label> 密码:</label><input type="password"  id="password" name="password"  placeholder="请输入密码长度(1-20)(必填)" value=<%=password%> >
                        </div>
                        <div class="login-inp">
                            <label>姓名:</label><input type="text"  id="name" name="name" placeholder="请输入姓名长度(1-10)(必填)" value=<%=tname%> >
                        </div>
                         <input type="hidden"  id="tid" name="tid"  value=<%=tno%> >
                        <div class="login-inp">
                           <label> 所教科目:</label><input type="text"  id="course" name="course" placeholder="请输入课程长度(1-10)(必填)" value=<%=cname%> >
                        </div>
                        <div>
                        <div class="login-inp">
                            <button type="submit">修改</button>
                        </div>
                        </div>
                    </form>
                    <form  action="Teacher.jsp" method= "post">
                        <div class="login-inp">
                            <button type="submit">返回</button>
                        </div>
                    </form>


</div>


</body>
</html>
<script>var errori ='<%=request.getParameter("editteacher_teachererror")%>'
if(errori=='yes') {
    alert("信息填写不完整！");
}
</script>