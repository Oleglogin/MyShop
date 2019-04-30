package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.PurchaseDAO;
import ua.lv.entity.Purchase;
import ua.lv.service.PurchaseService;

import java.util.List;

/**
 * Created by User on 14.04.2019.
 */
@Transactional
@Service
public class PurchaseServiceImpl implements PurchaseService {
    @Autowired
    PurchaseDAO purchaseDAO;
    @Override
    public void addPurchase(Purchase purchase) {
        purchaseDAO.save(purchase);
    }

    @Override
    public void deletePurchase(int id) {
        purchaseDAO.delete(id);
    }

    @Override
    public List<Purchase> purchaseList() {
        return purchaseDAO.findAll();
    }

    @Override
    public Purchase findPurchaseById(int id) {
        return purchaseDAO.findOne(id);
    }

    @Override
    public List<Purchase> productListInCurt(int id) {
        return purchaseDAO.productListInCurt(id);
    }


    @Override
    public int amountInCart(int id, boolean successOrder) {
        Integer amountCart = purchaseDAO.amountInCart(id,successOrder);
        if(amountCart == null){
            return 0;
        }
        return amountCart;
    }

    @Override
    public int countProductInBasket(int id,boolean successOrder) {
        return purchaseDAO.countProductInBasket(id, successOrder);
    }

    @Override
    public void success(int id, boolean success) {
        purchaseDAO.success(id, success);
    }

    @Override
    public void successOrder(int id, boolean successOrder) {
        purchaseDAO.successOrder(id,successOrder);
    }

    @Override
    public void check(int id, boolean checkOrder) {
        purchaseDAO.check(id,checkOrder);
    }
}
