<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType = "text/html" pageEncoding = "UTF-8" %>
<html>
    <head>
        <meta charset = "UTF-8">
        <title>Lista de Produtos</title>
        <link rel = "icon" type = "image/x-icon" href = "assets/storage.ico">
        <link rel = "stylesheet" href = "styles/style.css">
        <link rel = "stylesheet" href = "styles/estoque.css">
    </head>
    <body>
        <h4 class = "is-center">Estoque</h4>
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
                            <form method = "GET">
                                <table class = "striped">
                                    <caption>Lista Produtos</caption>
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th>Preço</th>
                                            <th>Código do Produto</th>
                                            <th>Quantidade no estoque</th>
                                            <th>Unidade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>KitKat</td>
                                            <td>Chocolate</td>
                                            <td>R$ 2,10</td>
                                            <td>274671264128</td>
                                            <td>5000</td>
                                            <td>unid</td>
                                        </tr>
                                        <tr>
                                            <td>Snikers</td>
                                            <td>Chocolate</td>
                                            <td>R$ 3,49</td>
                                            <td>274671223541</td>
                                            <td>1500</td>
                                            <td>unid</td>
                                        </tr>
                                        <tr>
                                            <td>Chokito</td>
                                            <td>Chocolate</td>
                                            <td>R$ 2,49</td>
                                            <td>274671132423</td>
                                            <td>1300</td>
                                            <td>unid</td>
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