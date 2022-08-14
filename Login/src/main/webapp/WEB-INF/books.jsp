<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
    <!-- Here we have to import the Date class. -->
    <!-- You will put the import in the first line of the jsp tag. Use the import attribute -->

    <!-- c:out ; c:forEach ; c:if -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Formatting (like dates) -->
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>

                    <!DOCTYPE html>
<html> <head><meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="/css/style.css"></head>
<body>
<div class="container">
 <div class="nav-item">
                <a class="nav-link" href="/logout">Logout</a></div>
<div class="nav-item">
                <a class="nav-link" href="/createNewBook">Add To My Shelf</a> </div>
         <h3>Welcome <span>${user.userName} </span></h3>                                
                                <div class="header_fixed">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author Name</th>
                    <th>Posted By</th>
                    <th>Num Pages</th>
                    <th>Genre</th>
                </tr>
            </thead>
            <tbody>
            
                                            <!-- Loop through items and display each of them -->
                                            <c:forEach var="book" items="${books}">
                                                <tr>

                                                    <td scope="row">
                                                        <p class="text-center">
                                                            <c:out value="${book.id}"></c:out>
                                                        </p>
                                                    </td>

                                                    <td scope="row" class="align-middle">
                                                        <a href="/oneBookDetails/${book.id}">
                                                            <c:out value="${book.title}"></c:out>
                                                        </a>
                                                    </td>

                                                    <td scope="row">
                                                        <p class="text-center">
                                                            <c:out value="${book.author}"></c:out>
                                                        </p>
                                                    </td>

                                                    <td scope="row">
                                                        <p class="text-center">
                                                            <c:out value="${book.user.firstName}">
                                                            </c:out>
                                                            <td scope="row">
                                                        <p class="text-center">
                                                            <c:out value="${book.numOfPages}">
                                                            </c:out>
                                                            <td scope="row">
                                                        <p class="text-center">
                                                            <c:out value="${book.genre}">
                                                            </c:out>
                                                            
                                                             <p class="text-center">
                                                            <c:out value="${book.review}">
                                                            </c:out>
                                                             <p class="text-center">
                                                            <c:out value="${book.rating}">
                                                            </c:out>
                                                            <!-- </a> -->
                                                        </p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                  
                                </div>
                            </div>
            

                        <script src="/js/app.js"></script>
                    </body>

                    </html>