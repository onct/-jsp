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
<h1>修改学生信息</h1>

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
%>
<%
    String sno = request.getParameter("editsno");
    if(sno != null)
        session.setAttribute("admin_editsno", sno);
    sno = (String)session.getAttribute("admin_editsno");
    System.out.println((String)session.getAttribute("admin_editsno"));
    String sname = null;
    String password  = null;
    String course = null;
    int grade = 0;
	Student stu = new Student();
  	stu = SSDBoperate.selectInfo(sno);
    sname = stu.getSname();
    password = stu.getSpasswd();
    course = stu.getCourse();
    grade = stu.getGrade();
        
    
    if(sname==null)
        sname = "";
    if(password==null)
        password = "111111";
    if(course==null)
        course="";
    if(sno==null)
        sno="";
   //    out.print(sname);
%>
<div class="login">
		<form  action="MainServlet?choice=modifyS2" method= "post" style="color:white"> 
                    
                    <div>
                    <div class="login-inp">            
                             学号：<input type="text" disabled = "disabled"  value=<%=sno%> placeholder="请输入学号(1-10)(必填)">
					</div> 
					</div> 
					
					<div>
                   	<div class="login-inp">
                            密码：<input type="password"  id="password" name="password"  placeholder="请输入密码(1-20)(必填)" value=<%=password%> >
                    </div>
                    </div>  
                     
                     <div>
                     <div class="login-inp">                    
                            姓名：<input type="text"  id="name" name="name" placeholder="请输入姓名(1-10)(必填)" value=<%=sname%> >
                     </div>
                     </div>
                     
					 <div>
                     <div class="login-inp">   
                            课程：<input type="text"  id="nickname"  name="nickname" placeholder="请输入课程(1-10)" value=<%=course%> >
  					 </div>
                     </div>
                     
                     <div>
                     <div class="login-inp"> 
                            成绩：<input type="text"  id="selfintroduction"  name="selfintroduction" placeholder="请输入成绩(0-100)" value=<%=grade%>>
                        </div>
                        </div>
                        

                        <div class="login-inp">
                        <button type="submit">修改</button>
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
<script>var errori ='<%=request.getParameter("editerror")%>'
if(errori!='null'){
    alert(errori);
}
</script>	
