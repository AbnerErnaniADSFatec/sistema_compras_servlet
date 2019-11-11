<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType = "text/html" pageEncoding = "UTF-8" %>
<html>
    <head>
        <meta charset = "UTF-8">
        <title>Cadastro de Produtos</title>
        <link rel = "icon" type = "image/x-icon" href = "assets/save.ico">
        <link rel = "stylesheet" href = "styles/style.css">
    </head>
    <body>
        <h4 class = "is-center">Cadastro de Produtos</h4>
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
                            <h3>Cadastrar novo produto</h3>
                            <form action = "cadastro" method = "POST">
                                Nome: <input type = "text" name = "name"/><br>
                                Descrição: <input type = "text" name = "description"/><br>
                                Moeda: <input type = "text" name = "currency"/><br>
                                Preço: <input type = "number"  min = "0.00" max = "10000.00" step = "0.01" name = "price"/><br>
                                Código do produto: <input type = "text" name = "code"/><br>
                                Quantidade no estoque: <input type = "number" min = "1" name = "amount"/><br>
                                Unidade: <input type = "text" name = "unit"/><br>
                                <input type = "reset" value = "Cancelar" style = "align-items: center"/>
                                <input type = "submit" value = "Cadastrar" style = "align-items: center"/>
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