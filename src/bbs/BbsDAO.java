package bbs;

import java.sql.*;
import java.util.ArrayList;

public class BbsDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	DBConnectionMgr pool;

	public BbsDAO() {
		pool = DBConnectionMgr.getInstance();
	}

	public void insert(BbsDTO dto) throws Exception {

		con = pool.getConnection();
		String sql = "insert into bbs(bbsProId,bbsName,bbsDate,bbsContent) value (?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getBbsProId());
		ps.setString(2, dto.getBbsName());
		ps.setString(3, dto.getBbsDate());
		ps.setString(4, dto.getBbsContent());
		
		ps.executeUpdate();
		
		pool.freeConnection(con, ps);

	}

	public void delete(int bbsNum) throws Exception {

		con = pool.getConnection();
		String sql = "delete from bbs where BbsNum = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, bbsNum);
		ps.executeUpdate();
		pool.freeConnection(con, ps);

	}

	public void update(BbsDTO dto) throws Exception {

		con = pool.getConnection();
		String sql = "update bbs set BbsContent = ?, BbsDate = ?, BbsProId = ? where BbsNum = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getBbsContent());
		ps.setString(2, dto.getBbsDate());
		ps.setInt(3, dto.getBbsProId());
		ps.setInt(4, dto.getBbsNum());
		ps.executeUpdate();
		pool.freeConnection(con, ps);

	}

	public BbsDTO select(int BbsNum) throws Exception {

		con = pool.getConnection();
		BbsDTO dto2 = null;
		String sql = "select * from bbs where BbsNum = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, BbsNum);
		rs = ps.executeQuery();

		while (rs.next()) {
			dto2 = new BbsDTO();
			dto2.setBbsNum(rs.getInt(1));
			dto2.setBbsProId((rs.getInt(2)));
			dto2.setBbsName((rs.getString(3)));
			dto2.setBbsDate((rs.getString(4)));
			dto2.setBbsContent((rs.getString(5)));
		}

		pool.freeConnection(con, ps, rs);

		return dto2;

	}

	public ArrayList selectAll(int proId, int start, int end) throws Exception {
		con = pool.getConnection();
		String sql = "select * from bbs where bbsProId = ? order by bbsNum desc limit ?,?";
		ps = con.prepareStatement(sql);
		
		ps.setInt(1, proId);
		ps.setInt(2, start);
		ps.setInt(3, end);
		
		rs = ps.executeQuery();
		ArrayList list = new ArrayList();
		BbsDTO dto = null;
		
		while (rs.next()) {
			dto = new BbsDTO();
			dto.setBbsNum(rs.getInt(1));
			dto.setBbsProId((rs.getInt(2)));
			dto.setBbsName((rs.getString(3)));
			dto.setBbsDate((rs.getString(4)));
			dto.setBbsContent((rs.getString(5)));
			list.add(dto);

		}
		pool.freeConnection(con, ps, rs);

		return list;

	}
	
	public int bbsPageList(int pId) throws Exception {// 상품 갯수 검색(상품페이지)
		int page = 0;
		con = pool.getConnection();
		String sql = "select count(*) from bbs where bbsProId = ?";
		ps = con.prepareStatement(sql);
		
		ps.setInt(1, pId);
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			page = rs.getInt(1);
			
		}

		pool.freeConnection(con, ps, rs);
		
		return page;
	}
}
