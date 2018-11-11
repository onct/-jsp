package myservlet.control;

import java.sql.*;
import java.util.List;

import mybean.data.*;

public class SSDBoperate {
	
	//登录
	public static String login(String num,String passwd)throws SQLException{
		String choice=null;
		
		if(num.length()==8){
        	Teacher tea=TeaDBUtil.selectTea_Tno(num);
			if(tea!=null){
				if(tea.getTpasswd().equalsIgnoreCase(passwd))
					choice="Teacher";
			}
			else{
				System.out.println("none of this account");
			}

        }
		else if(num.length()==12) {
            	Student st=StuDBUtil.selectStu_Sno(num);
            	if(st!=null){
        			if(st.getSpasswd().equalsIgnoreCase(passwd))
        				choice="Student";
        		}
        		else{
        			System.out.println("none of this account");
        		}

        }
        else {
        	if(num.equals("admin")&&passwd.equalsIgnoreCase("888888")){
        	choice="Admin";
        	}

        }
		return choice;
		
	}

	

	//注册
	public static <T> String register(T t) throws SQLException{ 
		if(t.getClass()==Student.class){
			if(StuDBUtil.selectStu_Sno(((Student) t).getSno())!=null)
			{
				return 	"false";	
			}else{
				String reg = StuDBUtil.insertStu((Student) t);
				return reg;
			}
		}
		else {
			if(TeaDBUtil.selectTea_Tno(((Teacher) t).getTno())!=null)
			{
				return 	"false";	
			}else{
				String reg = TeaDBUtil.insertTea((Teacher) t);
				return reg;	
			}
		}
		
		
	}

	///重置密码
	
	public static <T> String resetPasswd(T t)throws SQLException{
		if(t.getClass()==Student.class){
		
				String res = StuDBUtil.modifyStu((Student) t);
				return res;
		}
		else {

				String res = TeaDBUtil.modifyTea((Teacher) t);
				return res;	

		}
	}
	
	///cha
	//查询
	public static <T> T selectInfo(String num)throws SQLException{
		if(num.length()==12)
			return (T) StuDBUtil.selectStu_Sno(num);
		else if(num.length()==8){
			return (T) TeaDBUtil.selectTea_Tno(num);
		}
		else{
			return null;
		}
	}


	//查找全部
	public static <T> List<T> selectALLinfo(T t)throws SQLException{
		if(t.getClass()==Student.class){
		return (List<T>) StuDBUtil.selectStu_All();
	}
		else{
			return (List<T>) TeaDBUtil.selectTea_All();
		}
	}
	
	///shan
	public static String delete(String num) throws SQLException{
		if(num.length()==12)
			return StuDBUtil.deleteStu(num);
		else if(num.length()==6){
			return TeaDBUtil.deleteTea(num);
		}
		else{
			return null;
		}
	}
	
	public static <T> String modify(T t) throws SQLException {
		if(t.getClass()==Student.class){
			return StuDBUtil.modifyStu((Student) t);
		}
			else{
				return TeaDBUtil.modifyTea((Teacher) t);
			}
		
	}
	
}

