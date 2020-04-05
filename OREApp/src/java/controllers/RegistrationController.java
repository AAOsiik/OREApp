/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import model.User;

@WebServlet(name = "RegistrationController", urlPatterns = {"/RegistrationController"})
public class RegistrationController extends HttpServlet {

    RequestDispatcher rd;
    UserDAO userDAO = UserDAO.getInstance();

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error = "";
        boolean hasErrors = false;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("uname");
        // Create User
        User user = new User();
        user.setEmail(email);
        user.setUname(username);
        // Check if user already exists
        if ((error = userDAO.userExists(username, email)) != "") {
            hasErrors = true;
        }
        if (hasErrors) {
            // Set Attributes
            request.setAttribute("USERINPUT", user);
            request.setAttribute("ERRORS", error);
            rd = request.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        } else {
            user.setPassword(password);
            user.setIsComplete(0);
            if (userDAO.createUser(user)) {
                rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            } else {
                error = "Error creating user.";
                request.setAttribute("USERINPUT", user);
                request.setAttribute("ERRORS", error);
                rd = request.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
            }
        }
    }

}
