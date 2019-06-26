package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public MemberDAO() {
		// TODO Auto-generated constructor stub
		pool = DBConnectionMgr.getInstance();
	}

	public boolean memIdCheck(String id) throws Exception {
		boolean a = false;
		con = pool.getConnection();
		String sql = "select memId from member where memId = ?";
		ps = con.prepareStatement(sql);

		ps.setString(1, id);

		rs = ps.executeQuery();

		if (rs.next()) {
			a = true;
		}
		pool.freeConnection(con, ps, rs);

		return a;
	}

	public boolean memLogin(MemberDTO dto) throws Exception {
		boolean a = false;
		con = pool.getConnection();
		String sql = "select memId, memPw from member where memId = ? and memPw = ?";
		ps = con.prepareStatement(sql);

		ps.setString(1, dto.getMemId());
		ps.setString(2, dto.getMemPw());

		rs = ps.executeQuery();

		while (rs.next()) {

			if (dto.getMemId().equals(rs.getString(1)) && dto.getMemPw().equals(rs.getString(2))) {
				a = true;
			} else {
				a = false;
			}
		}
		pool.freeConnection(con, ps, rs);

		return a;
	}

	public void memInsert(MemberDTO dto) throws Exception {
		con = pool.getConnection();
		String sql = "insert into member values(?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);

		ps.setString(1, dto.getMemId());
		ps.setString(2, dto.getMemName());
		ps.setString(3, dto.getMemPw());
		ps.setString(4, dto.getMemAddr1()+"/"+dto.getMemAddr2()+"/"+dto.getMemAddr3());
		ps.setString(5, dto.getMemTel1()+"-"+dto.getMemTel2()+"-"+dto.getMemTel3());
		ps.setString(6, dto.getMemEmail());

		ps.executeUpdate();

		pool.freeConnection(con, ps);
	}

	public MemberDTO memSelect(String id) throws Exception {
		MemberDTO dto = null;
		con = pool.getConnection();
		String sql = "select * from member where memId = ?";
		ps = con.prepareStatement(sql);

		ps.setString(1, id);

		rs = ps.executeQuery();

		while (rs.next()) {
			dto = new MemberDTO();
			dto.setMemId(rs.getString(1));
			dto.setMemName(rs.getString(2));
			dto.setMemPw(rs.getString(3));
			String[] addr = rs.getString(4).split("/");
			dto.setMemAddr1(addr[0]);
			dto.setMemAddr2(addr[1]);
			dto.setMemAddr3(addr[2]);
			String[] tel = rs.getString(5).split("-");
			dto.setMemTel1(tel[0]);
			dto.setMemTel2(tel[1]);
			dto.setMemTel3(tel[2]);
			dto.setMemEmail(rs.getString(6));

		}
		pool.freeConnection(con, ps, rs);

		return dto;
	}

	public void memUpdate(MemberDTO dto) throws Exception {
		con = pool.getConnection();
		String sql = "update member set memName=?, memAddr=?, memTel=?, memEmail=? where memId=?";
		ps = con.prepareStatement(sql);

		ps.setString(1, dto.getMemName());
		ps.setString(2, dto.getMemAddr1()+"/"+dto.getMemAddr2()+"/"+dto.getMemAddr3());
		ps.setString(3, dto.getMemTel1()+"-"+dto.getMemTel2()+"-"+dto.getMemTel3());
		ps.setString(4, dto.getMemEmail());
		ps.setString(5, dto.getMemId());

		ps.executeUpdate();

		pool.freeConnection(con, ps);
	}

	public void memDelete(MemberDTO dto) throws Exception {

		con = pool.getConnection();
		String sql = "delete from Member where memId = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMemId());
		
		ps.executeUpdate();
		
		pool.freeConnection(con, ps);

	}

}
