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
import server.model.log.Log;

public class Relatorio extends HttpServlet{
    @Override
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            Log relatorio = new Log();
            req.setAttribute("relatorio", relatorio);
            req.getRequestDispatcher("/static/relatorio.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet");
        }
    }
    @Override
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            req.setCharacterEncoding("UTF-8");
            List<Product> produtos;
            try {
                produtos = new ProductDAOImpl().getProducts();
            } catch (Exception e) {
                produtos = new ArrayList<Product>();
            }
            Log relatorio = new Log();
            // for(Product prod : produtos){
            //     .add(Integer.parseInt(req.getParameter("quant-" + prod.getCode())));
            // }
            req.getRequestDispatcher("/static/relatorio.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet");
        }
    }
}