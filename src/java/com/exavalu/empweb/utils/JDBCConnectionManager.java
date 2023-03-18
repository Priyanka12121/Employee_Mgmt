/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.empweb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hp
 */
public class JDBCConnectionManager {

    public static Connection getMySQLConnection() {
		Connection connection = null;

		try {
			PropertyFileReader util = PropertyFileReader.getInstance();
			String user = util.getPropertyValue("user");
			String password = util.getPropertyValue("pass");
			String url = util.getPropertyValue("url");
			String dbName = util.getPropertyValue("dbName");
			String driverName = util.getPropertyValue("driverName");

			// we use use the url, userid and passowrd to ge the connection
			System.out.println("Got driverName = " + driverName);
			Class.forName(driverName);

			connection = DriverManager.getConnection(url + dbName, user, password);

		} catch (ClassNotFoundException | SQLException ex) {

			ex.printStackTrace();

		}

		return connection;

	}
}
