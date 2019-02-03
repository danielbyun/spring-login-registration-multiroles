<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>registration confirmation page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- materialized css -->
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/reset.css">
    </head>
    <body>
        <main class="container">
            <h2>user registered successfully!</h2>
            <hr>
            <a href="${pageContext.request.contextPath}/login">Login with new user</a>
        </main>
    </body>
</html>