package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import view.CategoryDAO;
import view.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import model.Product;

public class ManageProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    CategoryDAO cdao = new CategoryDAO();
    ProductDAO pdao = new ProductDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        ArrayList<Product> proList = pdao.getAdminProduct();
        request.setAttribute("totalProduct", proList.size());

        int total = proList.size() % 12 == 0 ? proList.size() / 12 : (proList.size() / 12) + 1;

        if (page == total) {
            request.setAttribute("proList", proList.subList((page - 1) * 12, proList.size()));
        } else {
            request.setAttribute("proList", proList.subList((page - 1) * 12, page * 12));
        }
        request.setAttribute("catList", cdao.getCategory());
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.getRequestDispatcher("manage.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            pdao.changeProduct(name, image, quantity, price, description, id);

        } else if ("add".equals(action)) {
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            int cate_id = Integer.parseInt(request.getParameter("category"));
            pdao.addProduct(name, image, quantity, price, cate_id, description);
        } else {// delete
            int id = Integer.parseInt(request.getParameter("id"));
            pdao.deleteProduct(id);
        }
        int page = Integer.parseInt(request.getParameter("page"));
        response.sendRedirect("manage?page=" + page);

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
