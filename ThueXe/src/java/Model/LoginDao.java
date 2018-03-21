/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entites.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
import sun.rmi.runtime.Log;

/**
 *
 * @author Admin
 */
public class LoginDao {

    public User loginAction(String username, String password) throws SQLException {
        boolean checkLogin;
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        User us = null;
        DBConnection db = new DBConnection();
        try {
            conn = db.getConnection();
            String sql = "select username,password from AccountTBL where Username =? and Password =?";
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            rs = pre.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setAccount(rs.getString("username"));
                us.setPassword(rs.getString("password"));
                us.setIsAdmin(true);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage() + "LoginDao");
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (rs != null) {
                pre.close();
            }
            if (conn != null) {
                pre.close();
            }
        }

        return us;
    }
}
