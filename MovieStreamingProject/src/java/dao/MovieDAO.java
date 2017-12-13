/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Duy Le
 */
import db.DBConnection;
import java.sql.*;
import model.*;
import java.util.*;
public class MovieDAO {
    private final Connection dbConnection;
    public MovieDAO() throws SQLException, ClassNotFoundException{
        dbConnection = DBConnection.getConnection();
    }
    public double calculateAverageRatingByID(int idMovie) throws SQLException{
        double res = 0;
        String sqlQuery = "select avg(rating)\n" +
                            "from rating\n" +
                            "where rating.idMovie = ?;";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setInt(1, idMovie);
        ResultSet resultSet = sqlStatement.executeQuery();
        while(resultSet.next()){
            res = resultSet.getDouble(1);
        }
        return res;
    }
    public Movie getMovieByID(int movieID) throws SQLException{
        String sqlQuery = "select * from movie where movie.idmovie = ?";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setInt(1, movieID);
        ResultSet resultSet = sqlStatement.executeQuery();
        Movie resultMovie = null;
        while(resultSet.next()){
            resultMovie = new Movie(resultSet.getInt("idMovie"),resultSet.getString("movieName"),resultSet.getString("movieDescription"),
            resultSet.getString("moviePosterLink"),resultSet.getString("movieTrailerLink"),resultSet.getString("country"),
            resultSet.getString("year"),resultSet.getString("length"),resultSet.getInt("idCategory"),this.calculateAverageRatingByID(resultSet.getInt("idMovie")));
        }
        return resultMovie;
    }
    public ArrayList<Movie> getAllMovie()throws SQLException{
        ArrayList<Movie> allMovie = new ArrayList<>();
        String sqlQuery = "select * from movie";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        ResultSet resultSet = sqlStatement.executeQuery();
        while(resultSet.next()){
            allMovie.add(this.getMovieByID(resultSet.getInt("idMovie")));
        }
        return allMovie;
    }
    public void addMovie(String movieName, String movieDescription, String posterLink, String trailerLink, String country, String year, String length, int categoryID) throws SQLException {
        String sqlQuery = "insert into movie (moviename,moviedescription,movieposterlink,movietrailerlink,country,year,length,idcategory)\n" +
        "values (?,?,?,?,?,?,?,?);";
        PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery);
        sqlStatement.setString(1,movieName);
        sqlStatement.setString(2,movieDescription);
        sqlStatement.setString(3,posterLink);
        sqlStatement.setString(4,trailerLink);
        sqlStatement.setString(5,country);
        sqlStatement.setString(6,year);
        sqlStatement.setString(7,length);
        sqlStatement.setInt(8,categoryID);
        sqlStatement.execute();
    }
    
//    public static void main(String[] args) throws Exception{
//        MovieDAO test = new MovieDAO();
//        test.addMovie("123 ", "123 ", "posterLink", "trailerLink", "country", "year", "length", 1);
//    }
}
