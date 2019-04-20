package ua.lv.entity;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
    private String subCategory;
    private String productImg;
    private int price;
    private boolean available;
    private int rate;
    private int size;
    @Column(columnDefinition = "text")
    private String description;
    private Date dateOfsave = new Date();
    private int tulike;
    private int disLike;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private User user;

    @OneToMany (cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
    private List<Purchase> purchases;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
    private List<Preview> previews;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
    private List<Likes> likes;

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

    public String getSubCategory() {
        return subCategory;
    }

    public void setSubCategory(String subCategory) {
        this.subCategory = subCategory;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(MultipartFile multipartFile) {
        String path = System.getProperty("user.home") + File.separator + "Pictures\\";
        try {
            multipartFile.transferTo(new File(path + multipartFile.getOriginalFilename()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.productImg = "\\workImg\\" + multipartFile.getOriginalFilename();
    }

    public int getTulike() {
        return tulike;
    }

    public void setTulike(int tulike) {
        this.tulike = tulike;
    }

    public int getDisLike() {
        return disLike;
    }

    public void setDisLike(int disLike) {
        this.disLike = disLike;
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
