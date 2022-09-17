/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import bike.Bike;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import utils.DBUtils;

/**
 *
 * @author dell
 */
public class UsersFacade {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Users checkLogin(String userName, String pass) {
        try {
            String query = "select * from tblUsers where UserName = ? and Password = ?";
            Connection con = DBUtils.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUser(Users user) {
        boolean result = true;
        String query = "UPDATE tblUSERS SET FullName= ?, AddressUser= ?, PhoneUser= ?, BirthDay= ? where UserName= ?";
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, user.getFullName());
            stm.setString(2, user.getAddress());
            stm.setString(3, user.getPhone());
            stm.setString(4, user.getDob());
            stm.setString(5, user.getUserName());
            int count = stm.executeUpdate();
            if (count == 0) {
                result = false;
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            result = false;
        }
        return result;
    }

    public Users checkAccountExist(String user) {
        try {
            String query = "select * from tblUsers where UserName = ?";
            Connection con = DBUtils.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
            con.close();
        } catch (Exception e) {

        }
        return null;
    }

    public boolean signUp(Users u) {
        boolean result = true;
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement("insert into tblUsers values(?, '', ?, ?,'r02','','','')");
            stm.setString(1, u.getUserId());
            stm.setString(2, u.getUserName());
            stm.setString(3, u.getPassword());
            int count = stm.executeUpdate();
            if (count == 0) {
                result = false;
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            result = false;
        }
        return result;
    }

}
