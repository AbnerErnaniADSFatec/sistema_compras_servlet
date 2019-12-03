<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType = "text/html" pageEncoding = "UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.Math" %>
<%@ page import = "server.model.product.Product" %>
<%@ page import = "server.model.log.Log" %>
<html>
    <head>
        <meta charset = "UTF-8">
        <title>Relatório</title>
        <link rel = "icon" type = "image/x-icon" href = "assets/doc.ico">
        <link rel = "stylesheet" href = "styles/style.css">
        <link rel = "stylesheet" href = "styles/relatorio.css">
    </head>
    <body>
        <h4 class = "is-center">Relatórios</h4>
        <div class = "container">
            <div class = "hero is-full-screen">
                <nav class = "tabs is-center">
                    <a href = "caixa">Home</a>
                    <a href = "relatorio">Relatório</a>
                    <a href = "estoque">Estoque</a>
                    <a href = "cadastro">Cadastro de Produtos</a>
                </nav>
                <div id = "estoque">
                    <div class = "row">
                        <div class = "col">
                            <table class = "striped">
                                <caption>
                                    <div class = "card">
                                        <%
                                            Log relatorio = (Log) request.getAttribute("relatorio");
                                            out.print("<p> Relatório " + relatorio.getDate() + "</p>");
                                        %>
                                    </div>
                                </caption>
                                <thead>
                                    <tr>
                                        <th>Código do Produto</th>
                                        <th>Nome</th>
                                        <th>Descrição</th>
                                        <th>Preço</th>
                                        <th>Quantidade</th>
                                        <th>Unidade</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            Map<String, Float> list = relatorio.getTotalByProduct();
                                            for(Product prod : relatorio.getProducts()) {
                                                out.print("<td>" + prod.getCode() + "</td>");
                                                out.print("<td>" + prod.getName() + "</td>");
                                                out.print("<td>" + prod.getDescription() + "</td>");
                                                out.print("<td>" + prod.getCurrency() + " " + String.format("%.2f", prod.getPrice()) + "</td>");
                                                out.print(
                                                    "<td>" + 
                                                        "<div class = 'card'>" +
                                                            "<p>" + prod.getAmount() + "</p>" +
                                                        "</div>" +
                                                    "</td>"
                                                );
                                                out.print("<td>" + prod.getUnit() + "</td>");
                                                out.print("<td>" + prod.getCurrency() + " " + String.format("%.2f", list.get(prod.getCode())) + "</td>");
                                                out.print("</tr>");
                                            }
                                        %>
                                    </tr>
                                </tbody>
                                </table>
                                <table class = "striped">
                                    <thead>
                                        <tr>
                                            <th>Moeda</th>
                                            <th>Valor Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            try {
                                                out.print("<td>" + relatorio.getProducts().get(0).getCurrency() + "</td>");
                                                out.print(
                                                    "<td>" +
                                                        "<label>" +
                                                            String.format("%.2f", relatorio.getTotal()) +
                                                        "</label>" +
                                                    "</td>"
                                                );
                                            } catch (Exception e) {
                                                out.print("<td>R$</td>");
                                                out.print("<td><label>0.00</label></td>");
                                            }
                                        %>                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class = "is-text-center">
            <p>
                Sistema para o gerennciamento de caixa
            </p>
        </footer>
    </body>
</html>