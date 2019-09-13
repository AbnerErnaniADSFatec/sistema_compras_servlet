package ex_01_servlet_basico;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/server"})
public class App extends HttpServlet{
    @Override
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException{
        String diretorio = getServletContext().getRealPath("WebContent/WEB-INF/");
        try {
            PrintWriter pw = res.getWriter();
            // pw.write("Build com gradle funcionando!!!");
            pw.println("WEB-INF/index.html");
            // req.getRequestDispatcher("WEB-INF/index.html"); //.forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em 10 ou Servlet");
        }
    }
}
