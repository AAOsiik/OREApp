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
import utils.DBConnection;

/**
 *
 * @author Alexander
 */
public class RecipeDAO {
    
    private Connection connection;
    private static RecipeDAO instance;
    
    public static RecipeDAO getInstance() {
        if (instance == null) {
            instance = new RecipeDAO();
        }
        return instance;
    }
    
    private RecipeDAO() {
    }

    /**
     * Returns all available items
     *
     * @return List of Products
     */
    public List<Recipe> getRecipes() {
        String sql = "select * from recipes";
        List<Recipe> recipes = new ArrayList<>();
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                Recipe recipe = new Recipe();
                recipe.setId(rs.getInt("id"));
                recipe.setUserId(rs.getInt("userid"));
                recipe.setTitle(rs.getString("title"));
                recipe.setDescription(rs.getString("description"));
                recipe.setCategory(rs.getString("category"));
                recipe.setDifficulty(rs.getString("difficulty"));
                recipe.setTags(rs.getString("tags"));
                recipe.setPicture(rs.getString("picture"));
                
                recipes.add(recipe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recipes;
    }

    /**
     * Creates a new recipe
     *
     * @param recipe
     * @return
     */
    public int createRecipe(Recipe recipe) {
        // Create Product
        String sql = "INSERT INTO recipes(userid, title, category, difficulty, tags, description) "
                + "VALUES ( ? , ? , ? , ? , ? , ?);";
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql,
                        Statement.RETURN_GENERATED_KEYS);) {
            prepStmt.setInt(1, recipe.getUserId());
            prepStmt.setString(2, recipe.getTitle());
            prepStmt.setString(3, recipe.getCategory());
            prepStmt.setString(4, recipe.getDifficulty());
            prepStmt.setString(5, recipe.getTags());
            prepStmt.setString(6, recipe.getDescription());

            // execute
            prepStmt.executeUpdate();
            int last_inserted_id = 0;
            ResultSet rs = prepStmt.getGeneratedKeys();
            if (rs.next()) {
                last_inserted_id = rs.getInt(1);
            }
            // close
            prepStmt.clearBatch();
            connection.close();
            return last_inserted_id;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public boolean recipeExists(String title) {
        
        connection = DBConnection.getInstance();
        try {
            // Statement
            Statement instr = connection.createStatement();
            // Search for products
            String sql = "SELECT * FROM recipes WHERE title = '" + title + "'";
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

    /**
     * Adds image to existing recipe
     *
     * @param recipe
     * @return
     */
    public boolean addPictureToRecipe(int id, String path) {
        // Add to Recipe
        String sql = "UPDATE recipes SET picture = ? WHERE (id = ?);";
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.setString(1, path);
            prepStmt.setInt(2, id);
            // execute
            prepStmt.executeUpdate();
            // close
            prepStmt.clearBatch();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Recipe> searchRecipes(String search) {
        List<Recipe> recipes = new ArrayList<>();
        
        try (Connection connection = DBConnection.getInstance()) {
            search = search.toUpperCase();
            PreparedStatement pstmt = connection.prepareStatement(
                    "SELECT * FROM recipes WHERE UPPER(title) LIKE ? OR UPPER(tags) LIKE ? ESCAPE '!'");
            pstmt.setString(1, "%" + search + "%");
            pstmt.setString(2, "%" + search + "%");
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Recipe recipe = new Recipe();
                recipe.setId(rs.getInt("id"));
                recipe.setUserId(rs.getInt("userid"));
                recipe.setTitle(rs.getString("title"));
                recipe.setDescription(rs.getString("description"));
                recipe.setCategory(rs.getString("category"));
                recipe.setDifficulty(rs.getString("difficulty"));
                recipe.setTags(rs.getString("tags"));
                recipe.setPicture(rs.getString("picture"));
                
                recipes.add(recipe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recipes;
    }
    
    public Recipe getRecipe(int recipeID) {
        Recipe recipe = new Recipe();
        
        connection = DBConnection.getInstance();
        try {
            // Statement
            Statement instr = connection.createStatement();
            // Search for products
            String sql = "SELECT * FROM recipes WHERE id = '" + recipeID + "'";
            ResultSet rs = instr.executeQuery(sql);
            if (rs.next()) {
                // Recipe exists
                recipe.setId(rs.getInt("id"));
                recipe.setId(rs.getInt("id"));
                recipe.setUserId(rs.getInt("userid"));
                recipe.setTitle(rs.getString("title"));
                recipe.setDescription(rs.getString("description"));
                recipe.setCategory(rs.getString("category"));
                recipe.setDifficulty(rs.getString("difficulty"));
                recipe.setTags(rs.getString("tags"));
                recipe.setPicture(rs.getString("picture"));
                rs.close();
                instr.clearBatch();
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return recipe;
    }
    
    public List<Recipe> getFavouriteRecipes(int userid) {
        
        String sql = "SELECT * FROM recipes R, favourites F where R.id = F.recipeid AND F.f_userid = " + userid + ";";
        List<Recipe> recipes = new ArrayList();
        
        try (Connection connection = DBConnection.getInstance()) {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Recipe recipe = new Recipe();
                recipe.setId(rs.getInt("id"));
                recipe.setUserId(rs.getInt("userid"));
                recipe.setTitle(rs.getString("title"));
                recipe.setDescription(rs.getString("description"));
                recipe.setCategory(rs.getString("category"));
                recipe.setDifficulty(rs.getString("difficulty"));
                recipe.setTags(rs.getString("tags"));
                recipe.setPicture(rs.getString("picture"));
                recipe.setIsFavourite(1);
                
                recipes.add(recipe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recipes;
    }
}
