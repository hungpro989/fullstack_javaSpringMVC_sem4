/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Customer;
import fontend_entities.MailCustomer;
import fontend_entities.Message;
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
public class MailCustomerModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public boolean insertMailCustomer(MailCustomer mailcustomer) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertCustomerMail(?,?,?,?,?)}");
            calla.setString(1, mailcustomer.getTitle());
            calla.setString(2, mailcustomer.getContent());
            calla.setString(3, mailcustomer.getCustomer());
            calla.setInt(4, mailcustomer.getCountMail());
            calla.setInt(5, mailcustomer.getCountMailSuccess());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    
    public List<MailCustomer> getAllMessage(){
        Connection conn = null;
        CallableStatement calla = null;
        List<MailCustomer> list = new ArrayList<MailCustomer>();
        ResultSet rs ;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllMail()}");
            rs = calla.executeQuery();
            while(rs.next()){
                MailCustomer mail = new MailCustomer();
                mail.setMailId(rs.getInt("MailId"));
                mail.setTitle(rs.getString("Title"));
                mail.setContent(rs.getString("Content"));
                mail.setCustomer(rs.getString("Customer"));
                mail.setCountMail(rs.getInt("CountMail"));
                mail.setCountMailSuccess(rs.getInt("CountSuccessMail"));
                mail.setStatus(rs.getBoolean("Status"));
                if(rs.getDate("Created") == null){
                      mail.setCreated(null);
                } else {
                      mail.setCreated(fomat.format(rs.getDate("Created")));
                }
               list.add(mail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MessageModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public MailCustomer getMailDetail(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        MailCustomer mail= new MailCustomer();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getMailDetail(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                mail.setMailId(rs.getInt("MailId"));
                mail.setTitle(rs.getString("Title"));
                mail.setContent(rs.getString("Content"));
                mail.setCustomer(rs.getString("Customer"));
                mail.setCountMail(rs.getInt("CountMail"));
                mail.setCountMailSuccess(rs.getInt("CountSuccessMail"));
                mail.setStatus(rs.getBoolean("Status"));
                if(rs.getDate("Created") == null){
                      mail.setCreated(null);
                } else {
                      mail.setCreated(fomat.format(rs.getDate("Created")));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return mail;
    }
}
