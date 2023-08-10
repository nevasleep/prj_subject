package view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Product;

public class AccountDAO extends DBContext {

    public void insertAccount(Account account) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[mail]\n"
                    + "           ,[phone]\n"
                    + "           ,[address])\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)");
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getMail());
            ps.setString(4, account.getPhone());
            ps.setString(5, account.getAddress());
            ps.setInt(6, account.getRole());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Account getAccount(String username, String password) {
        Account account = new Account();
        try {
            String sql = "select  * from account where username = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account p = new Account(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));

                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
