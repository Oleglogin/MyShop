package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.Product;
import ua.lv.entity.Purchase;
import ua.lv.entity.User;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserService;

/**
 * Created by User on 14.04.2019.
 */
@Controller
public class PurchaseController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    PurchaseService purchaseService;

    @RequestMapping(value = "/purchaseAdd/{product.id}/{currentUser.id}", method = RequestMethod.POST)
    public String addPurchase(@ModelAttribute("emptyPurchase")Purchase purchase,
                              @PathVariable("product.id")int ProductId,
                              @PathVariable("currentUser.id")int UserId){
        Product productId = productService.findProductById(ProductId);
        User userId = userService.getUserById(UserId);

        purchase.setUser(userId);
        purchase.setProduct(productId);

        int price = purchase.getProduct().getPrice();
        int amount = purchase.getCount();
        purchase.setAmount(price * amount);

        purchaseService.addPurchase(purchase);
        return "redirect:/cart";
    }
}
