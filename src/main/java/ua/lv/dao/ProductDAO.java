package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Product;

import java.util.List;

/**
 * Created by User on 13.04.2019.
 */
public interface ProductDAO extends JpaRepository<Product, Integer> {

    @Query("from Product product where product.category=:category")
    List<Product> sortByCategory(@Param("category")String category);
}
