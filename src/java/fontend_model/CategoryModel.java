/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Category;
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
public class CategoryModel {
    public List<Category> getAllCategory() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Category> list = new ArrayList<Category>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllCategory()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Category catalog = new Category();
                catalog.setCategoryId(rs.getInt("CategoryId"));
                catalog.setName(rs.getString("Name"));
                catalog.setDescriptions(rs.getString("Descriptions"));
                catalog.setParentId(rs.getInt("ParentId"));
                catalog.setDisplayNumber(rs.getInt("DisplayNumber"));
                catalog.setImages(rs.getString("Images"));
                catalog.setStatus(rs.getBoolean("Status"));
                list.add(catalog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public boolean insertCategory(Category category) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertCategory(?,?,?,?,?)}");
            calla.setString(1, category.getName());
            calla.setString(2, category.getDescriptions());
            calla.setInt(3, category.getParentId());
            calla.setString(4, category.getImages());
            calla.setInt(5, category.getDisplayNumber());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean updateCategory(Category category) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;

        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updateCategory(?,?,?,?,?,?)}");
            calla.setInt(1, category.getCategoryId());
            calla.setString(2, category.getName());
            calla.setString(3, category.getDescriptions());
            calla.setInt(4, category.getParentId());
            calla.setInt(5, category.getDisplayNumber());
            calla.setBoolean(6, category.isStatus());

            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean deleteCategory(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call deleteCategory(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    public List<Category> getCategoryRoot() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Category> list = new ArrayList<Category>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getCategoryRoot()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("CategoryId"));
                category.setName(rs.getString("Name"));
                category.setDescriptions(rs.getString("Descriptions"));
                category.setParentId(rs.getInt("ParentId"));
                category.setDisplayNumber(rs.getInt("DisplayNumber"));
                category.setImages(rs.getString("Images"));
                category.setStatus(rs.getBoolean("Status"));
                list.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public boolean updateCategoryStatus(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateCategoryStatus(?)}");
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
    public Category getCategoryByCategoryId(int customerId) {
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Category category = new Category();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call  getCategoryByCategoryId(?)}");
            calla.setInt(1, customerId);
            rs = calla.executeQuery();
            while (rs.next()) {
                category.setCategoryId(rs.getInt("CategoryId"));
                category.setName(rs.getString("Name"));
                category.setDescriptions(rs.getString("Descriptions"));
                category.setParentId(rs.getInt("ParentId"));
                category.setDisplayNumber(rs.getInt("DisplayNumber"));
                category.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return category;
    }
}
