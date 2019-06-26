package orderT;

public class OrderTDTO {
	private String orderId;
	private String orderMId;
	private int orderPId;
	private int orderCount;
	private String orderSize;
	private String orderDate;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderMId() {
		return orderMId;
	}
	public void setOrderMId(String orderMId) {
		this.orderMId = orderMId;
	}
	public int getOrderPId() {
		return orderPId;
	}
	public void setOrderPId(int orderPId) {
		this.orderPId = orderPId;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getOrderSize() {
		return orderSize;
	}
	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	
}
