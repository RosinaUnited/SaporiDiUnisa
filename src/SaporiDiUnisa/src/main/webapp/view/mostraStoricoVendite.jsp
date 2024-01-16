<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unisa.saporidiunisa.model.entity.Venduto" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sapori Di Unisa - Mostra Storico Vendita</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/table.css">
</head>
<body>
<%@ include file="/WEB-INF/include/header.html" %>

<div class = "container-table">
    <h2>Ricerca Prodotti</h2>

    <form action="${pageContext.request.contextPath}/MostraStoricoVenditeServlet" method="post">
        <label>Data Inizio:</label>
        <input type="date" name="inizio" max="<%=LocalDate.now().minusDays(1)%>" required>

        <label>Data Fine:</label>
        <input type="date" name="fine" max="<%=LocalDate.now().minusDays(1)%>" required>

        <input type="submit" value="Invia">
    </form>
    <%
        ArrayList<Venduto> venduti = (ArrayList<Venduto>) session.getAttribute("prodotti");
        if (venduti!= null && (!venduti.isEmpty()))
        {
            if(request.getAttribute("dataInizio") != null && request.getAttribute("dataFine") !=null){%>
    <h3>Risultati:</h3>
    <p>Data inizio inserita: <%=request.getAttribute("dataInizio")%>   Data Fine inserita: <%=request.getAttribute("dataFine")%></p>
    <table id = "product-table">
        <thead>
        <tr>
            <th>Prodotto</th>
            <th>Nome</th>
            <th>Quantità</th>
            <th>Incasso</th>
            <th>Guadagno</th>
        </tr>
        </thead>
        <tbody>
        <% for (Venduto v : venduti) {
            String foto = Base64.encodeBase64String(v.getProdotto().getFoto());%>
        <tr>
            <td><img src="data:image/jpeg;base64,<%=foto %>" alt="foto"></td>
            <td><%= v.getProdotto().getNome() %></td>
            <td><%= v.getQuantita() %></td>
            <td><%=v.getCosto()%> &euro;</td>
            <td><%=v.getGuadagno()%> &euro;</td>
        </tr>
        <% } %>
        </tbody>
    </table>
            <% }
        }else{ %>
    <p>Nessuna Risultato, inserisci una data</p>
    <%
    } %>
    <%@ include file="/WEB-INF/include/footer.html" %>
</div>

</body>
</html>
