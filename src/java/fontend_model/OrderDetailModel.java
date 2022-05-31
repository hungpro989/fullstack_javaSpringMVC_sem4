/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Order;
import fontend_entities.OrderDetail;
import fontend_utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class OrderDetailModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public List<OrderDetail> getOrderDetailById(int id){
        Connection conn = null;
        CallableStatement calla = null;
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getOrderDetailById(?)}");
            calla.setInt(1,(id));
            ResultSet rs = calla.executeQuery();
            while(rs.next()){
                OrderDetail order = new OrderDetail();
                order.setOrderDetailId(rs.getInt("OrderDetailId"));
                order.setOrderId(rs.getInt("OrderId"));
                order.setProductId(rs.getInt("ProductId"));
                order.setProductName(rs.getString("Name"));
                order.setImages(rs.getString("Images"));
                order.setPrice(rs.getFloat("Price"));
                order.setQuantity(rs.getInt("Quantity"));
                if(rs.getDate("Created") != null){
                    order.setCreated(fomat.format(rs.getDate("Created")));
                } 
                order.setStatus(rs.getBoolean("Status"));
                list.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
}
