/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.*;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import java.math.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Duy Le
 */
public class MovieController extends HttpServlet {

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
        LinkDAO linkDAO = new LinkDAO();
        LogDAO logDAO = new LogDAO();
        AdminDAO adminDAO = new AdminDAO();
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
        String movieIDString = request.getParameter("movieID");
        if (movieIDString == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        int movieID = Integer.parseInt(movieIDString);
        String action = request.getParameter("action");
        switch (action) {
            case "watch": {
                ArrayList<Link> movieLinks = linkDAO.getLinkByMovieID(movieID);
                session.setAttribute("listOfLinks" + movieID, movieLinks);
                response.sendRedirect("");
                logDAO.addWatchLog(member.getMemberID(), movieID);
                return;
            }
            case "edit": {
                if (!adminDAO.isAdmin(member.getMemberID())) {
                    response.sendRedirect("notMember.jsp");
                    return;
                }
                
            }
            case "delete": {
                if (!adminDAO.isAdmin(member.getMemberID())) {
                    response.sendRedirect("notMember.jsp");
                    return;
                }
            }
            case "add": {
                if (!adminDAO.isAdmin(member.getMemberID())) {
                    response.sendRedirect("notMember.jsp");
                    return;
                }
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
            Logger.getLogger(MovieController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MovieController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(MovieController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MovieController.class.getName()).log(Level.SEVERE, null, ex);
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
