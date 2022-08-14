<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Formatting (like dates) -->
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>

                    <!DOCTYPE html><html><head>
                        <meta charset="UTF-8" />

                        <link rel="stylesheet" type="text/css" href="/css/style.css"></head><body>

                            <div class="container">
                                        <div="nav-item">
                                            <a class="nav-link" href="/login">Login</a>
                                      <div class="nav-item">
                                            <a class="nav-link" href="/logout">Logout</a>
                                        <div class="nav-item">
                                            <a class="nav-link" href="/dashboard">Dashboard</a>
                                </div>
                            </div>
               
                            <div>
                                <h3 class="bg-dark text-light ps-5">Welcome to Book Club</h3>
                                <!-- <a class="btn btn-primary mt-4" href="/">Start Doing Something!</a> -->
                            </div>
                            <!-- Page Title END -->

                            <p class="w-100"></p>

                            <!-- show user name on page START -->
                            <div>
                                <h1 class="bg-primary text-light ps-5">Welcome <span
                                        class="text-primary ">${user.firstName}</span>, to the Book Club Create New Book
                                    Page</h1>
                            </div>
                            <!-- show user name on page END -->

                            <p class="w-100"></p>

                            <!-- BaseProject Create New Form START -->
                            <div
                                class="container bg-secondary text-light rounded-3 w-50 mt-5 border border-info border-5 pb-5 p-3">
                                <form:form action="/createNew" method="post" modelAttribute="book">
                                    <!-- the next line is for updating -->
                                    <!-- <input type="hidden" name="_method" value="put" /> -->

                                    <!-- for attaching the owner to the book -->
                                    <form:input type="hidden" path="user" class="float-start" value="${user.id}" />

                                    <div class="mb-3">
                                        <p>
                                            <form:label path="title" class="float-start">Book Title</form:label>
                                            <form:errors path="title" class="text-danger h5" />
                                            <form:input path="title" class="form-control text-dark"
                                                placeholder="title" />
                                        </p>
                                    </div>

                                    <div class="mb-3 mt-3">
                                        <p>
                                            <form:label path="numOfPages" class="float-start"> Number of Pages
                                            </form:label>
                                            <form:errors path="numOfPages"  />
                                            <form:input path="numOfPages" class="form-control"
                                                placeholder="Number of Pages " />
                                        </p>
                                    </div>
                                        <p>
                                            <form:label path="author" class="float-start">Author
                                            </form:label>
                                            <form:errors path="author" class="text-danger h5" />
                                            <form:input path="author" class="form-control" cols="30" rows="5"
                                                placeholder="author" />
                                        </p>
                                    
                                    
                                    
                                    
				<p>
                                            <form:label path="rating" class="float-start">Rating
                                            </form:label>
                                            <form:errors path="rating" class="text-danger h5" />
                                            <form:input  type="number" step=".1"  path="rating" class="form-control" cols="30" rows="5"
                                                placeholder="rating" />
                                        </p>
                            
                                        <p>
                                            <form:label path="review" class="float-start">Thoughts
                                            </form:label>
                                            <form:errors path="review" class="text-danger h5" />
                                            <form:textarea path="review" class="form-control"
                                                placeholder="thougths" />
                                        </p>
                                    </div>


                                    <p class="w-100"></p>

                                    <input type="submit" value="Add New Book" class="btn btn-warning float-start" />
                                    <!-- == Cancel button == -->
                                    <p class="w-100"></p>
                                    <a class="btn btn-info float-end mb-3" href="/dashboard">Cancel</a>
                                    <p class="w-100"></p>

                                </form:form>

                            </div>

                            <!-- BaseProject Create New Form END -->

                            <p class="w-100"></p>

                            <!-- Main container END -->
                        </div>

                        <script src="/js/app.js"></script>
                    </body>

                    </html>