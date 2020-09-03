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
	//db����
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
	//��ü����
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
	//����
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
	//����
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
	//���̵� üũ
	@Override
	public String idCheck(String userid) {
		Connection con =null;
		Statement st=null;
		ResultSet rs=null;
		String flag="yes"; //id ��밡���ϰ� ����
		try {
			con=getConnection();
			String sql="select* from member where userid='"+userid+"'";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) { //rs�� ���̵� db ���̺� �ִٴ� �ǹ�->>����� �� ����
				flag="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		
		return flag;
	}
	//�α��� üũ
	@Override
	public int loginCheck(String userid, String pwd) {
		Connection con =null;
		Statement st = null;
		ResultSet rs=null;
		int flag=-1;//-1ȸ���� �ƴ�, 2: ��� ����, 0:�Ϲ�ȸ�� 1:������(admin)
		
		try {
			con=getConnection();
			String sql="select pwd,admin from member where userid='"+userid+"'";
			
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) { //���̵�� ����(ȸ�� ����)
				if(rs.getString("pwd").equals(pwd)) {
					//�Ϲ�ȸ�� ->0 or	//������ ->1
					flag=rs.getInt("admin"); //0,1
				} else { //���Ʋ��
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
	//ȸ����
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

