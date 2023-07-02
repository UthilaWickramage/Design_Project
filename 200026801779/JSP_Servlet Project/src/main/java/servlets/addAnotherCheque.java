package servlets;

import beans.Cheque;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "addanothercheque", urlPatterns = "/addanothercheque")
public class addAnotherCheque extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Integer amount = Integer.valueOf(req.getParameter("value"));

        ServletContext context = getServletContext();
        ArrayList<Cheque> cheques = new ArrayList<>();
        if (context.getAttribute("cheques") != null) {
            cheques = (ArrayList<Cheque>) context.getAttribute("cheques");
        }

        Integer chequeValue = 0;
        for (Cheque allCheques : cheques) {
            if (allCheques.getId().equals(id)) {
                chequeValue = allCheques.getTotal();
                if (chequeValue > amount) {
                    Integer remainingChequeValue = chequeValue - amount;
                    allCheques.setTotal(remainingChequeValue);
                    context.setAttribute("dueTotal", 0);
                    context.setAttribute("paidTotal", amount);
                }
                if (chequeValue < amount) {
                    Integer remainingAmountValue = amount - chequeValue;
                    allCheques.setTotal(0);
                    context.setAttribute("dueTotal", remainingAmountValue);
                    context.setAttribute("paidTotal", chequeValue);
                }
            }
        }
        resp.sendRedirect("index.jsp");

    }
}
