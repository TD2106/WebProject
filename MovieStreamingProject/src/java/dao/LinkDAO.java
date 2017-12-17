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
public class LinkDAO {
    private final Connection dbConnection;
    public LinkDAO() throws SQLException, ClassNotFoundException{
        dbConnection = DBConnection.getConnection();
    }
    public void addLink(String movieLink,String serverName,int movieID) throws SQLException{
        String sqlQuery = "insert into link (movielink,servername,idmovie) values (?,?,?)";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setString(1, movieLink);
        sqlStatement.setString(2, serverName);
        sqlStatement.setInt(3, movieID);
        sqlStatement.execute();
    }
    public ArrayList<Link> getLinkByMovieID(int movieID) throws SQLException{
        String sqlQuery = "select * from link where idmovie = ?";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setInt(1, movieID);
        ResultSet resultSet = sqlStatement.executeQuery();
        ArrayList<Link> result = new ArrayList<>();
        while(resultSet.next()){
            result.add(new Link(resultSet.getInt("idlink"),resultSet.getString("movielink"),resultSet.getString("servernam"),
            resultSet.getInt("idmove")));
        }
        return result;
    }
    public void deleteLink(int linkID) throws SQLException{
        String sqlQuery = "delete from link where idlink = ?";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setInt(1, linkID);
        sqlStatement.execute();
    }
//    public static void main(String[] args) throws SQLException, ClassNotFoundException{
//        LinkDAO test = new LinkDAO();
//        test.getLinkByMovieID(1);
//    }
}
