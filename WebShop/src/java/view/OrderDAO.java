package view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Account;
import model.Order;

public class OrderDAO extends DBContext {

    public int insertOrder(Order order) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[OrderList]\n"
                    + "           ([total]\n"
                    + "           ,[username]\n"
                    + "           ,[phone]\n"
                    + "           ,[address])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, order.getTotal());
            ps.setString(2, order.getUserName());
            ps.setString(3, order.getPhone());
            ps.setString(4, order.getAddress());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> orderList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from [OrderList]");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5));
                orderList.add(order);
            }
        } catch (SQLException e) {
        }
        return orderList;
    }
}
