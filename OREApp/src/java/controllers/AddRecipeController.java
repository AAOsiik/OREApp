/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.RecipeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Recipe;

/**
 *
 * @author Alexander
 */
@MultipartConfig
public class AddRecipeController extends HttpServlet {

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

        RequestDispatcher rd;
		String error = "";
		boolean hasErrors = false;
                
                int userId = Integer.parseInt(request.getSession().getAttribute("userid").toString());
		String title = request.getParameter("title");
		String description = request.getParameter("description");
                String category = request.getParameter("category");
                String difficulty = request.getParameter("difficulty");
                String tags = request.getParameter("tags");
                
		Recipe recipe = new Recipe();
                recipe.setUserId(userId);
		recipe.setTitle(title);
		recipe.setDescription(description);
		recipe.setCategory(category);
		recipe.setDifficulty(difficulty);
                recipe.setTags(tags);
                
                // Check if recipe already exists
		if (recipeDAO.recipeExists(title)) {
			hasErrors = true;
			error = "Recipe with this title already exists!";
		}
		if (hasErrors) {
			request.setAttribute("INPUT", recipe);
			request.setAttribute("ERRORS", error);
			rd = request.getRequestDispatcher("/addRecipe.jsp");
			rd.forward(request, response);
			return;
		}
		
		// Otherwise, save 
		int id = recipeDAO.createRecipe(recipe);	
		recipe.setId(id);
		List<Recipe> recipes = (List<Recipe>) request.getServletContext().getAttribute("RECIPES");
		recipes.add(recipe);
		request.getServletContext().setAttribute("RECIPES", recipes);
		
		String UPLOAD_DIRECTORY = "C:\\uploads\\images";
		Part filePart = request.getPart("picture");
		String fileName = id + "_" + title + ".png";
		Path uploadDir = Paths.get(UPLOAD_DIRECTORY);
		try {
			Files.createDirectory(uploadDir);
		} catch (FileAlreadyExistsException fe) {
		}
		Path uploadPath = Paths.get(uploadDir.toString(), fileName);				
		filePart.write(uploadPath.toString());
		// Include Image Path in Database
		recipeDAO.addPictureToRecipe(id, uploadPath.toString());
		request.getRequestDispatcher("index.jsp").forward(request, response);
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
