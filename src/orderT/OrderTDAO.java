package orderT;

import java.sql.*;
import java.util.ArrayList;

import member.DBConnectionMgr;
import product.ProductDTO;
import shoes.OrderView;

public class OrderTDAO {
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public OrderTDAO() {
		// TODO Auto-generated constructor stub
		pool = DBConnectionMgr.getInstance();
	}

	public void ordInsert(String a,String b, int c, int d, String e,String f) throws Exception {
		con = pool.getConnection();
		String sql = "insert into orderT values (?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);

		ps.setString(1, a);
		ps.setString(2, b);
		ps.setInt(3, c);
		ps.setInt(4, d);
		ps.setString(5, e);
		ps.setString(6, f);

		ps.executeUpdate();

		
		pool.freeConnection(con, ps);

	}
	
	public ArrayList ordSelect(String id, int start, int end) throws Exception {
		con = pool.getConnection();
		String sql = "select distinct(orderId),orderDate from orderT where orderMId = ? order by orderDate desc limit ?,?";
		ps = con.prepareStatement(sql);

		ps.setString(1, id);
		ps.setInt(2, start);
		ps.setInt(3, end);

		rs = ps.executeQuery();
		OrderTDTO dto = null;
		ArrayList list = new ArrayList();
		while(rs.next()) {
			dto = new OrderTDTO();
			dto.setOrderId(rs.getString(1));
			dto.setOrderDate(rs.getString(2));
			
			list.add(dto);
		}
		
		pool.freeConnection(con, ps, rs);
		
		return list;

	}
	
	public ArrayList ordSelectAll(int start, int end) throws Exception {
		con = pool.getConnection();
		String sql = "select distinct(orderId),orderDate,orderMId from orderT order by orderDate desc limit ?,?";
		ps = con.prepareStatement(sql);

		ps.setInt(1, start);
		ps.setInt(2, end);
		
		rs = ps.executeQuery();
		OrderTDTO dto = null;
		ArrayList list = new ArrayList();
		while(rs.next()) {
			dto = new OrderTDTO();
			dto.setOrderId(rs.getString(1));
			dto.setOrderDate(rs.getString(2));
			dto.setOrderMId(rs.getString(3));
			
			list.add(dto);
		}
		
		pool.freeConnection(con, ps, rs);
		
		return list;

	}
	
	public ArrayList ordViewSelect(String orderId) throws Exception {
		con = pool.getConnection();
		String sql = "select product.proImg, product.proName, product.proExp, orderT.orderCount, orderT.orderSize, product.proPrice from product JOIN orderT ON product.proId = orderT.orderPId where orderT.orderId = ?;";
		ps = con.prepareStatement(sql);

		ps.setString(1, orderId);

		rs = ps.executeQuery();
		OrderView view = null;
		ArrayList list = new ArrayList();
		while(rs.next()) {
			view = new OrderView();
			view.setProImg(rs.getString(1));
			view.setProName(rs.getString(2));
			view.setProExp(rs.getString(3));
			view.setOrderCount(rs.getInt(4));
			view.setOrderSize(rs.getString(5));
			view.setProPrice(rs.getInt(6));
			
			list.add(view);
		}
		
		pool.freeConnection(con, ps, rs);
		
		return list;

	}
	
	public int ordPageList(String orderMId) throws Exception {// 상품 갯수 검색(상품페이지)
		int page = 0;
		con = pool.getConnection();
		String sql = "select count(*) from orderT where orderMId = ?";
		ps = con.prepareStatement(sql);

		ps.setString(1, orderMId);

		rs = ps.executeQuery();

		while (rs.next()) {
			page = rs.getInt(1);

		}

		pool.freeConnection(con, ps, rs);

		return page;
	}
	
	public int ordPageListAll() throws Exception {// 
		int page = 0;
		con = pool.getConnection();
		String sql = "select count(*) from orderT";
		ps = con.prepareStatement(sql);


		rs = ps.executeQuery();

		while (rs.next()) {
			page = rs.getInt(1);

		}

		pool.freeConnection(con, ps, rs);

		return page;
	}

}
