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

public class Cadastro extends HttpServlet{
    @Override
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            req.setAttribute("product", new Product());
            req.setAttribute("option", "criar");
            req.getRequestDispatcher("/static/cadastro.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet");
        }
    }
    @Override
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            req.setCharacterEncoding("UTF-8");
            Product product;
            try {
                List<Product> products = new ProductDAOImpl().findByCode(req.getParameter("code"));
                if (products.isEmpty()) {
                    product = new Product();
                } else {
                    product = products.get(0);
                }
            } catch (Exception e) {
                product = new Product();
            }
            if ( !(req.getParameter("code") == null) && !req.getParameter("code").trim().equals("") ) {
                product.setName(req.getParameter("name"));
                product.setDescription(req.getParameter("description"));
                product.setCurrency(req.getParameter("currency"));
                product.setPrice(Float.parseFloat(req.getParameter("price")));
                product.setCode(req.getParameter("code"));
                product.setAmount(Integer.parseInt(req.getParameter("amount")));
                product.setUnit(req.getParameter("unit"));
                try {
                    Product updateProduct = new ProductDAOImpl().updateProduct(product);
                } catch (Exception e) {
                    Product saveProduct = new ProductDAOImpl().saveProduct(product);
                }
                req.setAttribute("products", new ProductDAOImpl().getProducts());
                req.getRequestDispatcher("/static/estoque.jsp").forward(req, res);
            } else {
                req.setAttribute("product", new Product());
                req.setAttribute("option", "criar");
                req.getRequestDispatcher("/static/cadastro.jsp").forward(req, res);
            }
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet");
        }
    }
}