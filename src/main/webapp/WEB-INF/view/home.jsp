<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>spring-security-demo</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- materialized css -->
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/home.css">
    </head>
    <body>
        <header class="container row col s12 homeHeader">
            <h1 class="col s12">welcome, <security:authentication property="principal.username"/></h1>
            <!-- add a logout button -->
            <form:form action="${pageContext.request.contextPath}/logout" method="post" class="col">
                <button class="waves-effect waves-light btn-small" type="submit" value="logout">logout</button>
            </form:form>
        </header>
        <main class="container row">
            <div>
                <p class="col s12 row">
                    <security:authentication property="principal.username"/>, you have the following role(s):
                    <security:authentication property="principal.authorities"/>
                </p>
            </div>
            <!-- add a link to point to /leaders.. this is for the owner -->
            <security:authorize access="hasRole('ADMIN')">
                <p class="col s12">
                    <a href="${pageContext.request.contextPath}/admin">admin dashboard</a>
                    (only for the admin)
                </p>
            </security:authorize>
            <!-- add a link to point to /leaders.. this is for the managers -->
            <security:authorize access="hasRole('MANAGER')">
                <p class="col s12">
                    <a href="${pageContext.request.contextPath}/managers">manager dashboard</a>
                    (only for the managers)
                </p>
            </security:authorize>

        </main>
    </body>
</html>