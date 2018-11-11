package myservlet.control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBcon {
	private static Connection con;
	private static PreparedStatement pstmt;
	private static ResultSet rs;

	public static Connection getConnection() {
		try {
			Class.forName(DBparam.driver);		
			System.out.println(DBparam.driver + "加载成功");
		} catch (ClassNotFoundException e) {
			System.out.println(DBparam.driver + "加载失败");
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(DBparam.url, DBparam.user, DBparam.password);		
			System.out.println(DBparam.url + "连接成功");
		} catch (SQLException e) {
			System.out.println(DBparam.url + "连接失败");
			e.printStackTrace();
		}
		return con;
	}
	

	public static void closeConnection() throws SQLException{
		if(pstmt != null) {
				pstmt.close();
		}
		if(rs != null) {
				rs.close();
		}
		if(con != null) {
				con.close();
		}
	}
}
