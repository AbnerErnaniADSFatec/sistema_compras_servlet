<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType = "text/html" pageEncoding = "UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "server.model.product.Product" %>
<html>
    <head>
        <meta charset = "UTF-8">
        <title>Caixa</title>
        <link rel = "icon" type = "image/x-icon" href = "assets/favicon.ico">
        <link rel = "stylesheet" href = "styles/style.css">
        <link rel = "stylesheet" href = "styles/caixa.css">
    </head>
    <body>
        <h4 class = "is-center">Busca de Produtos</h4>
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
                            <div class = "search-box">
                                <form action = "caixa" method = "POST">
                                    <div class = "row">
                                        <div class = "col-10">
                                            <div>
                                                <input type = "text" name = "value" placeholder = "Busca..."/>
                                            </div>
                                        </div>
                                        <div class = "col">
                                            <button class = "button icon-only">
                                                <img src = "https://icongr.am/feather/search.svg?size=24">
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <form action = "relatorio" method = "POST">
                                    <table id = 'products' class = "striped">
                                        <caption>Resultado da pesquisa</caption>
                                        <thead>
                                            <tr>
                                                <th>Código do Produto</th>
                                                <th>Nome</th>
                                                <th>Descrição</th>
                                                <th></th>
                                                <th>Preço</th>
                                                <th>Quantidade</th>
                                                <th>Unidade</th>
                                            </tr>
                                        </thead>
                                        <tbody>  
                                            <%
                                                List<Product> products = (List<Product>) request.getAttribute("products");
                                                for ( Product prod : products ) {
                                                    if (prod.getAmount() != 0) {
                                                        out.print("<tr>");
                                                        out.print("<td>" + prod.getCode() + "</td>");
                                                        out.print("<td>" + prod.getName() + "</td>");
                                                        out.print("<td>" + prod.getDescription() + "</td>");
                                                        out.print("<td>" + prod.getCurrency() + "</td>");
                                                        out.print(
                                                            "<td>" +
                                                                "<div id = 'valor-" + prod.getCode() +"'>" +
                                                                    prod.getPriceFormat() +
                                                                "</div>" +
                                                            "</td>"
                                                        );
                                                        out.print(
                                                            "<td>" +
                                                                "<div class = 'qtd-prod'>" +
                                                                    "<input type = 'number' value = '0' min = '0' id = 'quant-" + prod.getCode() +"' name = 'quant-" + prod.getCode() +"'/>" +
                                                                "</div>" +
                                                            "</td>"
                                                        );
                                                        out.print("<td>" + prod.getUnit() + "</td>");
                                                        out.print("</tr>");
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <table class = "striped">
                                        <thead>
                                            <tr>
                                                <th>Moeda</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>R$</td>
                                                <td>
                                                    <label>
                                                        <div class = "valorTotal" id = "valorTotal" style = "color: red">
                                                            0.00
                                                        </div>
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type = "submit" value = "Finalizar Compra" style = "align-items: center"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
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
        <script src = "scripts/count.js"></script>
    </body>
</html>