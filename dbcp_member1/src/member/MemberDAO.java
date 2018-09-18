package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberVO;

//insert 부분만들고
//connection 얻어올때 dbcp 사용

public class MemberDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource ds = null;

	private Connection getConnection() {
		// class.forName~~
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MySQL");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {

		try {// 끝에서부터 닫아주기
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void close(Connection con, PreparedStatement pstmt) {

		try {
			if (rs != null)
				rs.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public int member_insert(MemberVO vo) {
		int result = 0;
		try {
			con = getConnection();
			// 트랜잭션
			con.setAutoCommit(false);
			String sql = "insert into member values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			result = pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();

		} finally {
			close(con, pstmt);
		}
		return result;
	}// insert 종료

	// 로그인 - 아이디 비밀번호 일치 시키는 값 찾기.
	public MemberVO isLogin(String userid, String password) {
		// id,password정보에 해당하는 사용자 확인 후 id와 name 넘겨주기
		MemberVO vo = null;

		try {
			con = getConnection();
			con.setAutoCommit(false);
			String sql = "select * from member where userid=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, password);

			// excuteQurery 는 rs에 담는 역할.
			// rs(ResultSet)=select결과를 담는 table
			// 여기서는 일치하는 값이 1개 뿐이라 rs테이블의 값은 1개 뿐임.
			rs = pstmt.executeQuery();

			// if '하나라도 있다면' 조건이 if문으로 들어옴
			// 결과 적으로 값이 없다면 vo는 null값이 된다.
			if (rs.next()) {
				vo = new MemberVO();

				// vo에 값을 넣어주기.
				// "username" 대신 컬럼의 위치인 1을 써주어도 된다.
				vo.setUserid(rs.getString("userid"));
				vo.setName(rs.getString("name"));// 3
			}
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
				close(con, pstmt, rs);
			}
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return vo;
	}

	public boolean checkId(String userid) {
		boolean flag=false;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="select * from member where userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				flag=true;
			}
			con.commit();
		}catch(Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {				
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return flag;
	}
	
}
