package org.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO{
	private static MemberDAO instance=new MemberDAOImpl();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	//db연결
	private Connection getConnection() throws Exception {
		Context initCtx=new InitialContext();
		Context envCtx=(Context)initCtx.lookup("java:comp/env");
		DataSource ds=(DataSource)envCtx.lookup("jdbc/member");
		return ds.getConnection();
	}
	
	@Override
	public void memInsert(MemberDTO member) {
		Connection con=null;
		PreparedStatement ps =null;
		
		try {
			con=getConnection();
			String sql="insert into member values(?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserid());
			ps.setString(3, member.getPwd());
			ps.setString(4,	member.getEmail());
			ps.setString(5, member.getPhone());
			ps.setInt(6, member.getAdmin());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con,ps,null,null);
		}
	}

	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
		try {
			if(rs!=null)rs.close();
			if(st!=null)st.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//전체보기
	@Override
	public ArrayList<MemberDTO> memList() {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<MemberDTO> arr=new ArrayList<>();
		
		try {
			con=getConnection();
			sql="select * from member";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
			while(rs.next()) {
				MemberDTO mem=new MemberDTO();
				mem.setAdmin(rs.getInt("admin"));
				mem.setEmail(rs.getString("email"));
				mem.setName(rs.getString("name"));
				mem.setPhone(rs.getString("phone"));
				mem.setPwd(rs.getString("pwd"));
				mem.setUserid(rs.getString("userid"));
				arr.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		
		return arr;
	}
	//수정
	@Override
	public int memUpdate(MemberDTO member) {
		Connection con=null;
		PreparedStatement ps=null;
		int flag=0;
		
		try {
			con=getConnection();
			String sql="update member set name=?,pwd=?,email=?,phone=?,admin=? where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getEmail());
			ps.setString(4, member.getPhone());
			ps.setInt(5, member.getAdmin());
			ps.setString(6, member.getUserid());
			flag=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, ps, null, null);
		}
		return flag;
	}

	@Override
	public MemberDTO findById(String userid) {
		Connection con = null;
		Statement st= null;
		ResultSet rs=null;
		MemberDTO member=null;
		
		try {
			con=getConnection();
			String sql="select* from member where userid='"+userid+"'";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
			if(rs.next()) {
				member=new MemberDTO();
				member.setAdmin(rs.getInt("admin"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setPwd(rs.getString("pwd"));
				member.setUserid(rs.getString("userid"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return member;
	}
	//삭제
	@Override
	public void memDelete(String userid) {
		Connection con = null;
		Statement st= null;
		
		try {
			con=getConnection();
			String sql="delete from member where userid='"+userid+"'";
			st=con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, null);
		}
		
	}
	//아이디 체크
	@Override
	public String idCheck(String userid) {
		Connection con =null;
		Statement st=null;
		ResultSet rs=null;
		String flag="yes"; //id 사용가능하게 해줌
		try {
			con=getConnection();
			String sql="select* from member where userid='"+userid+"'";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) { //rs는 아이디가 db 테이블에 있다는 의미->>사용할 수 없다
				flag="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		
		return flag;
	}
	//로그인 체크
	@Override
	public int loginCheck(String userid, String pwd) {
		Connection con =null;
		Statement st = null;
		ResultSet rs=null;
		int flag=-1;//-1회원이 아님, 2: 비번 오류, 0:일반회원 1:관리자(admin)
		
		try {
			con=getConnection();
			String sql="select pwd,admin from member where userid='"+userid+"'";
			
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) { //아이디는 맞음(회원 맞음)
				if(rs.getString("pwd").equals(pwd)) {
					//일반회원 ->0 or	//관리자 ->1
					flag=rs.getInt("admin"); //0,1
				} else { //비번틀림
					flag=2;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
		}
	//회원수
	@Override
	public int getCount() {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		int count=0;
		
		try {
			con=getConnection();
			String sql="select count(*) from member";
			
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
		
}

