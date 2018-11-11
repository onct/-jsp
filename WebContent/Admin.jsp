<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理界面</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%
    String aid = (String)session.getAttribute("id");
    String choice = (String)session.getAttribute("choice");
    if(aid==null||aid.length()==0||choice==null||choice.length()==0||choice.equals("Admin")==false) {
        response.sendRedirect("Login.jsp?nowid=admin_welcome.jsp");
    }
%>
<h1>综合信息管理</h1>

<br>
<br>
<br>

<div class="login">

<div>
<div class="login-inp">
    <button type="submit"  onclick="javascript:window.location.href='ManageStudent.jsp'">管理学生信息</button>
  </div>
</div>
 
 <div> 
<div class="login-inp">
    <button type="submit"  onclick="javascript:window.location.href='ManageTeacher.jsp'">管理教师信息</button>
  </div>
  </div>
 
 <div>
<div class="login-inp">
  	<button type="submit"  onclick="javascript:window.location.href='Login.jsp'">退出系统</button>
  </div>
 </div>
 
</div>

</body>
</html>