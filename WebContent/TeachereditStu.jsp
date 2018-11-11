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
<h1>修改学生信息</h1>

<br>
<br>
<br>
<body>
<%
    String tid = (String)session.getAttribute("id");
    String choice = (String)session.getAttribute("choice");
    if(choice==null||choice.length()==0||choice.equals("Teacher")==false){
        response.sendRedirect(request.getParameter("Login.jsp?editstudent_teacher.jsp"));
    }
%>
<%
    String sno = request.getParameter("editsid_teacher");
    String cname = null;
    cname = request.getParameter("editcname");
    if(sno != null)
        session.setAttribute("teacher_editsid", sno);
    sno = (String)session.getAttribute("teacher_editsid");
    if(cname != null)
        session.setAttribute("teacher_editcname", cname);
    cname = (String)session.getAttribute("teacher_editcname");
    System.out.println(1111111);
    System.out.println((String)session.getAttribute("teacher_editsid"));
    System.out.println( (String)session.getAttribute("teacher_editcname"));
    String sname = null;
    int grade = 0;
    
    Student stu = SSDBoperate.selectInfo(sno);

            sname = stu.getSname();
			grade=stu.getGrade();

    System.out.println(cname);
    if(sname==null)
        sname = "";
    if(sno==null)
        sno="";

%>
<div class="login">
                    <form  action="MainServlet?choice=modifyS1?cname=<%=cname%>" method= "post">
                        <div class="login-inp">
                            <label>学号:</label><input type="text" disabled="disabled"   value=<%=sno%> placeholder="请输入学号(必填)">
                        </div>
                        <div class="login-inp">
                            <label>姓名:</label><input type="text" disabled="disabled"  placeholder="请输入姓名(必填)" value=<%=sname%> >
                        </div>
                        <div class="login-inp">
                            <label><%=cname%>成绩</label><input type="text"  id="grade" name="grade" value=<%=grade%> placeholder="请输入<%=cname%>成绩[0,100]">
                        </div>
                        <input type="hidden"   id="sno" name="sno" value=<%=sno%> placeholder="请输入学号(必填)">
                        <input type="hidden"   id="name" name="name" placeholder="请输入姓名(必填)" value=<%=sname%> >
                        <br>
                        <div class="login-inp">
                            <button type="submit">修改</button>
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
<script>var errori ='<%=request.getParameter("editerror_teacher")%>'
if(errori=='yes'){
    alert("信息填写有误！");
}
</script>