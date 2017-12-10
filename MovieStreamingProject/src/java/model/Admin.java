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
public class Admin extends Member{
    
    public Admin(int memberID, String userName, String email, String password, String profilePictureLink) {
        super(memberID, userName, email, password, profilePictureLink);
    }
    
}
