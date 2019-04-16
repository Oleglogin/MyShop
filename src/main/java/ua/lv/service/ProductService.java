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
}
