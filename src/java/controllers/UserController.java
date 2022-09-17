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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.Users;
import users.UsersFacade;

/**
 *
 * @author dell
 */
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

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
            case "register":
                break;
            case "login":
                break;
//            case "forgot":
//                break;
            case "shoping":
                request.getRequestDispatcher("/home/info.com").forward(request, response);
                break;
            case "addToCart":
                request.getRequestDispatcher("/home/addToCart.com").forward(request, response);
                break;
            case "logining":
                login(request, response);
                break;
            case "signUp":
                signUp(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
                request.setAttribute("message", "error");
        }
        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("user");
        String password = request.getParameter("password");
        String total = request.getParameter("total");
        String result;
        UsersFacade uf = new UsersFacade();
        Users u = uf.checkLogin(userName, password);
        if (u == null) {
            result = "Login failed! username or password is incorrect";
            request.setAttribute("result", result);
            request.getRequestDispatcher("/user/login.com").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", u);
            request.setAttribute("total", total);
            request.getRequestDispatcher("/home/index.com").forward(request, response);
        }
    }

    protected void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("su-user");
        String password = request.getParameter("su-password");
        String rePassword = request.getParameter("re-su-password");
        Random generator = new Random();
        String randomId = "u" + String.valueOf(generator.nextInt(999999));

        if (!password.equals(rePassword)) {
            request.setAttribute("result", "Passwords do not match!");
            request.getRequestDispatcher("/user/register.com").forward(request, response);
        } else {
            UsersFacade uf = new UsersFacade();

            Users u = uf.checkAccountExist(userName);
            if (u == null) {
                u = new Users();
                u.setUserId(randomId);
                u.setUserName(userName);
                u.setPassword(password);
                request.setAttribute("user", u);

                if (uf.signUp(u)) {
                    request.getRequestDispatcher("/user/login.com").forward(request, response);
                    return;
                } else {
                    request.setAttribute("result", "Can't insert this account.");
                    request.getRequestDispatcher("/user/register.com").forward(request, response);
                }
            } else {
                request.setAttribute("result", "Username already exists!");
                request.getRequestDispatcher("/user/register.com").forward(request, response);
            }

        }

    }

    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("acc");
        request.getRequestDispatcher("/home/index.com").forward(request, response);

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
