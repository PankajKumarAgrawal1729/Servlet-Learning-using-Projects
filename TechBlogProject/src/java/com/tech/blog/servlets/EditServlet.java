/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfilePicHelper;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author pankaj-13162
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //Fetch User Data
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("user_name");
            String about = request.getParameter("about");
            Part pic = request.getPart("image");
            String picName = pic.getSubmittedFileName();

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentuser");
//            out.println(id + " " + name + " " + about + " " + pic);
            user.setId(id);
            user.setName(name);
            user.setAbout(about);
            String oldFile = user.getProfile();
            user.setProfile(picName);

            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean updated = userDao.updateUser(user);
            if (updated) {
                ServletContext context = request.getServletContext();
                String path = context.getRealPath("/") + "profilePics" + File.separator + user.getProfile();
                String oldPath = context.getRealPath("/") + "profilePics" + File.separator + oldFile;
                if (!oldFile.equals("default.png")) {
                    ProfilePicHelper.deleteFile(oldPath);
                }

                if (ProfilePicHelper.saveFile(pic.getInputStream(), path)) {
                    out.println("Updated");
                    Message msg = new Message("Profile Updated Successfully", "success", "alert-success");

                    session.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Something went wrong", "error", "alert-danger");

                    session.setAttribute("msg", msg);
                }

            } else {
                out.println("not Updated");
                Message msg = new Message("Something went wrong", "error", "alert-danger");

                session.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
