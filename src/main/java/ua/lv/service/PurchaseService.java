package ua.lv.service;

import ua.lv.entity.Purchase;

import java.util.List;

/**
 * Created by User on 14.04.2019.
 */
public interface PurchaseService {
    void addPurchase(Purchase purchase);
    void deletePurchase(int id);
    List<Purchase> purchaseList();
    Purchase findPurchaseById(int id);
    List<Purchase> productListInCurt(int id);
    int amountInCart(int id,boolean successOrder);
    int countProductInBasket(int id, boolean successOrder);
    void success(int id, boolean success);
    void successOrder(int id, boolean successOrder);
    void check(int id, boolean checkOut);
}
