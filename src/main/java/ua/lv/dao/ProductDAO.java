package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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

    @Query("from Product product where product.subCategory=:category")
    List<Product> sortBySubCategory(@Param("category")String category);

    @Modifying
    @Query("update Product p  set p.toLike=:cl where p.id=:id ")
    void toLike(@Param("id")int id,@Param("cl")int cl);

    @Modifying
    @Query("update Product p  set p.disLike=:cdl where p.id=:id")
    void disLike(@Param("id")int id,@Param("cdl")int cdl);
}
