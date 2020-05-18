/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.RecipeDAO;
import dao.UserRecipeDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Recipe;

/**
 *
 * @author Kri
 */
@WebServlet(name = "DeleteFavouriteController", urlPatterns = {"/DeleteFavouriteController"})
public class DeleteFavouriteController extends HttpServlet {

    UserRecipeDAO userRecipeDAO = UserRecipeDAO.getInstance();
    RecipeDAO recipeDAO = RecipeDAO.getInstance();

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

        int recipeID = Integer.parseInt(request.getParameter("recipeID"));
        int userID = Integer.parseInt(request.getSession().getAttribute("userid").toString());

        if (!userRecipeDAO.removeFavourite(userID, recipeID)) {
            request.getSession().setAttribute("ERRORS", "Error, cannot delete this favourite");
        } else {
            request.getSession().setAttribute("ERRORS", null);
        }
        List<Recipe> favs = recipeDAO.getFavouriteRecipes(userID);

        request.getSession().setAttribute("FAVS", favs);

        RequestDispatcher rd = request.getRequestDispatcher("FavouritesView");
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
