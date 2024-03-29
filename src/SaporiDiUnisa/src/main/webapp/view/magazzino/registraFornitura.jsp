<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/magazzino/registraFornitura.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/form.css">
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/img/favicon/site.webmanifest">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/script/magazzino/onSelectProduct.js" defer></script>
    <script src="${pageContext.request.contextPath}/script/magazzino/aggiungiLotto.js" defer></script>
    <script src="${pageContext.request.contextPath}/script/magazzino/registraFornitura.js" defer></script>
    <title>Sapori di Unisa - Registra Fornitura</title>
</head>
<body>
<%@ include file="/WEB-INF/include/header.html" %>
    <main>
        <h1 id="title">Registra fornitura</h1>
        <div id="displayFlex-div">
            <div id="container-left" class="container-form">
                <h2>Inserisci lotto</h2>
                <form id="aggiungiLotto-form">
                    <div class="row">
                        <div class="col-50">
                            <label for="nome">Nome</label>
                        </div>
                        <div class="col-50">
                            <input type="text" id="nome" name="nome" list="productsList" required>
                            <datalist id="productsList"></datalist>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-50">
                            <label for="marchio">Marchio</label>
                        </div>
                        <div class="col-50">
                            <input type="text" name="marchio" id="marchio" list="marchioList" required>
                            <datalist id="marchioList"></datalist>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-50">
                            <label for="prezzo">Prezzo cad.</label>
                        </div>
                        <div class="col-50">
                            <input type="number" name="prezzo" id="prezzo" min="0" value="0" step="0.10" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-50">
                            <label for="quantita">Quantità</label>
                        </div>
                        <div class="col-50">
                            <input type="number" name="quantita" id="quantita" min="0" value="0" step="1" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-50">
                            <label for="dataScadenza">Data scadenza</label>
                        </div>
                        <div class="col-50">
                            <input type="date" name="dataScadenza" id="dataScadenza" min = "<%=LocalDate.now().plusDays(1)%>" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-50">
                            <label for="foto" id="label-foto">Foto</label>
                        </div>
                        <div class="col-50">
                            <input type="file" name="foto" id="foto" accept=".png, .jpg, .jpeg" required>
                        </div>
                    </div>
                    <ul id="errors">
                    </ul>
                    <input id="ajax-caller" type="button" value="Aggiungi lotto">
                </form>
            </div>
            <div id="container-right" class="container-form">
                <h2>Lotti inseriti</h2>
                <table id="lottiInseriti">
                    <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Marchio</th>
                        <th>Prezzo cad.</th>
                        <th>Quantità</th>
                        <th>Data scadenza</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <form id="registraFornitura-form" action="${pageContext.request.contextPath}/RegistraFornitura" method="get">
                    <input type="button" id="reset-button" value="Reset">
                    <input id="registraFornitura-ajax" type="submit" value="Registra fornitura">
                </form>
            </div>
        </div>
    </main>
<a href="${pageContext.request.contextPath}/view/select/select_RegistraFornitura_VisualizzaForniture.jsp"><button class="btn" id="indietro-button">INDIETRO</button></a>
</body>
</html>
