package ua.lv.entity;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.File;
import java.io.IOException;

/**
 * Created by User on 14.04.2019.
 */
@Entity
public class Preview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String previewImg;
    private String previewCategory;
    private String previewTitle;
    private String previewPrice;
    @Column(columnDefinition = "text")
    private String previewDescription;



    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private Product product;

    public Preview() {
    }
    public Preview(String previewImg, String previewCategory, String previewTitle, String previewPrice, Product product) {
        this.previewImg = previewImg;
        this.previewCategory = previewCategory;
        this.previewTitle = previewTitle;
        this.previewPrice = previewPrice;
        this.product = product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPreviewImg() {
        return previewImg;
    }

    public void setPreviewImg(MultipartFile multipartFile) {
        String path = System.getProperty("user.home") + File.separator + "Pictures\\";
        try {
            multipartFile.transferTo(new File(path + multipartFile.getOriginalFilename()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.previewImg = "\\workImg\\" + multipartFile.getOriginalFilename();

    }

    public String getPreviewCategory() {
        return previewCategory;
    }

    public void setPreviewCategory(String previewCategory) {
        this.previewCategory = previewCategory;
    }

    public String getPreviewTitle() {
        return previewTitle;
    }

    public void setPreviewTitle(String previewTitle) {
        this.previewTitle = previewTitle;
    }

    public String getPreviewPrice() {
        return previewPrice;
    }

    public void setPreviewPrice(String previewPrice) {
        this.previewPrice = previewPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getPreviewDescription() {
        return previewDescription;
    }

    public void setPreviewDescription(String previewDescription) {
        this.previewDescription = previewDescription;
    }
}
