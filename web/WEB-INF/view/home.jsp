<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>spring-security-demo</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
            <h1>what's goood</h1>
        </header>
        <hr>
        <main>
            <p>welcome to the home page</p>
            <p>
                User: <security:authentication property="principal.username"/>
                <br><br>
                Role(s): <security:authentication property="principal.authorities"/>
            </p>
            <!-- add a link to point to /leaders.. this is for the managers -->
            <security:authorize access="hasRole('MANAGER')">
                <hr>
                <p>
                    <a href="${pageContext.request.contextPath}/managers">Leadership Meeting</a>
                    (Only for Managers)
                </p>
            </security:authorize>

            <!-- add a link to point to /leaders.. this is for the owner -->
            <security:authorize access="hasRole('OWNER')">
                <p>
                    <a href="${pageContext.request.contextPath}/owner">owner dashboard</a>
                    (Only for the owner)
                </p>
            </security:authorize>

            <hr>
            <!-- display user name and role -->
            <p>
                user: <security:authentication property="principal.username"/>
                <br><br>
                role(s): <security:authentication property="principal.authorities"/>
            </p>
            <hr>
            <!-- add a logout button -->
            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                <input type="submit" value="logout">
            </form:form>
        </main>
    </body>
</html>