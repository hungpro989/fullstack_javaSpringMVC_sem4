/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;


import fontend_entities.User;
import fontend_utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author ADMIN
 */
public class UserModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public boolean checkLoginUser(User user) {
        boolean result = false;
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkLoginUser(?,?)}");
            calla.setString(1, user.getUserName());
            calla.setString(2, user.getPassword());
            rs = calla.executeQuery();
            while (rs.next()) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public User getUserByUserName(String username) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        User user = new User();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getUserByUserName(?)}");
            calla.setString(1, username);
            rs = calla.executeQuery();
            while (rs.next()) {
                user.setUserId(rs.getInt("UserId"));
                user.setName(rs.getString("Name"));
                user.setUserName(rs.getString("UserName"));
                user.setPassword(rs.getString("Password"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setLevelId(rs.getInt("LevelId"));
                user.setLevelName(rs.getString("LevelName"));
                user.setImages(rs.getString("Images"));
                user.setStatus(rs.getBoolean("Status"));
                if (rs.getDate("Created") == null) {
                    user.setCreated(null);
                } else {
                    user.setCreated(fomat.format(rs.getDate("Created")));
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return user;
    }
    public boolean insertUser(User user) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertUser(?,?,?,?,?,?)}");
            calla.setString(1, user.getName());
            calla.setString(2, user.getUserName());
            calla.setString(3, user.getPassword());
            calla.setString(4, user.getPhone());
            calla.setString(5, user.getAddress());
            calla.setString(6, user.getEmail());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkUserName(String username) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkUserNameOfUser(?,?)}");
            calla.setString(1, username);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkPhone(String phone) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkPhoneOfUser(?,?)}");
            calla.setString(1, phone);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkEmail(String email) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkMailOfUser(?,?)}");
            calla.setString(1, email);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
}
