package ua.lv.service;

import ua.lv.entity.Product;

import java.util.List;

/**
 * Created by User on 13.04.2019.
 */
public interface ProductService {
    void save(Product product);
    void delete(int id);
    List<Product> productList();
    List<Product> productSortList();
    Product findProductById(int id);
    List<Product> sortByCategory(String category);
    List<Product> sortBySubCategory(String category);

    void toLike(int id,int cl);
    void disLike(int id,int cdl);

    List<Product>expensive();
    List<Product>poor();
    List<Product>popular();
    List<Product>sortByName(String name);
    List<Product>search(String search);
}
