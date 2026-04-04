package com.nanakusa.servlet;

import com.nanakusa.dao.UserDAO;
import com.nanakusa.util.JwtUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (dao.validate(username, password)) {

            String token = JwtUtil.generateToken(username);

            String json = "{"
                    + "\"token\":\"" + token + "\","
                    + "\"type\":\"Bearer\","
                    + "\"username\":\"" + username + "\""
                    + "}";

            response.getWriter().write(json);

        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"error\":\"Credenciales inválidas\"}");
        }
    }
}
