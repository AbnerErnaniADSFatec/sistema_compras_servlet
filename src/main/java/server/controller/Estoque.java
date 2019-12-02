package server.controller;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;
import server.model.product.Product;
import server.model.product.ProductDAOImpl;

public class Estoque extends HttpServlet{
    @Override
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            List<Product> produtos;
            try {
                produtos = new ProductDAOImpl().getProducts();
            } catch (Exception e) {
                produtos = new ArrayList<Product>();
            }
            req.setAttribute("products", produtos);
            req.getRequestDispatcher("/static/estoque.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet!");
        }
    }

    @Override
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            req.setCharacterEncoding("UTF-8");
            List<Product> produtos = new ProductDAOImpl().findByCode(req.getParameter("code"));
            Product product;
            if (produtos.isEmpty()) {
                product = new Product();
            } else {
                product = produtos.get(0);
            }
            req.setAttribute("option", req.getParameter("options"));
            if (req.getParameter("options").equals("editar")) {
                req.setAttribute("product", product);
                req.getRequestDispatcher("/static/cadastro.jsp").forward(req, res);
            } else if (req.getParameter("options").equals("excluir")) {
                Product prod; 
                try {
                    prod = new ProductDAOImpl().deleteProduct(product);
                } catch (Exception e) {
                    prod = new Product();
                }
                req.setAttribute("products", new ProductDAOImpl().getProducts());
                req.getRequestDispatcher("/static/estoque.jsp").forward(req, res);
            }
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet!");
        }
    }
}