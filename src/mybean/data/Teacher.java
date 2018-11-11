package mybean.data;

public class Teacher {
	private String tno=null;
	private String tname=null;
	private String tpasswd=null;
	private String course=null;
	
	public Teacher(){
		
	}
	public Teacher(String tno, String tname, String tpasswd, String course) {
		setTno(tno);
		setTname(tname);
		setTpasswd(tpasswd);
		setCourse(course);
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTpasswd() {
		return tpasswd;
	}
	public void setTpasswd(String tpasswd) {
		this.tpasswd = tpasswd;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course= course;
	}
	
}
