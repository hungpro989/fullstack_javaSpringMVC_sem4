/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Banner;
import fontend_entities.Message;
import fontend_entities.Order;
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
public class MessageModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public List<Message> getAllMessage(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Message> list = new ArrayList<Message>();
        ResultSet rs ;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllMessage()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Message mes = new Message();
                mes.setMessageId(rs.getInt("MessageId"));
                mes.setName(rs.getString("Name"));
                mes.setEmail(rs.getString("Email"));
                mes.setPhone(rs.getString("Phone"));
                mes.setMessageDescription(rs.getString("MessageDescription"));
                mes.setStatus(rs.getBoolean("Status"));
                if(rs.getDate("Created") == null){
                      mes.setCreated(null);
                } else {
                      mes.setCreated(fomat.format(rs.getDate("Created")));
                }
               list.add(mes);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MessageModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public boolean insertMessage(Message mes) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertMessage(?,?,?,?)}");
            calla.setString(1, mes.getName());
            calla.setString(2, mes.getPhone());
            calla.setString(3, mes.getEmail());
            calla.setString(4, mes.getMessageDescription());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(MessageModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public Message getMessageById(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Message mes= new Message();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getMessageById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                mes.setMessageId(rs.getInt("MessageId"));
                mes.setName(rs.getString("Name"));
                mes.setEmail(rs.getString("Email"));
                mes.setPhone(rs.getString("Phone"));
                mes.setMessageDescription(rs.getString("MessageDescription"));
                mes.setStatus(rs.getBoolean("Status"));
                if(rs.getDate("Created") == null){
                      mes.setCreated(null);
                } else {
                      mes.setCreated(fomat.format(rs.getDate("Created")));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return mes;
    }
    public boolean updateMessageStatus(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateMessageStatus(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
}
