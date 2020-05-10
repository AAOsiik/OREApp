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
        String sql =    "SELECT recipes.id," +
                        "recipes.userid," +
                        "users.username," +
                        "recipes.title," +
                        "recipes.description," +
                        "recipes.category," +
                        "recipes.difficulty," +
                        "recipes.tags," +
                        "recipes.picture" +
                        " FROM recipes" +
                        " LEFT JOIN users ON (recipes.userid=users.id);";
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
}
