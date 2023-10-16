<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="com.tech.blog.entities.User" %> 

<style>
    .card-body {
        overflow-y: auto;
        position: relative;
    }
</style>

<% 
    User user = (User)session.getAttribute("currentuser"); 
if(user == null){
response.sendRedirect("login-page.jsp");
    }
    
%> 

<div class="row">
    <% 
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    int catId = Integer.parseInt(request.getParameter("cid"));
    ArrayList<Post> posts = null;
    if(catId == 0){
    posts = dao.getAllPosts();
        }
        else{
        posts = dao.getPostByCategory(catId);
        }
    if(posts.size() == 0){
    out.println("<h1 class='display-3 text-center text-white'>No Post in this Category.</h1>");
    return;
        }
    for(Post p : posts){
    %>
    <div class="col-md-6 mt-2">
        <div class="card h-100">
            <img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="...">
            <div class="card-body">
                <h4 class="card-title"><%= p.getpTitle() %></h4>
                <p><%= p.getpContent() %></p>
            </div>
            <div class="card-footer text-content primary-background">
                <% LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection()); 
                int pid = p.getPid();
                int uid = user.getId();
                boolean alreadyLiked = likeDao.checkAlreadyLikedByUser(pid, uid);
                String counterClass = "counter_" + pid;
                String iconClass = "like-icon_" + pid;
                %>
                <a href="#" onclick="doLike(<%= pid %>, <%= uid %>)" class="btn btn-outline-light btn-sm"> <i class="<%= alreadyLiked ? "fa fa-thumbs-up" : "fa fa-thumbs-o-up" %> <%= iconClass %>"></i>
                    <%
                     int likes = likeDao.getLikesCount(pid);
                    if(likes > 0){
                    %>
                    <span class="<%= counterClass %>"><%=likes%></span>
                    <%}%>

                </a> 
                
                <a href="show_blog_page.jsp&#x3f;post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a> 
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>

<script src="js/likescript.js" type="text/javascript"></script>