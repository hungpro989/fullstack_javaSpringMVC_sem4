/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Order;
import fontend_entities.OrderDetail;
import fontend_utils.Common;
import fontend_utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class OrderModel {

    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");

    public boolean insertOrder(Order order) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertOrder(?,?,?,?,?,?,?,?,?,?,?)}");
            calla.setString(1, order.getName());
            calla.setString(2, order.getPhone());
            calla.setString(3, order.getEmail());
            calla.setString(4, order.getAddress());
            calla.setString(5, order.getDescription());
            calla.setInt(6, order.getCustomerId());
            calla.setInt(7, order.getPaymentTypeId());
            calla.setFloat(8, order.getSubPrice());
            calla.setFloat(9, order.getTotalPrice());
            calla.setFloat(10, order.getCod());
            calla.setFloat(11, order.getDiscount());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }

    public int getOrderIdNew() {
        Connection conn = null;
        CallableStatement calla = null;
        int result = 0;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getOrderIdNew(?)}");
            calla.registerOutParameter(1, Types.INTEGER);
            calla.executeUpdate();
            result = calla.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;

    }

    public boolean insertOrderDetail(OrderDetail orderDetail) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertOrderDetail(?,?,?,?)}");
            calla.setInt(1, orderDetail.getOrderId());
            calla.setInt(2, orderDetail.getProductId());
            calla.setFloat(3, orderDetail.getPrice());
            calla.setInt(4, orderDetail.getQuantity());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }

    public List<Order> getOrderByUserId(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        List<Order> list = new ArrayList<Order>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getOrderByUserId(?)}");
            calla.setInt(1, id);
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderId"));
                order.setName(rs.getString("Name"));
                order.setAddress(rs.getString("Address"));
                order.setPhone(rs.getString("Phone"));
                order.setEmail(rs.getString("Email"));
                order.setTotalPrice((rs.getFloat("TotalPrice")));
                order.setCod((rs.getFloat("Cod")));
                order.setDiscount((rs.getFloat("Discount")));
                order.setSubPrice((rs.getFloat("SubPrice")));
                order.setDescription(rs.getString("Description"));
                order.setPayName(rs.getString("payName"));
                order.setDeliveryName(rs.getString("deliveryName"));
                order.setStatusName(rs.getString("statusName"));
                if (rs.getDate("CreatedDate") != null) {
                    order.setCreated(fomat.format(rs.getDate("CreatedDate")));
                }
                list.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }

    public List<Order> getOrderByPhone(String phone) {
        Connection conn = null;
        CallableStatement calla = null;
        List<Order> list = new ArrayList<Order>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getOrderByPhone(?)}");
            calla.setString(1, (phone));
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderId"));
                order.setName(rs.getString("Name"));
                order.setAddress(rs.getString("Address"));
                order.setPhone(rs.getString("Phone"));
                order.setEmail(rs.getString("Email"));
                order.setPaymentTypeId(rs.getInt("PaymentTypeId"));
                order.setTotalPrice((rs.getFloat("TotalPrice")));
                order.setDescription(rs.getString("Description"));
                order.setStatusId(rs.getInt("StatusId"));
                order.setDeliveryId(rs.getInt("DeliveryId"));
                order.setPaymentTypeId(rs.getInt("PaymentTypeId"));
                
                order.setCustomerName(rs.getString("customerName"));
                order.setDeliveryName(rs.getString("deliveryName"));
                order.setStatusName(rs.getString("statusName"));
                order.setCodName(rs.getString("payName"));
                order.setUserName(rs.getString("userName"));
                
                if (rs.getDate("CreatedDate") != null) {
                    order.setCreated(fomat.format(rs.getDate("CreatedDate")));
                }
                order.setStatusId(rs.getInt("StatusId"));
                list.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }

    public Order getOrderById(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        Order order = new Order();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getOrderById(?)}");
            calla.setInt(1, (id));
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                order.setOrderId(rs.getInt("OrderId"));
                order.setName(rs.getString("Name"));
                order.setAddress(rs.getString("Address"));
                order.setPhone(rs.getString("Phone"));
                order.setEmail(rs.getString("Email"));
                order.setPaymentTypeId(rs.getInt("PaymentTypeId"));
                order.setTotalPrice((rs.getFloat("TotalPrice")));
                order.setSubPrice((rs.getFloat("SubPrice")));
                order.setCod((rs.getFloat("Cod")));
                order.setDiscount((rs.getFloat("Discount")));
                order.setDescription(rs.getString("Description"));
                if (rs.getDate("CreatedDate") != null) {
                    order.setCreated(fomat.format(rs.getDate("CreatedDate")));
                }
                order.setStatusId(rs.getInt("StatusId"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return order;
    }

    public boolean updateOrder(Order order) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateOrder(?,?,?,?,?,?)}");
            calla.setInt(1, order.getOrderId());
            calla.setString(2, order.getName());
            calla.setString(3, order.getPhone());
            calla.setString(4, order.getAddress());
            calla.setString(5, order.getEmail());
            calla.setString(6, order.getDescription());
            int i = calla.executeUpdate();
            if(i>0)
                result = true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public List<Order> getAllOrder(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Order> list = new ArrayList<Order>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllOrder()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderId"));
                order.setName(rs.getString("Name"));
                order.setAddress(rs.getString("Address"));
                order.setPhone(rs.getString("Phone"));
                order.setEmail(rs.getString("Email"));
                order.setTotalPrice((rs.getFloat("TotalPrice")));
                order.setCod((rs.getFloat("Cod")));
                order.setDiscount((rs.getFloat("Discount")));
                order.setSubPrice((rs.getFloat("SubPrice")));
                order.setDescription(rs.getString("Description"));
                order.setDeliveryId(rs.getInt("DeliveryId"));
                order.setPaymentTypeId(rs.getInt("PaymentTypeId"));
                order.setUserId(rs.getInt("UserId"));
                order.setStatusId(rs.getInt("StatusId"));
                order.setCustomerId(rs.getInt("CustomerId"));
                order.setPayName(rs.getString("payName"));
                order.setDeliveryName(rs.getString("deliveryName"));
                order.setStatusName(rs.getString("statusName"));
                order.setCustomerName(rs.getString("customerName"));
                order.setUserName(rs.getString("userName"));
                if (rs.getDate("CreatedDate") != null) {
                    order.setCreated(fomat.format(rs.getDate("CreatedDate")));
                }
                list.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public Order getOrdeDetailrByOrderId(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        Order order = new Order();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getOrderDetailByOrderId(?)}");
            calla.setInt(1, (id));
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                order.setOrderId(rs.getInt("OrderId"));
                order.setName(rs.getString("Name"));
                order.setAddress(rs.getString("Address"));
                order.setPhone(rs.getString("Phone"));
                order.setEmail(rs.getString("Email"));
                order.setTotalPrice((rs.getFloat("TotalPrice")));
                order.setCod((rs.getFloat("Cod")));
                order.setDiscount((rs.getFloat("Discount")));
                order.setSubPrice((rs.getFloat("SubPrice")));
                order.setDescription(rs.getString("Description"));
                order.setDeliveryId(rs.getInt("DeliveryId"));
                order.setPaymentTypeId(rs.getInt("PaymentTypeId"));
                order.setUserId(rs.getInt("UserId"));
                order.setStatusId(rs.getInt("StatusId"));
                order.setCustomerId(rs.getInt("CustomerId"));
                order.setPayName(rs.getString("payName"));
                order.setDeliveryName(rs.getString("deliveryName"));
                order.setStatusName(rs.getString("statusName"));
                order.setCustomerName(rs.getString("customerName"));
                order.setUserName(rs.getString("userName"));
                if (rs.getDate("CreatedDate") != null) {
                    order.setCreated(fomat.format(rs.getDate("CreatedDate")));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return order;
    }
    public boolean sendOrderToDelivery(Order order) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call sendOrderToDelivery(?,?)}");
            
            calla.setInt(1, order.getOrderId());
            calla.setInt(2, order.getDeliveryId());
            int i = calla.executeUpdate();
            if(i>0){
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
}
