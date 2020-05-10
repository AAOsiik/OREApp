/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import dao.RecipeDAO;
import dao.UserDAO;
import dao.UserRecipeDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import model.Recipe;
import model.UserRecipe;

/**
 * Web application lifecycle listener.
 *
 * @author Alexander
 */
public class contextListener implements ServletContextListener {

    // OLD
    // RecipeDAO recipeDAO = RecipeDAO.getInstance();
    // NEW
    UserRecipeDAO userRecipeDAO = UserRecipeDAO.getInstance();
    
     /**
     * Default constructor. 
     */
    public contextListener() {}
    
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Get Products
    	List<UserRecipe> recipes = new ArrayList<>();
    	recipes = userRecipeDAO.getCombinedRecipesInfo();
    	// Set Context
    	sce.getServletContext().setAttribute("RECIPES", recipes);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
