/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.User;

/**
 *
 * @author Kri
 */
@MultipartConfig
@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
public class ProfileController extends HttpServlet {

    RequestDispatcher rd;
    UserDAO userDAO = UserDAO.getInstance();

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

        User user = new User();
        user.setFirstName(request.getParameter("fName"));
        user.setLastName(request.getParameter("lName"));
        user.setEmail(request.getParameter("email"));
 
        user.setUname(request.getSession().getAttribute("user").toString());

        String UPLOAD_DIRECTORY = "C:\\uploads\\users";
	Part filePart = request.getPart("picture");
	String fileName = user.getUname() + ".png";
	Path uploadDir = Paths.get(UPLOAD_DIRECTORY);
	try {
            Files.createDirectory(uploadDir);
	} catch (FileAlreadyExistsException fe) {
	}
	Path uploadPath = Paths.get(uploadDir.toString(), fileName);
        if (filePart != null) {
            filePart.write(uploadPath.toString());  
            user.setPicture(uploadPath.toString());
        }
	// Include Image Path in Database
	userDAO.addPictureToUser(user.getUname(), uploadPath.toString());
        
        if (userDAO.modifyUser(user)) //user was updated successfully
        {
            request.setAttribute("USERINPUT", user);
        } else {
            request.setAttribute("ERRORS", "Ops.. something went wrong");
        }
        rd = request.getRequestDispatcher("ProfileView");
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
