/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import dao.RecipeDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import model.Recipe;

/**
 * Web application lifecycle listener.
 *
 * @author Alexander
 */
public class contextListener implements ServletContextListener {

    RecipeDAO recipeDAO = RecipeDAO.getInstance();
     /**
     * Default constructor. 
     */
    public contextListener() {}
    
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Get Products
    	List<Recipe> recipes = new ArrayList<>();
    	recipes = recipeDAO.getRecipes();
    	// Set Context
    	sce.getServletContext().setAttribute("RECIPES", recipes);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
