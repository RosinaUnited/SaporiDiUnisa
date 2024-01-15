<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <title>Sapori di Unisa - Homepage magazziniere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/box.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
</head>
<body>
<%@ include file="/WEB-INF/include/header.html" %>
<main>
    <form action="${pageContext.request.contextPath}/GoToServlet" method="post" onclick="this.submit()">
        <span class="material-symbols-outlined">shelves</span>
        <p>Visualizza Scaffale</p>
        <input type="hidden" name="address" value="visualizzaScaffale">
    </form>
    <form action="${pageContext.request.contextPath}/VisualizzaScaffale" method="post" onclick="this.submit()">
        <span class="material-symbols-outlined">list_alt_add</span>
        <p>Aggiungi Prodotti Scaffale</p>
    </form>
</main>
<%@ include file="/WEB-INF/include/footer.html" %>
</body>
</html>