/**
 *
 * @author pankaj Kumar
 */

package com.servlets;
import jakarta.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class FirstServlet implements Servlet{
    //Life Cycle Method
    ServletConfig conf;
    @Override
    public void init(ServletConfig conf){
        this.conf = conf;
        System.out.println("Object Created");
    }
    
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException{
        System.out.println("Servicing");
        //set the content type of response
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        out.println("<h1> This output from servlet</h1>");
        out.println("<h1>Today's date and time is: " + new Date().toString() + "</h1>");
    }
    
    @Override
    public void destroy(){
        System.out.println("Object Destroy");
    } 
    
    //non - Life Cycle Method
    
    @Override
    public ServletConfig getServletConfig(){
        return this.conf;
    }
    
    @Override
    public String getServletInfo(){
        return "Servlet created by Pankaj Kumar"; 
    }
}

