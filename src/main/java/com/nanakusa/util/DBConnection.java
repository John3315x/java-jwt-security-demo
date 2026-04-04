package com.nanakusa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/db_lab_sessions?useSSL=false&serverTimezone=UTC";
    private static final String USER = "devuser";
    private static final String PASSWORD = "aduf#3=845g9/";

    public static Connection getConnection() throws SQLException {
        try {
            // 🔥 Cargar driver (esto evita tu error)
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (ClassNotFoundException e) {
            System.out.println("Error: Driver no encontrado");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: No se pudo conectar a la BD");
            e.printStackTrace();
        }
        return null;
    }
}
