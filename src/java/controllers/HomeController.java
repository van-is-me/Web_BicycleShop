/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import bike.Bike;
import bike.BikeFacade;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import order.Item;
import users.Users;
import users.UsersFacade;

/**
 *
 * @author dell
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

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
            case "index": {
                list(request, response);
            }
            break;
            case "detail": {
                detailByCate(request, response);
            }
            break;
            case "info": {
                info(request, response);
            }
            case "brand": {
                detailByBrand(request, response);
            }
            break;
            case "shoping":
                request.getRequestDispatcher("/home/info.com").forward(request, response);
                break;
            case "addToCart": {
                String op = request.getParameter("op");
                switch (op) {
                    case "add_handler":
                        addHandler(request, response);
                        break;
                    case "buy_handler":
                        buyHandler(request, response);
                        break;
                }
                break;
            }
            case "updateCart":
                updateCart(request, response);
                break;
            case "updating":
                updating(request, response);
                break;
            case "delete": {
                delete(request, response);
                break;
            }
            case "clear": {
                String op = request.getParameter("op");
                switch (op) {
                    case "clear":
                        session.removeAttribute("cart");
                        session.removeAttribute("total");
                        request.getRequestDispatcher("/cart/cart.com").forward(request, response);
                        break;
                    case "buyAll":
                        if (session.getAttribute("cart") == null) {
                            String mess = "Please choose something to payment";
                            request.setAttribute("mess", mess);
                            request.getRequestDispatcher("/cart/cart.com").forward(request, response);
                        } else {
                            if (session.getAttribute("acc") == null) {
                                request.getRequestDispatcher("/user/login.com").forward(request, response);
                            } else {
                                Users u = (Users) session.getAttribute("acc");
                                request.setAttribute("user", u);
                                request.getRequestDispatcher("/cart/checkOut.com").forward(request, response);
                            }

                        }
                        break;
                }
                break;
            }
            case "logining":
                request.getRequestDispatcher("/user/logining.com").forward(request, response);
                break;
            case "logout":
                request.getRequestDispatcher("/user/logout.com").forward(request, response);
                break;
            case "goodbye":
                request.getRequestDispatcher("/cart/goodbye.com").forward(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
                request.setAttribute("message", "error");
        }

        request.getRequestDispatcher(config.Config.LAYOUT).forward(request, response);

    }

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BikeFacade sf = new BikeFacade();
        List<Bike> listDH = sf.selectByCateloryDH(true);
        request.setAttribute("listDH", listDH);
        List<Bike> listDP = sf.selectByCateloryDP(true);
        request.setAttribute("listDP", listDP);
        List<Bike> listD = sf.selectByCateloryD(true);
        request.setAttribute("listD", listD);
        List<Bike> listG = sf.selectByCateloryG(true);
        request.setAttribute("listG", listG);
        List<Bike> listN = sf.selectByCateloryN(true);
        request.setAttribute("listN", listN);
        List<Bike> listTE = sf.selectByCateloryTE(true);
        request.setAttribute("listTE", listTE);

    }

    protected void detailByCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = (String) request.getParameter("type");
        BikeFacade sf = new BikeFacade();
        List<Bike> listCate = null;
        String line = null;
        String typeLine = null;
        switch (type) {
            case "DP": {
                listCate = sf.selectByCateloryDP(false);
                line = "DP";
                typeLine = "Xe Đạp Đường Phố";
            }
            break;
            case "DH":
                listCate = sf.selectByCateloryDH(false);
                line = "DH";
                typeLine = "Xe Đạp Địa Hình";
                break;
            case "D":
                listCate = sf.selectByCateloryD(false);
                line = "D";
                typeLine = "Xe Đạp Đua";
                break;
            case "G":
                listCate = sf.selectByCateloryG(false);
                line = "G";
                typeLine = "Xe Đạp Gấp";
                break;
            case "N":
                listCate = sf.selectByCateloryN(false);
                line = "N";
                typeLine = "Xe Đạp Nữ";
                break;
            case "TE":
                listCate = sf.selectByCateloryTE(false);
                line = "TE";
                typeLine = "Xe Đạp Trẻ Em";
                break;
        }
        request.setAttribute("line", line);
        request.setAttribute("typeLine", typeLine);
        request.setAttribute("listCate", listCate);

    }

    protected void info(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String) request.getParameter("id");
        try {
            Bike bike = BikeFacade.getBike(id);
            BikeFacade sf = new BikeFacade();
            List<String> listImage = sf.listImageDetail(id);
            int size = listImage.size();
            request.setAttribute("bike", bike);
            request.setAttribute("listImage", listImage);
            request.setAttribute("size", size);

        } catch (SQLException ex) {

        }

    }

    protected void detailByBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brand = (String) request.getParameter("brand");
//        System.out.println(brand);
        BikeFacade sf = new BikeFacade();
        List<Bike> items = sf.selectByBrand(brand);

        request.setAttribute("items", items);
        request.setAttribute("brand", brand);

    }

    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        switch (op) {
            case "Yes":
                HttpSession session = request.getSession();
                session.removeAttribute("acc");
                request.getRequestDispatcher("/home/index.com").forward(request, response);
                break;
            case "No":
                request.getRequestDispatcher("/home/index.com").forward(request, response);
                break;
        }

    }

    protected void addHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            String color = request.getParameter("colorOption");
            String size = request.getParameter("sizeOption");
//            int total = 0;
//            int subTotal;
            int quantityTmp = 0;
            boolean confirm = false;
            Bike b = BikeFacade.getBike(id);
            b.setColor(color);
            b.setSize(size);
            if (session.getAttribute("cart") == null) {
                List<Item> cart = new ArrayList<Item>();
                cart.add(new Item(Integer.parseInt(quantity), b));
                session.setAttribute("cart", cart);
//                for (int i = 0; i < cart.size(); i++) {
//                    subTotal = cart.get(i).getBike().getUnitPrice() * cart.get(i).getQuantity();
//                    total = total + subTotal;
//                }
//                request.setAttribute("total", total);
                total(request, response);
            } else {
                List<Item> cart = (List<Item>) session.getAttribute("cart");
                for (int l = 0; l < cart.size(); l++) {
                    if (id.equalsIgnoreCase(cart.get(l).getBike().getProductId())) {
                        quantityTmp = cart.get(l).getQuantity() + Integer.parseInt(quantity);
                        cart.remove(l);
                        cart.add(new Item(quantityTmp, b));
                        confirm = true;
                        total(request, response);
                    }
                }
                if (confirm == false) {
                    cart.add(new Item(Integer.parseInt(quantity), b));
                    total(request, response);
                }
//                for (int i = 0; i < cart.size(); i++) {
//                    subTotal = cart.get(i).getBike().getUnitPrice() * cart.get(i).getQuantity();
//                    total = total + subTotal;
//                }
//                request.setAttribute("total", total);
            }
            request.getRequestDispatcher("/home/index.com").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void buyHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            String color = request.getParameter("colorOption");
            String size = request.getParameter("sizeOption");
//            int total = 0;
//            int subTotal;
            int quantityTmp = 0;
            boolean confirm = false;
            Bike b = BikeFacade.getBike(id);
            b.setColor(color);
            b.setSize(size);
            if (session.getAttribute("cart") == null) {
                List<Item> cart = new ArrayList<Item>();
                cart.add(new Item(Integer.parseInt(quantity), b));
                session.setAttribute("cart", cart);
//                for (int i = 0; i < cart.size(); i++) {
//                    subTotal = cart.get(i).getBike().getUnitPrice() * cart.get(i).getQuantity();
//                    total = total + subTotal;
//                }
//                request.setAttribute("totalInBuy", total);
                total(request, response);
            } else {
                List<Item> cart = (List<Item>) session.getAttribute("cart");
                for (int l = 0; l < cart.size(); l++) {
                    if (id.equalsIgnoreCase(cart.get(l).getBike().getProductId())
                            && color.equalsIgnoreCase(cart.get(l).getBike().getColor())
                            && size.equalsIgnoreCase(cart.get(l).getBike().getSize())) {
                        quantityTmp = cart.get(l).getQuantity() + Integer.parseInt(quantity);
                        cart.remove(l);
                        cart.add(new Item(quantityTmp, b));
                        confirm = true;
                        total(request, response);
                    }
                }
                if (confirm == false) {
                    cart.add(new Item(Integer.parseInt(quantity), b));
                    total(request, response);
                }
//                for (int i = 0; i < cart.size(); i++) {
//                    subTotal = cart.get(i).getBike().getUnitPrice() * cart.get(i).getQuantity();
//                    total = total + subTotal;
//                }
//                request.setAttribute("totalInBuy", total);

            }
            request.getRequestDispatcher("/cart/cart.com").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void total(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            List<Item> cart = (List<Item>) session.getAttribute("cart");
//            if (session.getAttribute("total") == null) {
            int subTotal;
            int total = 0;
            for (int i = 0; i < cart.size(); i++) {
                subTotal = cart.get(i).getBike().getUnitPrice() * cart.get(i).getQuantity();
                total = total + subTotal;
            }
            session.setAttribute("total", total);
//            } else {
//                int total = (int) session.getAttribute("total");
//                int subTotal;
//                for (int i = 0; i < cart.size(); i++) {
//                    subTotal = cart.get(i).getBike().getUnitPrice() * cart.get(i).getQuantity();
//                    total = total + subTotal;
//                }
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void updateCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
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
            request.getRequestDispatcher("/cart/updateCart.com").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void updating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            String color = request.getParameter("colorOption");
            String size = request.getParameter("sizeOption");
            String quantity = request.getParameter("quantity");
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            Bike bike = BikeFacade.getBike(id);
            bike.setSize(size);
            bike.setColor(color);
            cart.add(new Item(Integer.parseInt(quantity), bike));
            total(request, response);
            request.getRequestDispatcher("/cart/cart.com").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            String id = request.getParameter("id");
            String colorOption = request.getParameter("color");
            String sizeOption = request.getParameter("size");
            for (int i = 0; i < cart.size(); i++) {
                if (id.equalsIgnoreCase(cart.get(i).getBike().getProductId())
                        && colorOption.equalsIgnoreCase(cart.get(i).getBike().getColor())
                        && cart.get(i).getBike().getSize().equalsIgnoreCase(sizeOption)) {
                    cart.remove(i);
                }
            }
            total(request, response);
            if (cart.size() == 0) {
                session.removeAttribute("total");
            }

            request.getRequestDispatcher("/cart/cart.com").forward(request, response);

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
