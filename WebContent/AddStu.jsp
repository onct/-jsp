<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="myservlet.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=utf-8");
    response.setCharacterEncoding("utf-8");
    out.print(request.getParameter("addstudent_for_admin_error"));
    String aid = (String)session.getAttribute("id");
    String choice = (String)session.getAttribute("choice");
    if(aid==null||aid.length()==0||choice==null||choice.length()==0||choice.equals("Admin")==false) {
        response.sendRedirect("Login.jsp?nowid=addadmin.jsp");
    }
%>

<div class="login">
	<h1>添加学生信息</h1>
<form  action="MainServlet?choice=addS" method= "post" >                                      
     <div>
     <div class="login-inp">
          <label>学号</label>
           <input type="text"  id="sno" name="sno" placeholder="请输入学号(12位)(必填)">
      </div>
      </div>
                    
      <div>
      <div class="login-inp">
           <label>密码</label>
           <input type="password"  id="spassword" name="spassword"  placeholder="请输入密码(6-20位)(必填)" value="111111">
       </div>
       </div>
                    
       <div>
       <div class="login-inp">
           <label>姓名</label>
         	<input type="text"  id="sname" name="sname" placeholder="请输入姓名(1-10位)(必填)" >
        </div>
        </div>
                    
         <div>
         <div class="login-inp">
            <label>课程</label>
             <input type="text"  id="course" name="course" placeholder="请输入所学科目(非必填)" >
          </div>
          </div>
          
         <div>
         <div class="login-inp">
            <label>分数</label>
             <input type="text" id="grade" name="grade" placeholder="请输入科目分数(非必填)" >
          </div>
          </div>
                    
          <div class="login-inp">
                <button type="submit">添加</button>
           </div>  
</form>
            <form   action="ManageStudent.jsp" method= "post">
           <div class="login-inp">
                  <button type="submit">返回</button>
            </div>
            </form>
</div>

</body>
</html>