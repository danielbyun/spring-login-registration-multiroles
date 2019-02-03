<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>registration confirmation page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <main>
            <h2>user registered successfully!</h2>
            <hr>
            <a href="${pageContext.request.contextPath}/showMyLoginPage">Login with new user</a>
        </main>
    </body>
</html>