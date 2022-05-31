/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Customer;
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
public class CustomerModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    
    public List<Customer> getAllCustomer(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Customer> list = new ArrayList<Customer>();
        ResultSet rs ;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllCustomer()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("CustomerId"));
                customer.setName(rs.getString("Name"));
                customer.setUserName(rs.getString("UserName"));
                customer.setPassword(rs.getString("Password"));
                customer.setAddress(rs.getString("Address"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhone(rs.getString("Phone"));
                customer.setStatus(rs.getBoolean("Status"));
               
                if(rs.getDate("Created") == null){
                      customer.setCreated(null);
                } else {
                      customer.setCreated(fomat.format(rs.getDate("Created")));
                }
              
               list.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    
    public boolean insertCustomer(Customer customer) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertCustomer(?,?,?,?,?,?)}");
            calla.setString(1, customer.getName());
            calla.setString(2, customer.getUserName());
            calla.setString(3, customer.getPassword());
            calla.setString(4, customer.getPhone());
            calla.setString(5, customer.getEmail());
            calla.setString(6, customer.getAddress());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean updateCustomer(Customer customer) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updateCustomer(?,?,?,?,?,?,?,?)}");
            calla.setInt(1, customer.getCustomerId());
            calla.setString(2, customer.getName());
            calla.setString(2, customer.getUserName());
            calla.setString(3, customer.getPassword());
            calla.setString(4, customer.getPhone());
            calla.setString(5, customer.getEmail());
            calla.setString(6, customer.getAddress());
            calla.setBoolean(8, customer.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean deleteCustomer(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call deleteCustomer(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    public boolean activeCustomer(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call activeCustomer(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean recoverPassword(Customer customer) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call recoverPassword(?,?)}");
            calla.setInt(1, customer.getCustomerId());
            calla.setString(2, customer.getPassword());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public Customer getUserByEmail(String email) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Customer customer = new Customer();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getCustomerByEmail(?)}");
            calla.setString(1, email);
            rs = calla.executeQuery();
            while (rs.next()) {
                customer.setCustomerId(rs.getInt("CustomerId"));
                customer.setName(rs.getString("Name"));
                customer.setUserName(rs.getString("UserName"));
                customer.setPassword(rs.getString("Password"));
                customer.setAddress(rs.getString("Address"));
                customer.setPhone(rs.getString("Phone"));
                customer.setEmail(rs.getString("Email"));
                customer.setStatus(rs.getBoolean("Status"));
                if (rs.getDate("Created") == null) {
                    customer.setCreated(null);
                } else {
                    customer.setCreated(fomat.format(rs.getDate("Created")));
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return customer;
    }
    public Customer getCustomerByUserName(String username) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Customer customer = new Customer();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getCustomerByUserName(?)}");
            calla.setString(1, username);
            rs = calla.executeQuery();
            while (rs.next()) {
                customer.setCustomerId(rs.getInt("CustomerId"));
                customer.setName(rs.getString("Name"));
                customer.setUserName(rs.getString("UserName"));
                customer.setPassword(rs.getString("Password"));
                customer.setAddress(rs.getString("Address"));
                customer.setPhone(rs.getString("Phone"));
                customer.setEmail(rs.getString("Email"));
                if (rs.getDate("Created") == null) {
                    customer.setCreated(null);
                } else {
                    customer.setCreated(fomat.format(rs.getDate("Created")));
                }
                customer.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return customer;
    }
    public boolean checkUserName(String username) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkUserName(?,?)}");
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
    public boolean checkEmail(String mail) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkEmail(?,?)}");
            calla.setString(1, mail);
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
            calla = conn.prepareCall("{ call checkPhone(?,?)}");
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
    public boolean checkLogin(Customer customer) {
        boolean result = false;
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkLogin(?,?)}");
            calla.setString(1, customer.getUserName());
            calla.setString(2, customer.getPassword());
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
    public int getCustomerIdNew() {
        Connection conn = null;
        CallableStatement calla = null;
        int result = 0;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call  getCustomerIdNew(?)}");
            calla.registerOutParameter(1, Types.INTEGER);
            calla.executeUpdate();
            result = calla.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;

    }
    public Customer getCustomerByCustomerId(int customerId) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Customer customer = new Customer();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getCustomerByCustomerId(?)}");
            calla.setInt(1, customerId);
            rs = calla.executeQuery();
            while (rs.next()) {
                customer.setCustomerId(rs.getInt("CustomerId"));
                customer.setName(rs.getString("Name"));
                customer.setUserName(rs.getString("UserName"));
                customer.setPassword(rs.getString("Password"));
                customer.setAddress(rs.getString("Address"));
                customer.setPhone(rs.getString("Phone"));
                customer.setEmail(rs.getString("Email"));
                if (rs.getDate("Created") == null) {
                    customer.setCreated(null);
                } else {
                    customer.setCreated(fomat.format(rs.getDate("Created")));
                }
                customer.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return customer;
    }
    public boolean updatePassword(Customer c) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updatePasswordCustomer(?,?)}");
            calla.setInt(1, c.getCustomerId());
            calla.setString(2, c.getPasswordNew());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public Customer checkForgetPassword(Customer cus) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Customer customer = new Customer();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  checkForgetPassword(?,?,?)}");
            calla.setString(1, cus.getUserName());
            calla.setString(1, cus.getEmail());
            calla.setString(1, cus.getPhone());
            rs = calla.executeQuery();
            while (rs.next()) {
                customer.setCustomerId(rs.getInt("CustomerId"));
                customer.setName(rs.getString("Name"));
                customer.setUserName(rs.getString("UserName"));
                customer.setPassword(rs.getString("Password"));
                customer.setAddress(rs.getString("Address"));
                customer.setPhone(rs.getString("Phone"));
                customer.setEmail(rs.getString("Email"));
                if (rs.getDate("Created") == null) {
                    customer.setCreated(null);
                } else {
                    customer.setCreated(fomat.format(rs.getDate("Created")));
                }
                customer.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return customer;
    }
    public Customer getCustomerByEmail(String email) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Customer customer = new Customer();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getCustomerByEmail(?)}");
            calla.setString(1, email);
            rs = calla.executeQuery();
            while (rs.next()) {
                customer.setCustomerId(rs.getInt("CustomerId"));
                customer.setName(rs.getString("Name"));
                customer.setUserName(rs.getString("UserName"));
                customer.setPassword(rs.getString("Password"));
                customer.setAddress(rs.getString("Address"));
                customer.setPhone(rs.getString("Phone"));
                customer.setEmail(rs.getString("Email"));
                if (rs.getDate("Created") == null) {
                    customer.setCreated(null);
                } else {
                    customer.setCreated(fomat.format(rs.getDate("Created")));
                }
                customer.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return customer;
    }
    
}
