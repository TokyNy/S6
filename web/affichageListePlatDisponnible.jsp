<%-- 
    Document   : affichageListePlatDisponnible
    Created on : 22 mars 2022, 09:40:47
    Author     : ACER
--%>

<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-4">
                <form action="<%=request.getContextPath()%>/ListePlatParCategorie" method="get">
                    <select name="idCategorie" class="form-control" id="exampleFormControlSelect1">
                    <% Vector<Categorie> l=(Vector<Categorie>)request.getAttribute("listeCategorie");
                        for(int i=0;i<l.size();i++){
                    %>
                    
                        <option value="<% out.print(l.get(i).getId());%>"><% out.println(l.get(i).getDescri()); %></option>
                    
                    <% } %>
                    </select>
                    <p><input type="submit" value="ok" class="btn btn-primary mb-2"></p>
                </form>
                
            </div>
            <div class="col-md-4">
                <h1>liste plats</h1>
        <table class="table">
            <thead class="thead-light">
                <tr>
                <th>plat</th>
                <th>prix</th>
            </tr>

            </thead>
            <tbody>
                            <% Vector<Plat> liste=(Vector<Plat>)request.getAttribute("listePlat");
                    for(int j=0;j<liste.size();j++){
                %>
            <tr>
                
                <td><% out.println(liste.get(j).getDesc()); %> </td>
                <td><% out.println(liste.get(j).getPrix()); %></td>
            </tr>
            <% } %>
            </tbody>
            
        </table>
            </div>
            <div class="col-md-4"></div>
        </div>
        
        
    </body>
       
</html>
