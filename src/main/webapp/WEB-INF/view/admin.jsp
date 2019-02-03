<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>admin page</title>
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
        <header class="container row">
            <h1>admin page</h1>
        </header>
        <main class="container">
            <p class="row">
                page only visible to admin, not accessible to managers or employees
            </p>
            <a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/">back to home page</a>
        </main>
    </body>
</html>