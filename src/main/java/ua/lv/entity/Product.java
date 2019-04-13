package ua.lv.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by User on 13.04.2019.
 */
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String productTitle;
    private String category;
    private int price;
    private boolean available;
    private int rate;
    private int size;
    @Column(columnDefinition = "text")
    private String description;
    private Date dateOfsave = new Date();

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private User user;

    public Product() {
    }

    public Product(String productTitle, String category, int price, boolean available, int rate, int size, String description, Date dateOfsave, User user) {
        this.productTitle = productTitle;
        this.category = category;
        this.price = price;
        this.available = available;
        this.rate = rate;
        this.size = size;
        this.description = description;
        this.dateOfsave = dateOfsave;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateOfsave() {
        return dateOfsave;
    }

    public void setDateOfsave(Date dateOfsave) {
        this.dateOfsave = dateOfsave;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", productTitle='" + productTitle + '\'' +
                ", category='" + category + '\'' +
                ", price=" + price +
                ", available=" + available +
                ", rate=" + rate +
                ", size=" + size +
                ", description='" + description + '\'' +
                ", dateOfsave=" + dateOfsave +
                ", user=" + user +
                '}';
    }
}
