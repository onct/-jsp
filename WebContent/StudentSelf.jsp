<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="myservlet.control.*" %>
<html lang="zh-cmn-Hans-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生页面</title>
    <link rel="stylesheet" href="style.css">
</head>
<h1>个人信息</h1>

<br>
<br>
<br>
<body>

<%
    String choice = (String)session.getAttribute("choice");
    String sno = (String)session.getAttribute("id");
    if(choice==null||choice.length()==0||choice.equals("Student")==false){
        response.sendRedirect("Login.jsp?nowid=control_student_student.jsp");
    }
%>

<div class="login">
     <div align="center">
         <form id="form1" >
      	 <table id = 'tableResult'>
                        <tread>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>密码</th>
                            <th>课程</th>
                            <th>成绩</th>
                        </tr>
                        </tread>
                        <tbody>
                        <%
                            request.setCharacterEncoding("UTF-8");
                            if(sno==null||sno.length()==0) {
                                response.sendRedirect("Login.jsp?nowid=control_student_student.jsp");
                            }
							Student st = new Student();
                            List<Student> stu;
                            stu = SSDBoperate.selectALLinfo(st);
                            for(Student s : stu) {
                                if (s.getSno().equals(sno)) {
                                 %>
                                 <tr  style="color:white">
                                 <%
                                    out.print("<td>" + s.getSno() + "</td>");
                                    out.print("<td>" + s.getSname() + "</td>");
                                    out.print("<td>" + s.getSpasswd() + "</td>");
                                    out.print("<td>" + s.getCourse() + "</td>");
                                    out.print("<td>" + s.getGrade() + "</td>");
                                    out.print("</tr>");
                                    break;
                                }
                            }
                        %>
                        </tbody>
                    </table>
                    
                    <%
                        if(stu.size() == 0) {
                            out.print("<h4>"+"没有用户信息" +"<h4>");
                        }
                    %>
                    
      </form>
         </div>
      <form action="Student.jsp" method= "post">
               <div class="login-inp">
             <button type="submit">返回</button>
                   </div>
      </form>
</div>


</body>
</html>