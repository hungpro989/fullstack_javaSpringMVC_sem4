/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;


import fontend_entities.Delivery;
import fontend_utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author ADMIN
 */
public class DeliveryModel {
    public List<Delivery> getAllDelivery(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Delivery> list = new ArrayList<Delivery>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllDelivery()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Delivery delivery = new Delivery();
                delivery.setDeliveryId(rs.getInt("DeliveryId"));
                delivery.setName(rs.getString("Name"));
                delivery.setStatus(rs.getBoolean("Status"));
                list.add(delivery);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentTypeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
}
