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
     * @return Boolean whether username exists or not
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public boolean userExists(String username) {

        connection = DBConnection.getInstance();
        try {
            // Statement
            Statement instr = connection.createStatement();
            // Search for users
            String sql = "SELECT * FROM users WHERE username = '" + username + "'";
            ResultSet rs = instr.executeQuery(sql);
            if (rs.next()) {
                // Unique User
                rs.close();
                instr.clearBatch();
                return true;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean credentialsMatch(String uname, String password) {
        connection = DBConnection.getInstance();
        try {
            PreparedStatement prepStmt = connection
                    .prepareStatement("SELECT * FROM users u WHERE u.username = ? AND u.password = ?");
            prepStmt.setString(1, uname);
            prepStmt.setString(2, Hash.getHash(password));
            ResultSet rs = prepStmt.executeQuery();
            if (rs.next()) {
                rs.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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
                    "INSERT INTO users(email, password) VALUES ( ? , ? );");
            stm.setString(1, user.getEmail());
            stm.setString(2, Hash.getHash(user.getPassword()));
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
    
    
    public boolean modifyUser(User user){
        //TODO: Modify or add extra User Data
        return false;
    }
}
