/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import bike.Bike;
import bike.BikeFacade;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
@WebServlet(name = "AdministratorController", urlPatterns = {"/admin"})
public class AdministratorController extends HttpServlet {

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
        switch (action) {
            case "manager":
                list(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "showCreateForm":
                showCreateForm(request, response);
                break;
            case "create":
                create(request, response);
                break;
            case "update":
                edit(request, response);
                break;
            case "updating":
                update(request, response);
                break;
            case "delete":
                confirm(request, response);
                break;
            case "choosing":
                choosing(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
                request.setAttribute("message", "error");
        }
        request.getRequestDispatcher(config.Config.LAYOUT).forward(request, response);

    }

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BikeFacade bf = new BikeFacade();
        List<Bike> list = bf.selectAllOfAdmin();
        request.setAttribute("listCate", list);
    }

    protected void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            BikeFacade bf = new BikeFacade();
            List<Bike> list = bf.selectAllOfAdmin();
            request.setAttribute("list", list);
            request.getRequestDispatcher("/WEB-INF/views/admin/create.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("result", "Exception: " + e.getMessage());
        }
    }

    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        BikeFacade bf = new BikeFacade();
        List<Bike> list = bf.search(name);
        request.setAttribute("listCate", list);
        request.getRequestDispatcher("/WEB-INF/views/admin/manager.jsp").forward(request, response);

    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String size = request.getParameter("size");
            String FrameMaterial = request.getParameter("FM");
            int price = Integer.parseInt(request.getParameter("price"));
            String color = request.getParameter("color");
            String cateId = request.getParameter("cateId");
            String brandId = request.getParameter("brandId");

            Bike b = new Bike();
            b.setProductId(id);
            b.setProductName(name);
            b.setSize(size);
            b.setFrameMaterial(FrameMaterial);
            b.setUnitPrice(price);
            b.setColor(color);
            b.setCategoryId(cateId);
            b.setBrandId(brandId);
            request.setAttribute("bike", b);

            BikeFacade bf = new BikeFacade();
            if (bf.create(b)) {
                request.getRequestDispatcher("/admin/manager.com").forward(request, response);
                return;
            } else {
                request.setAttribute("result", "Can't insert this bike.");
            }
        } catch (Exception e) {
            request.setAttribute("result", "Exception: " + e.getMessage());
            e.printStackTrace();
        }
        showCreateForm(request, response);
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id").trim();
        BikeFacade bf = new BikeFacade();
        Bike b = bf.find(id);
        request.setAttribute("bike", b);
        request.getRequestDispatcher("/WEB-INF/views/admin/edit.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id").trim();
            String name = request.getParameter("name");
            String size = request.getParameter("size");
            String FrameMaterial = request.getParameter("FM");
            int price = Integer.parseInt(request.getParameter("price"));
            String color = request.getParameter("color");
            String cateId = request.getParameter("cateId");
            String brandId = request.getParameter("brandId");

            Bike bike = new Bike();
            bike.setProductId(id);
            bike.setProductName(name);
            bike.setSize(size);
            bike.setFrameMaterial(FrameMaterial);
            bike.setUnitPrice(price);
            bike.setColor(color);
            bike.setCategoryId(cateId);
            bike.setBrandId(brandId);
            BikeFacade bf = new BikeFacade();
            if (bf.update(bike)) {
                request.getRequestDispatcher("/admin/manager.com").forward(request, response);
                return;
            }
        } catch (Exception e) {
        }
        request.setAttribute("result", "Can't update this Product.");
        request.getRequestDispatcher("/admin/update.com").forward(request, response);
    }

    protected void confirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("id", id);
        request.getRequestDispatcher("/WEB-INF/views/admin/delete.jsp").forward(request, response);
    }

    protected void choosing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        switch (op) {
            case "Yes":
                String id = request.getParameter("id");
                BikeFacade bf = new BikeFacade();
                if (bf.remove(id)) {
                    request.getRequestDispatcher("/admin/manager.com").forward(request, response);
                } else {
                    request.setAttribute("result", "Can't remove this product.");
                    request.getRequestDispatcher("/admin/delete.com").forward(request, response);
                }
                break;
            case "No":
                request.getRequestDispatcher("/admin/manager.com").forward(request, response);
                break;
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
