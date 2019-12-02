<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType = "text/html" pageEncoding = "UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.Math" %>
<%@ page import = "server.model.product.Product" %>
<html>
    <head>
        <meta charset = "UTF-8">
        <title>Cadastro de Produtos</title>
        <link rel = "icon" type = "image/x-icon" href = "assets/save.ico">
        <link rel = "stylesheet" href = "styles/style.css">
        <link rel = "stylesheet" href = "styles/cadastro.css">
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
                            <h3>
                                <%
                                    try {
                                        String option = (String) request.getAttribute("option");
                                        if (option.equals("criar")) {
                                            out.print("Cadastrar novo produto");
                                        }
                                        else if (option.equals("editar")){
                                            out.print("Editar produto existente");
                                        }
                                    } catch (Exception e) {
                                        out.print("Cadastrar novo produto");
                                    }
                                %>
                            </h3>
                            <form action = "cadastro" method = "POST">
                                <%
                                    Product product;
                                    try {
                                        product = (Product) request.getAttribute("product");
                                    } catch (Exception e) {
                                        product = new Product();
                                    }
                                    if ( product.getCode() == null || product.getCode().trim().equals("") ) {
                                        out.print("Código do produto: <input type = 'text' name = 'code'/><br>");
                                        out.print("Nome: <input type = 'text' name = 'name'/><br>");
                                        out.print("Descrição: <input type = 'text' name = 'description'/><br>");
                                        out.print("Moeda: <input type = 'text' name = 'currency'/><br>");
                                        out.print("Preço: <input type = 'number'  min = '0.00' max = '10000.00' step = '0.01' name = 'price'/><br>");
                                        out.print("Quantidade no estoque: <input type = 'number' min = '1' name = 'amount'/><br>");
                                        out.print("Unidade: <input type = 'text' name = 'unit'/><br>");
                                    } else {
                                        out.print("Código do produto: <input type = 'text' name = 'code' value = '" + product.getCode() + "'/><br>");
                                        out.print("Nome: <input type = 'text' name = 'name' value = '" + product.getName() + "'/><br>");
                                        out.print("Descrição: <input type = 'text' name = 'description' value = '" + product.getDescription() + "'/><br>");
                                        out.print("Moeda: <input type = 'text' name = 'currency' value = '" + product.getCurrency() + "'/><br>");
                                        out.print("Preço: <input type = 'number'  min = '0.00' max = '10000.00' step = '0.01' name = 'price' value = '" + product.getPrice() + "'/><br>");
                                        out.print("Quantidade no estoque: <input type = 'number' min = '1' name = 'amount' value = '" + product.getAmount() + "'/><br>");
                                        out.print("Unidade: <input type = 'text' name = 'unit' value = '" + product.getUnit() + "'/><br>");
                                    }
                                %>
                                <%
                                    try {
                                        String option = (String) request.getAttribute("option");
                                        if (option.equals("criar")) {
                                            out.print("<input type = 'reset' value = 'Cancelar' style = 'align-items: center'/>");
                                            out.print("<input type = 'submit' value = 'Cadastrar' style = 'align-items: center'/>");
                                        } else if (option.equals("editar")) {
                                            out.print("<input type = 'reset' value = 'Cancelar' style = 'align-items: center'/>");
                                            out.print("<input type = 'submit' value = 'Salvar' style = 'align-items: center'/>");
                                        }
                                    } catch (Exception e) {
                                        out.print("<input type = 'reset' value = 'Cancelar' style = 'align-items: center'/>");
                                        out.print("<input type = 'submit' value = 'Cadastrar' style = 'align-items: center'/>");
                                    }
                                %>
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