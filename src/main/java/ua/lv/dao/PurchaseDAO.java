package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Product;
import ua.lv.entity.Purchase;

import java.util.List;

/*
 * Created by User on 14.04.2019.
 */
public interface PurchaseDAO extends JpaRepository<Purchase, Integer>{

    @Query("from Purchase purchase where purchase.user.id=:id")
    List<Purchase> productListInCurt(@Param("id") int id);

    @Query("select sum (purchase.amount) from Purchase purchase where purchase.user.id=:id")
    int amountInCart(@Param("id")int id);
}
