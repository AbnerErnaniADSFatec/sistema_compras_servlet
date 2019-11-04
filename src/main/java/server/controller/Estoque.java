package server.controller;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;
import server.model.Product;
import server.model.ProductDAOImpl;

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
            Product product = new Product();
            product.setId(5L);
            product.setName(req.getParameter("name"));
            product.setDescription(req.getParameter("description"));
            product.setCurrency(req.getParameter("currency"));
            product.setPrice(Float.parseFloat(req.getParameter("price")));
            product.setCode(req.getParameter("code"));
            product.setAmount(Integer.parseInt(req.getParameter("amount")));
            product.setUnit(req.getParameter("unit"));
            Product saveProduct = new ProductDAOImpl().saveProduct(product);
            req.setAttribute("products", new ProductDAOImpl().getProducts());
            req.getRequestDispatcher("/static/estoque.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet!");
        }
    }
}