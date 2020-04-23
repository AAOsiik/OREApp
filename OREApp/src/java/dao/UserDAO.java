/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import model.User;
import utils.DBConnection;
import utils.Hash;

/**
 *
 * @author Alexander
 */
public class UserDAO {

    private Connection connection;
    private static UserDAO instance;

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    private UserDAO() {
    }

    /**
     * *
     * Checks whether username already exists in userss database.
     *
     * @param username
     * @param email
     * @return Boolean whether username exists or not
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public String userExists(String username, String email) {

        connection = DBConnection.getInstance();
        try {
            // Statement
            Statement instr = connection.createStatement();
            // Search for users
            String sql = "SELECT * FROM users WHERE email = '" + email + "'";
            ResultSet rs = instr.executeQuery(sql);

            if (rs.next()) {
                return "User with this email already exists";
            } else {
                sql = "SELECT * FROM users WHERE username = '" + username + "'";
                rs = instr.executeQuery(sql);

                if (rs.next()) {
                    return "Username alreday taken, please chose another one";
                } else {
                    instr.clearBatch();
                    rs.close();
                    instr.clearBatch();
                    return "";
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Error";
    }

    public User credentialsMatch(String uname, String password) {
        connection = DBConnection.getInstance();
        try {
            PreparedStatement prepStmt = connection
                    .prepareStatement("SELECT * FROM users u WHERE (u.email = ? OR u.username = ?) AND u.password = ?");
            prepStmt.setString(1, uname);
            prepStmt.setString(2, uname);
            prepStmt.setString(3, Hash.getHash(password));
            ResultSet rs = prepStmt.executeQuery();
            String psw = Hash.getHash(password);
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUname(rs.getString("username"));
                rs.close();
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * *
     * Inserts a new user into users database
     *
     * @param user
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public boolean createUser(User user) {

        connection = DBConnection.getInstance();
        // Add user
        try {
            PreparedStatement stm = connection.prepareStatement(
                    "INSERT INTO users(username, email, password, complete) VALUES ( ? , ? , ?, ?);");
            stm.setString(1, user.getUname());
            stm.setString(2, user.getEmail());
            stm.setString(3, Hash.getHash(user.getPassword()));
            stm.setString(4, Integer.toString(user.getIsComplete()));
            // TODO: Adjust to modify User Data
            // execute
            stm.execute();
            // close
            stm.clearBatch();
            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /**
     *
     * Updates users first and last name
     *
     * @param user
     * @return
     */
    public boolean modifyUser(User user) {
        connection = DBConnection.getInstance();

        try {
            PreparedStatement stm = connection.prepareStatement(
                    "UPDATE users "
                    + "SET firstname = ?, lastname = ? "
                    + "WHERE username = ?");
            stm.setString(1, user.getFirstName());
            stm.setString(2, user.getLastName());
            stm.setString(3, user.getUname());

            stm.execute();
            stm.clearBatch();
            connection.close();
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public User getUserInfo(String uname) {
        connection = DBConnection.getInstance();

        try {
            PreparedStatement stm = connection.prepareStatement(
                    "SELECT * FROM users where username = ?");
            stm.setString(1, uname);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUname(rs.getString("username"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                rs.close();
                connection.close();
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }
}
