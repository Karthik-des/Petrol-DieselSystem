package com.karthik.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/petrol_diesel_db";
    private static final String USER = "root"; // Change this if needed
    private static final String PASSWORD = "Karthik7@@"; // Add your MySQL password if set
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    // Establish Database Connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
