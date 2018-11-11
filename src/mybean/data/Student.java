package mybean.data;

public class Student {
	private String sno=null;
	private String sname=null;
	private String spasswd=null;
	private String course=null;
	private int grade=0;
	
	public Student(String sno, String sname, String spasswd, String course,int grade) {
		setSno(sno);
		setSname(sname);
		setSpasswd(spasswd);
		setCourse(course);
		setGrade(grade);
	}
	public Student() {
		// TODO Auto-generated constructor stub
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSpasswd() {
		return spasswd;
	}
	public void setSpasswd(String spasswd) {
		this.spasswd = spasswd;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}

	
	
}
