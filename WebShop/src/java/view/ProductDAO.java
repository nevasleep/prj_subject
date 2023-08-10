package view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;

public class ProductDAO extends DBContext {

    public ArrayList<Product> getNewProduct() {
        ArrayList<Product> proList = new ArrayList<>();
        try {
            String sql = "select top 6  * from product order by product_id desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getString(8));

                proList.add(p);
            }
        } catch (SQLException e) {
        }
        return proList;
    }

    public ArrayList<Product> getSaleProduct() {
        ArrayList<Product> proList = new ArrayList<>();
        try {
            String sql = "select top 6 * from product order by (product_price/product_salePrice) desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getString(8));

                proList.add(p);
            }
        } catch (SQLException e) {
        }
        return proList;
    }

    public ArrayList<Product> getAllProduct(String search, String category) {
        ArrayList<Product> proList = new ArrayList<>();
        try {
            String sql = "select * from product where 1 = 1 ";
            if (search != null && !search.equals("")) {
                sql += " and product_name like ?";
            }
            if (category != null && !category.equals("-1") && !category.equals("")) {
                sql += " and category_id = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (search != null && !search.equals("")) {
                stm.setString(1, "%" + search + "%");
            }
            if (category != null && !category.equals("-1") && !category.equals("")) {
                int cate = Integer.parseInt(category);
                stm.setInt(1, cate);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getString(8));

                proList.add(p);
            }
        } catch (SQLException e) {
        }
        return proList;
    }

    public ArrayList<Product> getRelateProduct(int id) {
        ArrayList<Product> proList = new ArrayList<>();
        try {
            String sql = "select top 6 * from product where product_id != ? and category_id = (select category_id from product where product_id = ?) order by product_id desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getString(8));

                proList.add(p);
            }
        } catch (SQLException e) {
        }
        return proList;
    }

    public Product getProduct(int id) {
        Product product = new Product();
        try {
            String sql = "select  * from product where product_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getString(8));

                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<Product> getAdminProduct() {
        ArrayList<Product> proList = new ArrayList<>();
        try {
            String sql = "select * from product";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getString(8));

                proList.add(p);
            }
        } catch (SQLException e) {
        }
        return proList;
    }

//    public static void main(String[] args) {
//        System.out.println(new ProductDAO().getAllProduct("x",null).size());
//        System.out.println(new ProductDAO().getRelateProduct(48));
//    }
    public void changeProduct(String name, String image, int quantity, double price, String description, int id) {

        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[product]\n"
                    + "   SET\n"
                    + "      [product_name] = ?\n"
                    + "      ,[product_salePrice] = ?\n"
                    + "      ,[product_describe] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[img] = ?\n"
                    + " WHERE product_id = ?");
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setInt(4, quantity);
            ps.setString(5, image);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addProduct(String name, String image, int quantity, double price, int cate_id, String description) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[product]\n"
                    + "           ([category_id]\n"
                    + "           ,[product_name]\n"
                    + "           ,[product_salePrice]\n"
                    + "           ,[product_describe]\n"
                    + "           ,[quantity]\n"
                    + "           ,[img])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)");
            ps.setInt(1, cate_id);
            ps.setString(2, name);
            ps.setDouble(3, price);
            ps.setString(4, description);
            ps.setInt(5, quantity);
            ps.setString(6, image);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteProduct(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM [dbo].[product]\n"
                    + "      WHERE product_id = ?");
            ps.setInt(1, id);

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
