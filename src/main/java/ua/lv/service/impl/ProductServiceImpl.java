package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.ProductDAO;
import ua.lv.entity.Product;
import ua.lv.service.ProductService;

import java.util.List;

/**
 * Created by User on 13.04.2019.
 */
@Transactional
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDAO productDAO;

    @Override
    public void save(Product product) {
        productDAO.save(product);
    }

    @Override
    public void delete(int id) {
        productDAO.delete(id);
    }

    @Override
    public List<Product> productList() {
        return productDAO.findAll();
    }

    @Override
    public Product findProductById(int id) {
        return productDAO.findOne(id);
    }

    @Override
    public List<Product> sortByCategory(String category) {
        return productDAO.sortByCategory(category);
    }
}
