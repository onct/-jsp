<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="myservlet.control.*" %>
<html lang="zh-cmn-Hans-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>综合学生管理页面</title>
    <link rel="stylesheet" href="style.css">
</head>
<h1>综合学生管理</h1>

<br>
<br>
<br>
<body>

<%
    String aid = (String)session.getAttribute("id");
    String choice = (String)session.getAttribute("choice");
    if(aid==null||aid.length()==0||choice==null||choice.length()==0||choice.equals("Admin")==false) {
        response.sendRedirect("Login.jsp?nowid=addadmin.jsp");
    }
   // out.print(aid);
%>
<div class="login">

    <form action="" method= "post">
         	<div class="login-inp">
          		<input type="text" id="sqlquery" name="sqlquerystudent_admin" placeholder="请输入查询的学号">
            </div>
          	<div class="login-inp">
          		<button type="submit">查询用户</button>
            </div>
    </form>
    
<div align="center">
   <form id="form1">
   		<table  id = 'tableResult'>
        <thead>
        <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>密码</th>
        <th>课程</th>
        <th>成绩</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
           request.setCharacterEncoding("UTF-8");
           String message = request.getParameter("sqlquerystudent_admin");            
           List<Student> stu=null;
           Student st=null;
           if(message==null||message.length()==0) {
           		stu = StuDBUtil.selectStu_All();
                for(Student s : stu) {
        %>
                <tr  style="color:white">
        <%
        		 out.print("<td>" + s.getSno() + "</td>");
              	 out.print("<td>" + s.getSname() + "</td>");
                 out.print("<td>" + s.getSpasswd() + "</td>");
                 out.print("<td>" + s.getCourse()+ "</td>");
                 out.print("<td>" + s.getGrade() + "</td>");
                 out.print("<td>");
		%>
	
      <div class="login-txt">
        	<a href="Admineditstu.jsp?editsid=<%=s.getSno()%>" onClick="return confirm('你确定要修改该学生吗？')" >修改</a>|
   			<a href="MainServlet?choice=deleteS?delsid=<%=s.getSno()%>" onClick="return confirm('你确定要删除该学生吗？')" >删除</a>
      </div>

   		<%
                 out.print("</td>");
            	 out.print("</tr>");
                                }
        %>
       	<%      
            }else {
                    st = StuDBUtil.selectStu_Sno(message);
                    
                    out.print("<td>" + st.getSno() + "</td>");
                    out.print("<td>" + st.getSname() + "</td>");
                    out.print("<td>" + st.getSpasswd() + "</td>");
                    out.print("<td>" + st.getCourse()+ "</td>");
                    out.print("<td>" + st.getGrade() + "</td>");
                 	out.print("<td>");
                 	
                 	request.setAttribute("sqlquerystudent_admin", "");
        %>
        
      <div class="login-txt">
        	<a href="Admineditstu.jsp?editsid=<%=st.getSno()%>" onClick="return confirm('你确定要修改该学生吗？')" >修改</a>|
   			<a href="MainServlet?choice=deleteS?delsid=<%=st.getSno()%>" onClick="return confirm('你确定要删除该学生吗？')" >删除</a>
      </div>
      
        <%
                    out.print("</td>");
                    out.print("</tr>");
           }
        %>
    	</tbody>
        </table> 
                         <%
                        if(stu.size() == 0||st==null) {
                            out.print("<h1>"+"没有用户信息" +"<h1>");
                        }
                    %>                 
        </form>
  </div> 
  		<form  action="AddStu.jsp" method= "post">    
        <div>
        <div class="login-inp">
             <button type="submit" onclick="AddStu.jsp">添加学生</button>
		</div>
		</div>
		</form>
		
		<form  action="Admin.jsp" method= "post">
		<div>
		<div class="login-inp">
             <button type="submit" onclick="Admin.jsp">返回</button>
         </div>
         </div>
         </form>
</div>
</body>
</html>