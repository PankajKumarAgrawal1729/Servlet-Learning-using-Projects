package com.pankaj;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/square")
public class SquareServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		//if we set attribute in servlet ans use RequestDispatcher
//		int sum = (int)(req.getAttribute("sum"));
		
		//using sendRedirect
//		int sum = Integer.parseInt(req.getParameter("sum"));
		
		//using httpsession(Session)
//		HttpSession session = req.getSession();
//		int sum = (int)session.getAttribute("sum");
//		
//		//remove value from session
//		session.removeAttribute("sum");
		int sum = 0;
		//Cookie
		Cookie[] cookies = req.getCookies();
		for(Cookie c : cookies) {
			if(c.getName().equals("sum")) {
				sum = Integer.parseInt(c.getValue());
			}
		}
		
//		System.out.println(sum);
		int square = sum * sum;
		PrintWriter out = res.getWriter();
		out.println("<h1>Value is: " + sum + "</h1>");
		out.println("<h1>Square is: " + square + "</h1>");
	}
}
