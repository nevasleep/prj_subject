package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import view.OrderDAO;
import view.OrderItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderItem;
import model.Product;

public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    OrderDAO odao = new OrderDAO();
    OrderItemDAO oidao = new OrderItemDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HashMap<Integer, OrderItem> cart = (HashMap<Integer, OrderItem>) request.getSession().getAttribute("cart");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        double total = Double.parseDouble(request.getParameter("total"));
        int orderID = odao.insertOrder(new Order(total, username, phone, address));

        for (Map.Entry<Integer, OrderItem> entry : cart.entrySet()) {
            Integer key = entry.getKey();
            OrderItem value = entry.getValue();
            Product p = new Product(cart.get(key).getProduct().getId(), cart.get(key).getProduct().getImage(), cart.get(key).getProduct().getName(), cart.get(key).getProduct().getSale_price(), cart.get(key).getProduct().getQuantity());
            OrderItem orderItem = new OrderItem(orderID, p, cart.get(key).getStock());
            oidao.insertOrderItem(orderItem);
        }
        request.getSession().removeAttribute("cart");
        response.sendRedirect("home");
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
        request.setAttribute("orderList", odao.getAllOrder());
        request.getRequestDispatcher("order.jsp").forward(request, response);
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
