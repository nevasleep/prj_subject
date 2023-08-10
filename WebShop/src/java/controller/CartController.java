package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import view.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import model.OrderItem;
import model.Product;

public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProductDAO pdao = new ProductDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int id = request.getParameter("id") == null ? -1 : Integer.parseInt(request.getParameter("id"));
        //update quanity
        int quantity = request.getParameter("quantity") == null ? 0 : Integer.parseInt(request.getParameter("quantity"));
        HashMap<Integer, OrderItem> cart = (HashMap<Integer, OrderItem>) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
        }
        if (cart.containsKey(id)) {

            cart.get(id).setStock(quantity);
        } else if (quantity != 0) {
            Product p = pdao.getProduct(id);
            cart.put(id, new OrderItem(p, quantity));
        }

        //Tinh tong tien
        int total = 0;
        for (Map.Entry<Integer, OrderItem> entry : cart.entrySet()) {
            Integer key = entry.getKey();
            OrderItem value = entry.getValue();
            total += value.getProduct().getSale_price() * value.getStock();

        }

        request.getSession().setAttribute("cart", cart);
        //set lai tong
        request.setAttribute("total", total);
        request.setAttribute("proList", pdao.getNewProduct());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
