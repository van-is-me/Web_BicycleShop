/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import bike.Bike;
import users.Users;

/**
 *
 * @author dell
 */
public class Item {
    private int quantity;
    private Bike bike;
    private Users user;
    public Item() {
    }

    public Item(int quantity, Bike bike) {
        this.quantity = quantity;
        this.bike = bike;
    }

    public Item(int quantity, Bike bike, Users user) {
        this.quantity = quantity;
        this.bike = bike;
        this.user = user;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Bike getBike() {
        return bike;
    }

    public void setBike(Bike bike) {
        this.bike = bike;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
    
    
    
    
}
