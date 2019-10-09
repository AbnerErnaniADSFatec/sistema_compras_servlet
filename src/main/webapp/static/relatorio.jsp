<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType = "text/html" pageEncoding = "UTF-8" %>
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
                            <form action = "relatorio" method = "GET">
                                <table class = "striped">
                                    <caption>
                                        <div class = "card">
                                            <p>
                                                Relatório 19/09/2019 - 08h:32  
                                            </p>
                                        </div>
                                    </caption>
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th>Preço</th>
                                            <th>Código do Produto</th>
                                            <th>Quantidade</th>
                                            <th>Unidade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>KitKat</td>
                                            <td>Chocolate</td>
                                            <td>R$ 2,10</td>
                                            <td>274671264128</td>
                                            <td>
                                                <div class = "card">
                                                    <p>3</p>
                                                </div>
                                            </td>
                                            <td>unid</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                            <form action = "relatorio" method = "GET">
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
                                                <label>0,00</label>
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
        <footer class = "is-text-center">
            <p>
                Sistema para o gerennciamento de caixa
            </p>
        </footer>
    </body>
</html>