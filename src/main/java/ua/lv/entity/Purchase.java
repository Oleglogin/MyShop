package ua.lv.entity;

import javax.persistence.*;

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
    private int success;
    private int successOrder;
    private int size;
    private String clotheSize;




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



    public int isSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }


    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getClotheSize() {
        return clotheSize;
    }

    public void setClotheSize(String clotheSize) {
        this.clotheSize = clotheSize;
    }

    public int getSuccess() {
        return success;
    }

    public int getSuccessOrder() {
        return successOrder;
    }

    public void setSuccessOrder(int successOrder) {
        this.successOrder = successOrder;
    }

    @Override
    public String toString() {
        return "Purchase{" +
                "id=" + id +
                ", count='" + count + '\'' +
                '}';
    }
}
