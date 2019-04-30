package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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

    @Query("select sum (purchase.amount) from Purchase purchase where purchase.user.id=:id and purchase.successOrder=:successOrder")
    Integer amountInCart(@Param("id")int id,@Param("successOrder") boolean successOrder);

    @Query("select count (product.id) from Purchase purchase where purchase.user.id=:id and purchase.successOrder=:successOrder")
    int countProductInBasket(@Param("id")int id,@Param("successOrder")boolean successOrder);

    @Modifying
    @Query("update Purchase p set p.success=:success where p.user.id=:id")
    void success(@Param("id")int id,@Param("success")boolean success);

    @Modifying
    @Query("update Purchase p set p.successOrder=:successOrder where p.user.id=:id")
    void successOrder(@Param("id") int id,@Param("successOrder")boolean successOrder);

    @Modifying
    @Query("update Purchase p set p.checkOrder=:checkOrder where p.id=:id")
    void check(@Param("id") int id,@Param("checkOrder")boolean checkOrder);


}
