package db;

import model.Item;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class DbManager {
    private static Connection connection;

    static {
        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/Sprint2",
                    "postgres",
                    "admin"
            );
        }
        catch (ClassNotFoundException | java.sql.SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Item> getItems() {
        List<Item> items = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * FROM ITEMS"
            );
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getLong("ID"));
                item.setName(resultSet.getString("NAME"));
                item.setDescription(resultSet.getString("DESCRIPTION"));
                item.setPrice(resultSet.getDouble("PRICE"));
                items.add(item);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return items;
    }

    public static String login(String email, String password) {
        User user = getUserByEmail(email);
        if (user == null){
            return "EmailError";
        }
        if (!Objects.equals(user.getPassword(), password)) {
            return "PasswordError";
        }
        return "Success";
    }

    public static User getUserByEmail(String email) {
        User user = null;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * FROM USERS WHERE EMAIL = ?"
            );
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                user = new User();
                user.setId(resultSet.getLong("ID"));
                user.setEmail(resultSet.getString("EMAIL"));
                user.setPassword(resultSet.getString("PASSWORD"));
                user.setFullName(resultSet.getString("FULL_NAME"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
