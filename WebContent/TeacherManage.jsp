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
<h1>学生管理</h1>

<br>
<br>
<br>
<body>
<%
    String choice = (String)session.getAttribute("choice");
    if(choice==null||choice.length()==0||choice.equals("Teacher")==false){
        response.sendRedirect("index.jsp?nowid=control_student_teacher.jsp");
    }
%>
<%
    request.setCharacterEncoding("UTF-8");
    String tno = (String)session.getAttribute("id");
    String cname = null;
    Teacher tea = new Teacher();
    tea = SSDBoperate.selectInfo(tno);
	cname = tea.getCourse();
        
    
    if(cname==null||cname.length()==0)
        cname="";
    System.out.print(cname);
%>
</body>

<div class="login">


                <form action="" method= "post">
                            <div class="login-inp">
                    <input type="text" id="sqlquery" name="sqlquerystudent_admin" placeholder="请输入查询的学号或姓名">
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
                            <th><%=cname%>成绩</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            request.setCharacterEncoding("UTF-8");
                            String message = request.getParameter("sqlquerystudent_admin");
                            Student st =new Student();
                            List<Student> stu = null;
                            if(cname!=null && cname.length()!=0) {
                                if (message == null || message.length() == 0) {
                                	stu = SSDBoperate.selectALLinfo(st);
                                } else {
                                    stu = SSDBoperate.selectInfo(message);
                                    request.setAttribute("sqlquerystudent_admin", "");
                                }
                            }
                            for(Student s : stu) {
                                %>
                                 <tr  style="color:white">
                                <%
                                if(cname.equals(s.getCourse())){
                                    out.print("<td>" + s.getSno() + "</td>");
                                    out.print("<td>" + s.getSname() + "</td>");
                                    out.print("<td>" + s.getSpasswd() + "</td>");
                                
                                     out.print("<td>" + s.getCourse() + "</td>");
                                     out.print("<td>" + s.getGrade() + "</td>");
                                }
                                out.print("<td>");
                        %>
                        <a href="TeachereditStu.jsp?editsid_teacher=<%=s.getSno()%>&editcname=<%=cname%>" onClick="return confirm('你确定要修改该学生成绩吗？')" >修改</a>
                        <%
                                out.print("</td>");
                                out.print("</tr>");
                            }
                        %>
                        </tbody>
                    </table>
                    <%
                        if(stu.size() == 0) {
                            out.print("<h4>"+"没有学生信息" +"<h4>");
                        }
                    %>
                </form>
                </div>
                
                
                <form action="Teacher.jsp" method= "post">
                <div class="login-inp">
                    <button type="submit">返回</button>
                    </div>
                </form>
            	
</div>

</body>
</html>