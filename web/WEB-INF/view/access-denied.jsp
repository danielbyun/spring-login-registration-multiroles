<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Error</title>
    </head>
    <body>
        <main>
            <h1>You are not authorized to access this page.</h1>
            <hr>
            <c:url value="home.jsp" var="home"/>
            <a href="${home}">back to home page</a>
        </main>
    </body>
</html>
