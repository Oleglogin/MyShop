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
    int amountInCart(int id,int number);
    int countProductInBasket(int id, int number);
    void success(int id, int number);
    void successOrder(int id, int number);
    void check(int id, int number);
}
