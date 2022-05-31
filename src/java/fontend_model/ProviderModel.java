/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;


import fontend_entities.Provider;
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
public class ProviderModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public List<Provider> getAllProvider() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Provider> list = new ArrayList<Provider>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllProvider()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Provider provider = new Provider();
                provider.setProviderId(rs.getInt("ProviderId"));
                provider.setProviderName(rs.getString("ProviderName"));
                provider.setAddress(rs.getString("Address"));
                provider.setEmail(rs.getString("Email"));
                provider.setPhone(rs.getString("Phone"));
                provider.setStatus(rs.getBoolean("Status"));
                list.add(provider);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProviderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public boolean insertProvider(Provider provider) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertProvider(?,?,?,?)}");
            calla.setString(1, provider.getProviderName());
            calla.setString(2, provider.getAddress());
            calla.setString(3, provider.getEmail());
            calla.setString(4, provider.getPhone());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProviderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean updateProvider(Provider provider) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updateProvider(?,?,?,?,?,?)}");
            calla.setInt(1, provider.getProviderId());
            calla.setString(2, provider.getProviderName());
            calla.setString(3, provider.getAddress());
            calla.setString(4, provider.getEmail());
            calla.setString(5, provider.getPhone());
            calla.setBoolean(6, provider.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProviderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean deleteColor(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call deleteProvider(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProviderModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    public Provider getProviderById(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        Provider provider = new Provider();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" {call getProviderById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                provider.setProviderId(rs.getInt("ProviderId"));
                provider.setProviderName(rs.getString("ProviderName"));
                provider.setAddress(rs.getString("Address"));
                provider.setEmail(rs.getString("Email"));
                provider.setPhone(rs.getString("Phone"));
                provider.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return provider;
    }
    public boolean updateProviderStatus(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateProviderStatus(?)}");
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
