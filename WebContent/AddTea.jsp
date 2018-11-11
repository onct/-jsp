<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="myservlet.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%
    String aid = (String)session.getAttribute("id");
    String choice = (String)session.getAttribute("choice");
     if(aid==null||aid.length()==0||choice==null||choice.length()==0||choice.equals("Admin")==false) {
         response.sendRedirect("Login.jsp?nowid=addteacher.jsp");
     }
%>

<div class="login">
	<h1>添加教师信息</h1>
<form  action="MainServlet?choice=addT" method= "post" >                                      
     <div>
     <div class="login-inp">
          <label>工号</label>
           <input type="text"  id="tno" name="tno" placeholder="请输入工号(8位)(必填)">
      </div>
      </div>
                    
      <div>
      <div class="login-inp">
           <label>密码</label>
           <input type="password"id="tpassword" name="tpassword"  placeholder="请输入密码(6-20位)(必填)" value="111111">
       </div>
       </div>
                    
       <div>
       <div class="login-inp">
           <label>姓名</label>
         	<input type="text" id="tname" name="tname" placeholder="请输入姓名(1-10位)(必填)" >
        </div>
        </div>
                    
         <div>
         <div class="login-inp">
            <label>科目</label>
             <input type="text"  id="course" name="course" placeholder="请输入所教科目(必填)" >
          </div>
          </div>
                    
          <div class="login-inp">
                <button type="submit">添加</button>
           </div>  
</form>
            <form   action="ManageTeacher.jsp" method= "post">
           <div class="login-inp">
                  <button type="submit">返回</button>
            </div>
            </form>
</div>

</body>
</html>