/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Alexander
 */
public class DBConnection {
	private Connection connection;
	private static DBConnection instance;

	/**
	 * Creates new connection to users database
	 * 
	 * @throws SQLException
	 */
	private DBConnection() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/oreapp");
			connection = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Returns instance if connection is open, else creates and returns a new one.
	 * 
	 * @return Open or new instance.
	 * @throws SQLEsception
	 */
	public static Connection getInstance() {
		try {
			if (instance == null) {
				instance = new DBConnection();
			} else if (instance.getConnection().isClosed()) {
				instance = new DBConnection();
			}
		} catch (SQLException e) {
			System.err.println("Could not open db connction");
			e.printStackTrace();
		}
		return instance.getConnection();
	}

	/**
	 * @return The connection to users database.
	 */
	private Connection getConnection() {
		return connection;
	}
}
