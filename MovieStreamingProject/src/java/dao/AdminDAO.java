/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnection;
import java.sql.*;
import model.*;
/**
 *
 * @author Duy Le
 */
public class AdminDAO {
    private final Connection dbConnection;
    public AdminDAO() throws SQLException, ClassNotFoundException{
        dbConnection = DBConnection.getConnection();
    }
    public boolean isAdmin(String userName,String password) throws SQLException{
        String sqlQuery = "select idMember from Admin where Admin.idMember in "
                +"(select idMember from member where member.userName = ? and member.password = ?)";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setString(1, userName);
        sqlStatement.setString(2, password);
        ResultSet resultSet = sqlStatement.executeQuery();
        return resultSet.next();
    }
    public void adAmin(int memberID) throws SQLException{
        String sqlQuery = "insert into admin (idMember) values (?)";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setString(1, Integer.toString(memberID));
        sqlStatement.execute();
    }
    public void deleteAdminRight(int memberID) throws SQLException{
        String sqlQuery = "delete from admin where Admin.idMember = ?";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setString(1, Integer.toString(memberID));
        sqlStatement.execute();
    }
//    public static void main(String[] args) throws SQLException, ClassNotFoundException{
//        AdminDAO test = new AdminDAO();
//        test.deleteAdminRight(1);
//    }
}
