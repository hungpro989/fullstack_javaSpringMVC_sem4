/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.LevelUser;
import fontend_utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;
/**
 *
 * @author ADMIN
 */
public class LevelUserModel {
    public List<LevelUser> getAllLevel() {
        Connection conn = null;
        CallableStatement calla = null;
        List<LevelUser> list = new ArrayList<LevelUser>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllLevel()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                LevelUser levelUser = new LevelUser();
                levelUser.setLevelId(rs.getInt("LevelId"));
                levelUser.setName(rs.getString("Name"));
                levelUser.setStatus(rs.getBoolean("Status"));
                
                list.add(levelUser);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LevelUserModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
}
