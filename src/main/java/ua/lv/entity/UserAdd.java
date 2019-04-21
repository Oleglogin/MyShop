package ua.lv.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by User on 21.04.2019.
 */
@Entity
public class UserAdd {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String street;
    private String city;
    private String country;
    private String postIndex;
    private String phone;

    private Date dateOrder = new Date();

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private User user;

    public UserAdd() {
    }

    public UserAdd(String address, String city, String country, String index, String phone, Date dateOrder) {
        this.street = address;
        this.city = city;
        this.country = country;
        this.postIndex = postIndex;
        this.phone = phone;
        this.dateOrder = dateOrder;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return street;
    }

    public void setAddress(String address) {
        this.street = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostIndex() {
        return postIndex;
    }

    public void setPostIndex(String index) {
        this.postIndex = index;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
