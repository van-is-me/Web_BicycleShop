/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ADmin
 */
public class BikeFacade {

    //select all for admin
    public List<Bike> selectAllOfAdmin() {
        List<Bike> list = new ArrayList<>();
        String query = "select * from tblProduct";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Bike b = new Bike();
                b.setProductId(rs.getString("ProductId").trim());
                b.setProductName(rs.getString("ProductName"));
                b.setSize(rs.getString("Size"));
                b.setFrameMaterial(rs.getString("FrameMaterial"));
                b.setUnitPrice(rs.getInt("UnitPrice"));
                b.setColor(rs.getString("Color"));
                b.setCategoryId(rs.getString("CategoryId"));
                b.setBrandId(rs.getString("BrandId"));
                list.add(b);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(BikeFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //create product of Admin page
    public boolean create(Bike bike) {
        boolean result = true;
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement("insert into tblProduct values(?, ?, ?, ?, ?, ?, ?, ?)");
            stm.setString(1, bike.getProductId());
            stm.setString(2, bike.getProductName());
            stm.setString(3, bike.getSize());
            stm.setString(4, bike.getFrameMaterial());
            stm.setInt(5, bike.getUnitPrice());
            stm.setString(6, bike.getColor());
            stm.setString(7, bike.getCategoryId());
            stm.setString(8, bike.getBrandId());
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

    //search for admin page
    public List<Bike> search(String name) {
        List<Bike> list = selectAllOfAdmin();
        List<Bike> list2 = null;
        list2 = new ArrayList<>();
        for (Bike bike : list) {
            if (bike.getProductName().toLowerCase().matches("(.*)" + name.toLowerCase() + "(.*)")) {
                list2.add(bike);
            }
        }
        return list2;
    }

    //update for admin page
    public boolean update(Bike bike) {
        boolean result = true;
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement("update tblProduct set ProductName=?, Size=?, FrameMaterial=?, UnitPrice=?, Color=?, CategoryId=?, BrandId=? where ProductId=?");
            stm.setString(1, bike.getProductName());
            stm.setString(2, bike.getSize());
            stm.setString(3, bike.getFrameMaterial());
            stm.setInt(4, bike.getUnitPrice());
            stm.setString(5, bike.getColor());
            stm.setString(6, bike.getCategoryId());
            stm.setString(7, bike.getBrandId());
            stm.setString(8, bike.getProductId());
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

    //find by id for admin page
    public Bike find(String id) {
        Bike bike = null;
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement("select * from tblProduct where ProductId = ?");
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                bike = new Bike();
                bike.setProductId(rs.getString("ProductId"));
                bike.setProductName(rs.getString("ProductName"));
                bike.setSize(rs.getString("Size"));
                bike.setFrameMaterial(rs.getString("FrameMaterial"));
                bike.setUnitPrice(rs.getInt("UnitPrice"));
                bike.setColor(rs.getString("Color"));
                bike.setCategoryId(rs.getString("CategoryId"));
                bike.setBrandId(rs.getString("BrandId"));
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return bike;
    }

    //delete by id for admin page
    public boolean remove(String id) {
        boolean result = true;
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement("delete from tblProduct where ProductId = ?");
            stm.setString(1, id);
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

    //search quantity from productId
    public Bike findQuantity(String id) {
        Bike bike = null;
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement("select ProductId, Quantity from tblProShop where ProductId = ?");
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                bike = new Bike();
                bike.setProductId(rs.getString("ProductId"));
                bike.setQuantity(rs.getInt("Quantity"));
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return bike;
    }

    //update quantity in stock
    public boolean updateQuantity(Bike bike) {
        boolean result = true;
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement stm = con.prepareStatement("update tblProShop set Quantity = ? where ProductId= ?");
            stm.setInt(1, bike.getQuantity());
            stm.setString(2, bike.getProductId());
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

// select all product
    public List<Bike> selectAll() {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        try {

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName, s.Quantity,  i.url"
                    + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i"
                    + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%'");
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

// select all product by id
    public static Bike getBike(String id) throws SQLException {
        Bike Bike = null;
        //Connecting to a database
        Connection con = DBUtils.getConnection();
        //Executing the stm
        //Creating and executing sql statements            
        String sql
                = "select top 4 p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND p.ProductId = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, id);
        ResultSet rs = stm.executeQuery();
        //Loading data into the list                  
        if (rs.next()) {
            Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));

        }
        //Closing the connection
        con.close();
        return Bike;
    }

// select all product by catelory Xe đạp đường phố
    public List<Bike> selectByCateloryDP(boolean top) {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        String sql;
        try {
            if (top) {
                sql
                        = "select top 4 p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp đường phố'";
            } else {
                sql
                        = "select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp đường phố'";
            }

            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setString(1, catelory);
            ResultSet rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

    // select all product by catelory Địa hình
    public List<Bike> selectByCateloryDH(boolean top) {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        String sql;
        try {
            if (top) {
                sql
                        = "select top 4 p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp địa hình'";
            } else {
                sql
                        = "select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp địa hình'";
            }

            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setString(1, catelory);
            ResultSet rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

    // select all product by catelory Đua
    public List<Bike> selectByCateloryD(boolean top) {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        String sql;
        try {
            if (top) {
                sql
                        = "select top 4 p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp đua'";
            } else {
                sql
                        = "select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp đua'";
            }

            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setString(1, catelory);
            ResultSet rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

    // select all product by catelory Gấp
    public List<Bike> selectByCateloryG(boolean top) {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        String sql;
        try {
            if (top) {
                sql
                        = "select top 4 p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp gấp'";
            } else {
                sql
                        = "select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp gấp'";
            }

            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setString(1, catelory);
            ResultSet rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

    // select all product by catelory Nữ
    public List<Bike> selectByCateloryN(boolean top) {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        String sql;
        try {
            if (top) {
                sql
                        = "select top 4 p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp nữ'";
            } else {
                sql
                        = "select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp nữ'";
            }

            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setString(1, catelory);
            ResultSet rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

    // select all product by catelory Trẻ Em 
    public List<Bike> selectByCateloryTE(boolean top) {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        String sql;
        try {
            if (top) {
                sql
                        = "select top 4 p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp trẻ em'";
            } else {
                sql
                        = "select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                        + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                        + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND c.CategoryName = N'Xe đạp trẻ em'";
            }

            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setString(1, catelory);
            ResultSet rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

// select all product by brand 
    public List<Bike> selectByBrand(String brand) {
        List<Bike> list = null;
        Connection con = DBUtils.getConnection();
        String sql;
        try {

            sql
                    = "select p.ProductId, p.ProductName , p.Size , p.FrameMaterial, p.UnitPrice , p.Color, c.CategoryName, b.BrandName , s.Quantity,  i.url"
                    + " from [dbo].[tblProduct] p, [dbo].[tblCategory]  c, [dbo].[tblBrand]  b, [dbo].[tblProShop] s, [dbo].[tblImage] i "
                    + "where p.CategoryId = c.CategoryId AND p.BrandId = b.BrandId AND s.ProductId = p.ProductId AND i.ProductId = p.ProductId  AND i.ImageMain Like '%main%' AND b.BrandName = ?";

            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, brand);
            ResultSet rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                //    rs.getString("ProductId"), rs.getString("ProductName"),rs.getString("size"),rs.getString("frameMaterial"),rs.getInt("UnitPrice"),rs.getString("color"),rs.getString("categoryName"),rs.getString("brandName")
                Bike Bike = new Bike(rs.getString("ProductId"), rs.getString("ProductName"), rs.getString("size"), rs.getString("frameMaterial"), rs.getInt("UnitPrice"), rs.getString("color"), rs.getString("categoryName"), rs.getString("brandName"), rs.getInt("Quantity"), rs.getString("url"));
                list.add(Bike);
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

//list image by idproduct
    // select all product by brand 
    public List<String> listImageDetail(String id) {
        List<String> list = new ArrayList<>();
        Connection con = DBUtils.getConnection();
        String sql;
        try {

            sql
                    = "select i.url "
                    + "from [tblProduct] p, [tblImage] i "
                    + "where  p.ProductId = i.ProductId AND i.ImageMain Like ? AND p.ProductId = ?";

            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%detail%");
            stm.setString(2, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("url"));
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }
}
