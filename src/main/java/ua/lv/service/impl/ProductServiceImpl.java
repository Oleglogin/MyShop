package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.ProductDAO;
import ua.lv.entity.Product;
import ua.lv.service.ProductService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
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
    public List<Product> productList(){
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

    @Override
    public List<Product> sortBySubCategory(String category) {
        return productDAO.sortBySubCategory(category);
    }

    @Override
    public List<Product> productSortList(){
        LinkedList<Product> sortList = new LinkedList<>();
        sortList.addAll(productDAO.findAll());

        sortList.sort((o1, o2) -> {
            if (o1.getId() == o2.getId()) {
                return 0;
            } else if (o1.getId() < o2.getId()) {
                return 1;
            } else return -1;
        });
        return sortList;
    }

    @Override
    public void toLike(int id, int cl) {
        productDAO.toLike(id,cl);
    }

    @Override
    public void disLike(int id, int cdl) {
        productDAO.disLike(id,cdl);
    }

    @Override
    public List<Product> expensive() {
        ArrayList<Product> expensiveList = new ArrayList<>();
        expensiveList.addAll(productDAO.findAll());
        expensiveList.sort((o1,o2)->{
            if(o1.getPrice() == o2.getPrice()){
                return 0;
            }else if(o1.getPrice() < o2.getPrice()){
                return 1;
            }else return -1;
        });
        return expensiveList;
    }

    @Override
    public List<Product> poor() {
        ArrayList<Product> expensiveList = new ArrayList<>();
        expensiveList.addAll(productDAO.findAll());
        expensiveList.sort((o1,o2)->{
            if(o1.getPrice() == o2.getPrice()){
                return 0;
            }else if(o1.getPrice() > o2.getPrice()){
                return 1;
            }else return -1;
        });
        return expensiveList;
    }

    @Override
    public List<Product> popular() {
        ArrayList<Product> expensiveList = new ArrayList<>();
        expensiveList.addAll(productDAO.findAll());
        expensiveList.sort((o1,o2)->{
            if(o1.getToLike() == o2.getToLike()){
                return 0;
            }else if(o1.getToLike() < o2.getToLike()){
                return 1;
            }else return -1;
        });
        return expensiveList;
    }
}
