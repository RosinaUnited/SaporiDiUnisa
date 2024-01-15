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
        <span class="material-symbols-outlined">package_2</span>
        <p>Area Fornitura</p>
        <input type="hidden" name="address" value="select_RegistraFornitura_VisualizzaForniture">
    </form>
    <form action="${pageContext.request.contextPath}/GoToServlet" method="post" onclick="this.submit()">
        <span class="material-symbols-outlined">nutrition</span>
        <p>Prodotti Magazzino</p>
        <input type="hidden" name="address" value="visualizzaProdottiMagazzino">
    </form>
</main>
<%@ include file="/WEB-INF/include/footer.html" %>
</body>
</html>