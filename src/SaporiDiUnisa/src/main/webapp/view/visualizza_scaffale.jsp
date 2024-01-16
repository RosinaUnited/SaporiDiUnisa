<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unisa.saporidiunisa.model.entity.Esposizione" %>
<%@ page import="it.unisa.saporidiunisa.model.entity.Lotto" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sapori di Unisa - Visualizza Scaffale</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/table.css">
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/img/favicon/site.webmanifest">
</head>
<body>
<%@ include file="/WEB-INF/include/header.html" %>

<main>

<%
    ArrayList<Esposizione> lottiScaffale = (ArrayList<Esposizione>) request.getAttribute("lottiScaffale");
    ArrayList<Esposizione> lottiScaffaleScaduti = (ArrayList<Esposizione>) request.getAttribute("lottiScaffaleScaduti");
%>

<form action="${pageContext.request.contextPath}/EliminaScaduti" method="post">

    <div class="container">
        <table>
            <tr>
                <th>Prodotti Scaffale</th>
            </tr>
            <tr>
                <th>Nome</th>
                <th>Azienda</th>
                <th>Data Scadenza</th>
                <th>Qnt attuale</th>
            </tr>

            <%
                for(Esposizione e : lottiScaffale)
                {
                    boolean scaduto = false;
                    int l = e.getLotto().getId();
                    for(Esposizione e2 : lottiScaffaleScaduti){
                        if(e2.getLotto().getId() == l && !scaduto){
                            scaduto = true;
            %>

            <tr style="background-color: red">
                <td><%=e.getProdotto().getNome()%></td>
                <td><%=e.getProdotto().getMarchio()%></td>
                <td><%=e.getLotto().getDataScadenza()%></td>
                <td><%=e.getQuantita()%></td>
            </tr>

            <%
                        }
                    }
                    if(!scaduto){
            %>

            <tr>
                <td><%=e.getProdotto().getNome()%></td>
                <td><%=e.getProdotto().getMarchio()%></td>
                <td><%=e.getLotto().getDataScadenza()%></td>
                <td><%=e.getQuantita()%></td>
            </tr>

            <%
                    }
                }
            %>

        </table>
    </div>

    <input id="cancel-button" type="submit" value="ELIMINA SCADUTI">

</form>
</main>
<%@ include file="/WEB-INF/include/footer.html" %>
</body>
</html>