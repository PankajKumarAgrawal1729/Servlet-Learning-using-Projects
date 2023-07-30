package com.pankaj;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddServlet extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));
		
		int sum = num1 + num2;
		
		PrintWriter out = res.getWriter();
		out.println("<h1>Result is: " + sum + "</h1>");
	}
	
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
	
	//only working for Get request
//	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
//		int num1 = Integer.parseInt(req.getParameter("num1"));
//		int num2 = Integer.parseInt(req.getParameter("num2"));
//		
//		int sum = num1 + num2;
//		
//		PrintWriter out = res.getWriter();
//		out.println("<h1>Result is: " + sum + "</h1>");
//	}
}
