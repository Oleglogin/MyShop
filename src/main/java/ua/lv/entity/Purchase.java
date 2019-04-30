package ua.lv.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by User on 12.03.2019.
 */
@Entity
public class Purchase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int count;
    private int amount;
    private boolean success;
    private boolean successOrder;
    private String bikeSize;
    private boolean checkOrder;
    private Date dateOrder = new Date();




    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private User user;
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private Product product;



    public Purchase() {
    }

    public Purchase(int count) {
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }


    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public boolean isSuccessOrder() {
        return successOrder;
    }

    public void setSuccessOrder(boolean successOrder) {
        this.successOrder = successOrder;
    }

    public String getBikeSize() {
        return bikeSize;
    }

    public void setBikeSize(String bikeSize) {
        this.bikeSize = bikeSize;
    }

    public boolean isCheckOrder() {
        return checkOrder;
    }

    public void setCheckOrder(boolean checkOrder) {
        this.checkOrder = checkOrder;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    @Override
    public String toString() {
        return "Purchase{" +
                "id=" + id +
                ", count='" + count + '\'' +
                '}';
    }
}
