<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="myservlet.control.*" %>
<html lang="zh-cmn-Hans-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>综合教师管理页面</title>
    <link rel="stylesheet" href="style.css">
</head>
<h1>综合教师管理</h1>

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
          	<input type="text" id="sqlquery" name="sqlqueryteacher_admin" placeholder="请输入查询的工号">
        </div>
        <div class="login-inp">
          	<button type="submit">查询用户</button>
        </div>
    </form>
<div align="center">
   <form id="form1">
   		<table id = "tableResult">
        <thead>
        <tr>
        <th>工号</th>
        <th>姓名</th>
        <th>密码</th>
        <th>课程</th>
        </tr>
        </thead>
        <tbody>
        <%
           request.setCharacterEncoding("UTF-8");
           String message = request.getParameter("sqlqueryteacher_admin");            
           List<Teacher> Tea=null;
           Teacher tea=null;
           
           if(message==null||message.length()==0) {
           		Tea = TeaDBUtil.selectTea_All();
                for(Teacher t : Tea) {
        %>
                <tr  style="color:white">
        <%
        		 out.print("<td>" + t.getTno() + "</td>");
              	 out.print("<td>" + t.getTname() + "</td>");
                 out.print("<td>" + t.getTpasswd() + "</td>");
                 out.print("<td>" + t.getCourse()+ "</td>");
                 out.print("<td>");
		%>
		<div class="login-txt">
				<a href="Admineditea.jsp?edittid=<%=t.getTno()%>" onClick="return confirm('你确定要修改该教师吗？')" > 修改 </a>|
   				<a href="MainServlet?choice=deleteT?deltid=<%=t.getTno()%>" onClick="return confirm('你确定要删除该教师吗？')" >删除</a>
   		</div>
   		<%
                 out.print("</td>");
            	 out.print("</tr>");
                                }
        %>
       	<%      
            }else {
                    tea =TeaDBUtil.selectTea_Tno(message);
                    
                    out.print("<td>" + tea.getTno() + "</td>");
                    out.print("<td>" + tea.getTname() + "</td>");
                    out.print("<td>" + tea.getTpasswd() + "</td>");
                    out.print("<td>" + tea.getCourse()+ "</td>");
                 	out.print("<td>");
                 	
                 	request.setAttribute("sqlquerystudent_admin", "");
        %>
        <div class="login-txt">
       			<a href="Adminedittea.jsp?edittid=<%=tea.getTno()%>" onClick="return confirm('你确定要修改该教师吗？')" >修改</a>/
                <a href="MainServlet?choice=deleteT?deltid=<%=tea.getTno()%>" onClick="return confirm('你确定要删除该教师吗？')" >删除</a>
		</div>
        <%
                    out.print("</td>");
                    out.print("</tr>");
           }
        %>
    	</tbody>
        </table> 
                            <%
                        if(Tea.size() == 0||tea==null) {
                            out.print("<h1>"+"没有用户信息" +"<h1>");
                        }
                    %>                  
</form>
 </div>      
 		<form  action="AddTea.jsp" method= "post">
         <div>
        <div class="login-inp">
             <button type="submit" >添加教师</button>
		</div>
		</div>
      </form>
      	
      	<form  action="Admin.jsp" method= "post">	
		<div>
		<div class="login-inp">
             <button type="submit">返回</button>
         </div>
         </div>
		</form>
</div>
</body>
</html>
