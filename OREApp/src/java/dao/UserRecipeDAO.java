/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Recipe;
import model.UserRecipe;
import utils.DBConnection;

/**
 *
 * @author Alexander
 */
public class UserRecipeDAO {

    private Connection connection;
    private static UserRecipeDAO instance;

    public static UserRecipeDAO getInstance() {
        if (instance == null) {
            instance = new UserRecipeDAO();
        }
        return instance;
    }

    private UserRecipeDAO() {
    }

    /**
     * Returns all available items
     *
     * @return List of Recipes
     */
    public List<UserRecipe> getCombinedRecipesInfo() {
        String sql = "SELECT recipes.id,"
                + "recipes.userid,"
                + "users.username,"
                + "recipes.title,"
                + "recipes.description,"
                + "recipes.category,"
                + "recipes.difficulty,"
                + "recipes.tags,"
                + "recipes.picture"
                + " FROM recipes"
                + " LEFT JOIN users ON (recipes.userid=users.id);";
        List<UserRecipe> recipes = new ArrayList<>();
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                UserRecipe userRecipe = new UserRecipe();
                userRecipe.setId(rs.getInt("id"));
                userRecipe.setUserId(rs.getInt("userid"));
                userRecipe.setUsername(rs.getString("username"));
                userRecipe.setTitle(rs.getString("title"));
                userRecipe.setDescription(rs.getString("description"));
                userRecipe.setCategory(rs.getString("category"));
                userRecipe.setDifficulty(rs.getString("difficulty"));
                userRecipe.setTags(rs.getString("tags"));
                userRecipe.setPicture(rs.getString("picture"));

                recipes.add(userRecipe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recipes;
    }

    public List<UserRecipe> searchCombinedRecipesInfo(String search) {
        search = search.toUpperCase();
        String sql = "SELECT recipes.id,"
                + "recipes.userid,"
                + "users.username,"
                + "recipes.title,"
                + "recipes.description,"
                + "recipes.category,"
                + "recipes.difficulty,"
                + "recipes.tags,"
                + "recipes.picture"
                + " FROM recipes"
                + " LEFT JOIN users ON (recipes.userid=users.id) "
                + "WHERE UPPER(title) LIKE ? OR UPPER(tags) LIKE ? ESCAPE '!';";
        List<UserRecipe> recipes = new ArrayList<>();
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {

            prepStmt.setString(1, "%" + search + "%");
            prepStmt.setString(2, "%" + search + "%");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                UserRecipe userRecipe = new UserRecipe();
                userRecipe.setId(rs.getInt("id"));
                userRecipe.setUserId(rs.getInt("userid"));
                userRecipe.setUsername(rs.getString("username"));
                userRecipe.setTitle(rs.getString("title"));
                userRecipe.setDescription(rs.getString("description"));
                userRecipe.setCategory(rs.getString("category"));
                userRecipe.setDifficulty(rs.getString("difficulty"));
                userRecipe.setTags(rs.getString("tags"));
                userRecipe.setPicture(rs.getString("picture"));

                recipes.add(userRecipe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recipes;
    }

    public boolean addFavouriteRecipe(int userid, int recipeid) {
        String sql = "INSERT INTO favourites(f_userid, recipeid) "
                + "VALUES ( ? , ?);";
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.setInt(1, userid);
            prepStmt.setInt(2, recipeid);

            // execute
            prepStmt.executeUpdate();
            // close
            prepStmt.clearBatch();
            connection.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeFavourite(int userID, int recipeID) {
        String sql = "DELETE FROM favourites f WHERE f.f_userid=" + userID + " AND f.recipeid=" + recipeID + ";";
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            // execute
            prepStmt.executeUpdate();
            // close
            prepStmt.clearBatch();
            connection.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean isFavourite(int userid, int recipeid) {
        String sql = "SELECT * FROM favourites F WHERE F.f_userid = " + userid + " AND F.recipeid = " + recipeid + ";";
        connection = DBConnection.getInstance();
        try {
            // Statement
            Statement instr = connection.createStatement();
            // Search for products
            ResultSet rs = instr.executeQuery(sql);
            if (rs.next()) {
                // Recipe exists
                rs.close();
                instr.clearBatch();
                return true;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
