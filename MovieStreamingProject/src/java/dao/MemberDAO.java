/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import db.DBConnection;
import java.sql.*;
import java.util.*;
import model.*;
/**
 *
 * @author Duy Le
 */
public class MemberDAO {
    private Connection dbConnection;
    public MemberDAO() throws SQLException, ClassNotFoundException{
        dbConnection = DBConnection.getConnection();
    }
    public ArrayList<Member> getAllMember() throws SQLException{
        Statement sqlStatement = dbConnection.createStatement();
        ResultSet allMember = sqlStatement.executeQuery("select * from member ");
        ArrayList<Member> memberList = new ArrayList<>();
        while(allMember.next()){
            memberList.add(new Member(allMember.getInt("idMember"),allMember.getString("userName"),allMember.getString("password")
                    ,allMember.getString("email"),allMember.getString("profilePictureLink")));
            
        }
        return memberList;
    }
    public boolean isMemberWithEmailExist (String email) throws SQLException{
        Statement  sqlStatement = dbConnection.createStatement();
        ResultSet resultSet = sqlStatement.executeQuery("select * from member where member.email = '"+email+"'");
        return resultSet != null;
    }
    
//    public static void main(String[] args) throws SQLException, ClassNotFoundException{
//        MemberDAO test = new MemberDAO();
//        System.out.println(test.isMemberWithEmailExist("thanhduy2106@gmail.com"));
//    }
}
