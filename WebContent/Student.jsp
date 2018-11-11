<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>学生页面</title>
</head>
<h1>个人信息管理</h1>

<br>
<br>
<br>
<body>
<%
    	String sno = (String)session.getAttribute("id"); 
     	String choice = (String)session.getAttribute("choice");
     	sno = (String)session.getAttribute("id"); 
    	if(sno==null||sno.length()==0||choice==null||choice.length()==0||choice.equals("Student")==false) { 
        response.sendRedirect("Login.jsp?nowid=Student.jsp");
}
%>
<div class="login">

					<div>
					<div class="login-inp">
                    <form  action="StudentSelf.jsp" method= "post">
                            <button type="submit">查看个人信息</button>
                    </form>
                    </div>                
                    </div>
                    
                    
                    <div>
                    <div class="login-inp">
                    <form  action="Login.jsp" method= "post">
                            <button type="submit">退出登入</button>
                    </form>
                    </div>
                    </div>
                     
</div>
</body>
</html>