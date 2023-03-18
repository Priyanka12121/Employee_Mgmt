
package com.exavalu.entities;

import com.exavalu.empweb.utils.JDBCConnectionManager;
import com.exavalu.services.UserService;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {
 private String emailAddress,password,firstName,lastName;

public String getEmailAddress() {
   return emailAddress;
    }

public void setEmailAddress(String emailAddress) {
this.emailAddress = emailAddress;
}

public String getPassword() {
return password;
}

public void setPassword(String password) {
this.password = password;

}
    public String getFirstName()
{
return firstName;
}

public void setFirstName(String firstName) {
this.firstName = firstName;
}


public String getLastName() {
return lastName;
}

public void setLastName(String lastName) {
    this.lastName = lastName;
}
//public static boolean doRegister(String emailAddress, String password, String firstName, String lastName) {
//        boolean result = false;
//        try {
//
//            Connection con = JDBCConnectionManager.getMySQLConnection();
//            String sql = "INSERT INTO users (emailAddress,password,firstName,lastName,status)"
//                    + "VALUES (?,?,?,?,?)";
//
//            PreparedStatement preparedStatement;
//            preparedStatement = con.prepareStatement(sql);
//            preparedStatement.setString(1, emailAddress);
//            preparedStatement.setString(2, password);
//
//            preparedStatement.setString(3, firstName);
//            preparedStatement.setString(4, lastName);
//            preparedStatement.setInt(5, 1);
//
//            int row = preparedStatement.executeUpdate();
//            if (row != 0) {
//                result = true;
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return result;
//    }
}

