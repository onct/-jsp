package myservlet.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;
import mybean.data.Student;
import mybean.data.Teacher;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;

       
 
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        
		String method=request.getParameter("choice");
		if(method.endsWith("login")){

			login(request, response);
			
		}
		else if(method.endsWith("addT")){

			addT(request,response);
		}
		else if(method.endsWith("addS")){

			addS(request,response);
		}
		else if(method.endsWith("modifyT")){
			modifyT(request, response);
		}
		else if(method.endsWith("modifyS1")){
			modifyS1(request, response);
		}
		else if(method.endsWith("modifyS2")){
			modifyS2(request, response);
		}
		
		else if(method.endsWith("deleteS")){
			deleteS(request, response);
		}
		else if(method.endsWith("deleteT")){
			deleteT(request, response);
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession(true);
        
        String lgname = request.getParameter("lgname");
        String password = request.getParameter("lgpasswd");

        Login loginbean = new Login();
        session.setAttribute("loginbean", loginbean);
        loginbean.setName(lgname);
        loginbean.setPassword(password);
        String choice = null;
        boolean flag = true;
        if(loginbean.getName()==null || loginbean.getPassword()==null || loginbean.getName().length()==0 || loginbean.getPassword().length()==0)
            flag = false;       

        try {
			choice=SSDBoperate.login(lgname, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(choice);
        
        
        if((choice.equals("Teacher")||choice.equals("Student")||choice.equals("Admin"))&&flag){
            session.setAttribute("id", lgname);
            session.setAttribute("choice", choice);
            RequestDispatcher dip = request.getRequestDispatcher(choice+".jsp?tempid="+lgname);
            dip.forward(request, response);
        }else {
        	response.sendRedirect("Login.jsp");
        }
	}


	private void addS(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession(true);
        Student student = new Student();
        String message = "Repetition of school number";
        
        String sno = request.getParameter("sno");
        String spassword = request.getParameter("spassword");
        String sname = request.getParameter("sname");
        String course = request.getParameter("course");
        String grade = request.getParameter("grade").trim();
        boolean flag = true;
        if(grade==null || grade.length()==0 )
            grade="0";
      	Pattern p = Pattern.compile("[^0-9]");
    	Matcher m = p.matcher(grade);
        if(m.find()) {
            message = "Grade input error";
            flag = false;
        }
        if(flag) {
            int Grade = Integer.parseInt(grade.trim());
            student.setSno(sno.trim());
            student.setSpasswd(spassword.trim());
            student.setSname(sname.trim());
            student.setCourse(course.trim());
            student.setGrade(Grade);
            if (student.getSno() == null || student.getSno().trim().length() == 0 || student.getSno().trim().length() > 12) {
                message="Student ID input error";
                flag = false;
            }
            if (student.getSpasswd() == null || student.getSpasswd().length() == 0 || student.getSpasswd().trim().length() > 20) {
                message="Password input error";
                flag = false;
            }if (student.getSname() == null || student.getSname().trim().length() == 0 || student.getSname().trim().length() > 10) {
                message="Name input error";
                flag = false;
            }
            if (student.getGrade() < 0 || student.getGrade() > 100) {
                message="Grade input error";
                flag = false;
            }

            if(flag){
				try {
					 flag = !(SSDBoperate.selectInfo(sno)!=null);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
            }	
            if (flag) {
            	try {
					SSDBoperate.register(student);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
                response.sendRedirect("ManageStudent.jsp");
            } else {
                System.out.println(message);
                response.sendRedirect("AddStu.jsp?addstudent_for_admin_error="+message);
            }
        }else {
            response.sendRedirect("AddStu.jsp?addstudent_for_admin_error="+message);
        }
		
	}
	
	private void addT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession(true);
        
        Teacher tea = new Teacher();
        String message = "Repetition of school number";
        String tno = request.getParameter("tno");
        String tpassword = request.getParameter("tpassword");
        String tname = request.getParameter("tname");
        String course = request.getParameter("course");
        boolean flag = true;
    


        if(flag) {
        	tea.setTno(tno.trim());
        	tea.setTpasswd(tpassword.trim());
        	tea.setTname(tname.trim());
        	tea.setCourse(course.trim());

            if (tea.getTno() == null || tea.getTno().trim().length() == 0 || tea.getTno().trim().length() > 8) {
                message="Student ID input error";
                flag = false;
            }
            if (tea.getTpasswd() == null || tea.getTpasswd().length() == 0 || tea.getTpasswd().trim().length() > 20) {
                message="Password input error";
                flag = false;
            }if (tea.getTname() == null || tea.getTname().trim().length() == 0 || tea.getTname().trim().length() > 10) {
                message="Name input error";
                flag = false;
            }
 

            if(flag){
				try {
					 flag = !(SSDBoperate.selectInfo(tno)!=null);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
            }	
            if (flag) {
            	try {
					SSDBoperate.register(tea);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
                response.sendRedirect("AddTea.jsp");
            } else {
                System.out.println(message);
                response.sendRedirect("AddTea.jsp?addteacher_for_admin_error="+message);
            }
        }else {
            response.sendRedirect("AddTea.jsp?addteacher_for_admin_error="+message);
        }
		
	}
	
	private void deleteS(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(true);
        
		Student student = new Student();
        String sno = request.getParameter("delsid");
        student.setSno(sno);
        try {
			SSDBoperate.delete(sno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("ManageStudent.jsp");
		
	}
	private void deleteT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(true);
		
        Teacher Teacher = new Teacher();
        String Tno = request.getParameter("deltid");
        Teacher.setTno(Tno);
        try {
			SSDBoperate.delete(Tno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("ManageTeacher.jsp");
		
	}


	
	private void modifyT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(true);
        
		String message=null;
		String tno = request.getParameter("tid");
		String tpassword = request.getParameter("password");
        String tname = request.getParameter("name");
        String course = request.getParameter("course");
        boolean flag =true;
		Teacher tea =new Teacher();
		if(flag) {
        	tea.setTno(tno.trim());
        	tea.setTpasswd(tpassword.trim());
        	tea.setTname(tname.trim());
        	tea.setCourse(course.trim());

            if (tea.getTpasswd() == null || tea.getTpasswd().length() <= 6 || tea.getTpasswd().trim().length() > 20) {
                message="Password input error";
                flag = false;
            }if (tea.getTname() == null || tea.getTname().trim().length() == 0 || tea.getTname().trim().length() > 10) {
                message="Name input error";
                flag = false;
            }
 
	
            if (flag) {
            	try {
					SSDBoperate.modify(tea);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
                response.sendRedirect("Adminedittea.jsp");
            } else {
                System.out.println(message);
                response.sendRedirect("Adminedittea.jsp?addteacher_for_admin_error="+message);
            }
        }else {
            response.sendRedirect("Adminedittea.jsp?addteacher_for_admin_error="+message);
        }
		
		
	}
	
	//教师只允许修改成绩
	private void modifyS1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(true);
		
		Student student =new Student();
		
		String sno = request.getParameter("sid");
        String grade = request.getParameter("grade").trim();
        boolean flag = true;
        if(grade==null || grade.length()==0 )
            grade="0";
      	Pattern p = Pattern.compile("[^0-9]");
    	Matcher m = p.matcher(grade);
        if(m.find()) {
            flag = false;
        }
        if(flag) {
            int Grade = Integer.parseInt(grade.trim());
            try {
				student =SSDBoperate.selectInfo(sno);
				student.setGrade(Grade);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            if (flag) {
                try {
					SSDBoperate.modify(student);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                response.sendRedirect("TeacherManage.jsp");
            }
            else {
                response.sendRedirect("TeachereditStu.jsp?editerror_teacher=yes");
            }
        }else {
            response.sendRedirect("TeachereditStu.jsp?editerror_teacher=yes");
        }       		
		
	}
	
	private void modifyS2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(true);
		
		String message = null;
		Student student =new Student();
		
		String	sno = request.getParameter("sid").trim();
        String spassword = request.getParameter("spassword");
        String sname = request.getParameter("sname");
        String course = request.getParameter("course");
        String grade = request.getParameter("grade").trim();
        boolean flag = true;
        if(grade==null || grade.length()==0 )
            grade="0";
      	Pattern p = Pattern.compile("[^0-9]");
    	Matcher m = p.matcher(grade);
        if(m.find()) {
            message = "Grade input error";
            flag = false;
        }
        if(flag) {
        	int Grade = Integer.parseInt(grade.trim());
            student.setSno(sno.trim());
            student.setSpasswd(spassword.trim());
            student.setSname(sname.trim());
            student.setCourse(course.trim());
            student.setGrade(Grade);
            if (student.getSno() == null || student.getSno().trim().length() == 0 || student.getSno().trim().length() > 12) {
                message="Student ID input error";
                flag = false;
            }
            if (student.getSpasswd() == null || student.getSpasswd().length() == 0 || student.getSpasswd().trim().length() > 20) {
                message="Password input error";
                flag = false;
            }if (student.getSname() == null || student.getSname().trim().length() == 0 || student.getSname().trim().length() > 10) {
                message="Name input error";
                flag = false;
            }
            if (student.getGrade() < 0 || student.getGrade() > 100) {
                message="Grade input error";
                flag = false;
            }	
            if (flag) {
            	try {
					SSDBoperate.modify(student);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
                response.sendRedirect("ManageStudent.jsp");
            } else {
                System.out.println(message);
                response.sendRedirect("Admineditstu.jsp?addstudent_for_admin_error="+message);
            }
        }else {
            response.sendRedirect("Admineditstu.jsp?editerror_teacher=yes");
        }
				
	}
	
}
