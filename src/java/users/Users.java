/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

/**
 *
 * @author dell
 */
public class Users {

    private String userId;
    private String fullName;
    private String userName;
    private String password;
    private String roleId;
    private String address;
    private String phone;
    private String dob;


    public Users() {
    }

    public Users(String fullName, String userName, String address, String phone, String dob) {
        this.fullName = fullName;
        this.userName = userName;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
    }
    
    

    public Users(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public Users(String userId, String userName, String password) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
    }
    
    

    public Users(String userId, String fullName, String userName, String password, String roleId, String address, String phone, String dob) {
        this.userId = userId;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.roleId = roleId;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

}
