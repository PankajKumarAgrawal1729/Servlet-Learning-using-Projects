package com.pankaj;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		
//		Servlet Context
//		ServletContext ctx = getServletContext();
//		String name = ctx.getInitParameter("name");
		
		//Servlet Config
		ServletConfig cg = getServletConfig();
		String name = cg.getInitParameter("name");
		out.print("<h1>Hi "+ name + "</h1><br>");
	}
}