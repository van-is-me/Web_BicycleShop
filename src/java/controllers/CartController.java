/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import bike.Bike;
import bike.BikeFacade;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.Item;
import users.Users;
import users.UsersFacade;

/**
 *
 * @author dell
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = String.valueOf(request.getAttribute("action"));
        String controller = String.valueOf(request.getAttribute("controller"));
        HttpSession session = request.getSession();
        switch (action) {
            case "cart":
                String total = request.getParameter("total");
                request.setAttribute("total", total);
                break;
            case "clear":
                request.getRequestDispatcher("/home/clear.com").forward(request, response);
                break;
            case "index":
                request.getRequestDispatcher("/home/index.com").forward(request, response);
                break;
            case "updateCart": {
                try {
                    String id = request.getParameter("id");
                    String color = request.getParameter("color");
                    String size = request.getParameter("size");
                    String quantity = request.getParameter("quantity");
                    Bike bike = BikeFacade.getBike(id);
                    List<Item> cart = (List<Item>) session.getAttribute("cart");
                    for (int i = 0; i < cart.size(); i++) {
                        if (id.equalsIgnoreCase(cart.get(i).getBike().getProductId())
                                && cart.get(i).getBike().getColor().equalsIgnoreCase(color)
                                && cart.get(i).getBike().getSize().equalsIgnoreCase(size)) {
                            bike.setSize(size);
                            bike.setColor(color);
                            cart.remove(i);
                        }
                    }

                    request.setAttribute("bike", bike);
                    request.setAttribute("quantity", quantity);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            }
            case "checkOut":
                break;
            case "updating":
                request.getRequestDispatcher("/home/updating.com").forward(request, response);
                break;
            case "delete":
                request.getRequestDispatcher("/home/delete.com").forward(request, response);
                break;
            case "logining":
                request.getRequestDispatcher("/user/logining.com").forward(request, response);
                break;
            case "goodbye": {
                goodbye(request, response);
                break;
            }
            case "logout":
                request.getRequestDispatcher("/user/logout.com").forward(request, response);
                break;
            default:

        }
        request.getRequestDispatcher(config.Config.LAYOUT).forward(request, response);

    }

    protected void goodbye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String fullName = request.getParameter("fullName");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            Users u = (Users) session.getAttribute("acc");
            BikeFacade bf = new BikeFacade();

            List<Item> cart = (List<Item>) session.getAttribute("cart");
//            List<Bike> bikeList = bf.selectAll();
            u.setFullName(fullName);
            u.setAddress(address);
            u.setPhone(phone);
            u.setDob(dob);
            UsersFacade uf = new UsersFacade();
            for (int i = 0; i < cart.size(); i++) {
                Bike b = bf.findQuantity(cart.get(i).getBike().getProductId());
                b.setQuantity(b.getQuantity() - cart.get(i).getQuantity());
                bf.updateQuantity(b);
            }
            if (uf.updateUser(u)) {
                session.removeAttribute("cart");
                session.removeAttribute("total");
                request.getRequestDispatcher("/cart/thanks.com").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

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
