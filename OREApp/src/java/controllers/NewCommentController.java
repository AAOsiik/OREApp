/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Comment;

/**
 *
 * @author Kri
 */
@WebServlet(name = "NewCommentController", urlPatterns = {"/NewCommentController"})
public class NewCommentController extends HttpServlet {

    CommentDAO commentDAO = CommentDAO.getInstance();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String c = request.getParameter("comment");
        int recipeID = Integer.parseInt(request.getParameter("recipeID"));
        int userID = Integer.parseInt(request.getSession().getAttribute("userid").toString());

        Comment comment = new Comment();
        comment.setComment(c);
        comment.setRecipeId(recipeID);
        comment.setUserId(userID);
        comment.setUsername(request.getSession().getAttribute("user").toString());

        int commentID = commentDAO.createComment(comment);

        if (commentID != -1) {
            List<Comment> commentList = commentDAO.getComments(recipeID,userID);
            request.getSession().setAttribute("COMMENTS", commentList);
        } else {
            request.getSession().setAttribute("ERRORS", "Comment Error!");
        }
        RequestDispatcher rd = request.getRequestDispatcher("RecipeDetailView");
        rd.forward(request, response);
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}