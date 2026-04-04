package com.nanakusa.filter;

import com.nanakusa.util.JwtUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class JwtFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;

        String path = req.getRequestURI();

        //Matar sesiones
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // permitir login
        if (path.contains("index") || path.contains("login")) {
            chain.doFilter(request, response);
            return;
        }

        String authHeader = req.getHeader("Authorization");

        System.out.println("Authorization: " + authHeader);

        if (authHeader != null && authHeader.startsWith("Bearer ")) {

            String token = authHeader.substring(7);
            String user = JwtUtil.validateToken(token);

            if (user != null) {
                request.setAttribute("user", user);
                chain.doFilter(request, response);
                return;
            }
        }

        ((HttpServletResponse) response).setStatus(HttpServletResponse.SC_UNAUTHORIZED);
    }
}
