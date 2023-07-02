package servlets;

import beans.Cheque;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "addcheque", urlPatterns = "/addcheque")
public class addCheque extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        Integer value = Integer.valueOf(req.getParameter("value"));
        ServletContext context = getServletContext();
        ArrayList<Cheque> cheques = new ArrayList<>();
        if (id != null) {
            if(context.getAttribute("cheques")!=null){
                cheques = (ArrayList<Cheque>) context.getAttribute("cheques");
            }
            Cheque cheque = new Cheque(id, name, value);
            cheques.add(cheque);
        }
        context.setAttribute("cheques", cheques);
        resp.sendRedirect("viewBalances.jsp");
    }
}
