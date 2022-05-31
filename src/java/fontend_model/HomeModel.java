/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;


import fontend_entities.Customer;
import fontend_entities.Order;
import fontend_entities.Product;
import fontend_entities.User;
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
public class HomeModel {
     SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public int getProductTotalBuy() {
        Connection conn = null;
        CallableStatement calla = null;
        int result = 0;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductTotalBuy(?)}");
            calla.registerOutParameter(1, Types.INTEGER);
            calla.executeUpdate();
            result = calla.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(HomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public float getTotalPrice() {
        Connection conn = null;
        CallableStatement calla = null;
        float result = 0;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getTotalPrice(?)}");
            calla.registerOutParameter(1, Types.INTEGER);
            calla.executeUpdate();
            result = calla.getFloat(1);
        } catch (SQLException ex) {
            Logger.getLogger(HomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public int getTotalCustomer() {
        Connection conn = null;
        CallableStatement calla = null;
        int result = 0;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getTotalCustomer(?)}");
            calla.registerOutParameter(1, Types.INTEGER);
            calla.executeUpdate();
            result = calla.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(HomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public int getTotalOrder() {
        Connection conn = null;
        CallableStatement calla = null;
        int result = 0;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getTotalOrder(?)}");
            calla.registerOutParameter(1, Types.INTEGER);
            calla.executeUpdate();
            result = calla.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(HomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public List<Product> getTopProduct(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getTopProduct()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setImages(rs.getString("Images"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setView(rs.getInt("View"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<User> getAllUser(){
        Connection conn = null;
        CallableStatement calla = null;
        List<User> list = new ArrayList<User>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllUser()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("UserId"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setName(rs.getString("Name"));
                user.setPhone(rs.getString("Phone"));
                user.setAddress(rs.getString("Address"));
                user.setEmail(rs.getString("Email"));
                user.setLevelId(rs.getInt("LevelId"));
                user.setImages(rs.getString("Images"));
                user.setStatus(rs.getBoolean("Status"));
                user.setLevelName(rs.getString("levelName"));
                if (rs.getDate("Created") != null) {
                    user.setCreated(fomat.format(rs.getDate("Created")));
                }
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Customer> getTopNewCustomer(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Customer> list = new ArrayList<Customer>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getTopNewCustomer()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setCustomerId(rs.getInt("CustomerId"));
                cus.setName(rs.getString("Name"));
                cus.setPhone(rs.getString("Phone"));
                cus.setAddress(rs.getString("Address"));
                cus.setUserName(rs.getString("UserName"));
                cus.setEmail(rs.getString("Email"));
                cus.setStatus(rs.getBoolean("Status"));
                if (rs.getDate("Created") != null) {
                    cus.setCreated(fomat.format(rs.getDate("Created")));
                }
                list.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Order> getTopNewOrder(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Order> list = new ArrayList<Order>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getTopNewOrder()}");
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
    public Product getProductDiscountHome() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        Product product = new Product();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" {call getProductDiscountHome()}");
            rs = calla.executeQuery();
            while (rs.next()) {
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setImages(rs.getString("Images"));
                product.setDiscount(rs.getInt("Discount"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setCategoryName(rs.getString("CategoryName"));
                product.setProviderId(rs.getInt("ProviderId")); //đây nữa này :):)))
                product.setProviderName(rs.getString("ProviderName"));
                product.setColorId(rs.getInt("ColorId"));
                product.setSizeId(rs.getInt("SizeId"));
                product.setShowHome(rs.getBoolean("ShowHome"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return product;
    }
}
