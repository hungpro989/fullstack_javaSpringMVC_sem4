/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.PaymentType;
import fontend_utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class PaymentTypeModel {
    public List<PaymentType> getALlPaymentType(){
        Connection conn = null;
        CallableStatement calla = null;
        List<PaymentType> list = new ArrayList<PaymentType>();
        ResultSet rs ;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllPaymentType()}");
            rs = calla.executeQuery();
            while(rs.next()){
                PaymentType paymentType = new PaymentType();
                paymentType.setPaymentTypeId(rs.getInt("PaymentTypeId"));
                paymentType.setName(rs.getString("Name"));
                paymentType.setStatus(rs.getBoolean("Status"));
                list.add(paymentType);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentTypeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    
}
