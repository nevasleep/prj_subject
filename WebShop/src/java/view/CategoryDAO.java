package view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;

public class CategoryDAO extends DBContext {

    public ArrayList<Category> getCategory() {
        ArrayList<Category> proCate = new ArrayList<>();
        try {
            String sql = "select * from [category]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                proCate.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return proCate;
    }
}
