package myservlet.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mybean.data.Student;

public class StuDBUtil {
	 
	/**
	 * 查询全部
	 * @return
	 */
	public static List<Student> selectStu_All()throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
//		Statement stmt;
		ResultSet rs = null;
		
		List<Student> stu = new ArrayList<Student>();
		
		try {
			conn = DBcon.getConnection();
			String sql = "SELECT * FROM DBStudent";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String sno = rs.getString("Sno");
				String spasswd = rs.getString("Spasswd");
				String sname = rs.getString("Sname");
				String course = rs.getString("Course");
				int grade = rs.getInt("Grade");
				Student st = new Student(sno,sname,spasswd,course,grade);
				stu.add(st);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return stu;
	}
	
	/**
	 *根据学号查询
	 * @param sno
	 * @return
	 */
	public static Student selectStu_Sno(String sno) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Student st = null;
		try {
			conn = DBcon.getConnection();
			String sql = "SELECT * FROM DBStudent WHERE sno=?";
			ps = conn.prepareStatement(sql);
			ps.setNString(1, sno);
			rs = ps.executeQuery();
			while(rs.next()) {
				String sno1 = rs.getString("Sno");
				String sname = rs.getString("Sname");
				String spasswd = rs.getString("Spasswd");
				String course = rs.getString("Course");
				int grade = rs.getInt("Grade");
				st = new Student(sno1,sname,spasswd,course,grade);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps!= null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return st;
	}
	
	/**
	 * 插入
	 * @param stu
	 */
	public static String insertStu(Student stu)throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "INSERT INTO DBStudent (sno,spasswd,sname,course,grade) VALUES(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, stu.getSno());
			ps.setString(2, stu.getSpasswd());
			ps.setString(3, stu.getSname());
			ps.setString(4, stu.getCourse());
			ps.setInt(5, stu.getGrade());
			int insertCount = ps.executeUpdate();
			System.out.println(isSuccess(insertCount));
			return isSuccess(insertCount);
		}catch(SQLException e) {
			return "register failed"+e;
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					return ""+e;
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					return ""+e;
				}
			}
		}
	}
	
	/**
	 * 删除
	 * @param sno
	 */
	public static String deleteStu(String sno)throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "DELETE FROM DBStudent WHERE sno = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			int deleteCount = ps.executeUpdate();
			System.out.println(isSuccess(deleteCount));
			return isSuccess(deleteCount);
		}catch(SQLException e) {
			return ""+e;
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return ""+e;
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return ""+e;
				}
			}
		}
	}
	
	/**
	 * 修改信息
	 * @param stu
	 * @throws SQLException
	 */
	public static String modifyStu(Student stu) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "UPDATE DBStudent SET  spasswd=?, sname=?, course=?, grade=? WHERE sno=?";
			ps = conn.prepareStatement(sql);

			ps.setString(1, stu.getSpasswd());
			ps.setString(2, stu.getSname());
			ps.setString(3, stu.getCourse());
			ps.setInt(4, stu.getGrade());
			ps.setString(5, stu.getSno());
			
			int count = ps.executeUpdate();
			System.out.println(isSuccess(count));
			return isSuccess(count);
		}catch(SQLException e) {
			e.printStackTrace();
			return ""+e;
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return ""+e;
				}
			}
			if(conn != null) {
				conn.close();
			}
		}
	}
	
	/**
	 * 重置密码
	 * @param sno
	 * @throws SQLException
	 */
	public static String resetPasswd(String sno) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "UPDATE DBStudent SET  spasswd=? WHERE sno=?";
			ps = conn.prepareStatement(sql);

			ps.setString(1, "111111");
			ps.setString(2,sno);
			
			int count = ps.executeUpdate();
			System.out.println(isSuccess(count));
			return isSuccess(count);
		}catch(SQLException e) {
			e.printStackTrace();
			return ""+e;
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return ""+e;
				}
			}
			if(conn != null) {
				conn.close();
			}
		}
	}
	
	
	/**
	 * 判断是否执行成功
	 * @param count
	 * @return
	 */
	public static String isSuccess(int count){
		if(count > 0) {
			return "success";
		}else {
			return "failed";
		}
	}
	

}
