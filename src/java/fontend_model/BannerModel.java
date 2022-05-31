/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;


import fontend_entities.Banner;
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
public class BannerModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public List<Banner> getAllBannerHome(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Banner> list = new ArrayList<Banner>();
        ResultSet rs ;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllBannerHome()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Banner post = new Banner();
                post.setBannerId(rs.getInt("BannerId"));
                post.setTitle(rs.getString("Title"));
                post.setTitleMain(rs.getString("TitleMain"));
                post.setContent(rs.getString("Content"));
                post.setImage(rs.getString("Image"));
                post.setUserId(rs.getInt("UserId"));
                post.setDisplayNumber(rs.getInt("DisplayNumber"));
                post.setUserName(rs.getString("UserName"));
                post.setStatus(rs.getBoolean("Status"));
                post.setPath(rs.getString("Path"));
                if(rs.getDate("Created") == null){
                      post.setCreated(null);
                } else {
                      post.setCreated(fomat.format(rs.getDate("Created")));
                }
              
               list.add(post);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Banner> getAllBanner(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Banner> list = new ArrayList<Banner>();
        ResultSet rs ;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllBannerHome()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Banner post = new Banner();
                post.setBannerId(rs.getInt("BannerId"));
                post.setTitle(rs.getString("Title"));
                post.setTitleMain(rs.getString("TitleMain"));
                post.setContent(rs.getString("Content"));
                post.setImage(rs.getString("Image"));
                post.setUserId(rs.getInt("UserId"));
                post.setDisplayNumber(rs.getInt("DisplayNumber"));
                post.setUserName(rs.getString("UserName"));
                post.setStatus(rs.getBoolean("Status"));
               
                if(rs.getDate("Created") == null){
                      post.setCreated(null);
                } else {
                      post.setCreated(fomat.format(rs.getDate("Created")));
                }
              
               list.add(post);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public boolean updateBannerStatus(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateBannerStatus(?)}");
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
