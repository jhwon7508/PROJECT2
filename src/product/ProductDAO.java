package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {

	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public ProductDAO() {
		// TODO Auto-generated constructor stub
		pool = DBConnectionMgr.getInstance();
	}

	public void proInsert(ProductDTO dto) throws Exception {// 상품 등록
		con = pool.getConnection();
		String sql = "insert into product(proName,proPrice,proImg,proImg2,proExp,proSort) values(?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);

		ps.setString(1, dto.getProName());
		ps.setInt(2, dto.getProPrice());
		ps.setString(3, "../img/img1/product/" + dto.getProSort() + "/" + dto.getProImg());
		ps.setString(4, "../img/img2/product/" + dto.getProSort() + "/" + dto.getProImg2());
		ps.setString(5, dto.getProExp());
		ps.setString(6, dto.getProSort());

		ps.executeUpdate();

		pool.freeConnection(con, ps);
	}

	public ArrayList proSelectAll(int start, int end) throws Exception { // 상품 전체 검색
		con = pool.getConnection();
		String sql = "select * from product order by proId desc limit ?,?";
		ps = con.prepareStatement(sql);

		ps.setInt(1, start);
		ps.setInt(2, end);

		rs = ps.executeQuery();
		ArrayList list = new ArrayList();
		ProductDTO dto = null;
		while (rs.next()) {
			dto = new ProductDTO();
			dto.setProId(rs.getInt(1));
			dto.setProName(rs.getString(2));
			dto.setProPrice(rs.getInt(3));
			dto.setProImg(rs.getString(4));
			dto.setProImg2(rs.getString(5));
			dto.setProExp(rs.getString(6));
			dto.setProSort(rs.getString(7));

			list.add(dto);
		}

		pool.freeConnection(con, ps, rs);

		return list;
	}

	public ProductDTO proSelect(int id) throws Exception { // 상품 아이디로 검색
		con = pool.getConnection();
		String sql = "select * from product where proId = ?";
		ps = con.prepareStatement(sql);

		ps.setInt(1, id);

		rs = ps.executeQuery();
		ProductDTO dto = new ProductDTO();
		while (rs.next()) {
			dto.setProId(rs.getInt(1));
			dto.setProName(rs.getString(2));
			dto.setProPrice(rs.getInt(3));
			dto.setProImg(rs.getString(4));
			dto.setProImg2(rs.getString(5));
			dto.setProExp(rs.getString(6));
			dto.setProSort(rs.getString(7));

		}

		pool.freeConnection(con, ps, rs);

		return dto;
	}

	public void proUpdate(ProductDTO dto) throws Exception { // 상품 목록 수정
		con = pool.getConnection();
		String sql = "update product set proName=?,proPrice=?,proImg=?,proImg2=?,proExp=?,proSort=? where proId = ?";
		ps = con.prepareStatement(sql);

		ps.setString(1, dto.getProName());
		ps.setInt(2, dto.getProPrice());
		ps.setString(3, "../img/img1/product/" + dto.getProSort() + "/" + dto.getProImg());
		ps.setString(4, "../img/img2/product/" + dto.getProSort() + "/" + dto.getProImg2());
		ps.setString(5, dto.getProExp());
		ps.setString(6, dto.getProSort());
		ps.setInt(7, dto.getProId());

		ps.executeUpdate();

		pool.freeConnection(con, ps);
	}

	public void proDelete(int id) throws Exception { // 상품 삭제
		con = pool.getConnection();
		String sql = "delete from product where proId = ?";
		ps = con.prepareStatement(sql);

		ps.setInt(1, id);

		ps.executeUpdate();

		pool.freeConnection(con, ps);
	}

	public ArrayList proListSelect(String sort, int start, int end) throws Exception {// 상품 종류로 검색
		con = pool.getConnection();
		String sql = "select * from product where proSort = ? order by proId desc limit ?,?";
		ps = con.prepareStatement(sql);

		ps.setString(1, sort);
		ps.setInt(2, start);
		ps.setInt(3, end);

		rs = ps.executeQuery();
		ArrayList list = new ArrayList();
		ProductDTO dto = null;
		while (rs.next()) {
			dto = new ProductDTO();
			dto.setProId(rs.getInt(1));
			dto.setProName(rs.getString(2));
			dto.setProPrice(rs.getInt(3));
			dto.setProImg(rs.getString(4));
			dto.setProImg2(rs.getString(5));
			dto.setProExp(rs.getString(6));
			dto.setProSort(rs.getString(7));

			list.add(dto);

		}

		pool.freeConnection(con, ps, rs);

		return list;
	}

	public int proPage() throws Exception {// 상품 갯수 검색(상품페이지)
		int page = 0;
		con = pool.getConnection();
		String sql = "select count(*) from product";
		ps = con.prepareStatement(sql);

		rs = ps.executeQuery();

		while (rs.next()) {
			page = rs.getInt(1);

		}

		pool.freeConnection(con, ps, rs);

		return page;
	}

	public int proPageList(String sort) throws Exception {// 상품 갯수 검색(상품페이지)
		int page = 0;
		con = pool.getConnection();
		String sql = "select count(*) from product where proSort = ?";
		ps = con.prepareStatement(sql);

		ps.setString(1, sort);

		rs = ps.executeQuery();

		while (rs.next()) {
			page = rs.getInt(1);

		}

		pool.freeConnection(con, ps, rs);

		return page;
	}
}
