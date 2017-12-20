/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import security.AES;

/**
 *
 * @author Duy Le
 */
public class FavoriteController extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        MemberDAO memberDAO = new MemberDAO();
        MovieDAO movieDAO = new MovieDAO();
        Member member;
        HttpSession session = request.getSession();
        if (session.getAttribute("member") == null && session.getAttribute("admin") == null) {
            response.sendRedirect("notMember.jsp");
            return;
        }
        if (session.getAttribute("member") != null) {
            member = (Member) session.getAttribute("member");
        } else {
            member = (Member) session.getAttribute("admin");
        }
        if (!memberDAO.isMemberWithUserNameExist(member.getUserName())) {
            session.removeAttribute("member");
            session.removeAttribute("admin");
            response.sendRedirect("index.jsp");
            return;
        }
        String action = request.getParameter("action");
        switch (action) {
            case "add": {
                String temp = request.getParameter("movieID");
                if (temp == null) {
                    response.sendRedirect("index.jsp");
                    return;
                }
                int movieID = Integer.parseInt(temp);
                movieDAO.addToFavorite(member.getMemberID(), movieID);
                response.sendRedirect("viewMovie.jsp?id=" + movieID);
                return;
            }
            case "delete": {
                String temp = request.getParameter("movieID");
                if (temp == null) {
                    response.sendRedirect("index.jsp");
                    return;
                }
                int movieID = Integer.parseInt(temp);
                movieDAO.deleteFromFavorite(member.getMemberID(), movieID);
                response.sendRedirect(request.getHeader("referer"));
                return;
            }
            case "view":{
                ArrayList<Movie> favoriteMovies = movieDAO.getAllFavoriteMovieOfAMemberByID(member.getMemberID());
                session.setAttribute("favoriteMovies", favoriteMovies);
                response.sendRedirect(request.getHeader("referer"));
                return;
            }
            default:{
                response.sendRedirect("index.jsp");
                return;
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FavoriteController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FavoriteController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FavoriteController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FavoriteController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
