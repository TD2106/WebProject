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
public class MemberController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        MemberDAO memberDAO = new MemberDAO();
        AdminDAO adminDAO = new AdminDAO();
        HttpSession session = request.getSession();
        switch(action){
            case "login":{
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                this.removeBlankSpace(username);
                this.removeBlankSpace(password);
                password = AES.encrypt(password, "bestmoviesite");
                if(memberDAO.isLoginInformationCorrect(username, password)){
                    Member member = memberDAO.getMemberByUserName(username);
                    if(adminDAO.isAdmin(username, password)){
                        member = (Admin) member;
                        session.setAttribute("admin", member);
                    }
                    else session.setAttribute("member", member);
                    response.sendRedirect("index.jsp");
                    return;
                }
                else{
                    response.sendRedirect("login.jsp?result=invalid");
                    return;
                }
            }
            case "register":{
                if(session.getAttribute("member") != null || session.getAttribute("admin") != null){
                    response.sendRedirect("index.jsp");
                    return;
                }
                else{
                    String username = (String) request.getParameter("username");
                    String email = (String) request.getParameter("email");
                    String password = (String) request.getParameter("password");
                    String profilePictureLink = (String) request.getParameter("profilePictureLink");
                    this.removeBlankSpace(username);
                    this.removeBlankSpace(email);
                    this.removeBlankSpace(password);
                    this.removeBlankSpace(profilePictureLink);
                    password = AES.encrypt(password, "bestmoviesite");
                    if(memberDAO.isMemberWithEmailExist(email)||memberDAO.isMemberWithUserNameExist(username)){
                        response.sendRedirect("register.jsp?result=exists");
                        return;
                    }
                    else{
                        if(profilePictureLink == null) memberDAO.addMember(username, password, email);
                        else memberDAO.addMember(username, password, email, profilePictureLink);
                        Member member = memberDAO.getMemberByUserName(username);
                        session.setAttribute("member", member);
                        response.sendRedirect("index.jsp");
                        return;
                    }
                }
            }
            case "logout":{
                session.removeAttribute("member");
                session.removeAttribute("admin");
                response.sendRedirect("index.jsp");
                return;
            }
            case "editprofile":{
                if(session.getAttribute("member") == null && session.getAttribute("admin") == null){
                    response.sendRedirect("notMember.jsp");
                    return;
                }
                Member member;
                if(session.getAttribute("member")!=null) member = (Member) session.getAttribute("member");
                else member = (Admin) session.getAttribute("admin");
                String password = request.getParameter("password");
                String profilePictureLink = request.getParameter("profilePictureLink");
                String email = request.getParameter("email");
                this.removeBlankSpace(email);
                this.removeBlankSpace(password);
                this.removeBlankSpace(profilePictureLink);
                if(memberDAO.isMemberWithEmailExist(email)&&!email.equals(member.getEmail())){
                    response.sendRedirect("editInfo.jsp?result=emailexist");
                    return;
                }
                memberDAO.updateEmail(email, member.getMemberID());
                memberDAO.updateProfilePictureLink(profilePictureLink, member.getMemberID());
                memberDAO.updateUserPassword(password, member.getMemberID());
                response.sendRedirect("member.jsp?id="+member.getMemberID());
                return;
            }
            
            default:{
                response.sendRedirect("index.jsp");
                return;
            }
        }
    }
    public void removeBlankSpace(String inputData){
        inputData = inputData.replaceAll("\\s+","");
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
            Logger.getLogger(MemberController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(MemberController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberController.class.getName()).log(Level.SEVERE, null, ex);
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
