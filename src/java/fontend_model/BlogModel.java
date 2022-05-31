/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Blog;

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
public class BlogModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public List<Blog> getAllBlog() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Blog> list = new ArrayList<Blog>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllPost()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogId(rs.getInt("PostId"));
                blog.setTitle(rs.getString("Title"));
                blog.setContent(rs.getString("Content"));
                blog.setImages(rs.getString("Images"));
                blog.setDisplayNumber(rs.getInt("DisplayNumber"));
                blog.setUserId(rs.getInt("UserId"));
                blog.setStatus(rs.getBoolean("Status"));
                blog.setUserName(rs.getString("userName"));
                if (rs.getDate("Created") == null) {
                    blog.setCreated(null);
                } else {
                    blog.setCreated(fomat.format(rs.getDate("Created")));
                }
                list.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public Blog getBlogById(int id){
         Connection conn = null;
         CallableStatement calla = null;
         ResultSet rs ;
         Blog blog = new Blog();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getBlogById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
                blog.setBlogId(rs.getInt("PostId"));
                blog.setTitle(rs.getString("Title"));
                blog.setContent(rs.getString("Content"));
                blog.setImages(rs.getString("Images"));
                blog.setDisplayNumber(rs.getInt("DisplayNumber"));
                blog.setUserId(rs.getInt("UserId"));
                blog.setUserName(rs.getString("NameOfUser"));
                if (rs.getDate("Created") != null) {
                    blog.setCreated(fomat.format(rs.getDate("Created")));
                }
                blog.setStatus(rs.getBoolean("Status"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BlogModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return blog;
   }
    public boolean updatePostStatus(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updatePostStatus(?)}");
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
