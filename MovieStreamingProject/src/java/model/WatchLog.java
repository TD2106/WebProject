/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Duy Le
 */
public class WatchLog extends Log{
    private int movieID;


    public WatchLog(int movieID, int logID, String time, int memberID) {
        super(logID, time, memberID);
        this.movieID = movieID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }
    
}
