/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import utils.DBConnection;

/**
 *
 * @author Alexander
 */
public class CommentDAO implements Serializable{
    
    private Connection connection;
    private static CommentDAO instance;

    public static CommentDAO getInstance() {
        if (instance == null) {
            instance = new CommentDAO();
        }
        return instance;
    }

    private CommentDAO() {
    }
    
    /**
     * Returns all available items depending
     * 
     * @return List of Recipess
     */
    public List<Comment> getComments() {
        String sql = "select * from comments";
        List<Comment> comments = new ArrayList<>();
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setUserId(rs.getInt("userid"));
                comment.setRecipeId(rs.getInt("recipeid"));
                comment.setComment(rs.getString("comment"));

                comments.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }
    
    
    /**
     * Returns all available items depending on id
     * 
     * @param id the Id
     * @return List of Recipess
     */
    public List<Comment> getComments(int id) {
        String sql = "select * from comments";
        if (id > 0) {
            sql += " where id = '"+ id +"'";
        }
        List<Comment> comments = new ArrayList<>();
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setUserId(rs.getInt("userid"));
                comment.setRecipeId(rs.getInt("recipeid"));
                comment.setComment(rs.getString("comment"));

                comments.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }
    
    
     public int createComment(Comment comment) {
        // Create Product
        String sql = "INSERT INTO comments(userid, recipeid, comment) "
                + "VALUES ( ? , ? , ? );";
        try (Connection connection = DBConnection.getInstance();
                PreparedStatement prepStmt = connection.prepareStatement(sql,
                        Statement.RETURN_GENERATED_KEYS);) {
            prepStmt.setInt(1, comment.getUserId());
            prepStmt.setInt(2, comment.getRecipeId());
            prepStmt.setString(3, comment.getComment());

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
}
