package myservlet.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mybean.data.Teacher;

public class TeaDBUtil {
	/**
	 *查找全部
	 * @return
	 */
	public static List<Teacher> selectTea_All(){
		Connection conn = null;
		PreparedStatement ps = null;
//		Statement stmt;
		ResultSet rs = null;
		
		List<Teacher> tea = new ArrayList<Teacher>();
		
		try {
			conn = DBcon.getConnection();
			String sql = "SELECT * FROM DBTeacher";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String tno = rs.getString("tno");
				String tpasswd = rs.getString("tpasswd");
				String tname = rs.getString("tname");
				String course = rs.getString("Course");
				Teacher st = new Teacher(tno,tname,tpasswd,course);
				tea.add(st);
			}
		}catch(Exception e) {
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
		return tea;
	}
	
	/**
	 * 根据教工号查找
	 * @param tno
	 * @return
	 */
	public static Teacher selectTea_Tno(String tno) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Teacher st = null;
		try {
			conn = DBcon.getConnection();
			String sql = "SELECT * FROM DBTeacher WHERE tno=?";
			ps = conn.prepareStatement(sql);
			ps.setNString(1, tno);
			rs = ps.executeQuery();
			while(rs.next()) {
				String tno1 = rs.getString("tno");
				String tname = rs.getString("tname");
				String tpasswd = rs.getString("tpasswd");
				String course = rs.getString("Course");
				st = new Teacher(tno1,tname,tpasswd,course);
			}
		}catch(Exception e) {
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
	 * @param tea
	 */
	public static String insertTea(Teacher tea) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "INSERT INTO DBTeacher (tno,tpasswd,tname,course) VALUES(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			//����ռλ����Ӧ��ֵ
			ps.setString(1, tea.getTno());
			ps.setString(2, tea.getTpasswd());
			ps.setString(3, tea.getTname());
			ps.setString(4, tea.getCourse());
			int insertCount = ps.executeUpdate();
			System.out.println(isSuccess(insertCount));
			return isSuccess(insertCount);
		}catch(Exception e) {
			e.printStackTrace();
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
	 * 删除
	 * @param tno
	 */
	public static String deleteTea(String tno) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "DELETE FROM DBTeacher WHERE tno = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, tno);
			int deleteCount = ps.executeUpdate();
			System.out.println(isSuccess(deleteCount));
			return isSuccess(deleteCount);
		}catch(Exception e) {
			e.printStackTrace();
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
	 * @param tea
	 * @throws SQLException
	 */
	public static String modifyTea(Teacher tea) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "UPDATE DBTeacher SET  tpasswd=?, tname=?, course=? WHERE tno=?";
			ps = conn.prepareStatement(sql);
			//ע�����վλ��λ��
			//�˴���ͨ�����tnoȥ���½�ʦ��Ϣ������tno��λ�ò����ڵ�һ��λ�ö��������һ��λ��
			ps.setString(1, tea.getTpasswd());
			ps.setString(2, tea.getTname());
			ps.setString(3, tea.getCourse());
			ps.setString(4, tea.getTno());
			
			int count = ps.executeUpdate();
			System.out.println(isSuccess(count));
			return isSuccess(count);
		}catch(Exception e) {
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
	public static String resetPasswd(String tno) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBcon.getConnection();
			String sql = "UPDATE DBTeacher SET  tpasswd=? WHERE tno=?";
			ps = conn.prepareStatement(sql);

			ps.setString(1, "111111");
			ps.setString(2,tno);
			
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
	 * 判断是否成功
	 * @param count
	 * @return
	 */
	public static String isSuccess(int count) {
		if(count > 0) {
			return "success";
		}else {
			return "failed";
		}
	}
	

}
