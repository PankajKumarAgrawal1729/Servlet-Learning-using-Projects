package com.pankaj;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add")
public class AddServlet extends HttpServlet {
	
//	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
//		int num1 = Integer.parseInt(req.getParameter("num1"));
//		int num2 = Integer.parseInt(req.getParameter("num2"));
//		
//		int sum = num1 + num2;
//		
//		PrintWriter out = res.getWriter();
//		out.println("<h1>Result is: " + sum + "</h1>");
//	}
	
	//only work for post request
//	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
//		int num1 = Integer.parseInt(req.getParameter("num1"));
//		int num2 = Integer.parseInt(req.getParameter("num2"));
//		
//		int sum = num1 + num2;
//		
//		PrintWriter out = res.getWriter();
//		out.println("<h1>Result is: " + sum + "</h1>");
//	}
	
//	only working for Get request
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));
		
		int sum = num1 + num2;
//		System.out.println(sum);
//		PrintWriter out = res.getWriter();
//		out.println("<h1>Result is: " + sum + "</h1>");
		
		
//		//RequestDispatcher
//		req.setAttribute("sum", sum);
//		RequestDispatcher rd = req.getRequestDispatcher("square");
//		rd.forward(req, res);
		
		//sendRedirect
//		res.sendRedirect("square?sum=" + sum);
		
		//session management
//		HttpSession session = req.getSession();
//		session.setAttribute("sum", sum);
		
		//Cookie
		Cookie cookie = new Cookie("sum", sum + "");
		res.addCookie(cookie);
		res.sendRedirect("square");
		
	}
}
