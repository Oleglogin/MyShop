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
    public int amountInCart(int id) {
        return purchaseDAO.amountInCart(id);
    }

    @Override
    public int countProductInBasket(int id) {
        return purchaseDAO.countProductInBasket(id);
    }
}
