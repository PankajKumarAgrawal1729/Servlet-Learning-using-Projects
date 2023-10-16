<%-- 
    Document   : navbar
    Created on : 07-Sept-2023, 3:08:38 pm
    Author     : pankaj kumar
--%>

<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>

<nav class="navbar navbar-expand-lg navbar-dark  primary-background ">
    <div class="container-fluid">
        <a class="navbar-brand" href="profile.jsp"><span class="fa fa-laptop"></span> Tech Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-home"></span> Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="fa fa-cart-plus"></span> Categories
                    </a>
                    <ul class="dropdown-menu">
                        <% 
PostDao pdao = new PostDao(ConnectionProvider.getConnection());
ArrayList<Category> category = pdao.getAllCategories();
for(Category c: category){  %>
                        <a href="#" class="dropdown-item"><%=c.getName()%></a>
                        <% } %>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#"><span class="fa fa-users"></span> contact US</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="login-page.jsp"><span class="fa fa-user-circle"></span> Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="register-page.jsp"><span class="fa fa-user-plus"></span> Sign Up</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-light" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
